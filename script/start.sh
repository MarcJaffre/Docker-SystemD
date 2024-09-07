#!/usr/bin/bash

sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
sed -i -e "s/^#Port 22/Port 222/g" /etc/ssh/sshd_config;

systemctl stop ssh
