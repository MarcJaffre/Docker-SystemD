#!/bin/bash

# Load systemd daemon
systemd --system=/sysroot

# Enable and start the NoVNC service
systemctl enable novnc.service
systemctl start novnc.service

# Enable and start the Apache service
systemctl enable apache2.service
systemctl start apache2.service

# Enable and start the MySQL service
systemctl enable mysql.service
systemctl start mysql.service

# Enable and start the SSH service
systemctl enable ssh.service
systemctl start ssh.service

# Check the status of all services
systemctl list-units --type=service





# Disable and start the SSH service
#sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
#sed -i -e "s/^#Port 22/Port 222/g" /etc/ssh/sshd_config;
#systemctl disable ssh.service
#systemctl stop ssh.service

# Check the status of all services
#systemctl list-units --type=service
