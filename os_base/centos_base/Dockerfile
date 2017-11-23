FROM centos
# https://hub.docker.com/_/centos/

LABEL MAINTAINER=WaterBolik@163.com

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.utf8 \
    LANGUAGE=zh_CN.utf8:en_US.utf8:C.utf8 \
    SUPPORTED=zh_CN.utf8:en_US.utf8:C.utf8 \
    LC_ALL=zh_CN.utf8 

# 设置时区和中文语言环境
RUN set -euxo pipefail \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    && sed -i \
        -e 's~^override_install_langs=en_US.utf8~override_install_langs=zh_CN.utf8~g' \
        /etc/yum.conf \
    && { \
            echo 'LANG="zh_CN.utf8"'; \ 
            echo 'LANGUAGE="zh_CN.utf8:en_US.utf8:C.utf8"'; \
            echo 'SUPPORTED="zh_CN.utf8:en_US.utf8:C.utf8"'; \
            echo 'LC_ALL="zh_CN.utf8"'; \
            echo 'SYSFONT="lat0-sun16"'; \
        } > /etc/locale.conf \
    && echo "export LC_ALL=zh_CN.utf8" >> /etc/profile \
    && echo "end"     
    # cat /etc/yum.conf
    # cat /etc/locale.conf
    # cat /etc/profile

# use systemd
ENV container docker
RUN set -euxo pipefail \
    && ( \
            cd /lib/systemd/system/sysinit.target.wants/; \
            for i in *; do \
                [ $i == systemd-tmpfiles-setup.service ] \
                || rm -f $i; \
            done \
        ); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# 使用镜像源 
# ARG YUM_MIRROR=mirrors.ustc.edu.cn 
# ARG YUM_MIRROR=mirror.tuna.tsinghua.edu.cn 
ARG YUM_MIRROR=mirrors.aliyun.com
RUN set -euxo pipefail \
    && sed -i \
        -e "s|^mirrorlist=|#mirrorlist=|g" \    
        -e "s|^#baseurl=|baseurl=|g" \    
        -e "s|mirror.centos.org|${YUM_MIRROR}|g" \    
        -e "s|vault.centos.org|${YUM_MIRROR}|g" \    
        -e "s|http:|https:|g" \
        /etc/yum.repos.d/* \ 
    && yum -y install \
        epel-release \
    && sed -i \
        -e "s|^mirrorlist=|#mirrorlist=|g" \
        -e "s|^#baseurl=|baseurl=|g" \
        -e "s|download.fedoraproject.org/pub|${YUM_MIRROR}|g" \
        -e "s|http:|https:|g" \
        /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo \
    && yum repolist \       
    && yum makecache fast \   
    && yum -y update \
    && yum -y upgrade \ 
    && echo "end"      
    # 查看镜像源 cat /etc/yum.repos.d/CentOS-Base.repo

VOLUME [ "/sys/fs/cgroup" ]

# 启用SystemCtl必须采用该方式
CMD ["/usr/sbin/init"]

# 查看系统版本
# $ rpm -qi centos-release

# $ docker build -t centos_base ~/OpenSource/WaterBolik/docker-demo/os_base/centos_base/
# $ docker build -t centos_base /Volumes/Work/OpenSource/WaterBolik/docker-demo/os_base/centos_base/
# $ docker build -t centos_base B:/OpenSource/WaterBolik/docker-demo/os_base/centos_base/
# $ docker run -it --rm --name centos_base --privileged=true -d centos_base 
# $ docker exec -it centos_base bash
# $ docker stop centos_base
