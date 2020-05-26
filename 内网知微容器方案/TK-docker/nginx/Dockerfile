FROM mirror.taikangcloud.com/docker.io/nginx:1.11.6-alpine

LABEL maintainer="jiangpeng@agilean.cn"


COPY pure-react-admin-ui.tar.gz /var/www/pure-react-admin-ui.tar.gz

COPY pure-react-ui.tar.gz  /var/www/pure-react-ui.tar.gz

RUN cd /var/www/ \

    && tar -zxvf pure-react-admin-ui.tar.gz \
    && tar -zxvf pure-react-ui.tar.gz \
    && rm -rf pure-react-admin-ui.tar.gz \
    && rm -rf pure-react-ui.tar.gz
   

#CMD ["nginx", "-g", "daemon off;"]
