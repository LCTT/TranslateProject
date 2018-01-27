三款简单而优秀的 Linux 网络监视工具
============================================================

![network](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_3.png?itok=iuPcSN4k "network")

> 通过 `iftop`、 `nethogs` 和 `vnstat` 详细了解你的网络连接状态。

你可以通过这三个 Linux 命令了解当前网络的大量信息。`iftop` 通过进程号跟踪网络连接，`nethogs` 快速告知你哪些进程在占用你的带宽，而 `vnstat` 以一个良好的轻量级守护进程在后台运行，并实时记录你的网络使用情况。

### iftop

令人称赞的 `iftop` 可以监听您指定的网络接口，并以 top 的样式呈现。

这是一个不错的小工具，可以用于找出网络拥塞，测速和维持网络流量总量。看到自己到底在用多少带宽往往是非常惊人的，尤其是对于我们这些仍然记得电话线路、调制解调器，“高速”到令人惊叫的 kb 和实时波特率的老人们。我们在很久之前就不再使用波特率，转而钟情于比特率。波特率用于衡量信号变化，尽管有时候与比特率相同，但大多数情况下并非如此。

如果你只有一个网络接口，直接运行 `iftop` 即可。不过 `iftop` 需要 root 权限：

```
$ sudo iftop
```

如果你有多个网络接口，那就指定你要监控的接口：

```
$ sudo iftop -i wlan0
```

就像 `top` 命令一样，你可以在命令运行时更改显示选项：

*   `h` 切换帮助界面。
*   `n` 是否解析域名。
*   `s` 切换源地址的显示，`d` 则切换目的地址的显示。
*   `S` 是否显示端口号。
*   `N` 是否解析端口；若关闭解析则显示端口号。
*   `t` 切换文本显示界面。默认的显示方式需要 ncurses。我个人认为图 1 的显示方式在组织性和可读性都更加良好。
*   `p` 暂停显示更新。
*   `q` 退出程序。

![text display](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_8.png?itok=luKHS5ve "text display")

*图 1:组织性和可读性良好的文本显示。*

当你切换显示设置的时候，`iftop` 并不会中断监测流量。当然你也可以单独监测一台主机。而这需要该主机的 IP 地址和子网掩码。现在，我很好奇 Pandora（LCTT 译注：一家美国的电台公司）能给我贫瘠的带宽带来多大的负载。因此我首先使用 dig 命令找到他们的 IP 地址：

```
$ dig A pandora.com
[...]
;; ANSWER SECTION:
pandora.com.            267     IN      A       208.85.40.20
pandora.com.            267     IN      A       208.85.40.50
```

那子网掩码呢？[ipcalc][9] 会告诉我们：

```
$ ipcalc -b 208.85.40.20
Address:   208.85.40.20   
Netmask:   255.255.255.0 = 24
Wildcard:  0.0.0.255  
=>
Network:   208.85.40.0/24 
```

现在，将 IP 地址和子网掩码提供给 `iftop`：

```
$ sudo iftop -F 208.85.40.20/24 -i wlan0
```

很棒的不是么？而我也很惊奇地发现，Pandora 在我的网络上，每小时大约使用 500kb。并且就像大多数流媒体服务一样，Pandora 的流量在迅速增长，并依靠缓存稳定下来。

你可以使用 `-G` 选项对 IPv6 地址执行相同的操作。查阅友好的 man 可以帮助你了解 `iftop` 的其他功能，包括使用个人配置文件自定义你的默认选项，以及使用自定义过滤（请参阅 [PCAP-FILTER][10] 来获取过滤指南）。

### nethogs

当你想要快速了解是谁在吸取你的带宽的时候，`nethogs` 是个快速而简单的方法。你需要以 root 身份运行并指定要监听的接口。它会给你显示大量的应用程序及其进程号，所以如果你想的话，你可以借此杀死任一进程。

```
$ sudo nethogs wlan0

nethogs version 0.8.1

PID USER   PROGRAM              DEV    SENT   RECEIVED       
7690 carla /usr/lib/firefox     wlan0 12.494 556.580 KB/sec
5648 carla .../chromium-browser wlan0  0.052   0.038 KB/sec
TOTAL                                 12.546 556.618 KB/sec 
```

`nethogs` 并没有多少选项：在 kb/s、kb、b、mb之间循环，按接收和发送的数据包排序，调整刷新延迟。具体请看`man nethogs`，或者是运行 `nethogs -h`。

### vnstat

[vnstat][11]是最容易使用的网络数据收集工具。它十分轻量并且不需要 root 权限。它以守护进程在后台运行，因此可以实时地记录你的网络数据。单个 `vnstat` 命令就可以显示所累计的数据。

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

默认情况下它会显示所有的网络接口。使用 `-i` 选项来选择某个接口。也可以像这样合并多个接口的数据：

```
$ vnstat -i wlan0+eth0+eth1
```

你可以通过这几种方式过滤数据显示：

*   `-h` 按小时显示统计信息。
*   `-d` 按天显示统计信息.
*   `-w` 和 `-m` 分别按周和月份来显示统计信息。
*   使用 `-l` 选项查看实时更新。

以下这条命令将会删除 wlan1 的数据库并不再监视它：

```
$ vnstat -i wlan1 --delete
```

而下面这条命令将会为你的一个网络接口创建一个别名。这个例子使用了 Ubuntu 16.04 的一个有线接口名称：

```
$ vnstat -u -i enp0s25 --nick eth0
```

默认情况下，vnstat 会监视 eth0。你可以在 `/etc/vnstat.conf` 对它进行修改，或者在你的家目录下创建你自己的个人配置文件。请参阅 `man vnstat` 以获取完整的指南。

你也可以安装 `vnstati` 来创建简单的彩图（图 2）:

```
$ vnstati -s -i wlx7cdd90a0a1c2 -o vnstat.png
```

![vnstati](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-2_5.png?itok=HsWJMcW0 "vnstati")

*图 2:你可以使用vnstati来创建简单的彩图。*

请参阅 `man vnstati` 以获取完整的选项。


_欲了解 Linux 的更多信息，可以通过学习 Linux 基金会和 edX 的免费课程，[“Linux 入门”][7]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/3-simple-excellent-linux-network-monitors

作者：[CARLA SCHRODER][a]
译者：[KeyLD](https://github.com/KeyLD)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/files/images/fig-1png-8
[5]:https://www.linux.com/files/images/fig-2png-5
[6]:https://www.linux.com/files/images/bannerpng-3
[7]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[8]:http://www.ex-parrot.com/pdw/iftop/
[9]:https://www.linux.com/learn/intro-to-linux/2017/8/how-calculate-network-addresses-ipcalc
[10]:http://www.tcpdump.org/manpages/pcap-filter.7.html
[11]:http://humdi.net/vnstat/
