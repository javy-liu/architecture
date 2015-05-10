FROM ubuntu:oyach
MAINTAINER Oyach <lzy7750015@gmail.com> 

# =======================================
# Support
# 1. dns server
# =======================================

# Install bind9
RUN apt-get update && \
apt-get install -y bind9 && \
rm -rf /var/lib/apt/lists/*

# Copy file
COPY ./service/ /service/

RUN mkdir -m 0775 -p /var/run/named && \
chown root:bind /var/run/named && \
chmod +x /service/bind9/run

# VOLUME 
VOLUME ['/etc/bind']

# expose sshd port
EXPOSE 53 
EXPOSE 53/udp