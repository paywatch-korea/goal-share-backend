# Stage 1: Build the application
FROM gradle:8.5.0-jdk21 as builder

# Copy the source code
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

# Build the application
RUN gradle build --no-daemon -x test

# Stage 2: Run the application
FROM openjdk:21-jdk

# Copy the built artifact from the builder stage
COPY --from=builder /home/gradle/src/build/libs/*.jar /app/app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]