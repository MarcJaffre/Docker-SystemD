[Unit]
Description=NoVNC Service
After=network.target

[Service]
ExecStart=/usr/bin/novnc --listen 8080 --vnc localhost:5900
Restart=always

[Install]
WantedBy=multi-user.target
