FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/filter

COPY filter.jar ./filter.jar
COPY filter.properties ./filter.properties
COPY shared.properties ./shared.properties
RUN chmod a+x ./filter.jar
ENTRYPOINT ["java","-Xmx256M","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=shared.properties,filter.properties","./filter.jar"]

