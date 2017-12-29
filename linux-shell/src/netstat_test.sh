#!/bin/bash

# 在临时目录中工作，该目录通过容器映射临时空间实现“--mount type=tmpfs,destination=/app”
ROOTPATH=/tmpfs
cd ${ROOTPATH}

# netstat 是一个告诉我们系统中所有 tcp/udp/unix socket 连接状态的命令行工具。
# 它会列出所有已经连接或者等待连接状态的连接。 
# 该工具在识别某个应用监听哪个端口时特别有用，我们也能用它来判断某个应用是否正常的在监听某个端口。
# netstat 命令还能显示其它各种各样的网络相关信息，例如路由表， 网卡统计信息， 虚假连接以及多播成员等。

# 常用端口
# ftp:21
# telnet:23
# smtp:25
# http:80
# pop-3:110
# netbios-ssn:139
# squid:3128
# mysql:3306

echo "-a 显示系统所有的 tcp、udp 以及 unix 连接"
netstat -a

echo "-t 显示系统所有的 tcp 连接"
netstat -at

echo "-u 显示系统所有的 udp 连接"
netstat -au

echo "-x 显示系统所有的 unix 连接"
netstat -ax

echo "-p 列出进程 ID/进程名称"
netstat -ap

echo "-n 列出端口号"
netstat -an

echo "-l 只输出监听端口"
netstat -l

echo "-s 输出网络状态"
netstat -s

echo "-i 输出网卡状态"
netstat -i

echo "-g - 显示多播组multicast group信息"
netstat -g

echo "-r 显示网络路由信息"
netstat -r

echo "-c 持续输出"
netstat -c

echo "与 grep 连用来过滤出某个端口的连接"
netstat -anp | grep 3306

echo "通过与 wc 和 grep 命令连用，可以统计指定端口的连接数量"
netstat -anp | grep 3306 | wc -l