FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/kanban

COPY kanban.jar ./kanban.jar
COPY application.yml ./application.yml
COPY kb.properties ./kb.properties
COPY shared.properties ./shared.properties

   
#java -Xmx4G -jar kanban.jar --spring.config.location=application.yml,shared.properties,kb.properties> /dev/null 2>&1 &

ENTRYPOINT ["java","-Xmx500m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared.properties,kb.properties","./kanban.jar"]

