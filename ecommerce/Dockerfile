
FROM azul/zulu-openjdk:17-latest

COPY build/libs/ecommerce-0.0.1-SNAPSHOT app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

EXPOSE 8080