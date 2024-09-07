[Unit]
Description=Lancement du service NoVNC
After=network.target

[Service]
ExecStart=websockify -D --web=/usr/share/novnc/ --cert=/usr/share/novnc/novnc.pem 6080 localhost:5901 
Restart=always

[Install]
WantedBy=multi-user.target
