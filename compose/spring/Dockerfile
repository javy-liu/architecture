FROM java:8

# Defines environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

ENV SPRING_BOOT_VERSION=1.2.5.RELEASE
# Installs curl and GVM
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/spring && \
	cd /usr/local/spring && \
	curl -O http://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$SPRING_BOOT_VERSION/spring-boot-cli-$SPRING_BOOT_VERSION-bin.tar.gz && \
	tar -xvf *.gz && \
	rm -rf *.gz 

ENV SPRING_HOME /usr/local/spring/spring-$SPRING_BOOT_VERSION

ENV PATH $SPRING_HOME/bin:$PATH


