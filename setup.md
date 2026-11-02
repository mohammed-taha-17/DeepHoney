# DeepHoney - Development Environment Setup Guide

مرحباً بك في فريق DeepHoney. اتبع هذه الخطوات لتجهيز بيئتك المحلية.

## المتطلبات المسبقة
- Ubuntu 22.04 LTS (WSL أو VMware)
- 8GB RAM, 4 CPU Cores
- Docker Desktop (على ويندوز)

## خطوات التثبيت
1. جلب الكود:
   ```bash
   git clone https://github.com/YourTeam/DeepHoney.git
   cd DeepHoney
   ```

2. تشغيل سكربت التثبيت:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. تفعيل صلاحيات Docker:
   قم بتسجيل الخروج والدخول (Log out & Log in)، ثم تحقق:
   ```bash
   docker --version
   ```

4. تشغيل النظام:
   ```bash
   docker compose up -d
   ```
