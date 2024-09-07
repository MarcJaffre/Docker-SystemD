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

###############################################################################################################################################################################################################################
# Permission #
##############
RUN chmod +x /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/paquet.sh

###############################################################################################################################################################################################################################
# Paquets #
###########
RUN bash /usr/local/bin/paquet.sh

###############################################################################################################################################################################################################################
# Activation du service personnalise #
######################################
RUN systemctl enable novnc
RUN systemctl enable ssh
#RUN systemctl enable tigervncserver
#RUN systemctl enable start_container

###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22 80 443 5900 8080

###############################################################################################################################################################################################################################
# WorkDir #
###########
WORKDIR /root

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["systemd"]
