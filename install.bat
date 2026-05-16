@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo [local-cad-agent] Setting up Python environment...

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found. Install Python 3.11+ from https://www.python.org/downloads/
  pause
  exit /b 1
)

if not exist ".venv" (
  python -m venv .venv
)

call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -e .[dev,geometry,dxf,vision]

if not exist logs mkdir logs
if not exist workspace mkdir workspace
if not exist outputs mkdir outputs
if not exist cache mkdir cache

echo [local-cad-agent] Setup complete.
pause
