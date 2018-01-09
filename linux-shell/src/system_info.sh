#!/bin/bash

# 查看系统信息
uname -a

# 查看硬件信息
lshw

# 查看块设备（硬盘、闪存驱动器）信息
lsblk

# 查看 CPU 信息
lscpu

# 查看 PCI 信息
lspci

# lspci -v 将提供有关 PCI 卡的详细信息。
# lspci -t 会以树形格式显示它们。

# 查看 USB 信息
lsusb

# 查看 SCSI 信息
lsscsi

# 查看文件系统信息
fdisk -l