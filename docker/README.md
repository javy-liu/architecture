# System Environment

Provide System Environment Reuse

## About Organization

- system
- dns


### System

### DNS

- `/etc/hosts`
- local dns cache server
- first selected domain dns server
- root domain server


安装脚本

sudo apt-get update && \
sudo apt-get install wget && \
wget -qO- https://get.docker.com/ | sh


sudo usermod -aG docker your-user


openssl genrsa -aes256 -out ~/.docker/key.pem 2048
openssl req -new -x509 -days 365 -key key.pem -sha256 -out ~/.docker/ca.pem

 openssl genrsa -out ~/.docker/server-key.pem 2048