FROM alpine:latest

USER root
RUN apk add openjdk8 openjdk8-jre openjdk8-jre-base fontconfig busybox ttf-dejavu xvfb
RUN wget http://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz -O wildfly.tar
RUN tar -xzvf wildfly.tar
RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -O jenkins.war
RUN mv jenkins.war /wildfly-14.0.0.Final/standalone/deployments/
ENTRYPOINT /wildfly-14.0.0.Final/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0


