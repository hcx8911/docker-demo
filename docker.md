## 查看docker版本
$ docker version

## 查看本地镜像
$ docker images

## 创建并运行一个最小的linux系统
$ docker run -i -t --rm alpine sh

## 查看所有镜像，包括已经停止运行的
$ docker ps -a

## 删除容器，id name 都可以， id只要输正确前面几位即可
$ docker rm

## 查看docker系统使用空间
$ docker system df

## 清理临时镜像和容器（删除所有已停止容器，清除所有没有打标签的非引用镜像）
$ docker system prune -f

## 停止所有容器
$ docker stop $(docker ps -q)

## 删除所有已停止容器
$ docker rm $(docker ps -aq)

## 停止并删除所有容器
$ docker stop $(docker ps -q) & docker rm $(docker ps -aq)

## 删除所有本地镜像（慎用，拉取镜像不易，尤其是网络不好的情况）
$ docker rmi $(docker images -q -a)

## 删除所有磁盘映射（慎用，会删除容器映射数据）
$ docker volume rm $(docker volume ls -q)

## 删除基于镜像的所有容器
$ docker ps -a | awk '{ print $1,$2 }' | grep 这里是镜像的名称| awk '{print $1 }' | xargs -I {} sudo docker rm {}
