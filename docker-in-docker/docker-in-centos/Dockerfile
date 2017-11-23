FROM centos_systemd

LABEL MAINTAINER=WaterBolik@163.com

# 安装 Docker CE
# ARG YUM_MIRROR=download.docker.com
ARG YUM_MIRROR=mirrors.aliyun.com/docker-ce
RUN set -euxo pipefail \
    && yum -y install \
        yum-utils \
        device-mapper-persistent-data \
        lvm2 \
    && yum-config-manager \
        --add-repo \
        https://${YUM_MIRROR}/linux/centos/docker-ce.repo \
    && yum -y install \
        docker-ce \
    && yum clean all \   
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
    # 增加非稳定版Docker安装源
    # yum-config-manager --enable docker-ce-edge
    # yum-config-manager --enable docker-ce-test
    # yum-config-manager --disable docker-ce-edge
    # yum-config-manager --disable docker-ce-test
    # 显示可安装稳定版Docker
    # yum list docker-ce --showduplicates | sort -r

# 安装 Docker CE (使用测试脚本，安装的是Edge版)
# RUN set -euxo pipefail \
#     && curl -fsSL get.docker.com -o get-docker.sh \
#     && sh get-docker.sh \
#     && yum clean all \   
#     && systemctl enable docker \
#     && echo "end"   

    
# $ docker build -t docker-in-centos /Volumes/Work/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-centos/
# $ docker build -t docker-in-centos ~/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-centos/
# $ docker build -t docker-in-centos B:/OpenSource/WaterBolik/docker-demo/docker-in-docker/docker-in-centos/
# $ docker run -it --rm --name docker-in-centos --privileged=true -d docker-in-centos 
# $ docker exec -it docker-in-centos bash
# $ docker stop docker-in-centos
