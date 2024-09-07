FROM debian:12

##############################################################################################################
# Root
RUN echo root:admin | chpasswd

##############################################################################################################
# Install systemd
RUN apt update
RUN apt upgrade -y

##############################################################################################################
# Install Package
RUN apt install -y \
bash-completion \
nano \
openssh-server \
systemd \
systemd-sysv

##############################################################################################################
# NOVNC
RUN apt -y install -y novnc python3-websockify

##############################################################################################################
# Certificat #
##############
RUN (\
echo "FR"; \
echo "France"; \
echo "Paris"; \
echo "PERSO"; \
echo "Public"; \
echo "$(hotname)"; \
echo ""\
) | \
openssl req -x509 -nodes -newkey rsa:3072 -keyout /root/novnc.pem -out /root/novnc.pem -days 3650


##############################################################################################################
# Services #
############
RUN cat > /etc/systemd/system/novnc.service  << EOF
https://wiki.formatc.hr/link/109#bkmrk-%5Bservice%5Duser%3Dwww-da
 
[Service]
User=www-data
ExecStart=
ExecStart=authbind --deep novnc --listen 80

[Install]
WantedBy=graphical.target
EOF



##############################################################################################################
# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

##############################################################################################################
# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

##############################################################################################################
# SSH
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;

##############################################################################################################
# Workdir
WORKDIR /app

##############################################################################################################
# Expose
EXPOSE 22

##############################################################################################################
# Set the default command to run systemd
CMD ["/sbin/init"]
