FROM debian:12

# Install systemd
RUN apt update && apt install -y systemd

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# Enable systemd
#RUN systemctl enable systemd

# Set the default command to run systemd
CMD ["systemd"]
