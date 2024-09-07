FROM debian:12

# Mettre à jour les packages
RUN apt update

# Installer systemd
RUN apt install -y systemd systemd-sysv

# Configurer systemd comme gestionnaire d'init
#RUN update-rc.d systemd defaults
#RUN update-rc.d systemd enable

# Activer le service systemd
#RUN systemctl enable systemd

# Définir le répertoire de travail par défaut
#WORKDIR /root

# Exposer le port 22 pour SSH
#EXPOSE 22

# Définir la commande par défaut à exécuter lors du démarrage du conteneur
#CMD ["systemd"]
