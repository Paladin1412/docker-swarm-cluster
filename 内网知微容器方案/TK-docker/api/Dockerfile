FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"


WORKDIR  /data/zhiwei/api


COPY api.jar ./api.jar
COPY api.yml ./api.yml
COPY api.properties ./api.properties
COPY shared.properties ./shared.properties

#RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \

#    && echo 'Asia/Shanghai' > /etc/timezone

#nohup java -Xmx1G -jar api.jar --spring.config.location=shared.properties,api.properties,api.yml > api.log 2>&1 &
    
RUN chmod a+x ./api.jar

ENTRYPOINT ["java","-Xmx700M","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=shared.properties,api.properties,api.yml","./api.jar"]

