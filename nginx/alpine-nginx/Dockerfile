FROM alpine_base

# https://hub.docker.com/_/nginx/

LABEL MAINTAINER="WaterBolik@163.com"

# apk ?? nginx-1.12.2-r1
# RUN set -euxo pipefail \
#     && apk add --update --no-cache \
# 	    nginx \
#     && rm -rf /var/cache/apk/*

# https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile
ARG NGINX_VERSION=1.13.7
RUN set -euxo pipefail \
    && apk add --update --no-cache --virtual .build-deps \
        gcc \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        linux-headers \
        curl \
        gnupg \
        libxslt-dev \
        gd-dev \
        geoip-dev \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            B0F4253373F8F6F510D42178520A9993A1C052F8 \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            break; \
        done \
    \
    && curl -fSL -o nginx.tar.gz.asc http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz.asc \
    && curl -fSL -o nginx.tar.gz http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
    \
    && gpg --batch --verify nginx.tar.gz.asc nginx.tar.gz \
    \
    && mkdir -p /usr/src \
    && tar -zxC /usr/src -f nginx.tar.gz \
    \
    && rm -f nginx.tar.gz.asc \
    && rm -f nginx.tar.gz \
    \
    && cd /usr/src/nginx-$NGINX_VERSION \
    && CONFIG="\
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --modules-path=/usr/lib/nginx/modules \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --http-client-body-temp-path=/var/cache/nginx/client_temp \
        --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
        --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
        --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
        --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
        --user=nginx \
        --group=nginx \
        --with-http_ssl_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_dav_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_auth_request_module \
        --with-http_xslt_module=dynamic \
        --with-http_image_filter_module=dynamic \
        --with-http_geoip_module=dynamic \
        --with-threads \
        --with-stream \
        --with-stream_ssl_module \
        --with-stream_ssl_preread_module \
        --with-stream_realip_module \
        --with-stream_geoip_module=dynamic \
        --with-http_slice_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-compat \
        --with-file-aio \
        --with-http_v2_module \
        " \
    && ./configure \
        $CONFIG \
        --with-debug \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && mv objs/nginx objs/nginx-debug \
    && mv objs/ngx_http_xslt_filter_module.so objs/ngx_http_xslt_filter_module-debug.so \
    && mv objs/ngx_http_image_filter_module.so objs/ngx_http_image_filter_module-debug.so \
    && mv objs/ngx_http_geoip_module.so objs/ngx_http_geoip_module-debug.so \
    && mv objs/ngx_stream_geoip_module.so objs/ngx_stream_geoip_module-debug.so \
    && ./configure \
        $CONFIG \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && rm -rf /etc/nginx/html/ \
    && mkdir /etc/nginx/conf.d/ \
    && mkdir -p /usr/share/nginx/html/ \
    && install -m644 html/index.html /usr/share/nginx/html/ \
    && install -m644 html/50x.html /usr/share/nginx/html/ \
    && install -m755 objs/nginx-debug /usr/sbin/nginx-debug \
    && install -m755 objs/ngx_http_xslt_filter_module-debug.so /usr/lib/nginx/modules/ngx_http_xslt_filter_module-debug.so \
    && install -m755 objs/ngx_http_image_filter_module-debug.so /usr/lib/nginx/modules/ngx_http_image_filter_module-debug.so \
    && install -m755 objs/ngx_http_geoip_module-debug.so /usr/lib/nginx/modules/ngx_http_geoip_module-debug.so \
    && install -m755 objs/ngx_stream_geoip_module-debug.so /usr/lib/nginx/modules/ngx_stream_geoip_module-debug.so \
    && ln -s ../../usr/lib/nginx/modules /etc/nginx/modules \
    && strip /usr/sbin/nginx* \
    && strip /usr/lib/nginx/modules/*.so \
    && rm -rf /usr/src/nginx-$NGINX_VERSION \
    \
    && apk add --no-cache --virtual .gettext \
        gettext \
    && mv /usr/bin/envsubst /tmp/ \
    \
    && runDeps="$( \
            scanelf --needed --nobanner --format '%n#p' \
                /usr/sbin/nginx \
                /usr/lib/nginx/modules/*.so \
                /tmp/envsubst \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )" \
    && apk add --no-cache --virtual .nginx-rundeps \
        $runDeps \
    && apk del .gettext \
    && mv /tmp/envsubst /usr/local/bin/ \
    \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

# docker build -t alpine-nginx ~/OpenSource/WaterBolik/docker-demo/nginx/alpine-nginx/
# docker build -t alpine-nginx B:\OpenSource\WaterBolik\docker-demo\nginx\alpine-nginx\
# docker run -it --rm -p 80:80 -v ./www:/usr/share/nginx/html:ro -d alpine-nginx
