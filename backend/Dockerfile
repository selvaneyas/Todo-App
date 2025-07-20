# Use OpenJDK 21 base image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything from the backend/ folder in your repo to /app in the container
COPY backend/ .

# Copy Gradle wrapper and build files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Copy source files
COPY src src

# Give execution permission to gradlew
RUN chmod +x gradlew

# Build the app (skip tests if needed)
RUN ./gradlew build --no-daemon --stacktrace --warning-mode=all

# Use a smaller image for runtime (optional but recommended)
# FROM eclipse-temurin:21-jre-alpine
# WORKDIR /app
# COPY --from=0 /app/build/libs/app-0.0.1-SNAPSHOT.jar app.jar
# CMD ["java", "-jar", "app.jar"]

# If staying in single-stage Dockerfile:
CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]

# Expose the port your app runs on
EXPOSE 8080
