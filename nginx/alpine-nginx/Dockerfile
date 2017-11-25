FROM alpine_base

# https://hub.docker.com/_/nginx/
# https://github.com/docker-library/nginx/blob/master/8-jre/alpine/Dockerfile

LABEL MAINTAINER="WaterBolik@163.com"

RUN set -euxo pipefail \    
    && apk add --update --no-cache \
		  nginx \	
    && rm -rf /var/cache/apk/* \
    && echo "end"

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

# 编译及执行方法如下: 
# docker build -t alpine-nginx /Volumes/Work/OpenSource/WaterBolik/docker-demo/nginx/alpine-nginx/
# docker build -t alpine-nginx ~/OpenSource/WaterBolik/docker-demo/nginx/alpine-nginx/
# docker build -t alpine-nginx B:\OpenSource\WaterBolik\docker-demo\nginx\alpine-nginx\
# docker run -it --rm -p 80:80 -v ./www:/usr/share/nginx/html:ro -d alpine-nginx 
