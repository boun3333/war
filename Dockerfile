# Build the application
FROM maven:3.9-jdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Use Tomcat 9 base image
FROM tomcat:9.0-jdk8

# Set environment variables
ENV WAR_FILE=hello-world-war-1.0.0.war
ENV DEPLOY_DIR=/usr/local/tomcat/webapps

# Copy the WAR file into Tomcat webapps directory
COPY --from=builder /app/target/${WAR_FILE} ${DEPLOY_DIR}/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]