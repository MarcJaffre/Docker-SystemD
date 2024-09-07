###############################################################################################################################################################################################################################
# Operating System #
####################
FROM debian:12

###############################################################################################################################################################################################################################
# Root #
########
RUN echo root:admin | chpasswd

###############################################################################################################################################################################################################################
# Mise a jour du conteneur #
############################
RUN apt update
RUN apt upgrade -y

###############################################################################################################################################################################################################################
# SystemD #
###########
RUN apt install -y systemd systemd-sysv && mkdir -p /etc/systemd/system.conf.d
RUN echo "[Install] \n systemctl daemon-reexec"  > /etc/systemd/system.conf.d/override.conf 

###############################################################################################################################################################################################################################
# Copie de fichiers #
#####################
COPY ./Paquet.sh                  /usr/local/bin/paquet.sh  
COPY ./start.sh                   /usr/local/bin/start.sh

COPY ./services/start.service     /etc/systemd/system/start_container.service
COPY ./services/ssh.service       /etc/systemd/system/ssh.service
#COPY ./services/novnc.service     /etc/systemd/system/novnc.service
#COPY ./services/tigervnc.service  /etc/systemd/system/tigervncserver.service

###############################################################################################################################################################################################################################
# Permissions #
###############
RUN chmod +x /usr/local/bin/paquet.sh
RUN chmod +x /usr/local/bin/start.sh

###############################################################################################################################################################################################################################
# Lancement de script #
#######################
RUN bash /usr/local/bin/paquet.sh

###############################################################################################################################################################################################################################
# Gestion des services #
########################
#RUN systemctl enable start_container

###############################################################################################################################################################################################################################
# Expose #
##########
#EXPOSE 22 80 443 5900 8080

###############################################################################################################################################################################################################################
# WorkDir #
###########
#WORKDIR /root

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["systemd"]
