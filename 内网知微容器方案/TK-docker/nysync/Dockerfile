FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"


WORKDIR /data/zhiwei/nysync

COPY testcase-plugin.jar ./testcase-plugin.jar

COPY kanban-plugin.jar ./kanban-plugin.jar

COPY nsync-server.jar ./nsync-server.jar

COPY shared.properties ./shared.properties

COPY sync.yml ./sync.yml   

COPY testcase.json /root/kanban/testcase.json


#nohup java -Xmx1G -jar nsync-server.jar --spring.config.location=shared.properties,sync.yml > nsync.log 2>&1 &

ENTRYPOINT ["java","-Xmx512m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=shared.properties,sync.yml","./nsync-server.jar"]



