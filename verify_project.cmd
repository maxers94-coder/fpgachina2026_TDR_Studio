@echo off
python "%~dp0build\verify_project.py"
set "checkexit=%errorlevel%"
echo.
pause
exit /b %checkexit%
exit /b %errorlevel%
