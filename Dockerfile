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
RUN \
apt install -y systemd systemd-sysv && \
mkdir -p /etc/systemd/system.conf.d && \
echo "[Install] \n systemctl daemon-reexec"  > /etc/systemd/system.conf.d/override.conf 

###############################################################################################################################################################################################################################
# Packages #
############
RUN apt install -y novnc
RUN apt install -y openssh-server

###############################################################################################################################################################################################################################
# Copie de fichier #
####################
COPY ./services/start.service     /etc/systemd/system/start_container.service
COPY ./services/novnc.service     /etc/systemd/system/novnc.service
COPY ./services/tigervnc.service  /etc/systemd/system/tigervncserver.service
COPY ./scripts/start.sh           /usr/local/bin/start.sh

###############################################################################################################################################################################################################################
# Permission #
##############
RUN chmod +x /usr/local/bin/start.sh

###############################################################################################################################################################################################################################
# Services #
############
RUN systemctl enable novnc
RUN systemctl enable ssh

#RUN systemctl enable start_container

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
