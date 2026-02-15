FROM tomcat:9.0

COPY target/odin.war /usr/local/tomcat/webapps/

EXPOSE 8080
