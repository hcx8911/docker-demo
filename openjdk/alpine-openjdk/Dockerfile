FROM alpine-sshd

# https://hub.docker.com/_/openjdk/
# https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile

LABEL MAINTAINER="WaterBolik@163.com"

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre \
    CLASSPATH=/usr/lib/jvm/java-1.8-openjdk/jre/lib \
	PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN set -euxo pipefail \    
    && apk add --update --no-cache \
		openjdk8-jre \
    && rm -rf /var/cache/apk/* \
	&& { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ] \   
    && echo "end"

# 编译及执行方法如下: 
# docker build -t alpine-openjdk /Volumes/Work/OpenSource/WaterBolik/docker-demo/openjdk/alpine-openjdk/
# docker build -t alpine-openjdk ~/OpenSource/WaterBolik/docker-demo/openjdk/alpine-openjdk/
# docker build -t alpine-openjdk B:\OpenSource\WaterBolik\docker-demo\openjdk\alpine-openjdk\
# docker run -it --rm alpine-openjdk 
