# Use a base image with Java and Gradle
FROM gradle:8.4.0-jdk21 as builder

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Build the application
RUN gradle build --no-daemon

# ----------------------------

# Use a smaller runtime image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the jar from the builder stage
COPY --from=builder /app/build/libs/*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
