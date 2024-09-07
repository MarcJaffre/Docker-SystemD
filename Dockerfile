FROM debian:12

# Install systemd
RUN apt update && apt install -y systemd

# Enable systemd
RUN systemctl enable systemd

# Set the default command to run systemd
CMD ["systemd"]
