FROM debian:12

# Root
RUN echo root:admin | chpasswd

# Install systemd
RUN apt update
RUN apt upgrade -y

# Install SystemD
RUN apt install -y systemd
RUN apt install -y systemd-sysv

# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# SSH
RUN apt install -y openssh-server
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;

# Workdir
WORKDIR /app

# Expose
EXPOSE 22

# Set the default command to run systemd
CMD ["/sbin/init"]
