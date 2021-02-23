[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11547-1.html)
[#]: subject: (Viewing network bandwidth usage with bmon)
[#]: via: (https://www.networkworld.com/article/3447936/viewing-network-bandwidth-usage-with-bmon.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

用 bmon 查看网络带宽使用情况
======

> 介绍一下 bmon，这是一个监视和调试工具，可捕获网络统计信息并使它们易于理解。

![](https://img.linux.net.cn/data/attachment/album/201911/07/010237a8gb5oqddvl3bnd0.jpg)

`bmon` 是一种监视和调试工具，可在终端窗口中捕获网络统计信息，并提供了如何以易于理解的形式显示以及显示多少数据的选项。

要检查系统上是否安装了 `bmon`，请使用 `which` 命令：

```
$ which bmon
/usr/bin/bmon
```

### 获取 bmon

在 Debian 系统上，使用 `sudo apt-get install bmon` 安装该工具。

对于 Red Hat 和相关发行版，你可以使用 `yum install bmon` 或 `sudo dnf install bmon` 进行安装。或者，你可能必须使用更复杂的安装方式，例如使用以下命令，这些命令首先使用 root 帐户或 sudo 来设置所需的 `libconfuse`：

```
# wget https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.zip
# unzip confuse-3.2.2.zip && cd confuse-3.2.2
# sudo PATH=/usr/local/opt/gettext/bin:$PATH ./configure
# make
# make install
# git clone https://github.com/tgraf/bmon.git &&ammp; cd bmon
# ./autogen.sh
# ./configure
# make
# sudo make install
```

前面五行会安装 `libconfuse`，而后面五行会获取并安装 `bmon` 本身。

### 使用 bmon

启动 `bmon` 的最简单方法是在命令行中键入 `bmon`。根据你正在使用的窗口的大小，你能够查看并显示各种数据。

显示区域的顶部将显示你的网络接口的统计信息：环回接口（lo）和可通过网络访问的接口（例如 eth0）。如果你的终端窗口只有区区几行高，下面这就是你可能会看到的所有内容，它将看起来像这样：

```
lo bmon 4.0
Interfaces                     x RX bps pps     %x TX bps pps     %
 >lo                           x      4B0      x0     0 0     4B        0
    qdisc none (noqueue) x      0 0      x      0 0
  enp0s25                      x    244B0      x1     0 0   470B        2
    qdisc none (fq_codel)      x      0 0      x      0 0   462B        2
q Increase screen height to see graphical statistics qq


q Press d to enable detailed statistics qq
q Press i to enable additional information qq
 Wed Oct 23 14:36:27 2019 Press ? for help
```

在此示例中，网络接口是 enp0s25。请注意列出的接口下方的有用的 “Increase screen height” 提示。拉伸屏幕以增加足够的行（无需重新启动 bmon），你将看到一些图形：

```
Interfaces                     x RX bps       pps     %x TX bps       pps     %
 >lo                           x      0         0      x      0         0
    qdisc none (noqueue)       x      0         0      x      0         0
  enp0s25                      x    253B        3      x   2.65KiB      6
    qdisc none (fq_codel)      x      0         0      x   2.62KiB      6
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
                              (RX Bytes/second)
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
         1   5   10   15   20   25   30   35   40   45   50   55   60
                              (TX Bytes/second)
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
    0.00 ............................................................
         1   5   10   15   20   25   30   35   40   45   50   55   60
```

但是请注意，该图形未显示值。这是因为它正在显示环回 “>lo” 接口。按下箭头键指向公共网络接口，你将看到一些流量。

```
Interfaces                     x RX bps       pps     %x TX bps       pps     %
  lo                           x      0         0      x      0         0
    qdisc none (noqueue)       x      0         0      x      0         0
 >enp0s25                      x    151B        2      x   1.61KiB      3
    qdisc none (fq_codel)      x      0         0      x   1.60KiB      3
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
       B                      (RX Bytes/second)
  635.00 ...............................|............................
  529.17 .....|.........................|....|.......................
  423.33 .....|................|..|..|..|..|.|.......................
  317.50 .|..||.|..||.|..|..|..|..|..|..||.||||......................
  211.67 .|..||.|..||.|..||||.||.|||.||||||||||......................
  105.83 ||||||||||||||||||||||||||||||||||||||......................
         1   5   10   15   20   25   30   35   40   45   50   55   60
     KiB                      (TX Bytes/second)
    4.59 .....................................|......................
    3.83 .....................................|......................
    3.06 ....................................||......................
    2.30 ....................................||......................
    1.53 |||..............|..|||.|...|.|||.||||......................
    0.77 ||||||||||||||||||||||||||||||||||||||......................
         1   5   10   15   20   25   30   35   40   45   50   55   60


q Press d to enable detailed statistics qq
q Press i to enable additional information qq
 Wed Oct 23 16:42:06 2019 Press ? for help
```

通过更改接口，你可以查看显示了网络流量的图表。但是请注意，默认值是按每秒字节数显示的。要按每秒位数来显示，你可以使用 `bmon -b` 启动该工具。

如果你的窗口足够大并按下 `d` 键，则可以显示有关网络流量的详细统计信息。你看到的统计信息示例如下所示。由于其宽度太宽，该显示分为左右两部分。

左侧：

```
RX        TX   │                  RX      TX   │
 Bytes          11.26MiB  11.26MiB│ Packets       25.91K  25.91K  │
 Collisions         -         0   │ Compressed        0       0   │
 Errors             0         0   │ FIFO Error        0       0   │
 ICMPv6             2         2   │ ICMPv6 Checksu    0       -   │
 Ip6 Broadcast      0         0   │ Ip6 Broadcast     0       0   │
 Ip6 Delivers       8         -   │ Ip6 ECT(0) Pac    0       -   │
 Ip6 Header Err     0         -   │ Ip6 Multicast     0     152B  │
 Ip6 Non-ECT Pa     8         -   │ Ip6 Reasm/Frag    0       0   │
 Ip6 Reassembly     0         -   │ Ip6 Too Big Er    0       -   │
 Ip6Discards        0         0   │ Ip6Octets       530B    530B  │
 Missed Error       0         -   │ Multicast         -       0   │
 Window Error       -         0   │                               │
```

右侧：

```
│                  RX      TX   │                  RX      TX
│ Abort Error       -       0   │ Carrier Error     -       0
│ CRC Error         0       -   │ Dropped           0       0
│ Frame Error       0       -   │ Heartbeat Erro    -
│ ICMPv6 Errors     0       0   │ Ip6 Address Er    0       -
│ Ip6 CE Packets    0       -   │ Ip6 Checksum E    0       -
│ Ip6 ECT(1) Pac    0       -   │ Ip6 Forwarded     -       0
│ Ip6 Multicast     0       2   │ Ip6 No Route      0       0
│ Ip6 Reasm/Frag    0       0   │ Ip6 Reasm/Frag    0       0
│ Ip6 Truncated     0       -   │ Ip6 Unknown Pr    0       -
│ Ip6Pkts           8       8   │ Length Error      0
│ No Handler        0       -   │ Over Error        0       -
```

如果按下 `i` 键，将显示网络接口上的其他信息。

左侧：

```
MTU                        1500 | Flags    broadcast,multicast,up |
Address       00:1d:09:77:9d:08 | Broadcast ff:ff:ff:ff:ff:ff     |
Family                   unspec | Alias                           |
```

右侧：

```
| Operstate                 up | IfIndex                   2 |
| Mode                 default | TXQlen                 1000 |
| Qdisc               fq_codel |
```

如果你按下 `?` 键，将会出现一个帮助菜单，其中简要介绍了如何在屏幕上移动光标、选择要显示的数据以及控制图形如何显示。

要退出 `bmon`，输入 `q`，然后输入 `y` 以响应提示来确认退出。

需要注意的一些重要事项是：

* `bmon` 会将其显示调整为终端窗口的大小
* 显示区域底部显示的某些选项仅在窗口足够大可以容纳数据时才起作用
* 除非你使用 `-R`（例如 `bmon -R 5`）来减慢显示速度，否则每秒更新一次显示

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3447936/viewing-network-bandwidth-usage-with-bmon.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
