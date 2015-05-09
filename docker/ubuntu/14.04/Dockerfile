FROM ubuntu:latest
MAINTAINER Oyach <lzy7750015@gmail.com> 

# =======================================
# Support
# 1. daemontools
# 2. ssh
# =======================================

# Install OpenSSH and daemontools
RUN apt-get update; \
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server daemontools daemontools-run

# Copy file
COPY ./service /service

# setting 
RUN mkdir /var/run/sshd && \
sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
chmod +x /service/sshd/run

# Define default command.
CMD svscan /service

# run sshd as the root user
USER root

# expose sshd port
EXPOSE 22