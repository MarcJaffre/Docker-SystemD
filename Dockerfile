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
RUN apt install -y openssh-server


###############################################################################################################################################################################################################################
# Services #
############
RUN systemctl enable ssh

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
