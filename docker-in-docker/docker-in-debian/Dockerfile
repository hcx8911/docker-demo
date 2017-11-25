FROM debian_base

LABEL MAINTAINER="WaterBolik@163.com"

# 安装Docker CE
# ARG APT_MIRROR=download.docker.com
ARG APT_MIRROR=mirrors.aliyun.com/docker-ce
RUN set -eux \
    && apt-get update -y --fix-missing \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
    && curl -fsSL https://${APT_MIRROR}/linux/debian/gpg \
        | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
        "deb [arch=amd64] https://${APT_MIRROR}/linux/debian \
            $(lsb_release -cs) \
            stable" \
    && apt-get update -y --fix-missing \
    && apt-get install -y \
        docker-ce \ 
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/docker \
    &&  { \
            echo '{'; \ 
            echo '  "registry-mirrors": ['; \
            echo '    "https://registry.docker-cn.com"'; \ 
            echo '  ]'; \
            echo '}'; \ 
        } > /etc/docker/daemon.json \ 
    && systemctl enable docker \    
    && echo "end"      
    # && curl -fsSL get.docker.com -o get-docker.sh \
    # && sh get-docker.sh \
    # 显示可安装稳定版Docker
    # apt-cache madison docker-ce
    #  --no-install-recommends

    # && pip install docker-compose \
    # && apt-get -y install \
    #     docker-compose \
    
# 安装 Docker CE (使用测试脚本，安装的是Edge版)
# RUN set -euxo pipefail \
#     && curl -fsSL get.docker.com -o get-docker.sh \
#     && sh get-docker.sh \
#     && yum clean all \   
#     && systemctl enable docker \
#     && echo "end"   


# $ docker build -t docker-in-debian /Volumes/Work/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-debian/
# $ docker build -t docker-in-debian ~/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-debian/
# $ docker build -t docker-in-debian B:/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-debian/
# $ docker run -it --rm --name docker-in-debian --privileged=true -d docker-in-debian 
# $ docker exec -it docker-in-debian bash
# $ docker stop docker-in-debian
