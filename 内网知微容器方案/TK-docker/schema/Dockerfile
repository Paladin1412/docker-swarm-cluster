FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/schema
COPY schema.jar ./schema.jar
COPY application.yml ./application.yml
COPY schema.properties ./schema.properties
COPY shared.properties ./shared.properties



ENTRYPOINT ["java","-Xmx600M","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared.properties,schema.properties","./schema.jar"]

