# Start with a base image containing Java runtime
FROM adoptopenjdk:17-jdk-hotspot

# Add Maintainer Info
LABEL maintainer="your-name"

# Set the current working directory inside the image
WORKDIR /app

# Copy the executable jar file and application properties file to the working directory
COPY ./quiz/target/myapp.jar /app/app.jar
COPY ./quiz/application.properties application.properties

# Expose port 8080
EXPOSE 8080

# Command to run the executable
CMD ["java", "-jar", "/app/app.jar"]