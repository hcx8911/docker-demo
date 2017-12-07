FROM swaggerapi/swagger-ui

LABEL MAINTAINER="WaterBolik@163.com"

ADD swagger.json /swagger.json
ADD swagger-prod.json /swagger-prod.json

ENV API_URL=/swagger.json

# 编译及执行方法如下:
# docker build -t users-swager /Volumes/Work/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-swager/
# docker build -t users-swager ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-swager/
# docker build -t users-swager B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\users-swager\
# docker run -it --rm -p 5435:5432 -d users-swager
