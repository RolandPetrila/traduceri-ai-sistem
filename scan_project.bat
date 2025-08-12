@echo off
title SCANARE FOLDER TRADUCERI AI
color 0A

echo.
echo 🔍 SCANARE COMPLETĂ FOLDER TRADUCERI AI
echo =============================================
echo.

set "PROJECT_PATH=C:\Users\ALIENWARE\Desktop\Roly\4. Artificial Inteligence\w Programe Roland - CustomGPT w\2.3.3_Sistem_Traduceri_WEB\traduceri-ai-sistem"

echo 📂 Navigare în proiect...
cd /d "%PROJECT_PATH%" 2>nul
if errorlevel 1 (
    echo ❌ EROARE: Nu pot accesa folderul proiect!
    echo Calea: %PROJECT_PATH%
    pause
    exit /b 1
)

echo ✅ Folder accesat cu succes!
echo Locația curentă: %cd%
echo.

echo 📋 STRUCTURA BÁSICĂ FOLDER:
echo =============================================
dir /b /a-d
echo.

echo 📁 SUBFOLDERE:
echo =============================================
dir /b /ad
echo.

echo 📄 VERIFICARE FIȘIERE CRITICE:
echo =============================================

echo === BACKEND/APP.PY ===
if exist "backend\app.py" (
    echo ✅ backend/app.py EXISTĂ
    for %%f in ("backend\app.py") do echo Dimensiune: %%~zf bytes
) else (echo ❌ backend/app.py LIPSEȘTE!)

echo.
echo === .ENV CONFIGURATION ===
if exist ".env" (
    echo ✅ .env EXISTĂ
    for %%f in (".env") do echo Dimensiune: %%~zf bytes
    echo.
    echo Conținut .env:
    echo ----------------------------------------
    type .env 2>nul
    echo ----------------------------------------
) else (echo ❌ .env LIPSEȘTE!)

echo.
echo === REQUIREMENTS.TXT ===
if exist "requirements.txt" (
    echo ✅ requirements.txt EXISTĂ
    echo.
    echo Conținut requirements.txt:
    echo ----------------------------------------
    type requirements.txt 2>nul
    echo ----------------------------------------
) else (echo ❌ requirements.txt LIPSEȘTE!)

echo.
echo === FRONTEND ===
if exist "frontend\index.html" (
    echo ✅ frontend/index.html EXISTĂ
    for %%f in ("frontend\index.html") do echo Dimensiune: %%~zf bytes
) else (echo ❌ frontend/index.html LIPSEȘTE!)

echo.
echo === API-INTEGRATION ===
if exist "api-integration" (
    echo ✅ api-integration EXISTĂ
    echo Conținut:
    dir "api-integration" /b 2>nul
) else (echo ❌ api-integration LIPSEȘTE!)

echo.
echo === CONFIG ===
if exist "config" (
    echo ✅ config EXISTĂ
    echo Conținut:
    dir "config" /b 2>nul
) else (echo ❌ config LIPSEȘTE!)

echo.
echo 📊 STATISTICI TOTALE:
echo =============================================
echo Calculez statistici...
for /f "tokens=3" %%i in ('dir /-c ^| findstr "File(s)"') do echo Total fișiere: %%i
for /f "tokens=3" %%i in ('dir /-c ^| findstr "bytes"') do echo Total dimensiune: %%i bytes

echo.
echo 🗑️ FIȘIERE DE CURĂȚAT:
echo =============================================
if exist "*.tmp" (echo TEMP files găsite: && dir *.tmp /b) else (echo Nu există fișiere .tmp)
if exist "*.log" (echo LOG files găsite: && dir *.log /b) else (echo Nu există fișiere .log)
if exist "__pycache__" (echo Python cache găsit: __pycache__) else (echo Nu există cache Python)

echo.
echo ✅ SCANARE COMPLETATĂ!
echo =============================================
echo Pentru a vedea din nou, rulează script-ul din nou.
echo Pentru a continua, apasă orice tastă...

pause > nul