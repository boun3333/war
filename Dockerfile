FROM tomcat:9.0-jdk8

# Copy the WAR file into Tomcat webapps directory
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]