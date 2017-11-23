
$ROOTPATH = "B:/OpenSource/WaterBolik/docker-demo"

# base image pull -------------------------------------------------------------
docker pull alpine:latest
docker pull alpine:3.6

docker pull centos:latest
docker pull centos:7.4.1708
docker pull centos:6.9

docker pull debian:latest
docker pull debian:9.2

docker pull ubuntu:latest
docker pull ubuntu:16.04

docker pull docker
docker pull docker:dind

# # docker pull mysql
# docker pull mysql/mysql-server
# docker pull postgres:alpine
# docker pull adminer

# os base images 
docker build -t alpine_base ${ROOTPATH}/os_base/alpine_base/
docker build -t centos_base ${ROOTPATH}/os_base/centos_base/
docker build -t centos6_base ${ROOTPATH}/os_base/centos6_base/
docker build -t centos_systemd ${ROOTPATH}/os_base/centos_systemd/
docker build -t debian_base ${ROOTPATH}/os_base/debian_base/
docker build -t ubuntu_base ${ROOTPATH}/os_base/ubuntu_base/

# docker in docker
docker build -t docker-in-centos ${ROOTPATH}/docker-in-docker/docker-in-centos/
docker build -t docker-in-debian ${ROOTPATH}/docker-in-docker/docker-in-debian/
docker build -t docker-in-ubuntu ${ROOTPATH}/docker-in-docker/docker-in-ubuntu/

docker build -t sshd ${ROOTPATH}/sshd/

# 查看Docker的磁盘使用情况
docker system df

# 清理dangling镜像(参考What are Docker : images?)和容器，以及失效的数据卷和网络。
docker system prune -f

# 查看Docker的磁盘使用情况
docker system df

docker images

# 删除pull过程或者create过程产生的临时镜像
# docker stop $(docker ps -a -f status=exited -q)
# docker rm $(docker ps -a -f status=exited -q)
# docker rmi $(docker images --filter dangling=true -q)