FROM debian:12

# Root
RUN echo root:admin | chpasswd

# Install systemd
RUN apt update
RUN apt upgrade -y

# TEMP
COPY ./requierement.txt /tmp/requierement.txt

# Install Package
for PACKAGE in $(cat /tmp/requierement.txt); do apt install -y $PACKAGE done

# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# SSH
RUN sed -i -e "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;

# Workdir
WORKDIR /app

# Expose
EXPOSE 22

# Set the default command to run systemd
CMD ["/sbin/init"]
