# Use an official Debian image as the base
FROM debian:latest

# Install systemd and NoVNC
RUN apt-get update && \
    apt-get install -y systemd novnc && \
    apt-get clean

# Expose the NoVNC port
EXPOSE 6080

# Set the default command to run when the container starts
CMD ["systemd"]
