FROM openjdk:8-jdk-alpine

VOLUME /tmp

ARG JAR_FILE

COPY target/*.jar catalog-service.jar

COPY ./images /image

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/catalog-service.jar"]
