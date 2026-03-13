@echo off 
cd /d C:\Users\laure\OneDrive\Documents\heyos-dashboard 
echo [1/3] Copie fichiers... 
if exist "C:\Users\laure\Downloads\index.html" copy /y "C:\Users\laure\Downloads\index.html" index.html 
if exist "C:\Users\laure\Downloads\data.json" copy /y "C:\Users\laure\Downloads\data.json" data.json 
echo [2/3] Commit... 
git add -A 
git commit -m "update" 
echo [3/3] Push... 
git push origin main --force 
echo [OK] Deploy termine ! 
pause 
