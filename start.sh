#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Gestion des services #
########################
RUN systemctl enable novnc
RUN systemctl enable ssh
RUN systemctl enable tigervncserver








##########################################################################################################################################################
# Bureautique #
###############
#/usr/bin/tigervncserver -xstartup /usr/bin/mate-session -autokill -localhost no :1
#  -SecurityTypes None
