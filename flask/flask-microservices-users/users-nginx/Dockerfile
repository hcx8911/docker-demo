# FROM alpine-nginx
FROM nginx:alpine

LABEL MAINTAINER="WaterBolik@163.com"

RUN rm /etc/nginx/conf.d/default.conf
ADD /nginx.conf /etc/nginx/conf.d

# 编译及执行方法如下:
# docker build -t users-nginx ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-nginx/
# docker build -t users-nginx B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\users-nginx\
# docker run -it --rm -p 5435:5432 -d users-nginx
