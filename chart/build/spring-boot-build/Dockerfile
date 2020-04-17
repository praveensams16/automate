FROM centos as build

COPY jdk-8u241-linux-x64.tar.gz /mnt/
COPY apache-maven-3.6.3-bin.tar.gz /mnt/
ENV PATH="/mnt/maven/bin:/mnt/java/bin:${PATH}"

RUN	yum install git -y \
		&& cd /mnt/ \
		&& tar -zxvf jdk-8u241-linux-x64.tar.gz \
		&& mv jdk1.8.0_241 java \
		&& tar -zxvf apache-maven-3.6.3-bin.tar.gz \
		&& mv apache-maven-3.6.3 maven \
		&& export JAVA_HOME=/mnt/java \
		&& cd /mnt \
		&& java -version \
		&& ls -l \
		&& git clone https://noreplyseera:Pear123son123@github.com/praveensams/maven-code.git \
		&& cd maven-code \
		&& mvn package \
		&& ls \
		&& find . -name '*.jar'

FROM openjdk:8-jdk-alpine as app

COPY  --from=build /mnt/maven-code/target/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar /mnt/

ENTRYPOINT ["java","-jar","/mnt/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]

