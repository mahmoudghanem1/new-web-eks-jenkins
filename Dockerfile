FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY build/libs/new-web-0.0.1.jar app.jar

CMD ["java", "-jar", "app.jar"]