FROM java:8
MAINTAINER Nilhcem "nilhcem@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y wget unzip
RUN wget -q http://dist.sonar.codehaus.org/sonarqube-4.5.zip
RUN unzip -qq sonarqube-4.5.zip -d /opt/
RUN rm sonarqube-4.5.zip

EXPOSE 9000
EXPOSE 9092

CMD ["/opt/sonarqube-4.5/bin/linux-x86-64/sonar.sh", "console"]
