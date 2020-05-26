FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/history

COPY history.jar ./history.jar
COPY application.yml ./application.yml
COPY history.properties ./history.properties
COPY shared.properties ./shared.properties

#RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \

#    && echo 'Asia/Shanghai' > /etc/timezone
# nohup java -Xmx2G -jar history.jar --spring.config.location=shared.properties,history.properties> /dev/null 2>&1 &
ENTRYPOINT ["java","-Xmx250m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=shared.properties,history.properties","./history.jar"]

