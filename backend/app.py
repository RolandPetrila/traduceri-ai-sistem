from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
import os
import json
from datetime import datetime
import hashlib

# Nu mai forțăm dotenv dacă nu se instalează
try:
    from dotenv import load_dotenv
    load_dotenv()
except:
    print("Rulare fără dotenv - OK pentru development")

app = Flask(__name__)
CORS(app)

app.config['UPLOAD_FOLDER'] = 'uploads'
app.config['MAX_CONTENT_LENGTH'] = 50 * 1024 * 1024  # 50MB

os.makedirs('uploads', exist_ok=True)
os.makedirs('processed', exist_ok=True)

@app.route('/')
def index():
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Traduceri AI</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
            }
            .container {
                background: white;
                color: #333;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            }
            h1 { color: #667eea; }
            .status { 
                background: #48bb78;
                color: white;
                padding: 10px;
                border-radius: 5px;
                margin: 20px 0;
            }
            .upload-box {
                border: 2px dashed #667eea;
                padding: 30px;
                text-align: center;
                border-radius: 10px;
                margin: 20px 0;
            }
            button {
                background: #667eea;
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 25px;
                font-size: 16px;
                cursor: pointer;
                margin: 10px;
            }
            button:hover {
                background: #5a67d8;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🌍 Sistem Traduceri AI</h1>
            <div class="status">✅ Sistem Operațional!</div>
            
            <div class="upload-box">
                <h3>📁 Încarcă Document</h3>
                <input type="file" id="fileInput" accept=".pdf,.docx,.txt">
                <br><br>
                <button onclick="uploadFile()">Încarcă și Calculează Cost</button>
            </div>
            
            <div id="result"></div>
        </div>
        
        <script>
            function uploadFile() {
                const fileInput = document.getElementById('fileInput');
                const file = fileInput.files[0];
                
                if (!file) {
                    alert('Selectează un fișier mai întâi!');
                    return;
                }
                
                const formData = new FormData();
                formData.append('file', file);
                
                fetch('/api/calculate-cost', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('result').innerHTML = `
                        <h3>Rezultat Analiză:</h3>
                        <p>📄 Fișier: ${data.filename}</p>
                        <p>📝 Cuvinte estimate: ${data.word_count}</p>
                        <p>📑 Pagini: ${data.page_count}</p>
                        <p>💰 Cost estimat: ${data.total_price} RON</p>
                        <button onclick="alert('Demo Mode - Pentru traduceri reale configurați API keys')">
                            Traducere Demo
                        </button>
                    `;
                })
                .catch(error => {
                    alert('Eroare: ' + error);
                });
            }
        </script>
    </body>
    </html>
    """

@app.route('/api/health')
def health_check():
    return jsonify({
        'status': 'healthy',
        'timestamp': datetime.now().isoformat(),
        'python_version': f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}",
        'message': 'Sistem Traduceri AI - Operational'
    })

@app.route('/api/calculate-cost', methods=['POST'])
def calculate_cost():
    try:
        if 'file' not in request.files:
            return jsonify({'error': 'Nu a fost incarcat niciun fisier'}), 400
        
        file = request.files['file']
        if file.filename == '':
            return jsonify({'error': 'Fisier invalid'}), 400
        
        # Salvare temporară
        file_id = hashlib.md5(f"{file.filename}{datetime.now()}".encode()).hexdigest()[:12]
        filename = file.filename.replace(' ', '_')
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], f"{file_id}_{filename}")
        file.save(filepath)
        
        # Analiză simplă
        file_size = os.path.getsize(filepath)
        estimated_words = file_size // 5
        estimated_pages = max(1, file_size // 3000)
        
        # Calcul preț
        price_per_word = estimated_words * 0.07
        price_per_page = estimated_pages * 8
        total_price = round(min(price_per_word, price_per_page), 2)
        
        return jsonify({
            'file_id': file_id,
            'word_count': estimated_words,
            'page_count': estimated_pages,
            'total_price': total_price,
            'estimated_time': '15 minute',
            'filename': filename
        })
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    print("\n" + "="*50)
    print("🚀 SERVER PORNIT CU SUCCES!")
    print("="*50)
    print("\n📌 Deschide browserul la:")
    print("   http://localhost:5000")
    print("\n💡 Apasă Ctrl+C pentru a opri serverul\n")
    app.run(debug=True, host='0.0.0.0', port=5000)
