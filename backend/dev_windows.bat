@echo off
cd /d D:\Source_Code\speckit_proj\open-webui\backend
call .\.venv\Scripts\activate.bat
set CORS_ALLOW_ORIGIN=http://localhost:5173;http://localhost:8080
uvicorn open_webui.main:app --port 8080 --host 0.0.0.0 --forwarded-allow-ips=* --reload
