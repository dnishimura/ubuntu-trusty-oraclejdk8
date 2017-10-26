# Dockerfile for Ubuntu 14.04 with Oracle JDK 8

### Install Docker using HomeBrew on OSX

```bash
brew update
brew upgrade
brew cask install docker
```

Run Docker service from your Applications directory

### Build Docker Image

Clone this repo

```bash
git clone https://github.com/dnishimura/ubuntu-trusty-oraclejdk8.git
cd ubuntu-trusty-oraclejdk8
```

Go to JDK8 download page at: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

Download the 64-bit linux tarball into the repo. Ex: `jdk-8u151-linux-x64.tar.gz`

### Build Docker Image

```bash
docker build -t ubuntu/jdk8:latest .
```

### Run Docker image in Interactive Mode

Mount your Java project directory to the container when you run it.

```bash
docker run -v <Absolute path to Java Project>:/<Java Project Name> -it ubuntu/jdk8:latest /bin/bash
```

Example:

```bash
docker run -v $HOME/github/samza:/samza -it ubuntu/jdk8:latest /bin/bash
```

### References

https://github.com/oracle/docker-images/tree/master/OracleJava/
