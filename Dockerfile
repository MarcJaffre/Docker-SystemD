FROM debian:12

# Install systemd
RUN apt update

# Install SystemD
RUN apt install -y systemd
RUN apt install -y systemd-sysv

# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# Workdir
/app

# Expose
EXPOSE 22 80 443

# Set the default command to run systemd
CMD ["/sbin/init"]
