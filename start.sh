#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Gestion des services #
########################
systemctl enable --now novnc;
systemctl enable --now ssh;
systemctl enable --now tigervncserver;

##########################################################################################################################################################
# Bureautique #
###############
#/usr/bin/tigervncserver -xstartup /usr/bin/mate-session -autokill -localhost no :1
#  -SecurityTypes None
