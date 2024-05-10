FROM openjdk:8-jdk-alpine

VOLUME /tmp

ARG JAR_FILE

COPY /home/runner/work/book-store/book-store/bookstore-catalog-service/.jar catalog-service.jar

COPY ./images /images

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=local","-jar","/catalog-service.jar"]
