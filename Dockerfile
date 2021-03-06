FROM debian:stretch-slim

COPY . /usr/src/safecloudfs

# Setup JAVA_HOME
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"


WORKDIR /usr/src/safecloudfs


RUN mkdir -p /usr/share/man/man1/ && \
 apt-get update && \
 apt-get -y install openjdk-8-jdk-headless && \
 apt-get -y install maven && \
 apt-get -y install git && \
 apt-get -y install libfuse-dev

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64





RUN git clone https://github.com/inesc-id/DepSpacito.git
RUN cd DepSpacito && mvn clean && mvn install

RUN sh install.sh

# RUN mvn exec:java

# docker run --cap-add SYS_ADMIN --device /dev/fuse -i safecloudfs
