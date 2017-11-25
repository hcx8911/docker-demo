FROM alpine-openjdk

# https://hub.docker.com/_/zookeeper
# 3.3.6, 3.3 (3.3.6/Dockerfile)
# 3.4.11, 3.4, latest (3.4.11/Dockerfile)
# 3.5.3-beta, 3.5 (3.5.3-beta/Dockerfile)

LABEL MAINTAINER="WaterBolik@163.com"

ENV ZOOKEEPER_VERSION=3.4.11 \
	PATH=$PATH:/opt/zookeeper/bin/ \	
	ZOOCFGDIR=/conf \
    ZOO_CONF_DIR=/conf \
    ZOO_DATA_DIR=/data \
    ZOO_DATA_LOG_DIR=/datalog \
    ZOO_PORT=2181 \
    ZOO_TICK_TIME=2000 \
    ZOO_INIT_LIMIT=5 \
    ZOO_SYNC_LIMIT=2 

ARG GPG_KEY=C823E3E5B12AF29C67F81976F5CECB3CB5E9BD2D

COPY docker-entrypoint.sh /

# ARG APACHE_MIRROT=mirror.tuna.tsinghua.edu.cn/apache
# ARG APACHE_MIRROT=mirrors.ustc.edu.cn/apache
# ARG APACHE_MIRROT=mirrors.cnnic.cn/apache
ARG APACHE_MIRROT=mirrors.aliyun.com/apache
RUN set -euxo pipefail \
    && mkdir -p "$ZOO_DATA_LOG_DIR" "$ZOO_DATA_DIR" "$ZOO_CONF_DIR" \
	&& mkdir -p /opt \
	&& cd /opt \	
    && apk update \
	&& apk add --no-cache --virtual .build-deps \
        wget \
        gnupg \
    && rm -rf /var/cache/apk/* \
    && wget -q "http://${APACHE_MIRROT}/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz" \
    && wget -q "http://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && tar -xzf "zookeeper-${ZOOKEEPER_VERSION}.tar.gz" \
	&& mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
	&& mv "/opt/zookeeper/conf/"* "$ZOO_CONF_DIR" \
    && rm -r "$GNUPGHOME" "zookeeper-${ZOOKEEPER_VERSION}.tar.gz" "zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc" \
    && apk del \
		.build-deps \
	&& chmod a+x /docker-entrypoint.sh \
	&& echo "end"

VOLUME ["$ZOO_DATA_DIR", "$ZOO_DATA_LOG_DIR"]

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["zkServer.sh", "start-foreground"]

# CMD ["sh"]

# 编译及执行方法如下: 
# docker build -t alpine-zookeeper /Volumes/Work/OpenSource/WaterBolik/docker-demo/zookeeper/alpine-zookeeper/
# docker build -t alpine-zookeeper ~/OpenSource/WaterBolik/docker-demo/zookeeper/alpine-zookeeper/
# docker build -t alpine-zookeeper B:\OpenSource\WaterBolik\docker-demo/zookeeper/\alpine-zookeeper\
