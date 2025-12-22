# Open-Webui - Other

**Pages:** 15

---

## Customer Stories

**URL:** https://docs.openwebui.com/enterprise/customers

**Contents:**
- 📄️ Samsung Semiconductor Inc.

How Samsung Semiconductor built a secure, self-hosted AI platform with Open WebUI to boost research and development efficiency, cutting workflows from days to hours.

---

## Manual Alembic Database Migration

**URL:** https://docs.openwebui.com/troubleshooting/manual-database-migration

**Contents:**
- Manual Alembic Database Migration
- Overview​
- Prerequisites Checklist​
- Step 1: Create and Verify Backup​
  - Backup Your Database​
  - Verify Backup Integrity​
- Step 2: Diagnose Current State​
  - Access Your Environment​
  - Navigate to Alembic Directory and Set Environment​
  - Set Required Environment Variables​

Open WebUI automatically runs database migrations on startup. Manual migration is rarely needed and should only be performed in specific failure scenarios or maintenance situations.

You need manual migration only if:

Manual migration can corrupt your database if performed incorrectly. Always create a verified backup before proceeding.

Before starting, ensure you have:

Database migrations cannot run while Open WebUI is active. You must stop all Open WebUI processes before attempting manual migration.

Critical: Test that your backup is readable before proceeding.

Store backups on a different disk or volume than your database to protect against disk failure.

Before attempting any fixes, gather information about your database state.

Check where you are after entering the container:

The Alembic configuration is at /app/backend/open_webui/alembic.ini. Navigate there regardless of your starting directory.

Navigate to the directory containing alembic.ini and configure required environment variables:

Local installations often have DATABASE_URL in a .env file, but Alembic's env.py may not automatically load .env files. You must explicitly export these variables in your shell before running Alembic commands.

Alembic commands will fail with Required environment variable not found if WEBUI_SECRET_KEY is missing. Open WebUI's code imports env.py which validates this variable exists before Alembic can even connect to the database.

Execute these read-only diagnostic commands:

Verify what's actually in your database:

If diagnostics show you have pending migrations (current < heads), upgrade to latest:

Watch for these outputs:

This is a normal informational message for SQLite, not an error. SQLite doesn't support rollback of schema changes, so migrations run without transaction protection.

If the process appears to hang after this message, wait 2-3 minutes - some migrations take time, especially:

For very large databases (10M+ rows), consider running migrations during a maintenance window and monitoring progress with sqlite3 /path/to/webui.db ".tables" in another terminal.

If you need to apply migrations up to a specific point:

Downgrading can cause permanent data loss if the migration removed columns or tables. Only downgrade if you understand the consequences.

After running migrations, confirm everything is correct:

Successful startup logs:

Smoke test after startup:

Cause: WEBUI_SECRET_KEY environment variable is missing.

Open WebUI's env.py file imports models, which import open_webui.env, which validates that WEBUI_SECRET_KEY exists. Without it, Python crashes before Alembic can even connect to the database.

Cause: You're in the wrong directory.

Cause: Your database version doesn't match expected schema.

Solution depends on diagnosis:

Scenario: alembic current shows older version than alembic heads

Fix: You simply need to apply pending migrations.

Scenario: alembic current shows correct version, but you still see errors

Cause: Someone manually modified the database schema without migrations, or a previous migration partially failed.

Fix: Restore from backup - you have database corruption.

Scenario: New database that needs initial schema

Fix: Run migrations from scratch.

You may see advice to run alembic stamp head to "fix" version mismatches. This is dangerous.

alembic stamp tells Alembic "pretend this migration was applied" without actually running it. This creates permanent database corruption where Alembic thinks your schema is up-to-date when it isn't.

Only use alembic stamp <revision> if:

Never use it to "fix" migration errors or skip failed migrations.

Understanding the message: This is not an error. It's informational. SQLite doesn't support transactional DDL, so Alembic is warning that migrations can't be rolled back automatically.

Some migrations (especially those adding indexes or modifying large tables) take several minutes.

Action: Wait 3-5 minutes before assuming it's stuck.

Another process might have locked the database.

If the database is corrupted, migration will hang.

If integrity check fails, restore from backup.

Symptom: You ran alembic revision --autogenerate and it wants to drop existing tables.

Regular users should NEVER run alembic revision --autogenerate. This command is for developers creating new migration files, not for applying existing migrations.

The command you want is alembic upgrade head (no revision, no --autogenerate).

If you accidentally created a bad migration file:

Technical context: The "autogenerate detects removed tables" issue occurs because Open WebUI's Alembic metadata configuration doesn't import all model definitions. This causes autogenerate to compare against incomplete metadata, thinking tables should be removed. This is a developer-level issue that doesn't affect users running alembic upgrade.

This troubleshooting applies only to PostgreSQL databases. SQLite handles foreign keys differently.

Symptom: Errors like psycopg2.errors.InvalidForeignKey: there is no unique constraint matching given keys for referenced table "user"

Cause: PostgreSQL requires explicit primary key constraints that were missing in older schema versions.

Solution for PostgreSQL:

Note: The public. schema prefix and quoted "user" identifier are PostgreSQL-specific. This SQL will not work on SQLite or MySQL.

Duplicate column errors indicate schema corruption, usually from failed migrations or manual database modifications. This requires careful manual intervention.

Symptom: Migration fails with error like:

Or when starting Open WebUI:

Solution - Manual Column Removal:

Removing columns can cause data loss. Backup your database first before proceeding.

Alternative - Simpler approach if you know the duplicate column:

If you're not comfortable with SQL or aren't sure which column is the duplicate, stop here and seek help on the Open WebUI GitHub issues or Discord. Provide:

Background: Older Open WebUI versions (pre-0.4.x) used Peewee migrations. Current versions use Alembic.

What happens automatically:

If automatic transition fails:

If upgrading from very old Open WebUI versions (< 0.3.x), consider a fresh install with data export/import rather than attempting to migrate the database schema across multiple major version changes.

In multi-server deployments, running different code versions simultaneously during rolling updates can cause errors if the new code expects schema changes that haven't been applied yet, or if old code is incompatible with new schema.

Recommended deployment strategies:

Run migrations as a one-time job before deploying new application code:

This ensures schema is updated before any new code runs.

Take the application offline during migration:

Simplest approach but requires downtime.

Maintain two identical environments and switch traffic after migration:

Zero downtime but requires double infrastructure.

For review or audit purposes, generate the SQL that would be executed:

This is advanced functionality for DBAs or DevOps engineers. Regular users should just run alembic upgrade head directly.

If your database server is offline or isolated:

Only update alembic_version if you've actually applied the corresponding migrations. Lying to Alembic about migration state causes permanent corruption.

SQLite migrations are non-transactional. If a migration fails halfway through, your database is in a partially-migrated state. The only safe recovery is restoring from backup.

Symptoms of partial migration:

Never use alembic stamp to mark a partially-failed migration as complete. This leaves your database in a corrupt state.

Before and after migrations, verify your database isn't corrupted:

After successful migration, verify:

Retain backups from before major migrations for at least 1-2 weeks. Issues sometimes appear days later during specific workflows.

If migrations continue to fail after following this guide:

Gather diagnostic information:

Open WebUI GitHub Issues: https://github.com/open-webui/open-webui/issues

Open WebUI Discord Community

Provide this information:

Do not share your webui.db database file publicly - it contains user credentials and sensitive data. Only share the diagnostic text output.

**Examples:**

Example 1 (bash):
```bash
# Find your database location firstdocker inspect open-webui | grep -A 5 Mounts# Create timestamped backupcp /path/to/webui.db /path/to/webui.db.backup.$(date +%Y%m%d_%H%M%S)
```

Example 2 (bash):
```bash
pg_dump -h localhost -U your_user -d open_webui_db > backup_$(date +%Y%m%d_%H%M%S).sql
```

Example 3 (bash):
```bash
# Test backup can be openedsqlite3 /path/to/webui.db.backup "SELECT count(*) FROM user;"# Verify schema matchessqlite3 /path/to/webui.db ".schema" > current-schema.sqlsqlite3 /path/to/webui.db.backup ".schema" > backup-schema.sqldiff current-schema.sql backup-schema.sql
```

Example 4 (bash):
```bash
# Verify backup file is not empty and contains SQLhead -n 20 backup_*.sqlgrep -c "CREATE TABLE" backup_*.sql
```

---

## Open WebUI

**URL:** https://docs.openwebui.com/

**Contents:**
- Open WebUI
- Quick Start with Docker 🐳​
  - Open WebUI Bundled with Ollama​
  - Using image tags in production​
  - Using the Dev Branch 🌙​
  - Updating Open WebUI​
    - Manual Update​
    - Automatic Updates​
- Manual Installation​
  - Platform Compatibility​

Open WebUI is an extensible, feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline. It supports various LLM runners like Ollama and OpenAI-compatible APIs, with built-in inference engine for RAG, making it a powerful AI deployment solution.

Passionate about open-source AI? Join our team →

Looking for an Enterprise Plan? — Speak with Our Sales Team Today!

Get enhanced capabilities, including custom theming and branding, Service Level Agreement (SLA) support, Long-Term Support (LTS) versions, and more!

Upgrade to a licensed plan for enhanced capabilities, including custom theming and branding, and dedicated support.

WebSocket support is required for Open WebUI to function correctly. Ensure that your network configuration allows WebSocket connections.

If Ollama is on your computer, use this command:

To run Open WebUI with Nvidia GPU support, use this command:

For environments with limited storage or bandwidth, Open WebUI offers slim image variants that exclude pre-bundled models. These images are significantly smaller but download required models on first use:

This installation method uses a single container image that bundles Open WebUI with Ollama, allowing for a streamlined setup via a single command. Choose the appropriate command based on your hardware setup:

With GPU Support: Utilize GPU resources by running the following command:

For CPU Only: If you're not using a GPU, use this command instead:

Both commands facilitate a built-in, hassle-free installation of both Open WebUI and Ollama, ensuring that you can get everything up and running swiftly.

After installation, you can access Open WebUI at http://localhost:3000. Enjoy! 😄

If you want to always run the latest version of Open WebUI, you can use the :main, :cuda, or :ollama image tags, depending on your setup, as shown in the examples above. For production environments where stability and reproducibility are important, it is recommended to pin a specific release version instead of using these floating tags. Versioned images follow this format:

Examples (pinned versions for illustration purposes only):

The :dev branch contains the latest unstable features and changes. Use it at your own risk as it may have bugs or incomplete features.

If you want to try out the latest bleeding-edge features and are okay with occasional instability, you can use the :dev tag like this:

For the slim variant of the dev branch:

To update Open WebUI container easily, follow these steps:

Use Watchtower to update your Docker container manually:

Keep your container updated automatically every 5 minutes:

🔧 Note: Replace open-webui with your container name if it's different.

Open WebUI works on macOS, Linux (x86_64 and ARM64, including Raspberry Pi and other ARM boards like NVIDIA DGX Spark), and Windows.

There are two main ways to install and run Open WebUI: using the uv runtime manager or Python's pip. While both methods are effective, we strongly recommend using uv as it simplifies environment management and minimizes potential conflicts.

The uv runtime manager ensures seamless Python environment management for applications like Open WebUI. Follow these steps to get started:

Pick the appropriate installation command for your operating system:

Once uv is installed, running Open WebUI is a breeze. Use the command below, ensuring to set the DATA_DIR environment variable to avoid data loss. Example paths are provided for each platform:

For PostgreSQL Support:

The default installation now uses a slimmed-down package. If you need PostgreSQL support, install with all optional dependencies:

For users installing Open WebUI with Python's package manager pip, it is strongly recommended to use Python runtime managers like uv or conda. These tools help manage Python environments effectively and avoid conflicts.

Python 3.11 is the development environment. Python 3.12 seems to work but has not been thoroughly tested. Python 3.13 is entirely untested and some dependencies do not work with Python 3.13 yet—use at your own risk.

Open your terminal and run the following command:

Once installed, start the server using:

To update to the latest version, simply run:

This method installs all necessary dependencies and starts Open WebUI, allowing for a simple and efficient setup. After installation, you can access Open WebUI at http://localhost:8080. Enjoy! 😄

We offer various installation alternatives, including non-Docker native installation methods, Docker Compose, Kustomize, and Helm. Visit our Open WebUI Documentation or join our Discord community for comprehensive guidance.

Continue with the full getting started guide.

We also have an experimental desktop app, which is actively a work in progress (WIP). While it offers a convenient way to run Open WebUI natively on your system without Docker or manual setup, it is not yet stable.

👉 For stability and production use, we strongly recommend installing via Docker or Python (uv or pip).

We are incredibly grateful for the generous support of our sponsors. Their contributions help us to maintain and improve our project, ensuring we can continue to deliver quality work to our community. Thank you!

We are deeply grateful for the generous grant support provided by:

**Examples:**

Example 1 (bash):
```bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

Example 2 (bash):
```bash
docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
```

Example 3 (bash):
```bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main-slim
```

Example 4 (bash):
```bash
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

---

## Samsung Semiconductor Accelerates R&D With Private, On-Prem AI Platform Powered by Open WebUI

**URL:** https://docs.openwebui.com/enterprise/customers/samsung-semiconductor

**Contents:**
- Samsung Semiconductor Accelerates R&D With Private, On-Prem AI Platform Powered by Open WebUI
- Overview​
  - At a Glance​
- About Samsung Semiconductor Inc.​
- The Challenge: Secure, Flexible AI at Scale​
- The Solution: Open WebUI on Kubernetes​
- Adoption & Enablement​
- Results: Speed, Adoption, and Control​
  - 01. Development Speed​
  - 02. Adoption & Usability​

How Samsung Semiconductor built a secure, self-hosted AI platform with Open WebUI to boost research and development efficiency, cutting workflows from days to hours.

Samsung Semiconductor Inc. (SSI) delivers cutting-edge semiconductor solutions including DRAM, SSD, processors, and image sensors. With innovation at its core, the company supports global technology leaders and powers advancements across data centers, mobile devices, and AI systems.

As teams across SSI began experimenting with generative AI tools, leadership identified a need for a self-hosted AI interface that balanced innovation with control.

The goal: provide employees a trusted environment to work with large language models (LLMs) without compromising data security or compliance.

SaaS-based AI tools offered speed but lacked flexibility and governance. SSI required a platform they could host, audit, and evolve, without vendor lock-in.

Open WebUI was selected for its open architecture, flexibility, and rapid proof-of-concept capabilities. Within two weeks, SSI’s AI/ML engineering team had a production-ready deployment running inside their secure on-prem Kubernetes cluster.

Architecture Highlights

“Open WebUI gave us control across security, models, and UX, without vendor lock-in.” — Software Engineering, Samsung Semiconductor, Inc.

To ensure smooth adoption, SSI launched a 14-day pilot with 100 analysts. Following rapid success, Open WebUI was rolled out company-wide with two live training sessions and ongoing IT help desk support. Within 30 days:

“Open WebUI provides users with an environment similar to commercial tools, giving them a sense of familiarity, and at the same time, it has the advantage of improving usability with its simple and intuitive design.” — AI/ML Engineering, Samsung Semiconductor, Inc.

R&D and software development cycles shortened by 30%, accelerating iteration and innovation.

Over 40% of employees became active users within the first week, citing simplicity and responsiveness.

Open WebUI stood out as the only solution offering:

The platform empowered teams to collaborate confidently and securely, accelerating the path from idea to insight.

Samsung Semiconductor plans to continue expanding its AI infrastructure with Open WebUI, integrating additional internal models and optimizing RAG performance over proprietary research datasets.

Looking for an Enterprise Plan? — Speak with Our Sales Team Today!

Get enhanced capabilities, including custom theming and branding, Service Level Agreement (SLA) support, Long-Term Support (LTS) versions, and more!

---

## Server Connectivity Issues

**URL:** https://docs.openwebui.com/troubleshooting/connection-error

**Contents:**
- Server Connectivity Issues
- 🔐 HTTPS, TLS, CORS & WebSocket Issues​
  - Common Symptoms​
  - Required Configuration for HTTPS & Reverse Proxies​
  - Reverse Proxy / SSL/TLS Configuration​
  - WebSocket Troubleshooting​
  - Testing Your Configuration​
  - Quick Fixes Checklist​
- 🌟 Connection to Ollama Server​
  - 🚀 Accessing Ollama from Open WebUI​

We're here to help you get everything set up and running smoothly. Below, you'll find step-by-step instructions tailored for different scenarios to solve common connection issues.

If you're experiencing connectivity problems with Open WebUI, especially when using reverse proxies or HTTPS, these issues often stem from improper CORS, TLS, WebSocket, or cookie configuration. Here's how to diagnose and fix them.

You might be experiencing these issues if you see:

Critical Environment Variables

When running Open WebUI behind a reverse proxy with HTTPS, you must configure these settings:

WEBUI_URL Configuration

The WEBUI_URL must be set correctly BEFORE using OAuth/SSO. Since it's a persistent config variable, you can only change it by:

CORS Configuration Details

The CORS_ALLOW_ORIGIN setting is crucial for WebSocket functionality. If you see errors in the logs like "https://yourdomain.com is not an accepted origin" or "http://127.0.0.1:3000 is not an accepted origin", you need to add that URL to your CORS configuration. Use semicolons to separate multiple origins, and include every possible way users access your instance (domain, IP, localhost).

For reverse proxy and TLS setups, check our tutorials here.

WebSocket support is required for Open WebUI v0.5.0 and later. If WebSockets aren't working:

For multi-instance deployments, configure Redis for WebSocket management:

To verify your setup is working:

Struggling to connect to Ollama from Open WebUI? It could be because Ollama isn’t listening on a network interface that allows external connections. Let’s sort that out:

Configure Ollama to Listen Broadly 🎧: Set OLLAMA_HOST to 0.0.0.0 to make Ollama listen on all network interfaces.

Update Environment Variables: Ensure that the OLLAMA_HOST is accurately set within your deployment environment.

Restart Ollama🔄: A restart is needed for the changes to take effect.

💡 After setting up, verify that Ollama is accessible by visiting the WebUI interface.

For more detailed instructions on configuring Ollama, please refer to the Ollama's Official Documentation.

If you're seeing a connection error when trying to access Ollama, it might be because the WebUI docker container can't talk to the Ollama server running on your host. Let’s fix that:

Adjust the Network Settings 🛠️: Use the --network=host flag in your Docker command. This links your container directly to your host’s network.

Change the Port: Remember that the internal port changes from 3000 to 8080.

Example Docker Command:

🔗 After running the above, your WebUI should be available at http://localhost:8080.

Encountered an SSL error? It could be an issue with the Hugging Face server. Here's what to do:

Check Hugging Face Server Status: Verify if there's a known outage or issue on their end.

Switch Endpoint: If Hugging Face is down, switch the endpoint in your Docker command.

Example Docker Command for Connected Issues:

Running on MacOS with Podman? Here’s how to ensure connectivity:

Enable Host Access: Podman 5.0+ uses pasta by default, which simplifies host loopback. If you are on an older version, you may need --network slirp4netns:allow_host_loopback=true.

Set OLLAMA_BASE_URL: Ensure it points to http://host.containers.internal:11434.

Example Podman Command:

**Examples:**

Example 1 (bash):
```bash
# Set this to your actual domain BEFORE FIRST STARTUP (required for OAuth/SSO and proper operation)WEBUI_URL=https://your-open-webui-domain.com# If you already started Open WebUI, don't worry, you can set this config from the admin panel as well!# CORS configuration - CRITICAL for WebSocket functionality# Include ALL ways users might access your instance# Make sure to include all IPs, hostnames and domains users can and could access Open WebUI and how requests are going to your Open WebUI instance# e.g. localhost, 127.0.0.1, 0.0.0.0, <ip of your server/computer>, public domain - all in http and https with the correct portsCORS_ALLOW_ORIGIN="https://yourdomain.com;http://yourdomain.com;https://yourip;http://localhost:3000"# Cookie security settings for HTTPS# Disable if you do not use HTTPSWEBUI_SESSION_COOKIE_SECURE=trueWEBUI_AUTH_COOKIE_SECURE=true# For OAuth/SSO, you will probably have to use 'lax' (strict can break OAuth callbacks)WEBUI_SESSION_COOKIE_SAME_SITE=laxWEBUI_AUTH_COOKIE_SAME_SITE=lax# WebSocket support (if using Redis)# If you experience websocket related issues, even after configuring all of the above, you can try turning OFF ENABLE_WEBSOCKET_SUPPORT# But this is not recommended for production and also not officially supported!# If you experience websocket issues, you should ideally provide websocket support through reverse proxies.ENABLE_WEBSOCKET_SUPPORT=trueWEBSOCKET_MANAGER=redisWEBSOCKET_REDIS_URL=redis://redis:6379/1
```

Example 2 (bash):
```bash
ENABLE_WEBSOCKET_SUPPORT=trueWEBSOCKET_MANAGER=redisWEBSOCKET_REDIS_URL=redis://redis:6379/1
```

Example 3 (bash):
```bash
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

Example 4 (bash):
```bash
docker run -d -p 3000:8080 -e HF_ENDPOINT=https://hf-mirror.com/ --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

---

## Troubleshooting Microphone Access

**URL:** https://docs.openwebui.com/troubleshooting/microphone-error

**Contents:**
- Troubleshooting Microphone Access
- Understanding Secure Contexts 🔒​
- Common Permission Issues 🚫​
  - Solutions for Non-HTTPS Connections​
    - Chromium-based Browsers (e.g., Chrome, Brave)​
    - Firefox-based Browsers​
  - Considerations and Risks 🚨​

Ensuring your application has the proper microphone access is crucial for functionality that depends on audio input. This guide covers how to manage and troubleshoot microphone permissions, particularly under secure contexts.

For security reasons, accessing the microphone is restricted to pages served over HTTPS or locally from localhost. This requirement is meant to safeguard your data by ensuring it is transmitted over secure channels.

Browsers like Chrome, Brave, Microsoft Edge, Opera, and Vivaldi, as well as Firefox, restrict microphone access on non-HTTPS URLs. This typically becomes an issue when accessing a site from another device within the same network (e.g., using a mobile phone to access a desktop server). Here's how you can manage these issues:

Temporary Browser Flags (Use with caution):

While browser flags offer a quick fix, they bypass important security checks which can expose your device and data to vulnerabilities. Always prioritize proper security measures, especially when planning for a production environment.

By following these best practices, you can ensure that your application properly accesses the microphone while maintaining the security and integrity of your data.

---

## Troubleshooting OAUTH / SSO Issues

**URL:** https://docs.openwebui.com/troubleshooting/sso

**Contents:**
- Troubleshooting OAUTH / SSO Issues
- Common OAUTH/SSO Issues and How to Fix Them 🛠️​
  - 1. WebUI URL Not Configured in Admin Panel 🚪  🔒​
  - 2. Incorrect Environment Variable Configuration 📝🚫​
    - ❌ Non-Existent Variables People Often Use:​
    - ✅ Correct OIDC Variables:​
    - ✅ Correct Microsoft Variables:​
  - 3. Missing Required Variables 🚨⚠️​
    - OPENID_PROVIDER_URL is Mandatory for OIDC​
    - Other Required Variables by Provider:​

OAUTH or Single Sign-On (SSO) lets you secure Open WebUI with modern authentication, but when users encounter login problems, the solution is often simple—if you know where to look. Most of the time, one of these key issues below is the culprit. Here's how to hunt them down and fix SSO headaches fast! 🚦

Most OAUTH flows require the application's external URL ("redirect URI") so the provider knows where to send users after login. If this is missing, OAUTH won't be able to complete!

Check for typos! OAUTH is strict—URLs must match exactly, including https://.

This is by far the most common cause of OAUTH breakage. If you misspell, omit, or set the wrong environment variable (especially for OIDC/OAUTH config), authentication can't work.

Common Environment Variable Mistakes:

Most OAUTH errors (loops, 401s, unresponsiveness) are due to an environment variable incorrectly named, missing entirely, or using outdated variable names!

Many users forget this critical variable. Without it, OIDC authentication cannot work.

✅ For Microsoft Entra ID:

New Issue: Many users don't realize that OAuth settings are stored in the database after the first launch when ENABLE_OAUTH_PERSISTENT_CONFIG=true (default).

📌 Example for Docker Compose:

Sometimes the issue is with the identity provider (e.g., Google, Okta, Auth0, Azure AD) not aligning with your WebUI's setup.

📌 Redirect URI Format Examples:

When in doubt, recheck your provider registration and regenerate client secrets if needed.

A new and tricky problem: If you use NGINX (or another reverse proxy) with server-side caching, OAUTH endpoints can misbehave. The result isn't always a total failure—often, users experience random or "weird" login bugs that are almost impossible to debug.

Example NGINX Configuration:

📌 Warning: Never cache OAUTH or login endpoints! Caching can "poison" the session or deliver stale tokens, causing bizarre auth errors.

Common Problem: Reverse proxy cookie settings can interfere with OAuth authentication, especially the HttpOnly and SameSite settings.

New Issue: OAuth providers may be slow to respond, causing timeout errors during the authentication handshake.

Advanced Issue: Session cookies not being properly maintained across OAuth redirect flow.

Enterprise Issue: In multi-instance deployments, OAuth sessions can fail if not properly synchronized.

Problem: Using generic OIDC variables instead of Microsoft-specific ones.

✅ Correct Microsoft Setup:

Problem: Incorrect provider URL format.

✅ Correct Authentik Setup:

Recent versions of Open WebUI moved from URL-based tokens to cookie-based tokens. If you have authentication issues:

Enable debug logging and trace the OAuth flow:

Check if user accounts are being created:

If using a reverse proxy, test OAuth directly against Open WebUI:

By carefully configuring BOTH your OAuth provider and your WebUI environment—and keeping critical login endpoints immune to caching—you'll eliminate nearly all SSO/OAuth login problems. Don't let a typo, missing variable, or a hidden cache block your users from seamless, secure AI access! 🦾

**Examples:**

Example 1 (bash):
```bash
# Required for OIDCOAUTH_CLIENT_ID=your_client_idOAUTH_CLIENT_SECRET=your_client_secretOPENID_PROVIDER_URL=https://your-provider/.well-known/openid-configurationENABLE_OAUTH_SIGNUP=true# Optional but recommendedOAUTH_PROVIDER_NAME=Your Provider NameOAUTH_SCOPES=openid email profileOPENID_REDIRECT_URI=https://your-domain/oauth/oidc/callback
```

Example 2 (bash):
```bash
# Use these for Microsoft Entra IDMICROSOFT_CLIENT_ID=your_client_idMICROSOFT_CLIENT_SECRET=your_client_secretMICROSOFT_CLIENT_TENANT_ID=your_tenant_idOPENID_PROVIDER_URL=https://login.microsoftonline.com/YOUR_TENANT_ID/v2.0/.well-known/openid-configurationENABLE_OAUTH_SIGNUP=true
```

Example 3 (bash):
```bash
OPENID_PROVIDER_URL=https://login.microsoftonline.com/YOUR_TENANT_ID/v2.0/.well-known/openid-configuration
```

Example 4 (bash):
```bash
OPENID_PROVIDER_URL=https://accounts.google.com/.well-known/openid-configuration
```

---

## 🤝 Contributing

**URL:** https://docs.openwebui.com/contributing

**Contents:**
- 🤝 Contributing
- 💡 Contributing​
  - 🌟 Code Contribution Guidelines​
  - 🛠 Code PR Best Practices:​
  - 📚 Documentation & Tutorials​
  - 🌐 Translations and Internationalization​
  - 🌎 Accessibility Matters​
  - 🤔 Questions & Feedback​
  - 🚨 Reporting Issues​
  - 🧭 Scope of Support​

We are hiring! Shape the way humanity engages with intelligence.

🚀 Welcome, Contributors! 🚀

Your interest in contributing to Open WebUI is greatly appreciated. This document is here to guide you through the process, ensuring your contributions enhance the project effectively. Let's make Open WebUI even better, together!

Looking to contribute? Great! Here's how you can help:

We welcome pull requests. Before submitting one, please:

Thank you for contributing! 🚀

Help us make Open WebUI more accessible by improving documentation, writing tutorials, or creating guides on setting up and optimizing the web UI.

Help us make Open WebUI available to a wider audience. In this section, we'll guide you through the process of adding new translations to the project.

We use JSON files to store translations. You can find the existing translation files in the src/lib/i18n/locales directory. Each directory corresponds to a specific language, for example, en-US for English (US), fr-FR for French (France) and so on. You can refer to ISO 639 Language Codes to find the appropriate code for a specific language.

To add a new language:

We are committed to making Open WebUI inclusive and usable for everyone. Accessibility is a core part of good system design.

Here’s how you can help improve accessibility when you contribute:

To test you changes, you can use tools like lighthouse or the accessibility tools in your browser.

Let's make Open WebUI usable for everyone.

Got questions or feedback? Join our Discord community or open an issue. We're here to help!

Noticed something off? Have an idea? Check our Issues tab to see if it's already been reported or suggested. If not, feel free to open a new issue. When reporting an issue, please follow our issue templates. These templates are designed to ensure that all necessary details are provided from the start, enabling us to address your concerns more efficiently.

Template Compliance: Please be aware that failure to follow the provided issue template, or not providing the requested information at all, will likely result in your issue being closed without further consideration. This approach is critical for maintaining the manageability and integrity of issue tracking.

Detail is Key: To ensure your issue is understood and can be effectively addressed, it's imperative to include comprehensive details. Descriptions should be clear, including steps to reproduce, expected outcomes, and actual results. Lack of sufficient detail may hinder our ability to resolve your issue.

We've noticed an uptick in issues not directly related to Open WebUI but rather to the environment it's run in, especially Docker setups. While we strive to support Docker deployment, understanding Docker fundamentals is crucial for a smooth experience.

Docker Deployment Support: Open WebUI supports Docker deployment. Familiarity with Docker is assumed. For Docker basics, please refer to the official Docker documentation.

Advanced Configurations: Setting up reverse proxies for HTTPS and managing Docker deployments requires foundational knowledge. There are numerous online resources available to learn these skills. Ensuring you have this knowledge will greatly enhance your experience with Open WebUI and similar projects.

Your contributions, big or small, make a significant impact on Open WebUI. We're excited to see what you bring to the project!

Together, let's create an even more powerful tool for the community. 🌟

---

## 🏢 Open WebUI for Enterprises

**URL:** https://docs.openwebui.com/enterprise/

**Contents:**
- 🏢 Open WebUI for Enterprises
- The AI Platform Powering the World’s Leading Organizations​
    - Featured Customer Stories​
- Let’s Talk​
  - Partnership Guidelines for Agencies​
- Why Enterprises Choose Open WebUI​
    - 🚀 Faster AI Innovation, No Vendor Lock-In​
    - 🔒 Enterprise-Grade Security & Compliance​
    - ⚡ Reliable, Scalable, and Performance-Optimized​
    - 💡 Fully Customizable & Modular​

In the rapidly advancing AI landscape, staying ahead isn't just a competitive advantage, it’s a necessity. Open WebUI is the fastest-growing AI platform designed for seamless enterprise deployment, helping organizations leverage cutting-edge AI capabilities with unmatched efficiency.

Open WebUI is completely free to use as-is, with no restrictions or hidden limits.

We are sustained by our users. Optional licenses are available to support ongoing development while providing additional benefits for businesses.

Discover how Samsung Semiconductor Inc. built a secure, self-hosted AI platform using Open WebUI, reducing complex workflows from days to hours while maintaining strict data-security requirements.

Read the full story →

Deploying an self-hosted AI chat stack for a large university like the Johannes Gutenberg University Mainz demands scalable and seamlessly integrable solutions. As the AI Architect at the university's Data Center, I chose Open WebUI as our chat frontend, impressed by its out-of-the-box readiness for enterprise environments and its rapidly paced, community-driven development. Now, our fully open-source stack – comprising LLMs, proxy/loadbalancer, and frontend – is successfully serving our user base of 30,000+ students and 5,000+ employees, garnering very positive feedback. Open WebUI’s user-centric design, rich feature set, and adaptability have solidified it as an outstanding choice for our institution.

Explore how other organizations are driving real impact with Open WebUI.

View all customer stories →

To help us respond quickly and efficiently to your inquiry, please use your official work email address, Personal email accounts (e.g. gmail.com, hotmail.com, proton.me, icloud.com, yahoo.com etc.) are often flagged by our system and will not be answered.

sales@openwebui.com — Send us your deployment end user count (seats), and let’s explore how we can work together!

Enterprise licenses and partnership opportunities are available exclusively to registered entities and organizations. At this time, we are unable to accommodate individual users. We appreciate your understanding and interest.

We are not seeking, open to, or in need of any form of disguised collaboration or contribution pitches/offers. Any attempt to characterize engineering assistance, co-development, or roadmap input as an alternative to our enterprise licensing program will not receive a response. All organizational engagement with Open WebUI occurs solely and exclusively through enterprise licensing.

Take your AI strategy to the next level with our premium enterprise solutions, crafted for organizations that demand expert consulting, tailored deployment, and dedicated support.

We carefully select our partners to maintain the highest standards and provide the best experience to our community.

If you are a consulting agency, AI services provider, solutions provider or reseller, please do not contact our enterprise sales directly. You will not get a response from our sales team. Instead, fill out our partnership interest form:

Contact us directly with:

This will help us expedite the process and ensure we can support your client’s needs effectively.

Thank you for understanding and respecting our partnership process.

Unlike proprietary AI platforms that dictate your roadmap, Open WebUI puts you in control. Deploy on-premise, in a private cloud, or hybrid environments—without restrictive contracts.

Security is a business-critical requirement. Open WebUI is built to support SOC 2, HIPAA, GDPR, FedRAMP, and ISO 27001 compliance, ensuring enterprise security best practices with on-premise and air-gapped deployments.

Built for large-scale enterprise deployments with multi-node high availability, Open WebUI can be configured to ensure 99.99% uptime, optimized workloads, and scalability across regions and business units.

Customize every aspect of Open WebUI to fit your enterprise’s needs. White-label, extend, and integrate seamlessly with your existing systems, including LDAP, Active Directory, and custom AI models.

With one of the fastest iteration cycles in AI, Open WebUI ensures your organization stays ahead with cutting-edge features and continuous updates—no waiting for long release cycles.

Open WebUI’s enterprise solutions provide mission-critical businesses with a suite of advanced capabilities and dedicated support, including:

Even if you don’t need an enterprise license, consider becoming a sponsor to help fund continuous development.

Open WebUI is free to use, but building, maintaining, and improving a platform of this scale takes real time, resources, and ongoing engineering work. Sponsorships help fund stability, security, new features, and long-term development—at a fraction of what it would cost to build and maintain an equivalent system in-house.

Your support—through sponsorships, contributions, or enterprise partnerships—helps keep Open WebUI strong and evolving for users around the world.

---

## 🏢 Open WebUI for Enterprises

**URL:** https://docs.openwebui.com/enterprise

**Contents:**
- 🏢 Open WebUI for Enterprises
- The AI Platform Powering the World’s Leading Organizations​
    - Featured Customer Stories​
- Let’s Talk​
  - Partnership Guidelines for Agencies​
- Why Enterprises Choose Open WebUI​
    - 🚀 Faster AI Innovation, No Vendor Lock-In​
    - 🔒 Enterprise-Grade Security & Compliance​
    - ⚡ Reliable, Scalable, and Performance-Optimized​
    - 💡 Fully Customizable & Modular​

In the rapidly advancing AI landscape, staying ahead isn't just a competitive advantage, it’s a necessity. Open WebUI is the fastest-growing AI platform designed for seamless enterprise deployment, helping organizations leverage cutting-edge AI capabilities with unmatched efficiency.

Open WebUI is completely free to use as-is, with no restrictions or hidden limits.

We are sustained by our users. Optional licenses are available to support ongoing development while providing additional benefits for businesses.

Discover how Samsung Semiconductor Inc. built a secure, self-hosted AI platform using Open WebUI, reducing complex workflows from days to hours while maintaining strict data-security requirements.

Read the full story →

Deploying an self-hosted AI chat stack for a large university like the Johannes Gutenberg University Mainz demands scalable and seamlessly integrable solutions. As the AI Architect at the university's Data Center, I chose Open WebUI as our chat frontend, impressed by its out-of-the-box readiness for enterprise environments and its rapidly paced, community-driven development. Now, our fully open-source stack – comprising LLMs, proxy/loadbalancer, and frontend – is successfully serving our user base of 30,000+ students and 5,000+ employees, garnering very positive feedback. Open WebUI’s user-centric design, rich feature set, and adaptability have solidified it as an outstanding choice for our institution.

Explore how other organizations are driving real impact with Open WebUI.

View all customer stories →

To help us respond quickly and efficiently to your inquiry, please use your official work email address, Personal email accounts (e.g. gmail.com, hotmail.com, proton.me, icloud.com, yahoo.com etc.) are often flagged by our system and will not be answered.

sales@openwebui.com — Send us your deployment end user count (seats), and let’s explore how we can work together!

Enterprise licenses and partnership opportunities are available exclusively to registered entities and organizations. At this time, we are unable to accommodate individual users. We appreciate your understanding and interest.

We are not seeking, open to, or in need of any form of disguised collaboration or contribution pitches/offers. Any attempt to characterize engineering assistance, co-development, or roadmap input as an alternative to our enterprise licensing program will not receive a response. All organizational engagement with Open WebUI occurs solely and exclusively through enterprise licensing.

Take your AI strategy to the next level with our premium enterprise solutions, crafted for organizations that demand expert consulting, tailored deployment, and dedicated support.

We carefully select our partners to maintain the highest standards and provide the best experience to our community.

If you are a consulting agency, AI services provider, solutions provider or reseller, please do not contact our enterprise sales directly. You will not get a response from our sales team. Instead, fill out our partnership interest form:

Contact us directly with:

This will help us expedite the process and ensure we can support your client’s needs effectively.

Thank you for understanding and respecting our partnership process.

Unlike proprietary AI platforms that dictate your roadmap, Open WebUI puts you in control. Deploy on-premise, in a private cloud, or hybrid environments—without restrictive contracts.

Security is a business-critical requirement. Open WebUI is built to support SOC 2, HIPAA, GDPR, FedRAMP, and ISO 27001 compliance, ensuring enterprise security best practices with on-premise and air-gapped deployments.

Built for large-scale enterprise deployments with multi-node high availability, Open WebUI can be configured to ensure 99.99% uptime, optimized workloads, and scalability across regions and business units.

Customize every aspect of Open WebUI to fit your enterprise’s needs. White-label, extend, and integrate seamlessly with your existing systems, including LDAP, Active Directory, and custom AI models.

With one of the fastest iteration cycles in AI, Open WebUI ensures your organization stays ahead with cutting-edge features and continuous updates—no waiting for long release cycles.

Open WebUI’s enterprise solutions provide mission-critical businesses with a suite of advanced capabilities and dedicated support, including:

Even if you don’t need an enterprise license, consider becoming a sponsor to help fund continuous development.

Open WebUI is free to use, but building, maintaining, and improving a platform of this scale takes real time, resources, and ongoing engineering work. Sponsorships help fund stability, security, new features, and long-term development—at a fraction of what it would cost to build and maintain an equivalent system in-house.

Your support—through sponsorships, contributions, or enterprise partnerships—helps keep Open WebUI strong and evolving for users around the world.

---

## 🎯 Our Mission

**URL:** https://docs.openwebui.com/mission

**Contents:**
- 🎯 Our Mission
  - A Note from Our Founder​
  - Our Vision: Shaping the Future Together​

We are hiring! Shape the way humanity engages with intelligence.

Before diving into our mission, we invite you to read our founder's blog post: "Why I’m Building Open WebUI". In this post, Tim shares the inspiration, challenges, and hopes driving Open WebUI's vision forward. It's a heartfelt introduction to what we're all about!

Imagine a world where local, open models that can run on any machine, united as one, outperform proprietary giants like GPT-4. Even better, imagine us all having the capability to train and reproduce state-of-the-art models like GPT-4 or GPT-5 from scratch, using high-quality, curated data.

Here's the thing, though: one of the biggest challenges in creating these foundation and fine-tune models is the substantial need for high-quality data, which is both costly and time-consuming to gather and curate. This is where Open WebUI's mission comes into play. Our mission is to contribute to this vision by building the best AI interface and crowdsourcing curated datasets from our community of users.

Our mission is founded on the belief that AI technologies hold transformative potential for society, yet their benefits have been narrowly confined due to complex setup requirements. Recognizing this, we are dedicated to democratizing AI by developing an easy-to-install, feature-rich local WebUI that is designed to operate locally without internet access. Enabling anyone with basic technical skills to tap into the power of AI, effectively bringing its capabilities to communities far and wide.

At the heart of our efforts is the creation of an open-sourced ecosystem of AI tools. Our commitment lies in making AI not only accessible but also beneficial for everyone. We envision a future where AI acts as a lever for societal advancement, driving progress, and technological breakthroughs across all communities.

By eliminating technological barriers and making AI's advantages universally accessible, we aim to foster a positive impact worldwide. Our ultimate goal is to ensure that AI serves as a catalyst for positive change, helping to bridge gaps and create a more equitable society where everyone can benefit from the advancements in technology.

At the heart of our mission lies a profound commitment not just to envision a future where advanced AI technology is universally accessible, but to actively build towards it. Our efforts extend beyond the development of our WebUI; We are at the forefront of creating an ecosystem that embodies the democratization of AI technology. This ecosystem, envisioned as a vibrant, community-driven platform, will be a repository of shared knowledge—ranging from model presets and custom prompts to valuable chat logs. A space where the collective intelligence of our community acts as the driving force for the continuous evolution and refinement of AIs, ensuring these advancements serve us, the actual users of these technologies.

Our strategy aims to tackle the complex challenges of AI, such as model fine-tuning and dataset curation, head-on. Leveraging the collective skills and insights of our community, we'll forge innovative pathways that not only enhance the precision and relevance of AI models but also guarantee these improvements are shared openly. Our objective is unequivocal: to democratize access to refined, user-curated datasets, thereby eliminating barriers to advancing AI for all.

As we navigate this journey, our vision serves as our north star, guiding our efforts to turn bold ambitions into reality. We extend an invitation for you to join us in this endeavor, as we work diligently to ensure AI technology becomes an empowering resource for individuals and communities across the globe.

---

## 👥 Our Team

**URL:** https://docs.openwebui.com/team

**Contents:**
- 👥 Our Team
- 🌟 Meet Our Core Development Team!​
  - 🚀 We're Actively Hiring!​
  - 💓 Our Contributors​
- 🏛️ Governance​

We are hiring! Shape the way humanity engages with intelligence.

Passionate about open-source AI? Join our team →

Our team is led by the dedicated creator and founder, Tim J. Baek. We’re supported by talented team members from our company who work hard behind the scenes to make this project great. In addition, we are incredibly fortunate to have a community of amazing contributors who find this project valuable and actively participate in its continued success.

Open WebUI is centrally managed and operated by Open WebUI, Inc. Our governance model is straightforward and intentional—we do not operate on a committee-based governance system or a community-driven voting process. Strategic and operational decisions are led openly and transparently by our founder, Tim J. Baek, ensuring a clear, unified, long-term vision.

Our project is specifically designed and structured to remain sustainable and independent for decades to come—thanks largely to an intentional focus on remaining extremely lean, strategic, and capital-efficient. We aren't pursuing short-term milestones or temporary trends; we're carefully building something lasting and meaningful.

Beyond our contributors, Open WebUI, Inc. has an incredible global team working behind the scenes across multiple domains, including technology, operations, strategy, finance, legal, marketing, communications, partnerships, and community management. While Tim leads the vision, execution is supported by a growing network of talented individuals helping to ensure the long-term success of the project. Our team spans various expertise areas, ensuring that Open WebUI, Inc. thrives not just in software development but also in operational excellence, financial sustainability, legal compliance, brand awareness, and effective collaboration with partners.

We greatly appreciate enthusiasm and thoughtful suggestions from our community. At the same time, we're not looking for unsolicited governance recommendations or guidance on how to operate—we know exactly how we want to run our project (just as, for example, you wouldn't tell OpenAI how to run theirs). Open WebUI maintains strong, opinionated leadership because that's precisely what we believe is necessary to build something truly great, fast-moving, and purposeful.

Thank you for respecting our perspective and for your continued support and contributions. We're excited to keep building with the community around the vision we've established together!

---

## 💖 Sponsorships

**URL:** https://docs.openwebui.com/sponsorships

**Contents:**
- 💖 Sponsorships
- The Impact of Your Support​
- Sponsorship Policies​
  - Hard Rules​
  - Soft Rules​

Upgrade to a licensed plan for enhanced capabilities, including custom theming and branding, and dedicated support.

As Open WebUI grows, the tasks and challenges we face expand as well. Tim is at the heart of this project, tirelessly working to ensure all aspects of Open WebUI not only function but thrive. Yet, imagine the additional improvements we could make with a little extra support.

Consider the practical benefits your organization gains from Open WebUI. A modest contribution from users like you allows us to focus more on refining features and less on managing resources. Each helping hand makes a meaningful difference, aligning our daily realities with our ambitious goals.

We're incredibly thankful to our current sponsors. Your commitment has brought us closer to realizing the full potential of Open WebUI. Every contribution, big or small, strengthens the project and lays the groundwork for its continued success.

Thank you for considering joining us in this practical yet visionary endeavor. Here, every bit of support is not only appreciated—it’s crucial for keeping our project vibrant, dynamic, and responsive to users’ needs.

At Open WebUI, our community always comes first. Sponsors are welcome, but they must respect our community-first approach. This philosophy guides all our sponsorship policies.

These are the non-negotiable rules for sponsors:

Our community members should not be treated as sales leads.

We expect sponsors to be exemplary community members. It’s acceptable to subtly promote job openings at your company and showcase your product, but hard selling is not allowed. Additionally, do not ask community members to join your mailing list.

---

## 🛠️ Troubleshooting

**URL:** https://docs.openwebui.com/troubleshooting

**Contents:**
- 🛠️ Troubleshooting
- 🌟 General Troubleshooting Tips​
  - 🤝 Community Support​

We are hiring! Shape the way humanity engages with intelligence.

Encountering issues? Don't worry, we're here to help! 😊 Start with this important step:

With this project constantly evolving, updates and fixes are regularly added. Keeping your software up-to-date is crucial to take advantage of all the enhancements and fixes, ensuring the best possible experience. 🚀

This project thrives on community spirit and passion. If you still face problems after updating, we warmly invite you to join our vibrant community on Discord. There, you can share your experiences, find solutions, and connect with fellow enthusiasts who might be navigating similar challenges. Engaging with our community doesn't just help solve your problems; it strengthens the entire network of support, so we all grow together. 🌱

🌟 If your issues are pressing and you need a quicker resolution, consider supporting our project. Your sponsorship not only fast-tracks your queries in a dedicated sponsor-only channel, but also directly supports the dedicated maintainer who is passionately committed to refining and enhancing this tool for everyone.

Together, let's harness these opportunities to create the best environment and keep pushing the boundaries of what we can achieve with our project. Thank you from the bottom of our hearts for your understanding, cooperation, and belief in our mission! 🙏

---

## 🛠️ Troubleshooting

**URL:** https://docs.openwebui.com/troubleshooting/

**Contents:**
- 🛠️ Troubleshooting
- 🌟 General Troubleshooting Tips​
  - 🤝 Community Support​

We are hiring! Shape the way humanity engages with intelligence.

Encountering issues? Don't worry, we're here to help! 😊 Start with this important step:

With this project constantly evolving, updates and fixes are regularly added. Keeping your software up-to-date is crucial to take advantage of all the enhancements and fixes, ensuring the best possible experience. 🚀

This project thrives on community spirit and passion. If you still face problems after updating, we warmly invite you to join our vibrant community on Discord. There, you can share your experiences, find solutions, and connect with fellow enthusiasts who might be navigating similar challenges. Engaging with our community doesn't just help solve your problems; it strengthens the entire network of support, so we all grow together. 🌱

🌟 If your issues are pressing and you need a quicker resolution, consider supporting our project. Your sponsorship not only fast-tracks your queries in a dedicated sponsor-only channel, but also directly supports the dedicated maintainer who is passionately committed to refining and enhancing this tool for everyone.

Together, let's harness these opportunities to create the best environment and keep pushing the boundaries of what we can achieve with our project. Thank you from the bottom of our hearts for your understanding, cooperation, and belief in our mission! 🙏

---
