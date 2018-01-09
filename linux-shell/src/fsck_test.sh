#!/bin/bash

# FSCK 检测并修复文件系统中的错误
# FSCK 是一个很重要的 Linux/Unix 工具，它用于检测并修复文件系统中的错误。
# 它类似于 Windows 操作系统中的 “chkdsk” 工具，但它是为 Linux、MacOS、FreeBSD 操作系统所准备的。
# FSCK 全称为 File System Consistency Check。
# 在大多数时候，它在系统启动时运行，但是如果需要的话，它也能被超级用户手工启动。
# 它可以进行三种模式的操作，
#     查错并在发现错误时由用户决定如何处理，
#     查错并自动修复，
#     查错但在发现错误时只显示错误而不进行修复。

# fsck options drives
#     -p 自动修复（不询问）
#     -n 不对文件系统做出改动
#     -y 对所有问题都回答 "yes"
#     -c 检查所有的坏块并将之添加到坏块列表中
#     -f 即使文件系统标记为 clean 也强制进行检查
#     -v 输出详细信息
#     -b superblock 使用替代的超级块
#     -B blocksize 指定超级块的块大小
#     -j external_journal 指定外部日志的位置
#     -l bad_blocks_file 添加到指定的坏块列表（文件）
#     -L bad_blocks_file 指定坏块列表（文件）
# fsck 错误码。
#     0 - 没有错误
#     1 - 修复了一些文件系统错误
#     2 - 系统需要被重启
#     4 - 文件系统错误未被修复
#     8 - 操作错
#     16 - 使用或语法错
#     32 - fsck 被用户取消
#     128 - 共享库出错
# http://linuxtechlab.com/linux-filesystem-errors-fsck-command-with-examples/
# https://linux.cn/article-9194-1.html

# 在单个分区上进行错误检查
​umount /dev/sdb1
fsck /dev/sdb1
​
# 检查文件系统错误并自动修复​
fsck -a /dev/sdb1​​

# 检查文件系统错误但并不进行修复​
fsck -n /dev/sdb1

​​​​# 检查所有分区中的错误
fsck -A

# 禁止对根文件系统进行检查
fsck -AR

# 只检查指定文件系统类型的分区
fsck -t ext4 /dev/sdb1
fsck -t -A ext4

# 只在卸载的磁盘上进行一致性检查
fsck -AM

# 搜索坏的文件系统块
fsck -vcck /dev/sdb1

# 通过 du 和 df 检查磁盘空间

# 检查磁盘所在的挂载点目录
# 由于它要遍历磁盘中的所有文件，因此需要花费一点时间。
du -sh /

# 查看磁盘空间
df -h

# 已删除文件被进程所占用
# 在进程运行期间，Linux 不会释放该文件的存储空间。
# 你需要找出这个进程然后重启这个进程。
lsof / | grep deleted

# 重启相关进程
systemctl restart service_name

# 文件系统中有一些称为 “i 节点inode” 的元数据，其用来保存文件的相关信息。
df -i /