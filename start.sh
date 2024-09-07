#!/bin/bash

# Load systemd daemon
systemd --system=/sysroot

# Disable and start the SSH service
systemctl disable ssh.service
systemctl stop ssh.service

# Check the status of all services
systemctl list-units --type=service
