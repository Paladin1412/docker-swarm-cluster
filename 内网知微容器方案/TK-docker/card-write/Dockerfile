FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"


WORKDIR  /data/zhiwei/card-write

RUN mkdir -p /nfsc/kb/hollow

RUN chmod a+x /nfsc/kb/hollow



COPY card.jar ./card.jar
COPY application.yml ./application.yml
COPY card.properties ./card.properties
COPY shared-write.properties ./shared-write.properties

#RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \

#    && echo 'Asia/Shanghai' > /etc/timezone

    
#nohup java -Xmx4G -jar card.jar --spring.config.location=application.yml,shared.properties,card.properties> card.log 2>&1 &

ENTRYPOINT ["java","-Xmx512m","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared-write.properties,card.properties","./card.jar"]





