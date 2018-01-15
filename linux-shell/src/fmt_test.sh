#!/bin/bash

# fmt 命令是一个简单的文本格式化工具，任何人都能在命令行下运行它。
# 它的基本语法为：
#   fmt [-WIDTH] [OPTION]... [FILE]...
# https://linux.die.net/man/1/fmt

# 将文本内容格式成同一行
fmt fmt_test_data.txt

# 默认情况下，fmt 命令产生的输出中的最大行宽为 75。
# -w 修改最大行宽
fmt -w 120 fmt_test_data.txt
fmt -w 160 fmt_test_data.txt
fmt -w 40 fmt_test_data.txt

# -t 突出显示第一行
fmt -t fmt_test_data.txt

# -s 拆分长行
fmt -s fmt_test_data.txt

# -u 单词与单词之间用单个空格分开，句子之间用两个空格分开
fmt -u fmt_test_data.txt