FROM debian
WORKDIR /git
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install python3 python3-pip -y
RUN apt-get install openjdk-11-jdk -y
RUN export JAVA_HOME=/usr/lib/jvm/openjdk-11-jdk
RUN export PATH=$PATH:$JAVA_HOME/bin
RUN apt-get install groovy -y
RUN apt-get install iputils-ping -y
