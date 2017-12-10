#!/bin/bash

# 在临时目录中工作，该目录通过容器映射临时空间实现“--mount type=tmpfs,destination=/app”
ROOTPATH=/tmpfs
cd ${ROOTPATH}

echo " "
echo "创建文件--------------------------------------------------"
touch myfile && echo "my file first line" > myfile
cat myfile
echo "创建一个硬连接文件hard"
ln myfile hard
cat hard
echo "创建一个软连接文件soft"
ln -s myfile soft
cat soft
echo "采用绝对路径创建一个软连接文件soft_abs"
ln -s ${ROOTPATH}/myfile soft_abs
cat soft_abs
echo "查看文件列表"
ls -lhi
echo "----特别注意："
echo "    硬连接与原文件的inode号相同"
echo "    软连接文件大小即路径大小，软连接存储的即指向文件的路径"
echo " "

echo "通过硬连接修改文件---------------------------------------------"
echo "new line by hard" >> hard
echo "原文件"
cat myfile
echo "硬连接"
cat hard
echo "软连接"
cat soft
echo "绝对路径软连接"
cat soft_abs
echo " "

echo "通过软连接修改文件---------------------------------------------"
echo "new line by soft" >> soft
echo "原文件"
cat myfile
echo "硬连接"
cat hard
echo "软连接"
cat soft
echo "绝对路径软连接"
cat soft_abs
echo " "

echo "删除原文件-------------------------------------------------"
rm myfile
echo "原文件不存在，硬连接正常，软连接指向不存在位置，会变红"
ls -lhi
echo "原文件不存在"
cat myfile
echo "硬连接仍可访问"
cat hard
echo "软连接不可访问"
cat soft
echo "绝对路径软连接不可访问"
cat soft_abs
echo " "

echo "清除所有临时文件----------------------------------------------"
rm -f myfile hard soft soft_abs
ls -lhi
