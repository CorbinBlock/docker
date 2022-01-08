FROM debian
WORKDIR /git
VOLUME /git
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install git-lfs -y
RUN apt-get install iputils-ping -y
RUN apt-get install openjdk-11-jdk -y
RUN apt-get install groovy -y
RUN cd /usr/lib/jvm; ln -s java-11-openjdk-amd64/ default-java
RUN apt-get install python3 python3-pip -y
RUN apt-get install vim -y
RUN export JAVA_HOME=/usr/lib/jvm/openjdk-11-jdk
RUN export PATH=$PATH:$JAVA_HOME/bin
RUN git clone https://github.com/CorbinBlock/bash.git
RUN git clone https://github.com/CorbinBlock/docker.git
RUN git clone https://github.com/CorbinBlock/java.git
RUN git clone https://github.com/CorbinBlock/jenkins.git
RUN git clone https://github.com/CorbinBlock/python.git
RUN git clone https://github.com/CorbinBlock/sql.git
RUN git clone https://github.com/CorbinBlock/unit_test.git
