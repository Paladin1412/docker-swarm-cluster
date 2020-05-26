FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/notification
COPY notification-main-start.jar  ./notification-main-start.jar
COPY lark-1.0-SNAPSHOT.jar ./plugins/notification-plugins/lark-1.0-SNAPSHOT.jar
COPY dingding-1.0-SNAPSHOT.jar ./plugins/notification-plugins/dingding-1.0-SNAPSHOT.jar
COPY nim-1.0-SNAPSHOT.jar ./plugins/notification-plugins/nim-1.0-SNAPSHOT.jar
COPY mail-1.0-SNAPSHOT.jar ./plugins/notification-plugins/mail-1.0-SNAPSHOT.jar
COPY notification.yml ./notification.yml
COPY shared.properties ./shared.properties
COPY nim.yml ./plugins/notification-plugins-config/nim.yml 
COPY lark.yml ./plugins/notification-plugins-config/lark.yml 
COPY dingding.yml ./plugins/notification-plugins-config/dingding.yml 

RUN chmod a+x ./notification-main-start.jar
RUN chmod a+x ./plugins/notification-plugins/*.jar

ENTRYPOINT ["java","-Xmx250m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=notification.yml,shared.properties","./notification-main-start.jar"]





