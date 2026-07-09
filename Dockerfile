# Use a lightweight Java Runtime
FROM eclipse-temurin:21-jre

# Create application directory
WORKDIR /app

# Copy the JAR built by Maven
COPY target/banking-app-1.0-SNAPSHOT.jar app.jar

# Application listens on port 8080
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]