FROM jenkins

MAINTAINER Oyach <lzy7750015@gmail.com> 

# =======================================
# 扩展jenkins，
# 1. 安装常用插件
# 2. 添加sudo权限
# =======================================

USER root
RUN apt-get update 
      && apt-get install -y sudo 
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt