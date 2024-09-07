#/!/usr/bin/bash

###############################################################################################################################################################################################################################
# Outil #
#########
apt install -y bash;
apt install -y bash-completion;
apt install -y nano;
apt install -y net-tools;
apt install -y openssh-server;

###############################################################################################################################################################################################################################
# Environnement User #
######################
apt install --no-install-recommends mate;

###############################################################################################################################################################################################################################
# VNC #
#######
apt install -y novnc;
apt install -y python3-websockify;
apt install -y tigervnc-standalone-server;
(echo "admin123"; echo "admin123"; echo "n") | vncpasswd

tigervncserver -xstartup /usr/bin/mate-session -geometry 800x600 -localhost no :1



###############################################################################################################################################################################################################################
# Configuration SSH #
#####################
sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config 2>/dev/null;


###############################################################################################################################################################################################################################
# OpenSSL #
###########
mdkir -p /usr/share/novnc/;
(echo "FR"; echo "France"; echo "Paris"; echo "Personnel"; echo "Personnel"; echo "$(hostname)"; echo "mail@exemple.co"; ) | \
openssl req -x509 -nodes -newkey rsa:3072 -keyout /usr/share/novnc/novnc.pem -out /usr/share/novnc/novnc.pem -days 3650

