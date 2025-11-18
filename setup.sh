#!/usr/bin/env bash

set -e

echo "📦 Initialisation de l’environnement GeoNature…"

# ---------------------------
# 1) PYTHON BACKEND
# ---------------------------
echo "🐍 Création du venv Python…"

cd backend
python3 -m venv venv
source venv/bin/activate

echo "📥 Installation des dépendances backend…"
pip install --upgrade pip
pip install -r requirements_backend.txt

echo "🔍 Vérification versions installées :"
python -c "import flask, pandas, numpy; print('Flask:', flask.__version__, ' | Pandas:', pandas.__version__, ' | Numpy:', numpy.__version__)"

deactivate
cd ..

# ---------------------------
# 2) FRONTEND ANGULAR
# ---------------------------
echo "🅰️ Installation dépendances frontend…"

cd frontend

# Installation des dépendances Node
npm install

# Installation Angular CLI local si besoin
if ! npx ng version >/dev/null 2>&1; then
  echo "⬇️ Installation Angular CLI locale…"
  npm install @angular/cli@latest --save-dev
fi

cd ..

echo "✅ Installation terminée !"
