ARG VERSION=latest
ARG TEST=test

FROM busybox:$VERSION

LABEL MAINTAINER="WaterBolik@163.com"

# 在FROM之前的ARG要在FROM之后，即构建镜像期间使用，必须重新申明。
ARG VERSION

RUN set -euxo pipefail \
    &&  { \
            echo "$VERSION"; \
            echo "$TEST"; \
        } > image_version
# 注意：会产生“TEST: parameter not set”的构建错误