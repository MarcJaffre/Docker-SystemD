#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Gestion des services #
########################
systemctl enable novnc;
systemctl enable ssh;
systemctl enable tigervncserver;







##########################################################################################################################################################
# Bureautique #
###############
#/usr/bin/tigervncserver -xstartup /usr/bin/mate-session -autokill -localhost no :1
#  -SecurityTypes None
