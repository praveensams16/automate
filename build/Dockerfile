FROM centos

ENV PATH="/usr/local/java/bin:/usr/local/maven/bin:${PATH}" \
    JAVA_HOME="/usr/local/java"

COPY jdk-8u241-linux-x64.tar.gz /usr/local/src/
COPY apache-maven-3.6.3-bin.tar.gz /usr/local/src/

WORKDIR "/mnt"

RUN yum install unzip -y \
    && yum install git -y 

RUN mkdir /usr/local/{java,maven} \
    && cd /usr/local/src \
    && tar -zxvf jdk-8u241-linux-x64.tar.gz \
    && cd jdk1.8.0_241/ \
    && mv * /usr/local/java/ \
    && cd /usr/local/src \
    && tar -zxvf apache-maven-3.6.3-bin.tar.gz \
    && cd apache-maven-3.6.3 \
    && mv * /usr/local/maven/ 

CMD ["mvn","package"]
