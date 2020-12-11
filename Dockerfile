FROM tomcat:9.0.10-jre8

ARG WAR_FILE
ARG CONTEXT

COPY ${WAR_FILE} /usr/local/tomcat/webapps/${CONTEXT}.war

