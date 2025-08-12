#!/bin/bash
"""
Automated deployment script for Traduceri AI System
"""

set -e  # Exit on any error

echo "🚀 STARTING AUTOMATED DEPLOYMENT"
echo "=================================="

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create required directories
echo "📁 Creating directories..."
mkdir -p uploads processed logs ssl

# Copy environment template if .env doesn't exist
if [ ! -f ".env" ]; then
    echo "📋 Creating .env from template..."
    cp config/.env.template .env
    echo "⚠️  Please edit .env file with your API keys before continuing!"
    echo "Press Enter when ready..."
    read
fi

# Build and start services
echo "🔨 Building Docker containers..."
docker-compose build

echo "🚀 Starting services..."
docker-compose up -d

# Wait for services to start
echo "⏳ Waiting for services to start..."
sleep 10

# Check health
echo "🩺 Checking service health..."
if curl -f http://localhost:5000/api/health; then
    echo "✅ Services are running successfully!"
    echo ""
    echo "🌐 Access your application at:"
    echo "   Local: http://localhost:5000"
    echo "   Production: https://traduceri-ai.ro"
    echo ""
    echo "📊 View logs with: docker-compose logs -f"
    echo "🛑 Stop services with: docker-compose down"
else
    echo "❌ Service health check failed. Check logs:"
    docker-compose logs
fi
