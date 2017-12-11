#!/bin/bash

# 在临时目录中工作，该目录通过容器映射临时空间实现“--mount type=tmpfs,destination=/app”
ROOTPATH=/tmpfs
cd ${ROOTPATH}

echo "抽取子字符串的几种方法-----------------------------------------"
u="this is a test"
echo "$u"
echo " "

echo "抽取子字符串"
# ${parameter:offset:length} 
# parameter 值中以 offset 为开始，长为 length 个字符的字符串。
echo '''var_sub="${u:10:4}"'''
var_sub="${u:10:4}"
echo "${var_sub}" 
echo " "

echo "使用IFS"
# IFS（内部字段分隔符）
# 进行单词分割，并用内建的 read 命令将行分割为词。
# https://bash.cyberciti.biz/guide/$IFS
echo '''set -- $u && var_ifs="$4"'''
set -- $u && var_ifs="$4"
echo "${var_ifs}"
echo '''注意：该方式会产生临时变量$1...'''
echo "$1" # this
echo "$2" # is
echo "$3" # a
echo "$4" # test
echo " "

echo "借助 cut 命令"
echo '''var_cut="$(cut -d' ' -f 4 <<< $u)"'''
var_cut="$(cut -d' ' -f 4 <<< $u)"
echo "${var_cut}"
echo '''其它几种写法'''
echo "$u" | cut -d' ' -f 4
echo "$u" | cut --delimiter=' ' --fields=4