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

COPY docker-entrypoint.sh /

# https://github.com/31z4/zookeeper-docker/blob/master/3.4.11/Dockerfile
# ARG ZOOKEEPER_KEY=C823E3E5B12AF29C67F81976F5CECB3CB5E9BD2D
ARG DISTRO_NAME=zookeeper-3.4.11
ARG APACHE_MIRROT=mirrors.ustc.edu.cn/apache
# ARG APACHE_MIRROT=mirror.tuna.tsinghua.edu.cn/apache
# ARG APACHE_MIRROT=mirrors.aliyun.com/apache
# ARG APACHE_MIRROT=mirrors.cnnic.cn/apache
RUN set -euxo pipefail \
    && mkdir -p \
        "$ZOO_DATA_LOG_DIR" \
        "$ZOO_DATA_DIR" \
        "$ZOO_CONF_DIR" \
	    /opt \
	&& cd /opt \
	&& apk add --update --no-cache --virtual .build-deps \
        curl \
        gnupg \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            C823E3E5B12AF29C67F81976F5CECB3CB5E9BD2D \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            false; \
        done \
    \
    && curl -fSLO "http://www.apache.org/dist/zookeeper/${DISTRO_NAME}/${DISTRO_NAME}.tar.gz.asc" \
    && curl -fSLO "http://${APACHE_MIRROT}/zookeeper/${DISTRO_NAME}/${DISTRO_NAME}.tar.gz" \
    \
    && gpg --batch --verify "$DISTRO_NAME.tar.gz.asc" "$DISTRO_NAME.tar.gz" \
    \
    && tar -xzf "${DISTRO_NAME}.tar.gz" \
	&& mv /opt/${DISTRO_NAME} /opt/zookeeper \
	&& mv "/opt/zookeeper/conf/"* "$ZOO_CONF_DIR" \
    \
    && rm -f "${DISTRO_NAME}.tar.gz.asc" \
    && rm -f "${DISTRO_NAME}.tar.gz" \
    && rm -rf "$GNUPGHOME" \
    \
	&& chmod a+x /docker-entrypoint.sh \
    \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

VOLUME ["$ZOO_DATA_DIR", "$ZOO_DATA_LOG_DIR"]

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["zkServer.sh", "start-foreground"]

# 编译及执行方法如下:
# docker build -t alpine-zookeeper ~/OpenSource/WaterBolik/docker-demo/zookeeper/alpine-zookeeper/
# docker build -t alpine-zookeeper B:\OpenSource\WaterBolik\docker-demo/zookeeper/\alpine-zookeeper\
