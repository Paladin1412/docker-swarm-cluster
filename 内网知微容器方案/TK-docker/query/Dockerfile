FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR  /data/zhiwei/query

COPY query.jar ./query.jar

COPY query.properties ./query.properties

COPY shared.properties ./shared.properties


    
# nohup java -Xmx1G -Dreactor.netty.http.server.accessLogEnabled=true -jar query.jar --spring.config.location=shared.properties,query.properties> /dev/null 2>&1 &

ENTRYPOINT ["java","-Xmx512m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=shared.properties,query.properties","./query.jar"]

