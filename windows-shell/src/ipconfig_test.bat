REM IPCONFIG
REM 显示当前的TCP/IP配置的设置值

REM 显示每个已经配置了的接口的IP地址、子网掩码和缺省网关值。
IPCONFIG

REM 当使用all选项时，IPConfig能为DNS和WINS服务器显示它已配置且所有使用的附加信息，并且能够显示内置于本地网卡中的物理地址（MAC）。
REM 如果IP地址是从DHCP服务器租用的，IPConfig将显示DHCP服务器分配的IP地址和租用地址预计失效的日期。
IPCONFIG /all

REM 所有接口的租用IP地址便重新交付给DHCP服务器（归还IP地址）。
IPCONFIG /release

REM 本地计算机设法与DHCP服务器取得联系，并租用一个IP地址。
REM 大多数情况下网卡将被重新赋予和以前所赋予的相同的IP地址。
IPCONFIG /renew