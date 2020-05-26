FROM mirror.taikangcloud.com/docker.io/java:8

LABEL maintainer="Jiang Peng <jiangpeng@agilean.cn>"

WORKDIR  /data/zhiwei/devops

#COPY shell ./shell

COPY devops-plugin-zhiwei-1.0-SNAPSHOT.jar ./plugins/devops-plugins/devops-plugin-zhiwei-1.0-SNAPSHOT.jar

COPY devops-plugin-git-1.0-SNAPSHOT.jar ./plugins/devops-plugins/devops-plugin-git-1.0-SNAPSHOT.jar

COPY devops-plugin-jenkins-1.0-SNAPSHOT.jar ./plugins/devops-plugins/devops-plugin-jenkins-1.0-SNAPSHOT.jar

COPY jenkins.p12 ./jenkins.p12

COPY keystore.jks  ./keystore.jks
COPY devops-server-main-1.0-SNAPSHOT.jar ./devops-server-main-1.0-SNAPSHOT.jar

COPY devops.yml ./devops.yml
COPY devops.properties ./devops.properties

# nohup java -Xmx512m -Djavax.net.ssl.keyStoreType=pkcs12 -Djavax.net.ssl.keyStorePassword=123456 -Djavax.net.ssl.keyStore=/root/kanban/jenkins.p12 -Djavax.net.ssl.trustStoreType=jks -Djavax.net.ssl.trustStorePassword=changeit -Djavax.net.ssl.trustStore=/root/kanban/keystore.jks -jar devops-server-main.jar --spring.config.location=devops.yml,devops.properties >> devops.log 2>&1 &

    

ENTRYPOINT ["java","-Xmx256m","-Djava.security.egd=file:/dev/./urandom","-Djavax.net.ssl.keyStoreType=pkcs12","-Djavax.net.ssl.keyStorePassword=123456","-Djavax.net.ssl.keyStore=./jenkins.p12","-Djavax.net.ssl.trustStoreType=jks","-Djavax.net.ssl.trustStorePassword=changeit","-Djavax.net.ssl.trustStore=./keystore.jks", "-jar","-Dspring.config.location=devops.yml,devops.properties","./devops-server-main-1.0-SNAPSHOT.jar"]

