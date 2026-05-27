#!/bin/bash
# =============================================
# init_git.sh — Run once to initialize the repo
# Usage: bash init_git.sh
# =============================================

set -e  # exit on any error

echo ""
echo "================================================"
echo "  monetary-policy-var — Git Initialization"
echo "================================================"
echo ""

# 1. Check git is installed
if ! command -v git &> /dev/null; then
    echo "ERROR: git is not installed. Install it first."
    exit 1
fi

# 2. Initialize repo
echo "[1/5] Initializing git repository..."
git init
git branch -M main

# 3. Set up .env reminder
if [ ! -f ".env" ]; then
    echo ""
    echo "REMINDER: Create your .env file with your FRED API key:"
    echo "  echo \"FRED_API_KEY=your_key_here\" > .env"
    echo ""
fi

# 4. Add all files (respecting .gitignore)
echo "[2/5] Staging files..."
git add .

# 5. First commit
echo "[3/5] Creating initial commit..."
git commit -m "Initial project structure

- Add README with project overview, methodology and setup instructions
- Add .gitignore for Python/Jupyter/data files
- Add requirements.txt with all dependencies
- Add directory structure: data/, notebooks/, src/, outputs/, docs/
- Add variable definitions metadata
- Add 00_setup_check.ipynb for environment verification
- Add MIT license"

echo ""
echo "[4/5] Done! Local repository initialized."
echo ""
echo "================================================"
echo " NEXT STEP: Connect to GitHub"
echo "================================================"
echo ""
echo " 1. Go to https://github.com/new"
echo " 2. Create a new EMPTY repository named: monetary-policy-var"
echo "    (do NOT add README, .gitignore or license — we already have them)"
echo ""
echo " 3. Then run the following commands:"
echo ""
echo "    git remote add origin https://github.com/YOUR_USERNAME/monetary-policy-var.git"
echo "    git push -u origin main"
echo ""
echo "[5/5] After pushing, your repo will be live on GitHub."
echo ""
