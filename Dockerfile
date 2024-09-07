FROM debian:12

# Install systemd
RUN apt update
#RUN apt install -y dbus
#RUN apt install -y dbus-user-session
RUN apt install -y systemd
RUN apt install -y systemd-sysv

# Create the directory for systemd configuration overrides
RUN mkdir -p /etc/systemd/system.conf.d/

# Configure systemd to start automatically
RUN echo "[Install]" > /etc/systemd/system.conf.d/override.conf
RUN echo " systemctl daemon-reexec" >> /etc/systemd/system.conf.d/override.conf

# Set the default command to run systemd
#CMD ["systemd"]
CMD ["exec", "/sbin/init"]

# docker run -d -it --privileged my-debian-systemd-image
