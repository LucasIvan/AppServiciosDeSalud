FROM openjdk:11
WORKDIR /app
COPY "./target/AppServicioSalud-0.0.1-SNAPSHOT.jar" "AppServicioSalud.jar"
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "AppServicioSalud.jar"]