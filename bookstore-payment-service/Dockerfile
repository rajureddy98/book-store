FROM openjdk:8-jdk-alpine

VOLUME /tmp

ARG JAR_FILE

COPY target/${JAR_FILE} payment-service.jar


CMD java -Djava.security.egd=file:/dev/./urandom -jar /payment-service.jar
