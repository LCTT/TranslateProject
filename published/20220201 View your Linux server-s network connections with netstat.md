[#]: subject: "View your Linux server's network connections with netstat"
[#]: via: "https://opensource.com/article/22/2/linux-network-security-netstat"
[#]: author: "Sahana Sreeram https://opensource.com/users/sahanasreeram01gmailcom"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14461-1.html"

使用 netstat 查看你的 Linux 服务器网络连接
======

> netstat 命令为你的 Linux 服务器提供了监测和网络故障排除的重要观察手段。

![](https://img.linux.net.cn/data/attachment/album/202204/12/095932h99fuqzd7y9y4f48.jpg)

在 [之前的文章中][2]，我分享了一些管理你的个人 Linux 服务器的首要步骤。我简要的提到了监测网络连接的监听端口，我想通过 Linux 系统的 `netstat` 命令来扩展开讲讲。

服务监测和端口扫描是标准的行业惯例。有很好的软件，如 [Prometheus][3] 协助这个过程自动化，[SELinux][4] 协助上下文和保护系统访问权限。然而，我相信了解你的服务器是如何连接到其他网络和设备的，是建立正常服务器基准的关键，能够帮助你识别有可能表明错误和入侵等异常情况。作为一个初学者，我已经掌握了 `netstat` 命令为我的服务器提供了监测和网络故障排除的重要观察手段。

`netstat` 和类似的一些网络监测工具被归入 [net-tools 软件包][5] 里，用来显示关于活动连接的信息。因为运行在开放的端口的服务往往容易被利用，定期进行网络监测能够帮助你及早探测到可疑的活动。

### 安装 netstat

`netstat` 经常预装在 Linux 发行版上。如果 `netstat` 没有在你的服务器上安装，用你的包管理器安装它。下面是在基于 Debian 的系统上：

```
$ sudo apt-get install net-tools
```

在基于 Fedora 的系统上：

```
$ dnf install net-tools
```

### 使用 netstat

就其本身而言，`netstat` 命令显示了全部建立成功的连接。你可以使用 `netstat` 的参数指定进一步预期的输出。举个例子，要显示所有监听和非监听的连接，使用 `--all`（`-a` 为简写）的参数。这将返回许多结果，所以在例子中我用管道符输出给 `head` 命令来显示输出的前 15 行：

```
$ netstat --all | head -n 15
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 *:27036                 *:*                     LISTEN      
tcp        0      0 localhost:27060         *:*                     LISTEN      
tcp        0      0 *:16001                 *:*                     LISTEN      
tcp        0      0 localhost:6463          *:*                     LISTEN      
tcp        0      0 *:ssh                   *:*                     LISTEN      
tcp        0      0 localhost:57343         *:*                     LISTEN      
tcp        0      0 *:ipp                   *:*                     LISTEN      
tcp        0      0 *:4713                  *:*                     LISTEN      
tcp        0      0 10.0.1.222:48388        syd15s17-in-f5.1e:https ESTABLISHED
tcp        0      0 10.0.1.222:48194        ec2-35-86-38-2.us:https ESTABLISHED
tcp        0      0 10.0.1.222:56075        103-10-125-164.va:27024 ESTABLISHED
tcp        0      0 10.0.1.222:46680        syd15s20-in-f10.1:https ESTABLISHED
tcp        0      0 10.0.1.222:52730        syd09s23-in-f3.1e:https ESTABLISHED
```

要只显示 TCP 端口，使用  `--all` 和 `--tcp` 参数，或者简写成 `-at` ：

```
$ netstat -at | head -n 5
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address   Foreign Address  State      
tcp        0      0 *:27036         *:*              LISTEN      
tcp        0      0 localhost:27060 *:*              LISTEN      
tcp        0      0 *:16001         *:*              LISTEN
```

要只显示 UDP 端口，使用  `--all` 和 `--udp` 参数，或者简写成 `-au` ：

```
$ netstat -au | head -n 5
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address     Foreign Address    State      
udp        0      0 *:27036           *:*                                
udp        0      0 10.0.1.222:44741  224.0.0.56:46164   ESTABLISHED
udp        0      0 *:bootpc     
```

`netstat` 命令参数常常是简单易懂的。举个例子，要显示带有全部进程 ID（PID）和数字地址的监听 TCP 和 UDP 的端口：

```
$ sudo netstat --tcp --udp --listening --programs --numeric
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address      Foreign Addr  State   PID/Program name    
tcp        0      0 0.0.0.0:111        0.0.0.0:*     LISTEN  1/systemd            
tcp        0      0 192.168.122.1:53   0.0.0.0:*     LISTEN  2500/dnsmasq        
tcp        0      0 0.0.0.0:22         0.0.0.0:*     LISTEN  1726/sshd            
tcp        0      0 127.0.0.1:631      0.0.0.0:*     LISTEN  1721/cupsd          
tcp        0      0 127.0.0.1:6010     0.0.0.0:*     LISTEN  4023/sshd: tux@  
tcp6       0      0 :::111             :::*          LISTEN  1/systemd            
tcp6       0      0 :::22              :::*          LISTEN  1726/sshd            
tcp6       0      0 ::1:631            :::*          LISTEN  1721/cupsd          
tcp6       0      0 ::1:6010           :::*          LISTEN  4023/sshd: tux@  
udp        0      0 0.0.0.0:40514      0.0.0.0:*             1499/avahi-daemon:  
udp        0      0 192.168.122.1:53   0.0.0.0:*             2500/dnsmasq        
udp        0      0 0.0.0.0:67         0.0.0.0:*             2500/dnsmasq        
udp        0      0 0.0.0.0:111        0.0.0.0:*             1/systemd            
udp        0      0 0.0.0.0:5353       0.0.0.0:*             1499/avahi-daemon:  
udp6       0      0 :::111             :::*                  1/systemd            
udp6       0      0 :::44235           :::*                  1499/avahi-daemon:  
udp6       0      0 :::5353            :::*                  1499/avahi-daemon:
```

这个常用组合简写版本是 `-tulpn` 。

要显示一个指定服务的信息，[使用 grep 命令过滤][6]：

```
$ sudo netstat -anlp | grep cups
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      1721/cupsd           tcp6       0      0 ::1:631                 :::*                    LISTEN      1721/cupsd
unix  2      [ ACC ]     STREAM     LISTENING     27251    1/systemd /var/run/cups/cups.sock
unix  2      [ ]         DGRAM                    59530    1721/cupsd
unix  3      [ ]         STREAM     CONNECTED     55196    1721/cupsd /var/run/cups/cups.sock
```

### 接下来的步骤

一旦你运行了 `netstat` 命令，你就可以采取措施来保护你的系统，确保只有你主动使用的服务在你的网络上被监听。

  1. 识别通常被利用的端口和服务。一般来说，关闭你实际不使用的端口。
  2. 留意不常见的端口号，认识了解在你系统上使用的合法端口。
  3. 密切注意 SELinux 错误。有时你需要做的只是更新上下文，以匹配你对系统做的合法更改，但是要阅读错误警告，以确保 SELinux 提醒你的不是可疑或者恶意的活动。

如果你发现一个端口正在运行一个可疑的服务，或者你只是简单的想要关闭你不再使用的端口，你可以遵从以下这些步骤，通过防火墙规则手动拒绝端口访问：

如果你在使用 `firewall-cmd` ，运行这些命令：

```
$ sudo firewall-cmd –remove-port=<port number>/tcp
$ sudo firewall-cmd –runtime-to-permanent
```

如果你在使用 UFW，运行以下的命令：

```
$ sudo ufw deny <port number>
```

下一步，使用 `systemctl` 来停止这个服务：

```
$ systemctl stop <service>
```

### 理解 netstat

`netstat` 是一个快速收集你的服务器网络连接信息的有用工具。定期网络监测是了解你的系统的重要组成部分，对帮助你保持你的系统安全有着重要意义。将这一步纳入你的日常管理中，你可以使用类似 `netstat` 或者 `ss` ，以及 [Nmap 等开源端口扫描器或者 Wireshark 等嗅探器][7] ，它们都允许设定 [计划任务][8]。

随着服务器存储了大量的个人数据，确保个人服务器的安全日益重要。通过了解你的服务器怎样连接到互联网，你可以降低你的机器的风险，同时你仍可以在数字时代大量的连接中获得益处。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/linux-network-security-netstat

作者：[Sahana Sreeram][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sahanasreeram01gmailcom
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rack_server_sysadmin_cloud_520.png?itok=fGmwhf8I (A rack of servers, blue background)
[2]: https://opensource.com/article/21/4/securing-linux-servers
[3]: https://opensource.com/article/19/11/introduction-monitoring-prometheus
[4]: https://opensource.com/business/13/11/selinux-policy-guide
[5]: http://sourceforge.net/projects/net-tools/
[6]: https://opensource.com/article/21/3/grep-cheat-sheet
[7]: https://redhat.com/sysadmin/troubleshoot-dhcp-nmap-tcpdump-and-wireshark
[8]: https://opensource.com/article/22/2/redhat.com/sysadmin/nmap-scripting-engine
