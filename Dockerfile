FROM bitnami/tomcat:9.0
ENV TOMCAT_PASSWORD=password
COPY target/addressbook-2.0.war /opt/bitnami/tomcat/webapps/addressbook.war
