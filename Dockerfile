FROM debian:12

# Install systemd
RUN apt update

# Install SystemD
RUN apt install -y systemd
RUN apt install -y systemd-sysv
RUN apt install -y openssh-server

# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# Workdir
WORKDIR /app

# Expose
EXPOSE 22 80 443

# Set the default command to run systemd
CMD ["/sbin/init"]
