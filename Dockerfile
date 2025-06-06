# Use a lightweight JRE 11 base image
FROM adoptopenjdk/openjdk11:alpine-jre

# Argument for the artifact location (can be overridden at build time)
ARG artifact=target/spring-boot-web.jar

# Set working directory
WORKDIR /opt/app

# Copy the built JAR file to the container
COPY ${artifact} app.jar

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
