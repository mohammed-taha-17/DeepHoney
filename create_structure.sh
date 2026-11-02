#!/bin/bash

echo "🚀 Starting DeepHoney Structure Creation..."

# إنشاء المجلدات
mkdir -p configs/honeypots
mkdir -p configs/logstash
mkdir -p configs/nginx
mkdir -p src/correlation
mkdir -p src/ai_model
mkdir -p src/ui/static
mkdir -p src/ui/templates
mkdir -p data/logs
mkdir -p data/pcap
mkdir -p docs/diagrams
mkdir -p docs/reports

# إنشاء الملفات الأساسية
touch docker-compose.yml
touch .env.example
touch README.md
touch data/logs/.gitkeep
touch data/pcap/.gitkeep

# إنشاء ملف .gitignore
cat <<EOT > .gitignore
# Python
venv/
__pycache__/
*.pyc

# Environment Variables
.env

# Data & Logs
data/logs/*
data/pcap/*
!data/logs/.gitkeep
!data/pcap/.gitkeep

# OS Files
.DS_Store
Thumbs.db
EOT

# إنشاء ملف setup.md
cat <<EOT > setup.md
# DeepHoney - Development Environment Setup Guide

مرحباً بك في فريق DeepHoney. اتبع هذه الخطوات لتجهيز بيئتك المحلية.

## المتطلبات المسبقة
- Ubuntu 22.04 LTS (WSL أو VMware)
- 8GB RAM, 4 CPU Cores
- Docker Desktop (على ويندوز)

## خطوات التثبيت
1. جلب الكود:
   \`\`\`bash
   git clone https://github.com/YourTeam/DeepHoney.git
   cd DeepHoney
   \`\`\`

2. تشغيل سكربت التثبيت:
   \`\`\`bash
   chmod +x setup.sh
   ./setup.sh
   \`\`\`

3. تفعيل صلاحيات Docker:
   قم بتسجيل الخروج والدخول (Log out & Log in)، ثم تحقق:
   \`\`\`bash
   docker --version
   \`\`\`

4. تشغيل النظام:
   \`\`\`bash
   docker compose up -d
   \`\`\`
EOT

# إنشاء ملف setup.sh
cat <<EOT > setup.sh
#!/bin/bash
echo "🚀 Setting up DeepHoney..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git python3 python3-pip python3-venv net-tools jq

if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker \$USER
    rm get-docker.sh
fi

if [ ! -d "venv" ]; then
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip
    pip install requests elasticsearch pandas
    deactivate
fi

echo "✅ Setup Complete! Please log out and log back in."
EOT

chmod +x setup.sh

echo "======================================================"
echo "✅ Project structure created successfully!"
echo "👉 Next steps: git add . && git commit -m 'Initial commit'"
echo "======================================================"
