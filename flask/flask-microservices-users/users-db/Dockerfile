FROM postgres:alpine

LABEL MAINTAINER="WaterBolik@163.com"

# run create.sql on init
ADD create.sql /docker-entrypoint-initdb.d

# 编译及执行方法如下: 
# docker build -t users-db /Volumes/Work/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-db/
# docker build -t users-db ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-db/
# docker build -t users-db B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\users-db\
# docker run -it --rm -p 5435:5432 -d users-db
