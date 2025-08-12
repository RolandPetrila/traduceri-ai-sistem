@echo off
echo 🚀 PORNIRE COMPLETĂ SISTEM TRADUCERI AI
echo =============================================

echo.
echo 📂 NAVIGARE ÎN FOLDER PROIECT...
cd /d "C:\Users\ALIENWARE\Desktop\Roly\4. Artificial Inteligence\w Programe Roland - CustomGPT w\2.3.3_Sistem_Traduceri_WEB\traduceri-ai-sistem"

echo.
echo 📋 VERIFICARE FIȘIERE ESENȚIALE...
echo Checking backend/app.py:
if exist "backend\app.py" (echo ✅ backend/app.py EXISTĂ) else (echo ❌ backend/app.py LIPSEȘTE)

echo Checking .env:
if exist ".env" (echo ✅ .env EXISTĂ) else (echo ❌ .env LIPSEȘTE - CREARE...)

echo Checking requirements.txt:
if exist "requirements.txt" (echo ✅ requirements.txt EXISTĂ) else (echo ❌ requirements.txt LIPSEȘTE)

echo.
echo 🔧 CREARE/UPDATE .ENV CU API KEYS...
echo # === TRADUCERI AI - CONFIG COMPLET === > .env
echo DEEPL_API_KEY=893e7fec-915c-432c-8e63-7c9c109a6df5:fx >> .env
echo STRIPE_SECRET_KEY=sk_test_51RvLlFAHSbdGdylIrAr6KGdeXBALBLe3PKkkhwnSNf3wCGK184cXf4YDuQRT0pr5Xm8qCper0gAtn9WYk83J63mK00fXvmBuHX >> .env
echo STRIPE_PUBLISHABLE_KEY=pk_test_51RvLlFAHSbdGdylIvJED7DMfIsg5G1j86FKRX3EGVWiw29hJBUG0RJrZBggSBfLSwWcmN7Dc09T3GnYi4frOpRis00h9uo9qfw >> .env
echo SECRET_KEY=MySecureRandomKey2024ForTraduceriAI_Roland_Petrila_System! >> .env
echo PRICE_PER_WORD=0.08 >> .env
echo PRICE_PER_PAGE=8.5 >> .env
echo VAT_RATE=0.19 >> .env
echo FLASK_ENV=development >> .env
echo DEBUG=true >> .env

echo ✅ .env CONFIGURAT CU API KEYS REALE

echo.
echo 🐍 VERIFICARE PYTHON ȘI DEPENDINȚE...
python --version
pip list | findstr Flask

echo.
echo 🚀 PORNIRE SISTEM BACKEND...
echo Sistem va porni pe: http://localhost:5000
echo Pentru a opri: apasă Ctrl+C
echo.
echo ================================
python backend/app.py