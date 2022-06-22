FROM openjdk:11
MAINTAINER Romu Tiwari<romu@gmail.com>
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=target/websocket-demo-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} websocker-demo.jar
ENTRYPOINT ["java","-jar","/websocket-demo.jar"]
