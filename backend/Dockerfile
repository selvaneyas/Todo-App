# Use OpenJDK base image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy Gradle wrapper and build files
COPY . .

# Give permission to gradlew
RUN chmod +x ./gradlew

# Build the app
RUN ./gradlew build

# Set the startup command
CMD ["java", "-jar", "build/libs/app-0.0.1-SNAPSHOT.jar"]
