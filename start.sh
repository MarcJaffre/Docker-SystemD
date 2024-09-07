#!/bin/bash

/usr/sbin/init

# Load systemd daemon
systemd --system=/sysroot

# Enable and start the SSH service
systemctl enable ssh.service
systemctl start ssh.service





# Disable and start the SSH service
#sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
#sed -i -e "s/^#Port 22/Port 222/g" /etc/ssh/sshd_config;
#systemctl disable ssh.service
#systemctl stop ssh.service

# Check the status of all services
#systemctl list-units --type=service
