@echo off
echo ===================================
echo Setting up GitHub Repository
echo ===================================
echo.

REM Check if git is installed
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Git is not installed or not in PATH. Please install Git first.
    pause
    exit /b 1
)

REM Initialize git repository if not already initialized
if not exist .git (
    echo Initializing Git repository...
    git init
) else (
    echo Git repository already initialized.
)

REM Add all files
echo Adding files to Git...
git add .

echo.
echo ===================================
echo Repository setup complete!
echo.
echo Next steps:
echo 1. Create a repository on GitHub
echo 2. Run the following commands:
echo    git commit -m "Initial commit"
echo    git branch -M main
echo    git remote add origin https://github.com/gerrymoeis/hitam-putih.git
echo    git push -u origin main
echo ===================================
echo.
pause
