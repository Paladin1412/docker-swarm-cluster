FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR /data/zhiwei/rbac

COPY rbac.jar ./rbac.jar
COPY application.yml ./application.yml
COPY rbac.properties ./rbac.properties
COPY shared.properties ./shared.properties

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \

    && echo 'Asia/Shanghai' > /etc/timezone

ENTRYPOINT ["java","-Xmx2G","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared.properties,rbac.properties","./rbac.jar"]

