FROM openjdk:8-jdk-alpine

COPY target/*.jar account-service.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/account-service.jar"]
