#!/usr/bin/bash

###############################################################################################################################################################################################################################
# Gestion des services #
########################
systemctl enable --now novnc;
systemctl enable --now ssh;


# Desktop Requis !
systemctl enable --now tigervncserver;
