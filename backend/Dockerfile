# Use a minimal base image with JDK 21
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything from current context to container
COPY . .

# Give executable permission to gradlew
RUN chmod +x ./gradlew

# Build the application (skipping tests for speed)
RUN ./gradlew build -x test --no-daemon

# Expose the port Spring Boot runs on
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]
