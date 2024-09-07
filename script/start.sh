#!/usr/bin/bash

##########################################################################################################################################################
# Configuration de NOVNC #
##########################
systemctl enable novnc;
systemctl start novnc;

##########################################################################################################################################################
# Configuration du SSH #
########################
systemctl disable --now ssh;
sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
