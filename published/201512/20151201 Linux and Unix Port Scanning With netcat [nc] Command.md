使用 netcat [nc] 命令对 Linux 和 Unix 进行端口扫描 
================================================================================

我如何在自己的服务器上找出哪些端口是开放的？如何使用 nc 命令进行端口扫描来替换 [Linux 或类 Unix 中的 nmap 命令][1]？ 

nmap (“Network Mapper”)是一个用于网络探测和安全审核的开源工具。如果 nmap 没有安装或者你不希望使用 nmap，那你可以用 netcat/nc 命令进行端口扫描。它对于查看目标计算机上哪些端口是开放的或者运行着服务是非常有用的。你也可以使用 [nmap 命令进行端口扫描][2] 。

### 如何使用 nc 来扫描 Linux，UNIX 和 Windows 服务器的端口呢？ ###

如果未安装 nmap，试试 nc/netcat 命令，如下所示。-z 参数用来告诉 nc 报告开放的端口，而不是启动连接。在 nc 命令中使用 -z 参数时，你需要在主机名/ip 后面限定端口的范围和加速其运行： 

    ### 语法 ###
    ### nc -z -v {host-name-here} {port-range-here}
    nc -z -v host-name-here ssh
    nc -z -v host-name-here 22
    nc -w 1 -z -v server-name-here port-Number-her
     
    ### 扫描 1 to 1023 端口 ###
    nc -zv vip-1.vsnl.nixcraft.in 1-1023

输出示例:

    Connection to localhost 25 port [tcp/smtp] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 25 port [tcp/smtp] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 80 port [tcp/http] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 143 port [tcp/imap] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 199 port [tcp/smux] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 783 port [tcp/*] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 904 port [tcp/vmware-authd] succeeded!
    Connection to vip-1.vsnl.nixcraft.in 993 port [tcp/imaps] succeeded!

你也可以扫描单个端口:

    nc -zv v.txvip1 443
    nc -zv v.txvip1 80
    nc -zv v.txvip1 22
    nc -zv v.txvip1 21
    nc -zv v.txvip1 smtp
    nc -zvn v.txvip1 ftp
    
    ### 使用1秒的超时值来更快的扫描 ###
    netcat -v -z -n -w 1 v.txvip1 1-1023
 
输出示例:

![Fig.01: Linux/Unix: Use Netcat to Establish and Test TCP and UDP Connections on a Server](http://s0.cyberciti.org/uploads/faq/2007/07/scan-with-nc.jpg)

*图01：Linux/Unix：使用 Netcat 来测试 TCP 和 UDP 与服务器建立连接*

1. -z : 端口扫描模式即零 I/O 模式。
1. -v : 显示详细信息 [使用 -vv 来输出更详细的信息]。
1. -n : 使用纯数字 IP 地址，即不用 DNS 来解析 IP 地址。 
1. -w 1 : 设置超时值设置为1。

更多例子:

    $ netcat -z -vv www.cyberciti.biz http
    www.cyberciti.biz [75.126.153.206] 80 (http) open
     sent 0, rcvd 0
    $ netcat -z -vv google.com https
    DNS fwd/rev mismatch: google.com != maa03s16-in-f2.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f6.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f5.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f3.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f8.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f0.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f7.1e100.net
    DNS fwd/rev mismatch: google.com != maa03s16-in-f4.1e100.net
    google.com [74.125.236.162] 443 (https) open
     sent 0, rcvd 0
    $ netcat -v -z -n -w 1 192.168.1.254 1-1023
    (UNKNOWN) [192.168.1.254] 989 (ftps-data) open
    (UNKNOWN) [192.168.1.254] 443 (https) open
    (UNKNOWN) [192.168.1.254] 53 (domain) open

也可以看看 ：

- [使用 nmap 命令扫描网络中开放的端口][3]。 
- 手册页 - [nc(1)][4], [nmap(1)][5]

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/linux-port-scanning/

作者：Vivek Gite
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://linux.cn/article-2561-1.html
[2]:https://linux.cn/article-2561-1.html
[3]:https://linux.cn/article-2561-1.html
[4]:http://www.manpager.com/linux/man1/nc.1.html
[5]:http://www.manpager.com/linux/man1/nmap.1.html
