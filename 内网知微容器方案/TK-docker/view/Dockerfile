FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"
WORKDIR /data/zhiwei/view
COPY view.jar ./view.jar
COPY application.yml ./application.yml
COPY view.properties ./view.properties
COPY shared.properties ./shared.properties
# nohup java -Xmx4G -XX:NewRatio=1 -Dreactor.netty.http.server.accessLogEnabled=true -jar view.jar --spring.config.location=shared.properties,view.properties> /dev/null 2>&1 &
# nohup java -Xmx4G -jar view.jar --spring.config.location=shared.properties,view.properties> /dev/null 2>&1 &
ENTRYPOINT ["java","-Xmx600M","-XX:NewRatio=1","-Djava.security.egd=file:/dev/./urandom","-Dreactor.netty.http.server.accessLogEnabled=true","-jar","-Dspring.config.location=shared.properties,view.properties","./view.jar"]

