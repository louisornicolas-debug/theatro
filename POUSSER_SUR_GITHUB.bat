@echo off
chcp 65001 >nul
echo.
echo ========================================
echo 🚀 DÉPLOIEMENT SUR GITHUB
echo ========================================
echo.

REM Vérifier si Git est installé
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git n'est pas installé!
    echo.
    echo Installez Git depuis: https://git-scm.com/download/win
    pause
    exit /b
)

echo ✅ Git détecté
echo.

REM Demander le nom d'utilisateur GitHub
set /p GITHUB_USER="Entrez votre nom d'utilisateur GitHub: "

if "%GITHUB_USER%"=="" (
    echo ❌ Nom d'utilisateur requis!
    pause
    exit /b
)

echo.
echo 📦 Initialisation du repository Git...
git init

echo.
echo 📝 Ajout de tous les fichiers...
git add .

echo.
echo 💾 Création du commit initial...
git commit -m "Initial commit - Theatro VIP Reservation System"

echo.
echo 🌐 Configuration du repository GitHub...
git branch -M main
git remote add origin https://github.com/%GITHUB_USER%/theatro-reservation.git

echo.
echo 🚀 Push vers GitHub...
git push -u origin main

if errorlevel 0 (
    echo.
    echo ========================================
    echo ✅ SUCCÈS !
    echo ========================================
    echo.
    echo Votre code est maintenant sur GitHub:
    echo https://github.com/%GITHUB_USER%/theatro-reservation
    echo.
    echo 🌐 Pour déployer sur Vercel:
    echo 1. Allez sur vercel.com
    echo 2. Cliquez "Import Project"
    echo 3. Sélectionnez votre repo
    echo 4. Cliquez "Deploy"
    echo.
) else (
    echo.
    echo ========================================
    echo ⚠️  ERREUR
    echo ========================================
    echo.
    echo Si le repo n'existe pas encore:
    echo 1. Allez sur https://github.com/new
    echo 2. Créez un repo nommé "theatro-reservation"
    echo 3. Ne cochez RIEN
    echo 4. Relancez ce script
    echo.
)

pause
