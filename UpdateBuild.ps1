# {<Unrestricted> | <RemoteSigned> | <AllSigned> | <Restricted> | <Default> |
# 如果脚本不能执行，请先执行下面这句，确保获得脚本运行权限，执行完可以恢复权限
# Set-ExecutionPolicy RemoteSigned;

$ROOTPATH = "B:\OpenSource\WaterBolik\docker-demo"

# base image pull -------------------------------------------------------------
docker pull alpine:latest
docker pull alpine:3.6

docker pull centos:latest
docker pull centos:7
docker pull centos:7.4.1708
docker pull centos:6.9

docker pull debian:latest
docker pull debian:9.2

docker pull ubuntu:latest
docker pull ubuntu:16.04

docker pull docker
docker pull docker:dind

docker pull mysql
docker pull mysql/mysql-server
docker pull mysql/mysql-cluster
docker pull postgres:alpine
docker pull adminer

docker pull jenkins/jenkins:lts-alpine

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

docker build -t centos-sshd ${ROOTPATH}/sshd/centos-sshd/

docker build -t alpine-sshd ${ROOTPATH}/sshd/alpine-sshd/
docker build -t alpine-openjdk ${ROOTPATH}/openjdk/alpine-openjdk/
docker build -t alpine-zookeeper ${ROOTPATH}/zookeeper/alpine-zookeeper/

docker build -t alpine-nginx ${ROOTPATH}/nginx/alpine-nginx/

docker build -t alpine-python2 ${ROOTPATH}/python/alpine-python2/
docker build -t alpine-python3 ${ROOTPATH}/python/alpine-python3/

docker build -t alpine-nodejs ${ROOTPATH}/nodejs/alpine-nodejs/

docker build -t users-service ${ROOTPATH}/flask/flask-microservices-users/users-service
docker build -t web-service ${ROOTPATH}/flask/flask-microservices-users/web-service
docker build -t users-db ${ROOTPATH}/flask/flask-microservices-users/users-db
docker build -t users-nginx ${ROOTPATH}/flask/flask-microservices-users/users-nginx/

# 查看Docker使用磁盘情况
docker system df

# 清理临时文件
docker system prune -f

docker system df

docker images
