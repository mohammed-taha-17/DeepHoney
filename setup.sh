#!/bin/bash
echo "🚀 Setting up DeepHoney..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git python3 python3-pip python3-venv net-tools jq

if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
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
