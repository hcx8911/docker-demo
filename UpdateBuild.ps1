# {<Unrestricted> | <RemoteSigned> | <AllSigned> | <Restricted> | <Default> | 
# ����ű�����ִ�У�����ִ��������䣬ȷ����ýű�����Ȩ�ޣ�ִ������Իָ�Ȩ��
# Set-ExecutionPolicy RemoteSigned;

$ROOTPATH = "B:\OpenSource\WaterBolik\docker-demo"

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

# �鿴Dockerʹ�ô������
docker system df

# ������ʱ�ļ�
docker system prune -f

docker system df

docker images