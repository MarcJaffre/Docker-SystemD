#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Outil #
#########
RUN apt install -y bash;
RUN apt install -y bash-completion;
RUN apt install -y nano;
RUN apt install -y net-tools;

###############################################################################################################################################################################################################################
# SSH #
#######
RUN apt install -y openssh-server;
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config 2>/dev/null;

###############################################################################################################################################################################################################################
# VNC #
#######
RUN apt install -y novnc;
RUN apt install -y python3-websockify;
RUN apt install -y tigervnc-standalone-server;
RUN (echo "admin123"; echo "admin123"; echo "n") | vncpasswd

###############################################################################################################################################################################################################################
# OpenSSL #
###########
RUN mkdir -p "/usr/share/novnc/";
RUN (echo "FR"; echo "France"; echo "Paris"; echo "Personnel"; echo "Personnel"; echo "$(hostname)"; echo "mail@exemple.co"; ) | openssl req -x509 -nodes -newkey rsa:3072 -keyout /usr/share/novnc/novnc.pem -out /usr/share/novnc/novnc.pem -days 3650

###############################################################################################################################################################################################################################
# Environnement User #
######################
RUN apt install --no-install-recommends -y mate;


