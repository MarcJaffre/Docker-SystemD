#!/usr/bin/bash

###################################################################
# Demarrage des services #
##########################
#systemctl start ssh;
#systemctl start novnc;
#systemctl start tigervnc;

/usr/bin/tigervncserver -localhost :99 -xstartup /etc/X11/Xfce4/xinitrc &
/usr/bin/websockify -D --web /usr/share/novnc/ 6080 localhost:5900 &
