#!/usr/bin/env python3
"""
Configuration Management for Traduceri AI System
Centralized configuration with environment-based settings
"""

import os
from pathlib import Path
from typing import Dict, List, Optional
from dataclasses import dataclass

@dataclass
class APIConfig:
    """API configuration container"""
    name: str
    key: str
    endpoint: str
    enabled: bool

class ConfigurationManager:
    """Centralized configuration management"""
    
    def __init__(self, env_file: str = '.env'):
        self.environment = os.getenv('FLASK_ENV', 'development')
        self.debug_mode = self.environment == 'development'
        
        # API Configuration
        self.DEEPL_API_KEY = os.getenv('DEEPL_API_KEY', '')
        self.GOOGLE_TRANSLATE_KEY = os.getenv('GOOGLE_TRANSLATE_KEY', '')
        self.STRIPE_SECRET_KEY = os.getenv('STRIPE_SECRET_KEY', '')
        
        # Business settings
        self.COST_PER_WORD = 0.07  # 7 RON/100 cuvinte
        self.COST_PER_PAGE = 8.0   # 8 RON/pagină
        
    def validate_production_readiness(self) -> Dict:
        """Validate if system is production ready"""
        checks = {
            'api_keys_configured': bool(self.DEEPL_API_KEY and self.STRIPE_SECRET_KEY),
            'debug_disabled': not self.debug_mode,
            'secret_key_secure': len(os.getenv('SECRET_KEY', '')) > 20
        }
        
        passed = sum(checks.values())
        total = len(checks)
        
        return {
            'ready_for_production': passed == total,
            'readiness_score': (passed / total) * 100,
            'checks': checks
        }

# Global configuration instance
config = ConfigurationManager()
