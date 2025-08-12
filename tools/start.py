import os
import subprocess
import sys

print("\n" + "="*50)
print("🚀 PORNIRE SERVER TRADUCERI AI")
print("="*50 + "\n")

# Verifică unde suntem
if os.path.exists('backend/app.py'):
    print("✓ Backend găsit")
    os.chdir('backend')
    python_path = '..\\venv\\Scripts\\python.exe'
elif os.path.exists('app.py'):
    print("✓ Sunt deja în backend")
    python_path = '..\\venv\\Scripts\\python.exe'
else:
    print("❌ Nu găsesc backend/app.py")
    input("Apasă Enter...")
    sys.exit(1)

print("Pornesc serverul...")
print("-" * 50)

# Pornește serverul
subprocess.run([python_path, 'app.py'])