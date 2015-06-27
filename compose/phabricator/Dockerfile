FROM ubuntu
MAINTAINER Oyach <lzy7750015@gmail.com> 

# =======================================
# Support
# 1. daemontools
# 2. ssh
# =======================================

ENV DEBIAN_FRONTEND noninteractive

# Install 
RUN apt-get update && \
apt-get install -y wget && \
wget http://www.phabricator.com/rsrc/install/install_ubuntu.sh && \
chmod +x ./install_ubuntu.sh && \
./install_ubuntu.sh