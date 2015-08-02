FROM dockerfile/java:oracle-java8

# Defines environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Installs curl and GVM
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -s get.gvmtool.net | bash && \
    apt-get autoremove -y && \
    && rm -rf /var/lib/apt/lists/*