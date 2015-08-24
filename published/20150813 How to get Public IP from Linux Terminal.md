如何在 Linux 终端中知道你的公有 IP
================================================================================
![](http://www.blackmoreops.com/wp-content/uploads/2015/06/256x256xHow-to-get-Public-IP-from-Linux-Terminal-blackMORE-Ops.png.pagespeed.ic.GKEAEd4UNr.png)

公有地址由 InterNIC 分配并由基于类的网络 ID 或基于 CIDR 的地址块构成（被称为 CIDR 块），并保证了在全球互联网中的唯一性。当公有地址被分配时，其路由将会被记录到互联网中的路由器中，这样访问公有地址的流量就能顺利到达。访问目标公有地址的流量可经由互联网抵达。比如，当一个 CIDR 块被以网络 ID 和子网掩码的形式分配给一个组织时，对应的 [网络 ID，子网掩码] 也会同时作为路由储存在互联网中的路由器中。目标是 CIDR 块中的地址的 IP 封包会被导向对应的位置。

在本文中我将会介绍在几种在 Linux 终端中查看你的公有 IP 地址的方法。这对普通用户来说并无意义，但 Linux 服务器（无GUI或者作为只能使用基本工具的用户登录时）会很有用。无论如何，从 Linux 终端中获取公有 IP 在各种方面都很意义，说不定某一天就能用得着。

以下是我们主要使用的两个命令，curl 和 wget。你可以换着用。

### Curl 纯文本格式输出: ###

    curl icanhazip.com
    curl ifconfig.me
    curl curlmyip.com
    curl ip.appspot.com
    curl ipinfo.io/ip
    curl ipecho.net/plain
    curl www.trackip.net/i

### curl JSON格式输出: ###

    curl ipinfo.io/json
    curl ifconfig.me/all.json
    curl www.trackip.net/ip?json (有点丑陋)

### curl XML格式输出: ###

    curl ifconfig.me/all.xml

### curl 得到所有IP细节 （挖掘机）###

    curl ifconfig.me/all

### 使用 DYDNS （当你使用 DYDNS 服务时有用）###

    curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g' 
    curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"

### 使用 Wget 代替 Curl ###

    wget http://ipecho.net/plain -O - -q ; echo
    wget http://observebox.com/ip -O - -q ; echo

### 使用 host 和 dig 命令 ###

如果有的话，你也可以直接使用 host 和 dig 命令。

    host -t a dartsclink.com | sed 's/.*has address //'
    dig +short myip.opendns.com @resolver1.opendns.com

### bash 脚本示例: ###

    #!/bin/bash
    
    PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
    echo $PUBLIC_IP

简单易用。

我实际上是在写一个用于记录每日我的路由器中所有 IP 变化并保存到一个文件的脚本。我在搜索过程中找到了这些很好用的命令。希望某天它能帮到其他人。

--------------------------------------------------------------------------------

via: http://www.blackmoreops.com/2015/06/14/how-to-get-public-ip-from-linux-terminal/

译者：[KevinSJ](https://github.com/KevinSJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
