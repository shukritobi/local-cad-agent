@echo off
setlocal
cd /d "%~dp0"

if not exist ".venv\Scripts\activate.bat" (
  echo Virtual environment missing. Running install.bat first...
  call install.bat
)

call .venv\Scripts\activate.bat
if not exist logs mkdir logs
if not exist workspace mkdir workspace
if not exist outputs mkdir outputs

python -m local_cad_agent.cli status --config config.example.yaml
pause
