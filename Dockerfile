FROM tomcat:9.0
COPY abc.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
