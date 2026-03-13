@echo off
cd /d "C:\Users\laure\OneDrive\Documents\heyos-dashboard"

for /f "delims=" %%f in ('dir /b /o-d "C:\Users\laure\Downloads\portfolio_dashboard*.html" 2^>nul') do (
    set "LATEST=C:\Users\laure\Downloads\%%f"
    goto :found
)

if exist "C:\Users\laure\Downloads\index.html" (
    set "LATEST=C:\Users\laure\Downloads\index.html"
    goto :found
)

echo.
echo [ERREUR] Aucun fichier dashboard trouve dans Downloads.
pause
exit /b 1

:found
echo.
echo [OK] Fichier trouve : %LATEST%
echo [>>] Copie vers index.html...
copy /y "%LATEST%" "index.html" >nul

echo [>>] Git add tout...
git add -A

echo [>>] Git commit...
git commit -m "dashboard update"

echo [>>] Git pull rebase...
git pull --rebase
if %errorlevel% neq 0 (
    echo [ERREUR] git pull a echoue.
    pause
    exit /b 1
)

echo [>>] Git push...
git push
if %errorlevel% neq 0 (
    echo [ERREUR] git push a echoue.
    pause
    exit /b 1
)

echo.
echo [DONE] Live : https://lemiwinks007.github.io/heyos-dashboard/
echo.
pause
