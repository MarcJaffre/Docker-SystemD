###############################################################################################################################################################################################################################
# Operating System #
####################
FROM debian:12

###############################################################################################################################################################################################################################
# Mise a jour du conteneur #
############################
RUN apt update && apt upgrade -y

###############################################################################################################################################################################################################################
# SystemD #
###########
RUN \
apt install -y systemd systemd-sysv && \
mkdir -p /etc/systemd/system.conf.d && \
echo "[Install] \n systemctl daemon-reexec"  > /etc/systemd/system.conf.d/override.conf 

###############################################################################################################################################################################################################################
# Paquets #
###########
RUN apt install -y \
bash \
bash-completion \
nano \
net-tools \
novnc \
openssh-server \
python3-websockify \
tigervnc-standalone-server

#RUN apt install --no-install-recommends -y mate;

###############################################################################################################################################################################################################################
# SSH #
#######
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config 2>/dev/null;
RUN echo root:admin | chpasswd

###############################################################################################################################################################################################################################
# OpenSSL #
###########
RUN (echo "FR"; echo "France"; echo "Paris"; echo "Personnel"; echo "Personnel"; echo "$(hostname)"; echo "mail@exemple.co"; ) | openssl req -x509 -nodes -newkey rsa:3072 -keyout /usr/share/novnc/novnc.pem -out /usr/share/novnc/novnc.pem -days 3650
RUN (echo "admin123"; echo "admin123"; echo "n") | vncpasswd
RUN mkdir -p "/usr/share/novnc/";











###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22 80 443 5900 8080

###############################################################################################################################################################################################################################
# WorkDir #
###########
WORKDIR /root

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["systemd"]
