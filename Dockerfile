# Use an official Debian image as a base
FROM debian:latest

# Install systemd and other dependencies
RUN apt-get update && apt-get install -y systemd systemd-sysv

# Create a directory for our script and service files
RUN mkdir -p /etc/systemd/system

# Copy the script to launch services
COPY start_services.sh /start_services.sh
RUN chmod +x /start_services.sh

# Copy the systemd service files
COPY novnc.service /etc/systemd/system/novnc.service
COPY apache2.service /etc/systemd/system/apache2.service
COPY mysql.service /etc/systemd/system/mysql.service
COPY ssh.service /etc/systemd/system/ssh.service

# Configure systemd to use our script to launch services
RUN systemctl enable /start_services.sh
RUN systemctl start /start_services.sh

# Expose the necessary ports
EXPOSE 80 443 22

# Set the default command to run when the container starts
CMD ["/start_services.sh"]
