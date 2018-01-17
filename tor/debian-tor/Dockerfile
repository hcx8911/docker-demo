FROM debian_base

LABEL MAINTAINER="WaterBolik@163.com"

RUN set -eux \
    && apt-get update -y --fix-missing \
    && apt-get install -y --no-install-recommends \
        tor \    
    \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9050

    # && systemctl enable tor 

# USER ${user}
CMD tor -d

# 查看系统版本
# $ cat /etc/issue

# $ docker build -t debian-tor ~/OpenSource/WaterBolik/docker-demo/tor/debian-tor/
# docker build -t debian-tor B:/OpenSource/WaterBolik/docker-demo/tor/debian-tor/
# docker run -t -d --rm -p 9050:9050 debian-tor
