#!/bin/bash

# 在临时目录中工作，该目录通过容器映射临时空间实现“--mount type=tmpfs,destination=/app”
ROOTPATH=/tmpfs
cd ${ROOTPATH}

echo " "
echo "创建文件夹--------------------------------------------------"
mkdir test1 test2
ls -lhi
echo "注意：test1与test2的inode号不同"

echo "映射文件夹--------------------------------------------------"
mount --bind test1 test2
ls -lhi
echo "注意：test2的inode号变成test1的inode号"

echo "清除所有临时文件----------------------------------------------"
rm -rf test1 test2
ls -lhi
