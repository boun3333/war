# Runtime Stage Only - Build Server Separately
FROM tomcat:9.0
COPY hello-world-war.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]