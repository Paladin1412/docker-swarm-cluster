# I:公共服务节点

10.154.6.62，10.154.6.63，10.154.6.64，10.154.6.65


## 编辑 vi /etc/hosts    

各个节点均执行

10.154.6.62   t3-oddp-oddps-web01
10.154.6.63   t3-oddp-oddps-web02 
10.154.6.64   t3-oddp-oddps-web03
10.154.6.65   t3-oddp-oddps-web04



##执行：

* chmod 700 /appadmin/.ssh
* chmod 600 /appadmin/.ssh/authorized_keys




## 1-4台机器ssh互信操作

 先在A机器上生成公、私密钥 （如果有，不需要重新生成)
 
 $ssh-keygen
 

比如：A机器通过ssh <B机器IP> 的形式访问B机器, 先查看

查看A机器 ~/.ssh/id_rsa.pub内容，假设为 'XXXX'
 
登录主机B，将A主机的 ~/.ssh/id_rsa.pub公匙内容追加写入B主机的~/.ssh/authorized_keys文件后面
即运行：

$echo 'XXXX'  >> ~/.ssh/authorized_keys 
## swam 集群初始化

 在其中一台docker主机(主节点）运行

### (1) 主节点：

此时,swarm主节点初始完成；接着运行,获取Token

docker swarm init --advertise-addr 10.154.6.62 

#### 加入成为管理节点

docker swarm join-token manager 

docker swarm join-token worker


docker swarm join \
    --token SWMTKN-1-1bwt3es5id8r6vw4xdnzjwuxt9d32artqu9wykfpjhfoq75crp-8eq8azb6sx9cnehqhey00v7ep \
    10.154.6.62:2377




#### 加入成为工作节点
docker swarm join-token 

###(2) 从节点

docker swarm join-token worker 


如： docker swarm join --token SWMTKN-1-1dcgev2zimswn3zf7r55n6p6rhnehadnu0uxf1a4b4e5s2e1r5-5yuex93s6wvo3fxt8m3wal52u 10.154.6.62:2377



会出现token提示，拷贝提示内容后在其他3台机器上执行命令即可。
如： 在B、C、D机器上分别执行

$docker swarm join --token <TOKEN值> 10.154.6.62:2377


此时，在任意一台机器上运行 

$docker node ls 
如果swarm集群成功，可以看到机器节点列表。


##3 创建overlay网络 
```
ifconfig 找到 eth0 对应的IP ：10.154.6.62 


在主节点（A主机）上执行     

docker network create  --driver overlay --attachable   zhiwei                                   
 或者：
docker network create  --driver overlay --attachable --subnet 10.154.6.1/24 --opt encrypted  zhiwei

```
##4, 安装 docker-compose 

$curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose 

$chmod +x /usr/local/bin/docker-compose

查看是否安装成功

$docker-compose --version



#II 相关镜像:

bitnami/kafka:2
mysql:5.7
redis:6
bitnami/zookeeper:3
java:8
alpine:3.10                                                     
centos:7

## 1, 运行docker pull 拉取官方镜像

如： docker pull bitnami/kafka:2

## 2，批量build自定义镜像
```
base=/data/common

for fd in api card-read card-write devops filter history kafka kanban multi mysql nginx notification nstats nysync query rbac redis schema view zookeeper

do
  
  cd ${base}/${fd}
  
  docker build -t zhiwei-${fd}:0.1 .


done


echo 'finish the job'


  




```

#III 4台机器创建 folder

##1， create folders
* mkdir -p /data/zw-docker/files/hollow
* mkdir -p /data/zw-docker/files/lucene
* mkdir -p /data/zw-docker/files/schema/schema
* mkdir -p /data/zw-docker/files/tmp
* mkdir -p /data/zw-docker/files/devops/shell
* mkdir -p /data/local/git/kanban/



#IV 部署

 在管理节点上运行以下命令：
 
 如：在主节点上启动服务

 docker stack deploy -c  taikang-node1.yml node1-service
 
 docker stack deploy -c  taikang-node2.yml node2-service
 
 docker stack deploy -c  taikang-node3.yml node3-service
 
 docker stack deploy -c  taikang-node4.yml node4-service
 
 
 
 停止服务
 docker stack rm common-service
 docker stack rm node1-service
 docker stack rm node2-service
 docker stack rm node3-service 
 
# V 维护
 
 
##查看服务：
 
 docker stack ls
## 删除服务：
 docker stack rm <ID>
 
## 查看所有的容器服务
 
 docker service ls 
## 查看容器服务日志
 
docker service logs <ID> 

## 删除容器服务
docker service rm <ID>

## 查看服务中的容器在哪些节点上启动

docker service inspect <ID>


## 查看节点服务启动情况，异常 

docker  stack ps node3-service --no-trunc  
docker  stack ps node2-service --no-trunc  
docker  stack ps node1-service --no-trunc  

