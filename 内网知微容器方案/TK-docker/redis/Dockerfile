FROM mirror.taikangcloud.com/docker.io/redis:6

USER root
WORKDIR /data

COPY dump.rdb /data/db/dump.rdb
COPY redis.conf ./redis.conf
CMD [ "redis-server","/data/redis.conf"]

