#!/usr/bin/bash

##########################################################################################################################################################
# Configuration de NOVNC #
##########################
systemctl enable novnc;
systemctl start novnc;

##########################################################################################################################################################
# Configuration du SSH #
########################
sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
systemctl disable --now ssh;
