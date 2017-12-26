# {<Unrestricted> | <RemoteSigned> | <AllSigned> | <Restricted> | <Default> |
# 如果脚本不能执行，请先执行下面这句，确保获得脚本运行权限，执行完可以恢复权限
Set-ExecutionPolicy RemoteSigned;

$ROOTPATH = "B:\OpenSource\WaterBolik\docker-demo"

# base image pull -------------------------------------------------------------
docker pull alpine:latest
docker pull alpine:3.7

docker pull centos:latest
docker pull centos:7
# docker pull centos:7.4.1708
# docker pull centos:6
# docker pull centos:6.9

docker pull debian:latest
docker pull debian:9.2

docker pull ubuntu:latest
docker pull ubuntu:16.04

docker pull docker
docker pull docker:dind

# docker pull mysql
docker pull mysql/mysql-server
docker pull mysql/mysql-cluster
docker pull postgres:alpine
docker pull adminer

# docker pull jenkins/jenkins:lts-alpine

# os base images
docker build -t alpine_base ${ROOTPATH}/os_base/alpine_base/
docker build -t centos_base ${ROOTPATH}/os_base/centos_base/
# docker build -t centos6_base ${ROOTPATH}/os_base/centos6_base/
docker build -t centos_systemd ${ROOTPATH}/os_base/centos_systemd/
docker build -t debian_base ${ROOTPATH}/os_base/debian_base/
docker build -t ubuntu_base ${ROOTPATH}/os_base/ubuntu_base/

docker build -t alpine-buildpack ${ROOTPATH}/buildpack/alpine-buildpack/
docker build -t centos-buildpack ${ROOTPATH}/buildpack/centos-buildpack/
docker build -t debian-buildpack ${ROOTPATH}/buildpack/debian-buildpack/
docker build -t ubuntu-buildpack ${ROOTPATH}/buildpack/ubuntu-buildpack/

# docker in docker
docker build -t docker-in-centos ${ROOTPATH}/docker-in-docker/docker-in-centos/
docker build -t docker-in-debian ${ROOTPATH}/docker-in-docker/docker-in-debian/
docker build -t docker-in-ubuntu ${ROOTPATH}/docker-in-docker/docker-in-ubuntu/

docker build -t centos-sshd ${ROOTPATH}/sshd/centos-sshd/

docker build -t alpine-sshd ${ROOTPATH}/sshd/alpine-sshd/
docker build -t alpine-openjdk ${ROOTPATH}/openjdk/alpine-openjdk/
docker build -t alpine-zookeeper ${ROOTPATH}/zookeeper/alpine-zookeeper/

docker build -t alpine-nginx ${ROOTPATH}/nginx/alpine-nginx/

docker build -t alpine-golang ${ROOTPATH}/golang/alpine-golang/

docker build -t alpine-python2 ${ROOTPATH}/python/alpine-python2/
docker build -t alpine-python3 ${ROOTPATH}/python/alpine-python3/

docker build -t alpine-nodejs ${ROOTPATH}/nodejs/alpine-nodejs/

# 查看Docker的磁盘使用情况
docker system df

# 清理临时镜像和容器（删除所有已停止容器，清除所有没有打标签的非引用镜像）
docker system prune -f
# 清理数据卷（没有与容器关联的数据卷）
docker volume prune -f

# 查看Docker的磁盘使用情况
docker system df

# 列出所有本地镜像
docker images