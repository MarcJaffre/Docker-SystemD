# Docker-SystemD

[![Build and Push Docker Image](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml)


# Guide de lancement
Il suffit de coller le code suivant dans la console et sa génère et lance le conteneur.
```bash
clear;
####################################################################
# Conteneur #
#############
docker image prune -a -f  1>/dev/null;
cd /tmp/Docker-SystemD    2>/dev/null;
docker-compose down       2>/dev/null;

####################################################################
# GIT #
#######
cd /tmp;
rm -rf ./Docker-SystemD 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker-SystemD.git;
cd ./Docker-SystemD;

####################################################################
# Image #
#########
docker image rm -f systemd:latest 2>/dev/null;
docker build -f Dockerfile -t systemd .;

####################################################################
# Conteneur #
#############
docker-compose up -d;
```

# Fonctionnement
```
- Démarrage de l'OS
- Mot de passe root
- Mise à jour des paquets
- Installation de SystemD
- Copie de fichier
- Permission
- Installation des paquets
- Activation du service custom
- Exposition de port
- Démarrage SystemD
```
