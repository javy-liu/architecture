FROM jenkins

MAINTAINER Oyach <lzy7750015@gmail.com> 

# =======================================
# 扩展jenkins，
# 1. 安装常用插件
# 2. 添加sudo权限
# =======================================

ENV SPRING_BOOT_VERSION=1.2.5.RELEASE
ENV MAVEN_VERSION 3.3.3
ENV THRIFT_VERSION 0.8.0

ENV DEBIAN_FRONTEND noninteractive

USER root

# 安装vim等环境
RUN apt-get update && \
    apt-get install -y apt-utils sudo vim curl unzip make libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev && \
    curl -s get.gvmtool.net | bash && \
    rm -rf /var/lib/apt/lists/*

# 安装上maven环境
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# 安装docker环境
RUN wget -qO- https://get.docker.com/ | sh &&\
		sudo usermod -aG docker jenkins

# 安装spring-boot环境
RUN mkdir /usr/local/spring && \
	cd /usr/local/spring && \
	curl -O http://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$SPRING_BOOT_VERSION/spring-boot-cli-$SPRING_BOOT_VERSION-bin.tar.gz && \
	tar -xvf *.gz && \
	rm -rf *.gz 

# 安装thrift
RUN curl -fsSL http://archive.apache.org/dist/thrift/0.8.0/thrift-0.8.0.tar.gz | tar xzf - -C /tmp && \
	cd /tmp/thrift-$THRIFT_VERSION && \
	./configure && \
	make && \
	make install

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

ENV SPRING_HOME /usr/local/spring/spring-$SPRING_BOOT_VERSION

ENV PATH $SPRING_HOME/bin:$PATH 

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt