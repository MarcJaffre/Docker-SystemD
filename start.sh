#!/usr/bin/bash

##########################################################################################################################################################
# Service #
###########
systemctl enable  --now novnc & 2>/dev/null;
systemctl disable --now ssh   & 2>/dev/null;

##########################################################################################################################################################
# Environnement Graphique #
###########################
/usr/bin/tigervncserver -xstartup /usr/bin/mate-session -autokill -localhost no :1

#  -SecurityTypes None
