
# pstree 在psmisc包中
#   -h：高亮显示当前的进程及其祖先
#   -H：高亮显示指定进程及其祖先
#   -p：显示进程的pid
#   -s：显示特定进程的直系进程
#   -u：指定用户
pstree -p

# ps 这个命令比较特殊，支持了三种风格的命令使用
#     Unix选项：使用1个-
#     BSD选项：选项不使用-
#     GNU长选项：选项使用2个-
# 主要参数和栏位信息简介
#     参数：
#         a：列出终端相关的，如果想列出所有进程需要配合x
#         u：显示面向用户的格式
#         x：列出终端先关的，如果列出所有进程需要配合a
#         f ：显示进程树，这个显示效果跟pstree的效果差远啦
#         k ：根据指定指标去排序
#         --sort： 根据指定指标去排序，%cpu以cpu占用排序，-%cpu反序排
#         o ：设置显示的列
#         L ：显示支持的属性列表
#         -C ：指定命令，多个命令用，分割
#         -L ：显示线程
#         -u ： 指定有效用户ID或名称
#         -U ： 指定真正的用户ID或名称
#         -p ： 显示指定pid进程
#         --pid ：显示属于pid的子进程
#         --forest:树型显示
#     列：
#         USER :用户
#         PID:进程id
#         %CPU:cpu占用率
#         %MEM:内存占用率
#         VSZ:虚拟内存大小
#         RSS:真实内存大小
#         TTY:终端
#         STAT:状态
#         START:开始时间
#         TIME:占用cpu时间
#         COMMAND:命令
#         PRI:优先级
#         RTPRIO:实时优先级
#         PSR:当前进程对应的处理器
#         NI:进程的nice值
#     进程状态：
#         D:不可终端睡眠
#         R:运行或者在运行队列中
#         S:终端睡眠（等待一个时间完成）
#         T:被作业控制信号停止
#         t:被调试追踪停止
#         W:内存换页中
#         X：死亡了
#         Z:蜘蛛进程
#         <:高优先级的
#         N:第优先级的
#         L:有页面锁定在内存
#         s:是一个会话的领导者
#         l:是一个多线程
#         +：是一个前台进程
ps aux

# 查看所有进程的命令，进程id,cpu占用，内存占用信息 ，并按照cpu占用排序
ps axo cmd,pid,%cpu,%mem,%cpu

# renice: 调整优先级
# nice: 指定优先级
# chrt: 改变实时优先级
# pgrep: 查找进程
# pkill: 发送信号给进程，多数使用9信号
# pidof: 查找运行进程的pid
pidof sh

# top
# cpu相关：
#     us:用户空间运行时间（user space）
#     sy:内核空间运行时间（system ）
#     ni：nice过的进程运行时间（nice）
#     id:空闲进程时间（idle）
#     wa:等待io时间(wait)
#     hi:硬中断(hardware interrupts)
#     si:软中断(software interrupts)
#     st:虚拟机偷走的时间（stolen time）
# 内存相关：
#     total:总内存
#     free:空闲内存
#     used:使用内存
#     buff/cache:buffer/cache内存
# 排序：
#     P:按照cpu占比排序
#     M:按照内存占比排序
#     T:按照占据cpu时间排序
# 首部信息显示：
#     l：uptime信息
#     t：tasks及其cpu信息
#     cpu分别显示：1（数字）
#     m:内存信息显示
# 命令：
#     s:修改刷新间隔
#     k:终止指定进程
#     w:保存当前设置到~/.toprc文件，下次使用top采用这个设置
#     q:退出
top

# htop 在htop包中
# 是一个加强版本的top命令，比较炫。
# 选项：
#     -d:指定延迟
#     -u:仅显示指定用户的进程
#     -s:以指定字段进行排序
# 子命令：
#     s：根据指定进程的系统调用
#     l:显示选定进程打开的文件列表
#     a:将选定的进程绑定到指定的cpu上
#     t：显示进程树
# 功能键：
#     F1:帮助
#     F2:设置
#     F3:查找
#     F4:过滤
#     F5:树显示
#     F6:排序
#     F7:减小nice
#     F8:增加nice
#     F9:kill进程
#     F10:退出，q也可以退出的
htop

# vmstat 在procps包中
# 查看虚拟内存信息
# Procs：
#     r:正在运行中或等待运行的进程数量
#     b: 不可终端睡眠的进程数量
# Memory：
#     swpd: 交互内存的使用量
#     free: 空闲物理内存总量
#     buff: 用于buffer的内存总量
#     cache: 用于cache的内存总量
#     inact:非活动内存(配合-a)
#     active: 活动内存（配合-a）
# Swap:
#     si: 从磁盘交互进内存的速率（kb/s）
#     so: 从内存进入磁盘交互的速率（kb/s）
# IO:
#     bi: 读取磁盘到系统的速率（kb/s）
#     bo: 系统写到磁盘的速率（kb/s）
# System:
#     in: 终端速率
#     cs: 上下文切换速率
# CPU:
#     us:用户空间运行时间（user space）
#     sy:内核空间运行时间（system ）
#     id:空闲进程时间（idle）
#     wa:等待io时间(wait)
#     st:虚拟机偷走的时间（stolen time）
vmstat

# iostat
# 查看io的信息
# 选项：
#     -h:人类易读的格式显示单位
#     -p:显示分区的，而不仅仅是磁盘的
#     -x:扩展信息
# cpu相关：
#     %user:用户级别的应用程序的cpu占比
#     %nice:调整过nice的应用程序的cpu占比
#     %system:系统级别的cpu占比
#     %iowait:io等待的cpu占比
#     %steal:别虚拟机偷取的cpu占比
#     %idle:空闲的（没有io请求的）cpu占比
# 设备相关：
#     tps:每秒的事务量
#     Blk_read/s：每秒的块读取速度
#     Blk_wrtn/s:每秒的块写入速度
#     Blk_read:读取的块大小合计
#     Blk_wrtn:写入的块大小合计
iostat

# 报告指定进程的内存映射
pmap 1

# glances
# 跨平台的系统监控工具
# 选项：
#     -c:作为客户端
#     -s:作为服务端
#     -B指定绑定ip，默认是绑定所有ip
#     -p：指定端口，默认是61209
# 在一台机器上
glances -s  &
# 在另外一个机器上
glances -c 192.168.1.101

# 系统资源统计，用于代替vmstat,iostat的
# 选项：
#     -c:显示cpu相关信息
#     -d:显示磁盘相关信息
#     -m:显示内存相关信息
#     -n:显示网络相关信息
#     -p：显示进程相关信息
#     -r:显示io请求相关信息
#     -s:显示swaped相关信息
#     --top-cpu:显示最占用cpu的进程
#     --top-mem:显示最占用内存的进程
dstat

# 类似top命令的io监控
iotop

# kill
# 给指定进程发信号，大多数用于关闭进程
# 常用信号：
#     0）用于测试进程是否存在
#     1）SIGHUP:无需关闭进程让其重读配置文件
#     2）SIGINT:中止正在运行的进程，相当于ctrl+c
#     3) SIGQUIT:退出，相当于ctrl+\
#     9) SIGKILL:强制杀死正在运行的进程
#     15）SIGTERM:终止正在运行的进程
#     18）SIGCONT:继续运行
#     19）SIGSTOP:后台睡眠
# 指定信号方式：
#     数字方式,如1
#     信号完整名字，如SIGHUP
#     信号简写，如HUP
kill
