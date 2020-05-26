FROM mirror.taikangcloud.com/docker.io/mysql:5.7

COPY init.sql  /docker-entrypoint-initdb.d/init.sql

COPY kanban-ddl.sql  /docker-entrypoint-initdb.d/kanban-ddl.sql



