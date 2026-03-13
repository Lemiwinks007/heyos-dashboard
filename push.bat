@echo off
cd /d C:\Users\laure\OneDrive\Documents\heyos-dashboard

echo [1/4] Recherche du fichier dashboard...
set NEWEST=
for /f "delims=" %%f in ('dir /b /o-d "C:\Users\laure\Downloads\portfolio_dashboard_v*.html" 2^>nul') do (
    if not defined NEWEST set NEWEST=%%f
)

if not defined NEWEST (
    echo [ERREUR] Aucun fichier portfolio_dashboard_v*.html trouve dans Downloads
    pause
    exit /b 1
)

echo [OK] Fichier : %NEWEST%
copy /y "C:\Users\laure\Downloads\%NEWEST%" index.html >nul

echo [2/4] Ajout des fichiers...
git add -A

echo [3/4] Commit...
git commit -m "dashboard update" >nul 2>&1

echo [4/4] Push...
git push origin main 2>&1
if errorlevel 1 (
    echo [INFO] Push direct echoue, tentative force...
    git push origin main --force
)

echo.
echo [OK] Deploy termine !
timeout /t 3 >nul
