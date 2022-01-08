FROM debian
WORKDIR /git
RUN apt update -y && apt upgrade -y
RUN apt install git -y
RUN apt install python3 python3-pip -y
RUN apt install openjdk-11-jdk -y
RUN export JAVA_HOME=/usr/lib/jvm/openjdk-11-jdk
RUN export PATH=$PATH:$JAVA_HOME/bin
