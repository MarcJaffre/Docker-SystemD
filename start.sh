#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Environment User #
####################
RUN apt install -y xfce4
#RUN apt install -y xfce4-goodies

###############################################################################################################################################################################################################################
# SSH #
#######
RUN apt install -y openssh-server
RUN mkdir -p /run/sshd && chmod 0755 /run/sshd
COPY ./services/ssh.service  /etc/systemd/system/ssh.service
RUN systemctl enable ssh.service

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
RUN (echo "admin123"; echo "admin123"; echo "n") | vncpasswd
COPY ./services/tigervnc.service /etc/systemd/system/tigervnc.service
RUN systemctl enable tigervnc;


###############################################################################################################################################################################################################################
# Start-up #
############
COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x    /usr/local/bin/start.sh

###############################################################################################################################################################################################################################
# Mon Service #
###############
COPY ./services/start.service  /etc/systemd/system/start.service
RUN chmod +x /etc/systemd/system/start.service
RUN systemctl enable start.service

###############################################################################################################################################################################################################################
# Expose #
##########
# Expose the VNC port
EXPOSE 5901

# Expose the NOVNC port
EXPOSE 6080


###################################################################
# Demarrage des services #
##########################
#systemctl start ssh;
#systemctl start novnc;
#systemctl start tigervnc;

