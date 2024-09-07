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
COPY ./services/novnc.service /etc/systemd/system/novnc.service
RUN systemctl enable novnc

###############################################################################################################################################################################################################################
# Tigervnc #
############
RUN apt install -y python3-websockify tigervnc-standalone-server
COPY ./services/tigervnc.service /etc/systemd/system/tigervnc.service
RUN (echo "admin123"; echo "admin123"; echo "n") | vncpasswd
RUN systemctl enable tigervnc

###############################################################################################################################################################################################################################
# Expose #
##########
# Expose the VNC port
EXPOSE 5901

# Expose the NOVNC port
EXPOSE 6080

###############################################################################################################################################################################################################################
# WorkDir #
###########
WORKDIR /root

###############################################################################################################################################################################################################################
# Set the default command to run systemd #
##########################################
CMD ["systemd"]
