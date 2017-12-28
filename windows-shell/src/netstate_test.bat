REM 检测计算机与网络之间详细的连接情况，
REM 可以得到以太网的统计信息并显示所有协议（TCP协议、UDP协议以及IP协议等）的使用状态。
REM 还可以选择特定的协议并查看其具体使用信息，包括显示所有主机的端口号以及当前主机的详细路由信息。

REM -s 按照各个协议分别显示其统计数据
NETSTAT -s

REM -e 用于显示关于以太网的统计数据
NETSTAT -e

REM -r 显示关于路由表的信息
NETSTAT -r

REM -a 显示一个所有的有效连接信息列表
NETSTAT -a

REM -n 显示所有已建立的有效连接
NETSTAT -n
