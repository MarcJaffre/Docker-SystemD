#/!/usr/bin/bash

###############################################################################################################################################################################################################################
# Outil #
#########
apt install -y bash;
apt install -y bash-completion;
apt install -y nano;
apt install -y net-tools;
apt install -y novnc;
apt install -y openssh-server;
apt install -y python3-websockify

###############################################################################################################################################################################################################################
# Configuration #
#################
sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config 2>/dev/null;


