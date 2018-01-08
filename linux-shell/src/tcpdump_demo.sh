#!/bin/bash

# Tcpdump 是一个很常用的网络包分析工具，可以用来显示通过网络传输到本系统的 TCP/IP 以及其他网络的数据包。
# tcpdump 使用 libpcap 库来抓取网络报，这个库在几乎在所有的 Linux/Unix 中都有。
# tcpdump 可以从网卡或之前创建的数据包文件中读取内容，也可以将包写入文件中以供后续使用。
# 必须是 root 用户或者使用 sudo 特权来运行 tcpdump。

# 从所有网卡中捕获数据包
tcpdump -i any

# 从指定网卡中捕获数据包
tcpdump -i eth0

# 将捕获的包写入文件
tcpdump -i eth0 -w packets_file

# 读取之前产生的 tcpdump 文件
tcpdump -r packets_file

# 获取更多的包信息，并且以可读的形式显示时间戳
tcpdump -ttttnnvvS

# 查看整个网络的数据包
tcpdump net 192.168.1.0/24

# 根据 IP 地址查看报文
tcpdump host 192.168.1.100

# 指定 IP 地址是源地址或是目的地址则使用
tcpdump src 192.168.1.100
tcpdump dst 192.168.1.100

# 查看某个协议或端口号的数据包
tcpdump ssh
tcpdump port 22
tcpdump portrange 22-125

# 使用“与”
tcpdump src 192.168.1.100 && port 22 -w ssh_packets

# 使用“或”
tcpdump src 192.168.1.100 or dst 192.168.1.50 && port 22 -w ssh_packets
tcpdump port 443 or 80 -w http_packets

# 使用“非”
tcpdump -i eth0 src port not 22
