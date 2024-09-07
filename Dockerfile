###############################################################################################################################################################################################################################
# Operating System #
####################
FROM debian:12

###############################################################################################################################################################################################################################
# Mise a jour du conteneur #
############################
RUN apt update && apt upgrade -y

###############################################################################################################################################################################################################################
# SystemD #
###########
RUN apt install -y systemd systemd-sysv
RUN mkdir -p /etc/systemd/system.conf.d
RUN echo "[Install] \n systemctl daemon-reexec"  > /etc/systemd/system.conf.d/override.conf 

###############################################################################################################################################################################################################################
# SSH #
#######
RUN apt install -y openssh-server
RUN systemctl enable ssh

###############################################################################################################################################################################################################################
# NOVNC #
#########
RUN apt install -y novnc
RUN systemctl enable novnc

###############################################################################################################################################################################################################################
# TigerVNC #
############
RUN apt install -y python3-websockify
RUN apt install -y tigervnc-standalone-server

###############################################################################################################################################################################################################################
#RUN (echo "admin123"; echo "admin123"; echo "n") | vncpasswd
#RUN mkdir -p "/usr/share/novnc/";
#COPY ./services/novnc.service /etc/systemd/system/novnc.service
#RUN (echo "FR"; echo "France"; echo "Paris"; echo "Personnel"; echo "Personnel"; echo "$(hostname)"; echo "mail@exemple.co"; ) | openssl req -x509 -nodes -newkey rsa:3072 -keyout /usr/share/novnc/novnc.pem -out /usr/share/novnc/novnc.pem -days 3650

###############################################################################################################################################################################################################################
# Services #
############





###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22

###############################################################################################################################################################################################################################
# WorkDir #
###########
WORKDIR /root

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["systemd"]
