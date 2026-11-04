@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0capture_tools\record_serial_text.ps1" %*
echo.
pause
