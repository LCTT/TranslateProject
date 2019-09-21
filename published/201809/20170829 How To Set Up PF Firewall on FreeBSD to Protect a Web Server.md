如何在 FreeBSD 上设置 PF 防火墙来保护 Web 服务器
======

[![How To Set Up a Firewall with PF on FreeBSD to Protect a Web Server][1]][1]

我是从 Linux 迁移过来的 FreeBSD 新用户，Linux 中使用的是 netfilter 防火墙框架（LCTT 译注：netfilter 是由 Rusty Russell 提出的 Linux 2.4 内核防火墙框架）。那么在 FreeBSD 上，我该如何设置 PF 防火墙，来保护只有一个公共 IP 地址和端口的 web 服务器呢？

PF 是<ruby>包过滤器<rt>packet filter</rt></ruby>的简称。它是为 OpenBSD 开发的，但是已经被移植到了 FreeBSD 以及其它操作系统上。PF 是一个包状态过滤引擎。在这篇教程中，我将向你展示如何在 FreeBSD 10.x 以及 11.x 中设置 PF 防火墙，从而来保护 web 服务器。

### 第一步：开启 PF 防火墙

你需要把下面这几行内容添加到文件 `/etc/rc.conf` 文件中：

```
# echo 'pf_enable="YES"' >> /etc/rc.conf
# echo 'pf_rules="/usr/local/etc/pf.conf"' >> /etc/rc.conf
# echo 'pflog_enable="YES"' >> /etc/rc.conf
# echo 'pflog_logfile="/var/log/pflog"' >> /etc/rc.conf
```

在这里：

  1.  `pf_enable="YES"` - 开启 PF 服务
  2.  `pf_rules="/usr/local/etc/pf.conf"` - 从文件 `/usr/local/etc/pf.conf` 中读取 PF 规则
  3.  `pflog_enable="YES"` - 为 PF 服务打开日志支持
  4.  `pflog_logfile="/var/log/pflog"` - 存储日志的文件，即日志存于文件 `/var/log/pflog` 中

### 第二步：在 `/usr/local/etc/pf.conf` 文件中创建防火墙规则

输入下面这个命令打开文件（超级用户模式下）：

```
# vi /usr/local/etc/pf.conf
```

在文件中添加下面这些 PF 规则集：

```
# vim: set ft=pf
# /usr/local/etc/pf.conf
 
## 设置公共端口 ##
ext_if="vtnet0"
 
## 设置服务器公共 IP 地址 ##
ext_if_ip="172.xxx.yyy.zzz"
 
## 设置并删除下面这些公共端口上的 IP 范围 ##
martians = "{ 127.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12, \
	      10.0.0.0/8, 169.254.0.0/16, 192.0.2.0/24, \
	      0.0.0.0/8, 240.0.0.0/4 }"
 
## 设置 http(80)/https (443) 端口 ##
webports = "{http, https}"
 
## 启用下面这些服务 ##
int_tcp_services = "{domain, ntp, smtp, www, https, ftp, ssh}"
int_udp_services = "{domain, ntp}"
 
## 跳过回环端口 - 跳过端口上的所有 PF 处理 ##
set skip on lo
 
## 设置 PF 应该统计的端口信息，如发送/接收字节数，通过/禁止的包的数目 ##
set loginterface $ext_if
 
## 设置默认策略 ##
block return in log all
block out all
 
# 基于 IP 分片的错误处理来防御攻击 
scrub in all
 
# 删除所有不可达路由地址
block drop in quick on $ext_if from $martians to any
block drop out quick on $ext_if from any to $martians
 
## 禁止欺骗包
antispoof quick for $ext_if
 
# 打开 SSH 端口，SSH 服务仅从 VPN IP 139.xx.yy.zz 监听 22 号端口
# 出于安全原因，我不允许/接收 SSH 流量
pass in quick on $ext_if inet proto tcp from 139.xxx.yyy.zzz to $ext_if_ip port = ssh flags S/SA keep state label "USER_RULE: Allow SSH from 139.xxx.yyy.zzz"
## 使用下面这些规则来为所有来自任何 IP 地址的用户开启 SSH 服务 #
## pass in inet proto tcp to $ext_if port ssh
### [ OR ] ###
## pass in inet proto tcp to $ext_if port 22 
 
# Allow Ping-Pong stuff. Be a good sysadmin 
pass inet proto icmp icmp-type echoreq
 
# All access to our Nginx/Apache/Lighttpd Webserver ports 
pass proto tcp from any to $ext_if port $webports
 
# 允许重要的发送流量
pass out quick on $ext_if proto tcp to any port $int_tcp_services
pass out quick on $ext_if proto udp to any port $int_udp_services
 
# 在下面添加自定义规则
```

保存并关闭文件。欢迎来参考我的[规则集][2]。如果要检查语法错误，可以运行：

```
# service pf check
```

或

```
/etc/rc.d/pf check
```

或

```
# pfctl -n -f /usr/local/etc/pf.conf
```

### 第三步：开始运行 PF 防火墙

命令如下。请小心，如果是基于 SSH 的会话，你可能会和服务器断开连接。

#### 开启 PF 防火墙：

```
# service pf start
```

#### 停用 PF 防火墙：

```
# service pf stop
```

#### 检查语法错误：

```
# service pf check
```

#### 重启服务：

```
# service pf restart
```

#### 查看 PF 状态：

```
# service pf status
```

示例输出：

```
Status: Enabled for 0 days 00:02:18           Debug: Urgent
 
Interface Stats for vtnet0            IPv4             IPv6
  Bytes In                           19463                0
  Bytes Out                          18541                0
  Packets In
    Passed                             244                0
    Blocked                              3                0
  Packets Out
    Passed                             136                0
    Blocked                             12                0
 
State Table                          Total             Rate
  current entries                        1               
  searches                             395            2.9/s
  inserts                                4            0.0/s
  removals                               3            0.0/s
Counters
  match                                 19            0.1/s
  bad-offset                             0            0.0/s
  fragment                               0            0.0/s
  short                                  0            0.0/s
  normalize                              0            0.0/s
  memory                                 0            0.0/s
  bad-timestamp                          0            0.0/s
  congestion                             0            0.0/s
  ip-option                              0            0.0/s
  proto-cksum                            0            0.0/s
  state-mismatch                         0            0.0/s
  state-insert                           0            0.0/s
  state-limit                            0            0.0/s
  src-limit                              0            0.0/s
  synproxy                               0            0.0/s
  map-failed                             0            0.0/s
```

#### 开启/关闭/重启 pflog 服务的命令

输入下面这些命令：

```
# service pflog start
# service pflog stop
# service pflog restart
```

### 第四步：`pfctl` 命令的简单介绍

你需要使用 `pfctl` 命令来查看 PF 规则集和参数配置，包括来自<ruby>包过滤器<rt>packet filter</rt></ruby>的状态信息。让我们来看一下所有常见命令：

#### 显示 PF 规则信息

```
# pfctl -s rules
```

示例输出：

```
block return in log all
block drop out all
block drop in quick on ! vtnet0 inet from 172.xxx.yyy.zzz/24 to any
block drop in quick inet from 172.xxx.yyy.zzz/24 to any
pass in quick on vtnet0 inet proto tcp from 139.aaa.ccc.ddd to 172.xxx.yyy.zzz/24 port = ssh flags S/SA keep state label "USER_RULE: Allow SSH from 139.aaa.ccc.ddd"
pass inet proto icmp all icmp-type echoreq keep state
pass out quick on vtnet0 proto tcp from any to any port = domain flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ntp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = smtp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = http flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = https flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ftp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ssh flags S/SA keep state
pass out quick on vtnet0 proto udp from any to any port = domain keep state
pass out quick on vtnet0 proto udp from any to any port = ntp keep state
```

#### 显示每条规则的详细内容

```
# pfctl -v -s rules
```

在每条规则的详细输出中添加规则编号：

```
# pfctl -vvsr show
```

#### 显示状态信息

```
# pfctl -s state
# pfctl -s state | more
# pfctl -s state | grep 'something'
```

#### 如何在命令行中禁止 PF 服务

```
# pfctl -d
```

#### 如何在命令行中启用 PF 服务

```
# pfctl -e
```

#### 如何在命令行中刷新 PF 规则/NAT/路由表

```
# pfctl -F all
```

示例输出：

```
rules cleared
nat cleared
0 tables deleted.
2 states cleared
source tracking entries cleared
pf: statistics cleared
pf: interface flags reset
```

#### 如何在命令行中仅刷新 PF 规则

```
# pfctl -F rules
```

#### 如何在命令行中仅刷新队列

```
# pfctl -F queue
```

#### 如何在命令行中刷新统计信息（它不是任何规则的一部分）

```
# pfctl -F info
```

#### 如何在命令行中清除所有计数器

```
# pfctl -z clear
```

### 第五步：查看 PF 日志

PF 日志是二进制格式的。使用下面这一命令来查看：

```
# tcpdump -n -e -ttt -r /var/log/pflog
```

示例输出：

```
Aug 29 15:41:11.757829 rule 0/(match) block in on vio0: 86.47.225.151.55806 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 52206 [tos 0x28]
Aug 29 15:41:44.193309 rule 0/(match) block in on vio0: 5.196.83.88.25461 > 45.FOO.BAR.IP.26941: S 2224505792:2224505792(0) ack 4252565505 win 17520 (DF) [tos 0x24]
Aug 29 15:41:54.628027 rule 0/(match) block in on vio0: 45.55.13.94.50217 > 45.FOO.BAR.IP.465: S 3941123632:3941123632(0) win 65535
Aug 29 15:42:11.126427 rule 0/(match) block in on vio0: 87.250.224.127.59862 > 45.FOO.BAR.IP.80: S 248176545:248176545(0) win 28200 <mss 1410,sackOK,timestamp 1044055305 0,nop,wscale 8> (DF)
Aug 29 15:43:04.953537 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7475: S 1164335542:1164335542(0) win 1024
Aug 29 15:43:05.122156 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7475: R 1164335543:1164335543(0) win 1200
Aug 29 15:43:37.302410 rule 0/(match) block in on vio0: 94.130.12.27.18080 > 45.FOO.BAR.IP.64857: S 683904905:683904905(0) ack 4000841729 win 16384 <mss 1460>
Aug 29 15:44:46.574863 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7677: S 3451987887:3451987887(0) win 1024
Aug 29 15:44:46.819754 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7677: R 3451987888:3451987888(0) win 1200
Aug 29 15:45:21.194752 rule 0/(match) block in on vio0: 185.40.4.130.55910 > 45.FOO.BAR.IP.80: S 3106068642:3106068642(0) win 1024
Aug 29 15:45:32.999219 rule 0/(match) block in on vio0: 185.40.4.130.55910 > 45.FOO.BAR.IP.808: S 322591763:322591763(0) win 1024
Aug 29 15:46:30.157884 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6511: S 2412580953:2412580953(0) win 1024 [tos 0x28]
Aug 29 15:46:30.252023 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6511: R 2412580954:2412580954(0) win 1200 [tos 0x28]
Aug 29 15:49:44.337015 rule 0/(match) block in on vio0: 189.219.226.213.22640 > 45.FOO.BAR.IP.23: S 14807:14807(0) win 14600 [tos 0x28]
Aug 29 15:49:55.161572 rule 0/(match) block in on vio0: 5.196.83.88.25461 > 45.FOO.BAR.IP.40321: S 1297217585:1297217585(0) ack 1051525121 win 17520 (DF) [tos 0x24]
Aug 29 15:49:59.735391 rule 0/(match) block in on vio0: 36.7.147.209.2545 > 45.FOO.BAR.IP.3389: SWE 3577047469:3577047469(0) win 8192 <mss 1460,nop,wscale 8,nop,nop,sackOK> (DF) [tos 0x2 (E)]
Aug 29 15:50:00.703229 rule 0/(match) block in on vio0: 36.7.147.209.2546 > 45.FOO.BAR.IP.3389: SWE 1539382950:1539382950(0) win 8192 <mss 1460,nop,wscale 8,nop,nop,sackOK> (DF) [tos 0x2 (E)]
Aug 29 15:51:33.880334 rule 0/(match) block in on vio0: 45.55.22.21.53510 > 45.FOO.BAR.IP.2362: udp 14
Aug 29 15:51:34.006656 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6491: S 151489102:151489102(0) win 1024 [tos 0x28]
Aug 29 15:51:34.274654 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6491: R 151489103:151489103(0) win 1200 [tos 0x28]
Aug 29 15:51:36.393019 rule 0/(match) block in on vio0: 60.191.38.78.4249 > 45.FOO.BAR.IP.8000: S 3746478095:3746478095(0) win 29200 (DF)
Aug 29 15:51:57.213051 rule 0/(match) block in on vio0: 24.137.245.138.7343 > 45.FOO.BAR.IP.5358: S 14134:14134(0) win 14600
Aug 29 15:52:37.852219 rule 0/(match) block in on vio0: 122.226.185.125.51128 > 45.FOO.BAR.IP.23: S 1715745381:1715745381(0) win 5840 <mss 1420,sackOK,timestamp 13511417 0,nop,wscale 2> (DF)
Aug 29 15:53:31.309325 rule 0/(match) block in on vio0: 189.218.148.69.377 > 45.FOO.BAR.IP5358: S 65340:65340(0) win 14600 [tos 0x28]
Aug 29 15:53:31.809570 rule 0/(match) block in on vio0: 13.93.104.140.53184 > 45.FOO.BAR.IP.1433: S 39854048:39854048(0) win 1024
Aug 29 15:53:32.138231 rule 0/(match) block in on vio0: 13.93.104.140.53184 > 45.FOO.BAR.IP.1433: R 39854049:39854049(0) win 1200
Aug 29 15:53:41.459088 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6028: S 168338703:168338703(0) win 1024
Aug 29 15:53:41.789732 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6028: R 168338704:168338704(0) win 1200
Aug 29 15:54:34.993594 rule 0/(match) block in on vio0: 212.47.234.50.5102 > 45.FOO.BAR.IP.5060: udp 408 (DF) [tos 0x28]
Aug 29 15:54:57.987449 rule 0/(match) block in on vio0: 51.15.69.145.5100 > 45.FOO.BAR.IP.5060: udp 406 (DF) [tos 0x28]
Aug 29 15:55:07.001743 rule 0/(match) block in on vio0: 190.83.174.214.58863 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 27420
Aug 29 15:55:51.269549 rule 0/(match) block in on vio0: 142.217.201.69.26112 > 45.FOO.BAR.IP.22: S 757158343:757158343(0) win 22840 <mss 1460>
Aug 29 15:58:41.346028 rule 0/(match) block in on vio0: 169.1.29.111.29765 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 28509
Aug 29 15:59:11.575927 rule 0/(match) block in on vio0: 187.160.235.162.32427 > 45.FOO.BAR.IP.5358: S 22445:22445(0) win 14600 [tos 0x28]
Aug 29 15:59:37.826598 rule 0/(match) block in on vio0: 94.74.81.97.54656 > 45.FOO.BAR.IP.3128: S 2720157526:2720157526(0) win 1024 [tos 0x28]stateful
Aug 29 15:59:37.991171 rule 0/(match) block in on vio0: 94.74.81.97.54656 > 45.FOO.BAR.IP.3128: R 2720157527:2720157527(0) win 1200 [tos 0x28]
Aug 29 16:01:36.990050 rule 0/(match) block in on vio0: 182.18.8.28.23299 > 45.FOO.BAR.IP.445: S 1510146048:1510146048(0) win 16384
```

如果要查看实时日志，可以运行：

```
# tcpdump -n -e -ttt -i pflog0
```

如果你想了解更多信息，可以访问 [PF FAQ][3] 和 [FreeBSD HANDBOOK][4] 以及下面这些 man 页面：

```
# man tcpdump
# man pfctl
# man pf
```

### 关于作者

我是 nixCraft 的创立者，一个经验丰富的系统管理员，同时也是一位 Linux 操作系统/Unix shell 脚本培训师。我在不同的行业与全球客户工作过，包括 IT、教育、国防和空间研究、以及非营利组织。你可以在 [Twitter][5]、[Facebook][6] 或 [Google+][7] 上面关注我。 

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-pf-on-freebsd-to-protect-a-web-server/

作者：[Vivek Gite][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/08/howto-setup-a-firewall-with-pf-on-freebsd.001.jpeg
[2]:https://github.com/nixcraft/pf.conf/blob/master/pf.conf
[3]:https://www.openbsd.org/faq/pf/
[4]:https://www.freebsd.org/doc/handbook/firewalls.html
[5]:https://twitter.com/nixcraft
[6]:https://facebook.com/nixcraft
[7]:https://plus.google.com/+CybercitiBiz
