FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"


WORKDIR /data/zhiwei/multi


COPY multi.jar ./multi.jar
COPY application.yml ./application.yml
COPY multi.properties ./multi.properties
COPY shared.properties ./shared.properties

# nohup java -Xmx1G -jar multi.jar --spring.config.location=application.yml,shared.properties,multi.properties> /dev/null 2>&1 &    

ENTRYPOINT ["java","-Xmx512M","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared.properties,multi.properties","./multi.jar"]

#ENTRYPOINT ["java","-Xmx512m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,multi.properties,shared.properties","./card.jar"]

