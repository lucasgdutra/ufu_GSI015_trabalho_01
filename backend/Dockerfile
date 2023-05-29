# Use the official maven/Java 8 image to create a build artifact.
# This is based on Debian and sets the MAVEN_HOME environment variable for you, among other things.
FROM maven:3.8-openjdk-17 as builder

# Set the working directory in the image to /app
WORKDIR /app

# Copy the pom.xml file to download dependencies
COPY quiz/pom.xml .

# Download dependencies as specified in pom.xml
RUN mvn dependency:go-offline -B

# Copy the rest of the source code
COPY quiz/src src

# Package the application
RUN mvn clean package spring-boot:repackage

# Use openjdk image from Docker Hub for the runtime
FROM openjdk:17.0.1-jdk-slim

# Set the working directory in the image to /app
WORKDIR /app

# Copy the jar file from the builder image
COPY --from=builder /app/target/quiz-1.0-SNAPSHOT.jar .

# Run the application
CMD ["java", "-jar", "quiz-1.0-SNAPSHOT.jar"]
