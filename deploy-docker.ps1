[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path -Parent $PSCommandPath),
    [string]$ComposeFile = "docker-compose.yaml",
    [string]$DataDir = "D:\open-webui",
    [int]$TimeoutSec = 240,
    [switch]$AutoSyncLockfile
)

$ErrorActionPreference = 'Stop'

function Write-Info([string]$Message) { Write-Host "[INFO] $Message" }
function Write-Warn([string]$Message) { Write-Host "[WARN] $Message" -ForegroundColor Yellow }
function Write-Err([string]$Message)  { Write-Host "[ERR ] $Message" -ForegroundColor Red }

function Assert-Command([string]$Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Missing required command: $Name"
    }
}

function Invoke-ComposeUp([string]$ComposePath) {
    Write-Info "docker compose -f \"$ComposePath\" up -d --build"
    $output = & docker compose -f $ComposePath up -d --build 2>&1 | Tee-Object -Variable _composeOut
    $code = $LASTEXITCODE
    return [pscustomobject]@{
        ExitCode = $code
        Output   = $output
    }
}

function Is-NpmCiLockMismatch($Lines) {
    if (-not $Lines) { return $false }
    $text = ($Lines | Out-String)
    return (
        $text -match 'npm ci\s+can only install packages when.*package-lock\.json' -or
        $text -match 'package\.json and\s+package-lock\.json.*are in sync' -or
        $text -match 'Missing: .* from lock file'
    )
}

function Is-ContainerNameConflict($Lines) {
    if (-not $Lines) { return $false }
    $text = ($Lines | Out-String)
    return ($text -match 'Conflict\. The container name "/[^"]+" is already in use')
}

function Remove-ConflictingNamedContainers($Lines) {
    if (-not $Lines) { return }
    $text = ($Lines | Out-String)
    $names = @()
    foreach ($m in [regex]::Matches($text, 'container name "/(?<name>[^"]+)" is already in use', 'IgnoreCase')) {
        $names += $m.Groups['name'].Value
    }
    $names = $names | Select-Object -Unique
    foreach ($name in $names) {
        if ([string]::IsNullOrWhiteSpace($name)) { continue }
        Write-Warn "Removing conflicting container name: $name"
        & docker rm -f $name *> $null
    }
}

function Write-OutputTail($Lines, [int]$Tail = 200) {
    if (-not $Lines) { return }
    Write-Info "---- docker compose output (last $Tail lines) ----"
    $Lines | Select-Object -Last $Tail | ForEach-Object { Write-Host $_ }
    Write-Info "---- end ----"
}

function Remove-LegacyContainerByName([string]$Name) {
    if ([string]::IsNullOrWhiteSpace($Name)) { return }
    try {
        $existing = & docker ps -a --format "{{.Names}}" 2>$null | Where-Object { $_ -eq $Name } | Select-Object -First 1
        if ($existing) {
            Write-Warn "Removing legacy container not managed by compose: $Name"
            & docker rm -f $Name *> $null
        }
    } catch {
        # ignore
    }
}

try {
    Write-Info "Project root: $ProjectRoot"
    Set-Location -Path $ProjectRoot

    Assert-Command docker

    # Verify Docker daemon is up
    Write-Info "Checking Docker daemon..."
    & docker info *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "Docker daemon not reachable. Start Docker Desktop and try again."
    }

    # Verify compose is available
    Write-Info "Checking Docker Compose..."
    & docker compose version *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "Docker Compose not available. Ensure Docker Desktop is up-to-date."
    }

    $composePath = Join-Path $ProjectRoot $ComposeFile
    if (-not (Test-Path $composePath)) {
        throw "Compose file not found: $composePath"
    }

    # Ensure data dir exists
    Write-Info "Ensuring data directory exists: $DataDir"
    New-Item -ItemType Directory -Force -Path $DataDir | Out-Null

    # Optional sanity check: expected bind mount exists in compose
    $composeText = Get-Content -Path $composePath -Raw
    if ($composeText -notmatch [regex]::Escape('D:/open-webui:/app/backend/data')) {
        Write-Warn "Compose file does not contain expected bind mount 'D:/open-webui:/app/backend/data'."
        Write-Warn "Current file: $composePath"
    }

    # Provide a deployment identifier so the UI can show a distinct build/deploy.
    # This is passed to docker compose for variable substitution, and into the container via compose env.
    $env:DEPLOYMENT_ID = (Get-Date -Format 'yyyyMMdd-HHmmss')
    Write-Info "DEPLOYMENT_ID: $($env:DEPLOYMENT_ID)"

    Write-Info "Pulling remote images (ignoring buildable services)..."
    & docker compose -f $composePath pull --ignore-buildable
    if ($LASTEXITCODE -ne 0) {
        Write-Warn "Pull step failed; continuing with build/start anyway."
    }

    Write-Info "Stopping existing stack (if any)..."
    & docker compose -f $composePath down *> $null

    # If a previous compose file used to manage ollama with a fixed container name,
    # it can linger after removing the service from docker-compose.yaml.
    Remove-LegacyContainerByName "ollama"

    Write-Info "Starting containers (build from local project)..."
    $upResult = Invoke-ComposeUp -ComposePath $composePath
    if ($upResult.ExitCode -ne 0) {
        if (Is-ContainerNameConflict $upResult.Output) {
            Write-Warn "Detected container-name conflict; removing conflicting container(s) and retrying once..."
            Remove-ConflictingNamedContainers $upResult.Output
            $upResult = Invoke-ComposeUp -ComposePath $composePath
        }

        if ($upResult.ExitCode -ne 0 -and (Is-NpmCiLockMismatch $upResult.Output)) {
            Write-Err "Docker build failed because npm lockfile is out of sync (npm ci strict mode)."
            if ($AutoSyncLockfile) {
                Assert-Command npm
                Write-Info "AutoSyncLockfile enabled: syncing package-lock.json (no scripts)..."
                & npm install --package-lock-only --ignore-scripts --force
                if ($LASTEXITCODE -ne 0) {
                    Write-Warn "npm install --force failed; retrying with --legacy-peer-deps..."
                    & npm install --package-lock-only --ignore-scripts --legacy-peer-deps
                    if ($LASTEXITCODE -ne 0) { throw "npm install failed (exit $LASTEXITCODE)" }
                }

                Write-Info "Retrying docker compose build/start..."
                $upResult = Invoke-ComposeUp -ComposePath $composePath
            } else {
                Write-Warn "Fix options:"
                Write-Warn "1) Run: npm install --package-lock-only --ignore-scripts"
                Write-Warn "2) Re-run this script with: .\\deploy-docker.ps1 -AutoSyncLockfile"
                throw "docker compose up failed due to lockfile mismatch"
            }
        }

        if ($upResult.ExitCode -ne 0) {
            Write-OutputTail $upResult.Output 250
            throw "docker compose up failed (exit $($upResult.ExitCode))"
        }
    }

    Write-Info "Current status:"
    & docker compose -f $composePath ps

    $url = "http://localhost:3000/"
    Write-Info "Health check: waiting for $url (timeout ${TimeoutSec}s)"

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $ok = $false

    while ($stopwatch.Elapsed.TotalSeconds -lt $TimeoutSec) {
        Start-Sleep -Seconds 2

        $psOut = & docker compose -f $composePath ps --format json 2>$null
        if ($LASTEXITCODE -eq 0 -and $psOut) {
            try {
                $entries = $psOut | ConvertFrom-Json
                $webui = $entries | Where-Object { $_.Service -eq 'open-webui' } | Select-Object -First 1
                if ($null -ne $webui -and $webui.State -and $webui.State -ne 'running') {
                    Write-Warn "open-webui container state: $($webui.State)"
                }
            } catch {
                # ignore formatting issues and continue polling
            }
        }

        try {
            $resp = Invoke-WebRequest -Uri $url -Method GET -TimeoutSec 5
            if ($resp.StatusCode -ge 200 -and $resp.StatusCode -lt 400) {
                $ok = $true
                break
            }
        } catch {
            # keep waiting
        }
    }

    if (-not $ok) {
        Write-Err "Health check failed: $url did not become ready within ${TimeoutSec}s"
        Write-Info "Recent logs (open-webui):"
        & docker compose -f $composePath logs --tail 200 open-webui
        exit 1
    }

    try {
        $ver = Invoke-RestMethod -Uri ($url.TrimEnd('/') + '/api/version') -Method GET -TimeoutSec 5
        if ($ver) {
            Write-Info ("Server version: {0}, deployment_id: {1}" -f $ver.version, $ver.deployment_id)
        }
    } catch {
        Write-Warn "Unable to fetch /api/version for confirmation."
    }

    Write-Info "Deployment OK. Open: $url"
    exit 0
}
catch {
    Write-Err $_
    exit 1
}
