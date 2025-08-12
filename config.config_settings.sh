# ================================
# TRADUCERI AI - PRODUCTION CONFIG
# ================================

# === TRADUCERI (DEEPL REAL) ===
DEEPL_API_KEY=893e7fec-915c-432c-8e63-7c9c109a6df5:fx

# === PLĂȚI (STRIPE TEST) ===
STRIPE_SECRET_KEY=sk_test_51RvLlFAHSbdGdylIrAr6KGdeXBALBLe3PKkkhwnSNf3wCGK184cXf4YDuQRT0pr5Xm8qCper0gAtn9WYk83J63mK00fXvmBuHX
STRIPE_PUBLISHABLE_KEY=pk_test_51RvLlFAHSbdGdylIvJED7DMfIsg5G1j86FKRX3EGVWiw29hJBUG0RJrZBggSBfLSwWcmN7Dc09T3GnYi4frOpRis00h9uo9qfw

# === SECURITATE ===
SECRET_KEY=MySecureRandomKey2024ForTraduceriAI_System_Production_Ready_Roland!
ADMIN_API_KEY=admin_secure_key_2024_traduceri_ai_roland_petrila

# === BUSINESS SETTINGS ===
PRICE_PER_WORD=0.08
PRICE_PER_PAGE=8.5
VAT_RATE=0.19
MIN_AMOUNT=5.0
MAX_AMOUNT=1000.0
CURRENCY=RON

# === EMAIL (CONFIGURĂM MAI TÂRZIU) ===
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=petrilarolly@gmail.com
SMTP_PASSWORD=your_gmail_app_password_here
SMTP_USE_TLS=true

# === APLICAȚIE ===
FLASK_ENV=development
DEBUG=true
MAX_FILE_SIZE_MB=50
UPLOAD_FOLDER=backend/uploads
PROCESSED_FOLDER=backend/processed

# === URLS ===
STRIPE_SUCCESS_URL=http://localhost:5000/payment/success
STRIPE_CANCEL_URL=http://localhost:5000/payment/cancel

# === FEATURE FLAGS ===
ENABLE_PREVIEW=true
ENABLE_BATCH_PROCESSING=false
ENABLE_ANALYTICS=true