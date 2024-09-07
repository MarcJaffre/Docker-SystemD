# Docker-SystemD

[![Build and Push Docker Image](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/MarcJaffre/Docker-SystemD/actions/workflows/docker-image.yml)


# Creation Image
```bash
clear;
cd /tmp;
rm -rf ./Docker-SystemD 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker-SystemD.git;
cd ./Docker-SystemD;
docker image rm -f systemd:latest 2>/dev/null;
docker build -f Dockerfile -t systemd .;
```
