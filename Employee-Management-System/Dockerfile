FROM openjdk:11
MAINTAINER Romu Tiwari <romu@gmail.com>
VOLUME /tmp
EXPOSE 8081
ARG JAR_FILE=target/my-ems-project-1.0-SNAPSHOT.jar
ADD ${JAR_FILE} ems.jar
ENTRYPOINT ["java","-jar","/ems.jar"]
