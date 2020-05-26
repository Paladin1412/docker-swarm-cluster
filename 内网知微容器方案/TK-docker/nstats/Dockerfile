FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"


WORKDIR /data/zhiwei/nstats


COPY nstats.jar ./nstats.jar
COPY application.yml ./application.yml
COPY nst.properties ./nst.properties
COPY shared.properties ./shared.properties


# nohup java -Xmx2560M -jar nstats.jar --spring.config.location=application.yml,shared.properties,nst.properties> /dev/null 2>&1 &
    

ENTRYPOINT ["java","-Xmx512M","-Djava.security.egd=file:/dev/./urandom","-jar","-Dspring.config.location=application.yml,shared.properties,nst.properties","./nstats.jar"]

