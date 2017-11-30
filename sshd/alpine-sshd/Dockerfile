FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

# 配置ssh服务、客户端、免密访问
RUN set -euxo pipefail \
    && apk add --update --no-cache \
		openssh \
    \
    &&  sed -i \
            -e 's~^#PermitRootLogin prohibit-password~PermitRootLogin yes~g' \
            -e 's~^#HostKey /etc/ssh/ssh_host_rsa_key~HostKey /etc/ssh/ssh_host_rsa_key~g' \
            -e 's~^#PubkeyAuthentication yes~PubkeyAuthentication yes~g' \
            -e 's~^#PasswordAuthentication yes~PasswordAuthentication yes~g' \
            -e 's~^#PermitEmptyPasswords no~PermitEmptyPasswords yes~g' \
            -e 's~^#UseDNS no~UseDNS no~g' \
            -e 's~^#Port 22~Port 2222~g' \
        /etc/ssh/sshd_config \
    \
    && mkdir -p $HOME/.ssh \
    && chmod 700 $HOME/.ssh \
    &&  { \
            echo 'Host *'; \
            echo '  UserKnownHostsFile /dev/null'; \
            echo '  StrictHostKeyChecking no'; \
            echo '  LogLevel quiet'; \
            echo '  Port 2222'; \
        } > $HOME/.ssh/config \
    && chmod 600 $HOME/.ssh/config \
    \
    && ssh-keygen -A \
    && ssh-keygen -q -N "" -t rsa -f $HOME/.ssh/id_rsa \
    && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys \
    && chmod 600 $HOME/.ssh/authorized_keys \
    \
    && rm -rf /var/cache/apk/*

EXPOSE 2222

# $ docker build -t alpine-sshd ~/OpenSource/WaterBolik/docker-demo/sshd/alpine-sshd
# $ docker build -t alpine-sshd B:/OpenSource/WaterBolik/docker-demo/sshd/alpine-sshd
# $ docker run -it --rm --name alpine-sshd --privileged=true -d alpine-sshd
# $ docker exec -it alpine-sshd bash
# $ docker stop alpine-sshd
