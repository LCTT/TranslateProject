3 个简单、优秀的 Linux 网络监视器
============================================================

![network](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_3.png?itok=iuPcSN4k "network")

*用 iftop、Nethogs 和 vnstat 了解更多关于你的网络连接。*

你可以通过这三个 Linux 网络命令，了解有关你网络连接的大量信息。iftop 通过进程号跟踪网络连接，Nethogs 可以快速显示哪个在占用你的带宽，而 vnstat 作为一个很好的轻量级守护进程运行，可以随时随地记录你的使用情况。

### iftop

[iftop][7] 监听你指定的网络接口，并以 `top` 的形式展示连接。

这是一个很好的小工具，用于快速识别占用、测量速度，并保持网络流量的总体运行。看到我们使用了多少带宽是非常令人惊讶的，特别是对于我们这些还记得使用电话线、调制解调器、让人尖叫的 Kbit 速度和真实的实时波特率的老年人来说。我们很久以前就放弃了波特率，转而使用比特率。波特率测量信号变化，有时与比特率相同，但大多数情况下不是。

如果你只有一个网络接口，可以不带选项运行 `iftop`。`iftop` 需要 root 权限：

```
$ sudo iftop
```

当你有多个接口时，指定要监控的接口：

```
$ sudo iftop -i wlan0
```

就像 top 一样，你可以在运行时更改显示选项。

*   `h` 切换帮助屏幕。
*   `n` 切换名称解析。
*   `s` 切换源主机显示，`d` 切换目标主机。
*   `s` 切换端口号。
*   `N` 切换端口解析。要全看到端口号，请关闭解析。
*   `t` 切换文本界面。默认显示需要 ncurses。我认为文本显示更易于阅读和更好的组织（图1）。
*   `p` 暂停显示。
*   `q` 退出程序。

![text display](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_8.png?itok=luKHS5ve "text display")

*图 1：文本显示是可读的和可组织的。*

当你切换显示选项时，`iftop` 会继续测量所有流量。你还可以选择要监控的单个主机。你需要主机的 IP 地址和网络掩码。我很好奇 Pandora 在我那可怜的带宽中占用了多少，所以我先用 `dig` 找到它们的 IP 地址：

```
$ dig A pandora.com
[...]
;; ANSWER SECTION:
pandora.com.            267     IN      A       208.85.40.20
pandora.com.            267     IN      A       208.85.40.50
```

网络掩码是什么？ [ipcalc][8] 告诉我们：

```
$ ipcalc -b 208.85.40.20
Address:   208.85.40.20   
Netmask:   255.255.255.0 = 24
Wildcard:  0.0.0.255  
=>
Network:   208.85.40.0/24 
```

现在将地址和网络掩码提供给 iftop：

```
$ sudo iftop -F 208.85.40.20/24 -i wlan0
```

这不是真的吗？我很惊讶地发现，我珍贵的带宽对于 Pandora 很宽裕，每小时使用大约使用 500Kb。而且，像大多数流媒体服务一样，Pandora 的流量也有峰值，其依赖于缓存来缓解阻塞。

你可以使用 `-G` 选项对 IPv6 地址执行相同操作。请参阅手册页了解 `iftop` 的其他功能，包括使用自定义配置文件定制默认选项，并应用自定义过滤器（请参阅 [PCAP-FILTER][9] 作为过滤器参考）。

### Nethogs

当你想要快速了解谁占用了你的带宽时，Nethogs 是快速和容易的。以 root 身份运行，并指定要监听的接口。它显示了空闲的应用程序和进程号，以便如果你愿意的话，你可以杀死它：

```
$ sudo nethogs wlan0

NetHogs version 0.8.1

PID USER   PROGRAM              DEV    SENT   RECEIVED       
7690 carla /usr/lib/firefox     wlan0 12.494 556.580 KB/sec
5648 carla .../chromium-browser wlan0  0.052   0.038 KB/sec
TOTAL                                 12.546 556.618 KB/sec 
```

Nethogs 选项很少：在 kb/s、kb、b 和 mb 之间循环；通过接收或发送的数据包进行排序；并调整刷新之间的延迟。请参阅 `man nethogs`，或者运行 `nethogs -h`。

### vnstat

[vnstat][10] 是最容易使用的网络数据收集器。它是轻量级的，不需要 root 权限。它作为守护进程运行，并记录你网络统计信息。`vnstat` 命令显示累计的数据：

```
$ vnstat -i wlan0
Database updated: Tue Oct 17 08:36:38 2017

   wlan0 since 10/17/2017

          rx:  45.27 MiB      tx:  3.77 MiB      total:  49.04 MiB

   monthly
                     rx      |     tx      |    total    |   avg. rate
     ------------------------+-------------+-------------+---------------
       Oct '17     45.27 MiB |    3.77 MiB |   49.04 MiB |    0.28 kbit/s
     ------------------------+-------------+-------------+---------------
     estimated        85 MiB |       5 MiB |      90 MiB |

   daily
                     rx      |     tx      |    total    |   avg. rate
     ------------------------+-------------+-------------+---------------
         today     45.27 MiB |    3.77 MiB |   49.04 MiB |   12.96 kbit/s
     ------------------------+-------------+-------------+---------------
     estimated       125 MiB |       8 MiB |     133 MiB |
```

它默认显示所有的网络接口。使用 `-i` 选项选择单个接口。以这种方式合并多个接口的数据：

```
$ vnstat -i wlan0+eth0+eth1
```

你可以通过以下几种方式过滤显示：

*   `-h` 以小时显示统计数据。
*   `-d` 以天数显示统计数据。
*   `-w` 和 `-m` 按周和月显示统计数据。
*   使用 `-l` 选项查看实时更新。

此命令删除 wlan1 的数据库，并停止监控它：

```
$ vnstat -i wlan1 --delete
```

此命令为网络接口创建别名。此例使用 Ubuntu 16.04 中的一个奇怪的接口名称：

```
$ vnstat -u -i enp0s25 --nick eth0
```

默认情况下，vnstat 监视 eth0。你可以在 `/etc/vnstat.conf` 中更改此内容，或在主目录中创建自己的个人配置文件。请参见 `man vnstat` 以获得完整的参考。

你还可以安装 `vnstati` 创建简单的彩色图（图2）：

```
$ vnstati -s -i wlx7cdd90a0a1c2 -o vnstat.png
```

![vnstati](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-2_5.png?itok=HsWJMcW0 "vnstati")

*图 2：你可以使用 vnstati 创建简单的彩色图表。*

有关完整选项，请参见 `man vnstati`。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/3-simple-excellent-linux-network-monitors

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/files/images/fig-1png-8
[5]:https://www.linux.com/files/images/fig-2png-5
[6]:https://www.linux.com/files/images/bannerpng-3
[7]:http://www.ex-parrot.com/pdw/iftop/
[8]:https://www.linux.com/learn/intro-to-linux/2017/8/how-calculate-network-addresses-ipcalc
[9]:http://www.tcpdump.org/manpages/pcap-filter.7.html
[10]:http://humdi.net/vnstat/
