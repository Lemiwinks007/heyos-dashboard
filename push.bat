@echo off
cd /d C:\Users\laure\OneDrive\Documents\heyos-dashboard

echo [1/5] Recherche dashboard...
set NEWEST=
for /f "delims=" %%f in ('dir /b /o-d "C:\Users\laure\Downloads\portfolio_dashboard_v*.html" 2^>nul') do (
    if not defined NEWEST set NEWEST=%%f
)

if defined NEWEST (
    echo [OK] Dashboard : %NEWEST%
    copy /y "C:\Users\laure\Downloads\%NEWEST%" index.html >nul
) else (
    echo [INFO] Pas de nouveau dashboard dans Downloads, index.html inchange
)

echo [2/5] Recherche data.json...
if exist "C:\Users\laure\Downloads\data.json" (
    copy /y "C:\Users\laure\Downloads\data.json" data.json >nul
    echo [OK] data.json mis a jour depuis Downloads
) else (
    echo [INFO] Pas de data.json dans Downloads, fichier existant conserve
)

echo [3/5] Ajout des fichiers...
git add -A

echo [4/5] Commit...
git commit -m "update S38" >nul 2>&1

echo [5/5] Push...
git push origin main 2>&1
if errorlevel 1 (
    echo [INFO] Tentative force...
    git push origin main --force
)

echo.
echo [OK] Deploy termine !
timeout /t 3 >nul
