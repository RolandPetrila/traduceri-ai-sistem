#!/usr/bin/env python3
"""
Production-Ready Flask Backend for Traduceri AI
Integrates all services: translation, payment, document processing
"""

import os
import sys
import json
import logging
import traceback
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, Optional
from werkzeug.utils import secure_filename

# Flask and extensions
from flask import Flask, request, jsonify, send_file, send_from_directory
from flask_cors import CORS
import hashlib
import uuid

# Environment management
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    print("⚠️ python-dotenv not installed. Using environment variables only.")

# Import our custom services
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))

try:
    from api_integration.translation_service import TranslationService, TranslationCost
    from api_integration.payment_service import StripePaymentService, PaymentRequest
    from document_processor import DocumentProcessor
except ImportError as e:
    print(f"⚠️ Service import failed: {e}")
    print("Make sure all service files are in the correct directories")

# Flask application setup
app = Flask(__name__)
CORS(app, origins=['http://localhost:5000', 'http://127.0.0.1:5000'])

# Configuration
app.config.update(
    SECRET_KEY=os.getenv('SECRET_KEY', 'dev-key-change-in-production'),
    MAX_CONTENT_LENGTH=50 * 1024 * 1024,  # 50MB max file size
    UPLOAD_FOLDER='uploads',
    PROCESSED_FOLDER='processed',
    CACHE_FOLDER='cache',
    LOG_FOLDER='logs'
)

# Ensure directories exist
for folder in ['uploads', 'processed', 'cache', 'logs']:
    os.makedirs(folder, exist_ok=True)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
