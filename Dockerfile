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
openssh-server \
systemd \
systemd-sysv

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
# Copy #
########
COPY ./start.sh /usr/local/bin/start_services.sh

###############################################################################################################################################################################################################################
# Permission #
##############
RUN chmod +x /usr/local/bin/start_services.sh

###############################################################################################################################################################################################################################
# Expose #
##########
EXPOSE 22

###############################################################################################################################################################################################################################
# Set the default command to run systemd
CMD ["/usr/local/bin/start_services.sh"]

#CMD ["/sbin/init"]
#CMD ["systemd", "--system=/sysroot", "start", "multi-user.target"]
