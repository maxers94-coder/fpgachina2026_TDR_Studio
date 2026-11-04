@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0record_serial_text.ps1" %*
echo.
pause
