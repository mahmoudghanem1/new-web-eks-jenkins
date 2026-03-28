FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY build/libs/app.jar app.jar

CMD ["java", "-jar", "app.jar"]