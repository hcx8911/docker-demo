#!/bin/bash

# nmap 
# 网络探测工具和安全/端口扫描器
# https://nmap.org/

# 命令格式
# nmap [ <Scan Type> ...] [ <Options> ] { <target specification> }

# nmap 10.101.1.1

# nmap 10.27.230.121

# nmap vip.rovaniemi.vip

# nmap www.rovaniemi.vip

nmap scanme.nmap.org

nmap -A -T4 scanme.nmap.org