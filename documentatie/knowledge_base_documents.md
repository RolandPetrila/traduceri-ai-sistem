# 📚 Knowledge Base - Traduceri AI

## Document 1: GitHub_Workflow_Guide.md

```markdown
# 🐙 GitHub Workflow Guide - Traduceri AI

## Token GitHub
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

## Comenzi Git Esențiale

### Setup Inițial
```bash
git config --global user.name "Numele Tău"
git config --global user.email "petrilarolly@gmail.com"
git clone https://github.com/username/traduceri-ai-sistem.git
cd traduceri-ai-sistem
```

### Workflow Zilnic
```bash
git pull origin main          # Aduce updates
git add .                     # Adaugă modificări
git commit -m "Description"   # Salvează local
git push origin main          # Trimite pe GitHub
```

### Colaborare AI
- Repository public: https://github.com/username/traduceri-ai-sistem
- Acces instant pentru orice AI
- Context complet și actualizat
```

## Document 2: Multi_AI_Collaboration.md

```markdown
# 🤖 Multi-AI Collaboration Strategy

## Echipa AI Specializată

### 🏗️ Claude Sonnet 4 (ARHITECT)
- Rol: Strategy & planning general
- Responsabilități: Code review, architecture decisions, coordonare
- Chat: Principal (acest chat)

### ⚡ Claude Sonnet 4 (BACKEND)
- Rol: Python development specialist
- Focus: API integrations, DeepL, Stripe, FGO, database
- Deliverables: Backend complet funcțional

### 🎨 GPT-5 (FRONTEND)
- Rol: WordPress & UI specialist
- Focus: User interface, JavaScript, payment forms
- Deliverables: Frontend responsive și intuitiv

### 🔧 Custom GPT-5 (DEVOPS)
- Rol: Testing & deployment
- Focus: QA, automation, documentation, monitoring
- Deliverables: Production-ready deployment

## Workflow Colaborare
1. Arhitect → Definește task
2. Specialist → Implementează
3. GitHub → Sync context
4. Review → Optimizare
5. Integration → Testing
6. Deployment → Live
```

## Document 3: Project_Structure.md

```markdown
# 📁 Project Structure - Traduceri AI

## Business Model
- Cod CAEN 7430 (fără autorizare MJ)
- Monetizare: 7-9 RON/pagină, 0.06-0.08 RON/cuvânt
- Target: 50+ traduceri/zi = €4000-5000/lună
- Costuri: ~€35-45/lună

## Stack Tehnologic
- Frontend: WordPress + drag & drop
- Backend: Python Flask API
- APIs: DeepL Pro + Google Translate + Stripe + FGO
- Database: PostgreSQL production / SQLite dev
- Hosting: VPS + Nginx

## Structura Repository
```
traduceri-ai-sistem/
├── backend/           # Python Flask server
├── frontend/          # WordPress theme + HTML
├── api-integration/   # DeepL, Stripe, FGO clients
├── docs/             # Documentation
├── tests/            # Testing suites
├── config/           # Configuration templates
├── tools/            # Helper scripts
└── README.md         # Project overview
```

## Flux Automat
Client Upload → Cost Calculator → Preview → Payment → Translation → Email Delivery
```

## Document 4: Configurare_Deployment.txt

```
# Configurare Deployment - Traduceri AI

## API Keys Configuration (.env)
DEEPL_API_KEY=your_deepl_pro_key
STRIPE_SECRET_KEY=sk_live_your_stripe_key
STRIPE_PUBLISHABLE_KEY=pk_live_your_publishable_key
FGO_API_ENDPOINT=https://api.fgo.ro/v1
FGO_USERNAME=your_fgo_username
FGO_PASSWORD=your_fgo_password
SMTP_USER=petrilarolly@gmail.com
SMTP_PASSWORD=your_gmail_app_password

## VPS Requirements
- Ubuntu 20.04+ LTS
- Python 3.8+
- Nginx reverse proxy
- SSL certificate
- PostgreSQL database
- 2GB RAM minimum

## Production Setup
1. VPS provisioning
2. Domain & SSL setup
3. Database configuration
4. Python environment
5. Nginx configuration
6. API keys deployment
7. Testing & monitoring

## Security
- HTTPS mandatory
- API keys în environment variables
- CORS configuration
- Rate limiting
- Input validation
- Payment security (PCI compliance)
```

## Document 5: README_Knowledge_Base.md

```markdown
# 📖 README Knowledge Base - Traduceri AI

## Organizarea Documentației

### Core Documents
1. **GitHub_Workflow_Guide.md** - Comenzi Git și colaborare AI
2. **Multi_AI_Collaboration.md** - Strategia echipei specializate  
3. **Project_Structure.md** - Arhitectura și business model
4. **Configurare_Deployment.txt** - Setup production
5. **2.1_11.08.25_Ajutor_Claude_Traduceri_WEB.md** - Conversația completă

### Context Business
- Birou online traduceri 100% automatizat
- Legal prin CAEN 7430 (fără autorizare)
- Monetizare: 7-9 RON/pagină
- Stack: WordPress + Python + DeepL + Stripe + FGO

### Status Current
- MVP local funcțional (localhost:5000)
- GitHub token: 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
- Repository: traduceri-ai-sistem (public pentru AI access)

### Next Steps
1. Finalizare GitHub repository setup
2. Configurare API keys reale
3. Optimizare production
4. Colaborare multi-AI activă
```