FROM debian:12

###############################################################################################################################################################################################################################
# Root #
########
RUN echo root:admin | chpasswd

###############################################################################################################################################################################################################################
# Install systemd #
###################
RUN apt update
RUN apt upgrade -y

###############################################################################################################################################################################################################################
# Install Package #
###################
RUN apt install -y \
bash \
bash-completion \
nano \
net-tools \
novnc \
openssh-server \
systemd \
systemd-sysv \
x11vnc \
xterm \
xvfb

ENV HOME=/root \
DEBIAN_FRONTEND=noninteractive \
    LANG=fr_FR.UTF-8 \
    LANGUAGE=fr_FR.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes

###############################################################################################################################################################################################################################
# Create the directory for systemd configuration overrides #
############################################################
RUN mkdir -p /etc/systemd/system.conf.d/

###############################################################################################################################################################################################################################
# Configure systemd to start automatically #
############################################
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

###############################################################################################################################################################################################################################
# SSH #
#######
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
RUN sed -i -e "s/^#Port 22/Port 222/g" /etc/ssh/sshd_config;

###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["/sbin/init"]
