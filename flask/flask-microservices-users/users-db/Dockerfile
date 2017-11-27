FROM postgres:alpine

LABEL MAINTAINER="WaterBolik@163.com"

# run create.sql on init
ADD create.sql /docker-entrypoint-initdb.d

# 编译及执行方法如下: 
# docker build -t flask-microservices-users /Volumes/Work/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/
# docker build -t flask-microservices-users ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/
# docker build -t flask-microservices-users B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\
# docker run -it --rm  -p 8080:5000 -v ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/app:/usr/src/app flask-microservices-users 
