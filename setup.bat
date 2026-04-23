@echo off
REM BlkOps GitHub Setup — Windows
REM Usage: setup.bat YOUR_GITHUB_TOKEN
REM Get token at: https://github.com/settings/tokens (needs repo scope)

SET TOKEN=%1
SET GITHUB_USERNAME=BLKSAge
SET REPO_NAME=blkops
SET DESCRIPTION=AI-powered job search operations framework. Adapted from andrew-shwetzer/career-ops-plugin.

IF "%TOKEN%"=="" (
    echo Usage: setup.bat YOUR_GITHUB_TOKEN
    echo Get a token at: https://github.com/settings/tokens
    echo Required scope: repo
    pause
    exit /b 1
)

echo Creating GitHub repository...

curl -s -X POST ^
  -H "Authorization: token %TOKEN%" ^
  -H "Accept: application/vnd.github.v3+json" ^
  https://api.github.com/user/repos ^
  -d "{\"name\":\"%REPO_NAME%\",\"description\":\"%DESCRIPTION%\",\"private\":false,\"has_issues\":true,\"auto_init\":false}"

echo.
echo Initializing git...

git init
git add .
git commit -m "Initial commit: BlkOps v1.0 - adapted from andrew-shwetzer/career-ops-plugin"
git branch -M main
git remote add origin https://%TOKEN%@github.com/%GITHUB_USERNAME%/%REPO_NAME%.git
git push -u origin main

echo.
echo Done! BlkOps is live at:
echo https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
pause
