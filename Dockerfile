FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y vim

ENV JAVA_PKG=jdk-8u*-linux-x64.tar.gz \
    JAVA_HOME=/usr/java/default \
    _JAVA_OPTIONS="-Xmx1024m -Xms512m"

ADD $JAVA_PKG /usr/java/

RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    update-alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    update-alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    update-alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000 && \
    update-alternatives --install /usr/bin/javadoc javadoc $JAVA_DIR/bin/javadoc 20000

ADD ./configure.sh /root/
WORKDIR /root
RUN ["chmod", "+x", "configure.sh"]
RUN ["./configure.sh"]
WORKDIR /
CMD []

