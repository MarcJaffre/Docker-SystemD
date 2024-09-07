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
RUN \
apt install -y systemd systemd-sysv && \
mkdir -p /etc/systemd/system.conf.d && \
echo "[Install]" > /etc/systemd/system.conf.d/override.conf && \
echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

###############################################################################################################################################################################################################################
# Paquets #
###########
RUN apt install -y bash bash-completion nano net-tools openssh-server

###############################################################################################################################################################################################################################
# Service #
###########
COPY ./services/start.service /etc/systemd/system/start_container.service

###############################################################################################################################################################################################################################
# Script #
##########
COPY ./script/start.sh        /usr/local/bin/start.sh
RUN chmod +x                  /usr/local/bin/start.sh

###############################################################################################################################################################################################################################
# Demarrage du service #
########################
RUN systemctl enable start.service

###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["systemd"]
