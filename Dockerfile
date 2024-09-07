# Use an official Debian image as the base
FROM debian:latest

# Install systemd and NoVNC
RUN apt-get update && \
    apt-get install -y systemd novnc && \
    apt-get clean

# Enable systemd
RUN systemctl enable systemd

# Create a systemd service file for NoVNC
RUN COPY ./systemd/novnc.service /etc/systemd/system/novnc.service

# Reload systemd daemon
RUN systemctl daemon-reload

# Start NoVNC service
RUN systemctl start novnc

# Expose the NoVNC port
EXPOSE 6080

# Set the default command to run when the container starts
CMD ["systemd"]
