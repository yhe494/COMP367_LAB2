FROM tomcat:9-jdk11

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps directory
COPY target/example.war /usr/local/tomcat/webapps/ROOT.war

# Set environment variables if needed
ENV CATALINA_OPTS="-Xms512m -Xmx1024m"

# Expose the default Tomcat port
EXPOSE 9090

# Start Tomcat
CMD ["catalina.sh", "run"]