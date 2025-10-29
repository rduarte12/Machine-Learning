@echo off
REM activate_env.bat
REM Ativa o virtualenv `venv` (apenas para cmd.exe)

IF NOT EXIST "%~dp0..\venv\Scripts\activate.bat" (
    echo Nenhum virtualenv encontrado. Rode scripts\create_env.ps1 no PowerShell para criar o venv.
    exit /b 1
)

call "%~dp0..\venv\Scripts\activate.bat"
echo venv ativado (CMD). Use "deactivate" para sair.
