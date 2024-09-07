# Docker-SystemD

[![Build and Push Docker Image](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml)


# Creation Image
```bash
clear;
cd ;
git clone https://github.com/MarcJaffre/Docker-SystemD.git;
cd Docker-SystemD;
docker image rm -f systemd 2>/dev/null;
docker build -f Dockerfile -t systemd;
