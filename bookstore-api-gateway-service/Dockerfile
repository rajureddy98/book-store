FROM openjdk:8-jdk-alpine

ARG JAR_FILE

COPY target/*.jar gateway-server.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=local","-jar","/gateway-server.jar"]
