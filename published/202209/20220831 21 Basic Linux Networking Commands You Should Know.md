[#]: subject: "21 Basic Linux Networking Commands You Should Know"
[#]: via: "https://itsfoss.com/basic-linux-networking-commands/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15013-1.html"

你应该知道的 22 个基本的 Linux 网络命令
======

![](https://img.linux.net.cn/data/attachment/album/202209/09/151623qbizibbrzfrffrpc.jpg)

我们并不是每天都会谈论 Linux 的命令行。但正如一些读者指出的那样，你们也想学习一些命令行的技巧。

因此，我整理了一份基本的 Linux 网络命令清单，这些命令在我的大学时代帮助了我，让我对如何在网络方面使用 Linux 有了坚定的认识。

这些命令将帮助你设置网络，以及解决你在 Linux 系统中可能遇到的各种网络问题。

### Linux 中的基本网络命令

这个汇编包括了 CLI 实用程序，它们将帮助你排除网络问题、监控数据包和连接的设备，以及更多。

在我展示这些命令的一些细节之前，让我分享一下我今天要讨论的所有命令的简要概述。

| 命令 | 说明 | 
| :- | :- |
| `ip` | 操纵路由来分配和配置网络参数 | 
| `traceroute` | 识别数据包到达主机的路径 | 
| `tracepath` | 在追踪网络主机的路径时，获取最大传输单元 | 
| `ping` | 通常用于检查主机和服务器之间的连接情况 |
| `ss` | 获得有关网络套接字的详细信息 |
| `dig` | 给出所有关于 DNS 名称服务器的必要信息 |
| `host` | 输出特定域和主机的 IP 地址 |
| `hostname` | 主要用于输出和更改主机名 |
| `curl` | 在网络上通过各种协议传输数据 |
| `mtr` | `ping` 和 `traceroute` 的组合，用于诊断网络 |
| `whois` | 获取有关注册的域名、IP 地址、名称服务器等信息 |
| `ifplugstatus` | 检测本地以太网设备的链接状态 |
| `iftop` | 监视与带宽有关的统计信息 |
| `tcpdump` | 数据包嗅探和分析工具，用于捕获、分析和过滤网络流量 |
| `ethtool` | 允许用户配置以太网设备 |
| `nmcli` | 用于网络连接的故障排除工具 |
| `nmap` | 主要用于审计网络安全 |
| `bmon` | 开源工具，用于监控实时带宽 |
| `firewalld` | 配置防火墙规则的 CLI 工具 |
| `iperf` | 测量网络性能和调整的工具 |
| `speedtest-cli` | speedtest.net 的 CLI 工具，用于检查网速 |
| `vnstat` | 主要用于监控网络流量和带宽消耗 |

现在，让我们用例子和更深入的方式讨论它们。

请注意，并不是所有的命令都会预装。我已经添加了针对 Debian/Ubuntu 的说明。对于其他发行版，请使用你的软件包管理器进行安装。

#### 1、ip 命令

`ip` 命令是最基本的，但也是最重要的，你会发现系统管理员经常使用它，其用于从操纵路由到分配和配置网络参数。

虽然用例可能无穷无尽，但让我向你展示 `ip` 命令的最基本用例（寻找 IP 地址）。

```
ip address
```

![ip address][1]

同样，你也可以使用 `ip` 命令来持续监控设备的状态，请使用 `monitor` 参数而不是我们之前用来获取 IP 地址的 `address` 参数：

```
ip monitor
```

![ip monitor][2]

#### 2、traceroute

使用 `traceroute` 命令，你可以确定数据包到达主机的路线。而且，当你想询问数据包的传输情况和数据包所走的跳数时，它可能相当有用。

默认情况下，你的系统可能没有安装 `traceroute`，如果你使用的是 Debian 及派生的发行版（包括 Ubuntu），安装时只需使用一个命令：

```
sudo apt install traceroute
```

例如，追踪到 google.com 的数据包：

```
traceroute google.com
```

![traceroute google.com][3]

默认情况下，`traceroute` 会使用 IPv4，但是你可以通过使用 `-6` 选项来改变这一行为，该选项将指示 `traceroute` 使用 IPv6。让我告诉你怎么做：

![traceroute -6 google.com][4]

#### 3、tracepath

`tracepath` 命令用于发现 MTU（最大传输单元），同时追踪到网络主机的路径。它与我上面讨论的 `traceroute` 很相似，但它不需要 `sudo` 权限，而且也没有像它那么多功能。

但是，首先什么是 MTU？

MTU 就是可以在网络上传输或接收的最大帧或数据包。

现在，让我们看一下 google.com 的 `tracepath` 的基本例子：

```
tracepath google.com
```

![tracepath google.com][5]

同样，你可以使用 `-b` 选项同时打印出 IP 地址和主机名。

```
tracepath -b google.com
```

![tracepath -b google.com][6]

#### 4、ping

[ping 命令][7]（<ruby>数据包网络飞龙探云手<rt>Packet Internet Groper</rt></ruby> 🤣） 可以说是在排除网络故障时最重要的命令之一，因为它是检查主机和服务器之间连接情况的最常用方法。

例如，我 `ping` 谷歌：

```
ping google.com
```

![ping google.com][8]

这里，最后一行（`min/avg/max`）表示从指定的服务器获得响应的时间。

如果你得到一个错误提示 `bash: ping: command not found` （LCTT 译注：不会吧？），你可以查看我们的指南 [如何在 Ubuntu 上安装 Ping][9]。

#### 5、ss

`ss`（<ruby>套接字统计<rt>socket statistics</rt></ruby>）命令用于详细了解网络套接字（在网络上发送和接收数据的端点）。

要列出所有监听和非监听的 TCP 连接，你必须使用 `-at` 选项，如下所示：

```
ss -at
```

![ss -at][10]

同样，你可以使用 `-au` 选项对 UDP 端口进行同样的操作：

```
ss -au
```

![ss -au][11]

#### 6、dig

[dig 命令][12]（<ruby>域信息龙爪手<rt>Domain Information Groper</rt></ruby> 😜）用于获取有关域名的所有必要信息。

要在基于 Ubuntu 的发行版上安装 `dig` 工具，请按照给出的命令进行：

```
sudo apt install dnsutils
```

现在，让我告诉你如何获取一个特定主机的信息，在这个例子中，我将获取 itsfoss.com 的信息：

```
dig itsfoss.com
```

![dig itsfoss.com][13]

#### 7、host

`host` 命令主要用于获取一个特定主机的 IP 地址，或者你可以从一个特定的 IP 地址获取主机名。换句话说，它是一个 DNS 查询工具。

要找到主机的 IP，你只需要在 `host` 命令中附加主机名。让我告诉你怎么做：

```
host itsfoss.com
```

![host itsfoss.com][14]

同样，你可以用一个 IP 地址来获取主机名：

```
host 8.8.4.4
```

![host 8.8.4.4][15]

#### 8、hostname

如果你已经使用了一段时间的 Linux，你一定很熟悉这个命令，因为这主要是用来 [改变你的系统的主机名][16] 和 NIS（网络信息系统）的主机名。

当不使用任何选项时，它可以得到系统当前的主机名。

```
hostname
```

![hostname][17]

从包含所需主机名的文件中改变主机名是这个工具的另一个有趣的功能：

```
sudo hostname -F <filename>
```

![sudo hostname -F][18]

#### 9、curl

`curl`（<ruby>客户端 URL<rt>Client URL</rt></ruby>）命令主要用于在网络上传输数据，支持各种协议，包括 HTTP、FTP、IMAP 和许多其他协议。

这个工具是首选的自动化工具，因为它是在没有任何人类互动的情况下工作的，也可以用于端点测试、调试和错误记录。

`curl` 工具没有预装，如果你在任何 Debian 及其派生发行版上，你只需要使用以下命令进行安装：

```
sudo apt install curl
```

使用 `curl` 命令 [下载文件][19] 非常容易，你只需在 URL 中使用 `-O` 选项，就可以开始了。

```
curl -O [URL]
```

![curl -o url][20]

在下载大文件时，进度条会很方便，你可以用 `curl` 的 `-#` 选项来显示进度条。

![curl -# -O][21]

#### 10、mtr

它是 `ping` 和 `traceroute` 工具的组合，主要用于网络诊断，并提供网络响应和连接的实时情况。

使用 `mtr` 的最简单方法是用它跟上一个主机名或 IP 地址，它将给出一个实时的 `traceroute` 报告。

```
mtr [URL/IP]
```

![mtr google.com][22]

如果你想让 `mtr` 同时显示主机名和 IP 地址，你可以把它和 `-b` 选项配对，如下图：

```
mtr -b [URL]
```

![mtr -b][23]

#### 11、whois

`whois` 可以帮助你找到有关注册的域名、IP 地址、名称服务器等信息，因为它是 whois 目录服务的客户端。

这个工具可能没有预装在你的设备上，要在基于 Debian/Ubuntu 的发行版上安装，你可以使用给出的命令：

```
sudo apt install whois
```

一般来说，`whois` 命令是与给出的域名配对使用的：

```
whois [DomainName]
```

![whois google.com][24]

另外，你也可以用一个 IP 地址来代替域名，你会得到同样的细节。

#### 12、ifplugstatus

`ifplugstatus` 是一个最基本的，但也是最有用的工具，足以在基本水平上排除连接问题。它用于检测本地以太网的链接状态，其工作方式与 `mii-diag`、`mii-tool` 和 `ethtool` 类似，支持所有三个 API。

在基于 Debian/Ubuntu 的发行版上安装，你可以按照给出的命令进行：

```
sudo apt install ifplugd
```

这个工具没有任何花哨的选项，经常不需要与任何配对选项而使用：

```
ifplugstatus
```

![ifplugstatus][25]

#### 13、iftop

`iftop`（<ruby>接口的 top<rt>Interface TOP</rt></ruby>）经常被管理员用来监控与带宽有关的统计数据，当你遇到网络问题时，也可以作为诊断工具使用。

这个工具需要手动安装，可以通过给出的命令在运行 Debian/Ubuntu 的机器上轻松安装。

```
sudo apt install iftop
```

当 `iftop` 在没有任何选项的情况下使用时，它会显示默认接口的带宽统计。

```
sudo iftop
```

![iftop][26]

你也可以通过在设备名称后面加上 `-i` 选项来指定网络设备。

```
sudo iftop -i <DeviceName>.
```

在我的例子中，是 `enp1s0`，所以我的输出将是如下：

![sudo iftop -i enp1s0][27]

#### 14、tcpdump

`tcpdump` 是一个数据包嗅探和分析工具，用于捕获、分析和过滤网络流量。它也可以作为一个安全工具使用，因为它将捕获的数据保存在可以 [通过 Wireshark 访问][28] 的 pcap 文件中。

像许多其他工具一样，`tcpdump` 没有预装，如果你是在Debian/Ubuntu 上，你可以按照下面的命令进行安装：

```
sudo apt install tcpdump
```

一旦你完成了安装，你可以获得当前接口的捕获数据包，如下所示：

```
sudo tcpdump
```

![sudo tcpdump][29]

那么如何将捕获的数据包保存在 pcap 文件中呢？让我告诉你怎么做：

```
sudo tcpdump -w Captured_Packets.cap -i < networkdevice >
```

![sudo tcpdump -w][30]

要访问保存的文件，你需要使用 `-r` 选项加上文件名。

```
sudo tcpdump -r Captured_Packets.pcap
```

![sudo tcpdump -r filename][31]

#### 15、ethtool

顾名思义，`ethtool` 工具主要涉及管理以太网设备。使用这个工具，你可以调整网卡速度、自动协商特性等。

但它可能没有预装在你的机器上，可以通过利用给出的命令安装在 Debian/Ubuntu 机器上：

```
sudo apt install ethtool
```

要获取接口的详细信息，你只需在命令后面加上设备名称，如下所示：

```
sudo ethtool <InterfaceName>
```

![sudo ethtool enp1s0][32]

#### 16、nmcli

作为一个简单而强大的网络故障排除工具，它是任何系统管理员在排除网络故障时首先使用的工具之一，也可以在脚本中使用。

你可以使用 `nmcli` 命令来监控设备的连接状态：

```
nmcli dev status
```

![nmcli dev status][33]

当不使用任何选项时，它将带来你系统中所有现有设备的信息：

```
nmcli
```

![nmcli][34]

#### 17、nmap

`nmap` 是一个探索和审计网络安全的工具。它经常被黑客和安全爱好者使用，因为它允许你获得网络的实时信息、连接到你的网络的 IP 的详细信息、端口扫描，以及更多。

要在基于 Debian/Ubuntu 的发行版上安装 `nmap` 工具，请使用给出的命令：

```
sudo apt install nmap
```

让我们开始扫描主机名：

```
nmap itsfoss.com
```

![nmap itsfoss.com][35]

#### 18、bmon

`bmon` 是一个开源的工具，用于监测实时带宽和调试问题，以更人性化的方式呈现统计数据。这个工具最好的部分是图形显示，甚至可以在 HTML 中得到你的输出！

安装非常简单，因为 `bmon` 存在于流行的 Linux 发行版的默认仓库中，这也包括 Debian/Ubuntu。

```
sudo apt install bmon
```

现在，你只需要启动 `bmon`，就可以用眼睛愉快地监控带宽了：

```
bmon
```

![bmon][36]

#### 19、firewalld

管理防火墙可以说是网络安全的核心部分，这个工具允许你添加、配置和删除防火墙的规则。

但是 firewalld 需要手动安装，如果你使用的是基于 Debian/Ubuntu 的发行版，你可以利用给出的命令进行安装：

```
sudo apt install firewalld
```

例如，我将向你展示，如何为公共区域永久地打开 80 端口：

```
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
```

![sudo firewall-cmd --permanent --zone=public][37]

同样，要删除最近添加的规则，你必须使用 `-remove` 选项，如下所示：

```
sudo firewall-cmd --zone=public --remove-port=80/tcp
```

![sudo firewall-cmd --zone=public --remove][38]

#### 20、iperf

`iperf` 是一个用 C 语言编写的开源工具，允许用户进行网络性能测量和调整。

这个工具存在于 Debian/Ubuntu 的默认资源库中，可以通过给出的命令安装：

```
sudo apt install iperf
```

要开始监控网络，用户必须通过给出的命令在服务器上启动这个客户端：

```
iperf -s -u
```

其中，`-s` 选项表示服务器，`-u` 选项为 UDP 格式。

![iperf -s -u][39]

现在，你可以通过提供首选协议的 IP 地址有效载荷连接到你的服务器（使用 `-c` 选项表示客户端）。在这个例子中，我选择了 UDP（使用 `-u` 选项），有效载荷为 100：

```
iperf -c 10.0.2.15 -u 100
```

![iperf -c][40]

#### 21、speedtest-cli

顾名思义，这是 speedtest.net 网站的 CLI 工具。这个在 Apache 2.0 许可下发布的开源工具，当你想从 CLI 获得一个可靠的 [检查网速][41] 的来源时，会有很大帮助。

安装非常简单，如果你是在 Debian/Ubuntu 上，可以利用给出的命令轻松安装：

```
sudo apt install speedtest-cli
```

一旦你完成了安装部分，你只需要使用一行命令即可测试你的速度：

```
speedtest-cli
```

![speedtest-cli][42]

#### 22、vnstat

`vnstat` 工具主要被系统管理员用来监控网络流量和带宽消耗（大部分情况下），因为这个工具可以监控你系统的网络接口的流量。

和其他网络工具一样，你可以在默认的软件库中找到 `vnstat`，如果你在 Debian/Ubuntu 上，可以通过给出的命令进行安装：

```
sudo apt install vnstat
```

你可以使用 `vnstat` 命令，不需要任何选项，它将带来你系统所有可用接口的基本统计信息：

```
vnstat
```

![vnstat][43]

对于实时监控，你可以将 `vnstat` 命令与 `-l` 选项配对。

![vnstat -l][44]

### 一个长长的清单，对吗？

这个汇编连冰山一角都算不上，只是分享了每个命令的目的和基本例子，因为增加更多的命令会使这个清单变得更长。

流行的但 [已废弃的 Linux 命令][45]，如 `ipconfig`，已被故意排除在这个列表之外。

如果你很好奇，你可以学习 [如何最大限度地利用手册页][46]，这将教会你如何使用任何实用程序的最大潜力。

如果我忘了提到任何你喜欢的东西，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/basic-linux-networking-commands/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/ip-address-1.png
[2]: https://itsfoss.com/wp-content/uploads/2022/08/ip-monitor.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/traceroute-google.com_.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/traceroute-6-google.com_.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/tracepath-google.com_.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/tracepath-b-google.com_.png
[7]: https://linuxhandbook.com/ping-command-ubuntu/
[8]: https://itsfoss.com/wp-content/uploads/2022/08/ping-google.com_.png
[9]: https://linuxhandbook.com/ping-command-ubuntu/
[10]: https://itsfoss.com/wp-content/uploads/2022/08/ss-at.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/ss-au.png
[12]: https://linuxhandbook.com/dig-command/
[13]: https://itsfoss.com/wp-content/uploads/2022/08/dig-itsfoss.com_.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/host-itsfoss.com_.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/host-8.8.4.4.png
[16]: https://itsfoss.com/change-hostname-ubuntu/
[17]: https://itsfoss.com/wp-content/uploads/2022/08/hostname.png
[18]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-hostname-f.png
[19]: https://linuxhandbook.com/curl-command-examples/
[20]: https://itsfoss.com/wp-content/uploads/2022/08/curl-o-url.png
[21]: https://itsfoss.com/wp-content/uploads/2022/08/curl-o.png
[22]: https://itsfoss.com/wp-content/uploads/2022/08/mtr-google.com_.png
[23]: https://itsfoss.com/wp-content/uploads/2022/08/mtr-b.png
[24]: https://itsfoss.com/wp-content/uploads/2022/08/whois-google.com_.png
[25]: https://itsfoss.com/wp-content/uploads/2022/08/ifplugstatus.png
[26]: https://itsfoss.com/wp-content/uploads/2022/08/iftop.png
[27]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-iftop-i-enp1s0.png
[28]: https://itsfoss.com/install-wireshark-ubuntu/
[29]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-tcpdump.png
[30]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-tcpdump-w-.png
[31]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-tcpdump-r-filename.png
[32]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-ethtool-enp1s0.png
[33]: https://itsfoss.com/wp-content/uploads/2022/08/nmcli-dev-status.png
[34]: https://itsfoss.com/wp-content/uploads/2022/08/nmcli.png
[35]: https://itsfoss.com/wp-content/uploads/2022/08/nmap-itsfoss.com_.png
[36]: https://itsfoss.com/wp-content/uploads/2022/08/bmon-800x591.png
[37]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-firewall-cmd-permanent-zonepublic.png
[38]: https://itsfoss.com/wp-content/uploads/2022/08/sudo-firewall-cmd-zonepublic-remove.png
[39]: https://itsfoss.com/wp-content/uploads/2022/08/iperf-s-u.png
[40]: https://itsfoss.com/wp-content/uploads/2022/08/iperf-c-.png
[41]: https://itsfoss.com/network-speed-monitor-linux/
[42]: https://itsfoss.com/wp-content/uploads/2022/08/speedtest-cli.png
[43]: https://itsfoss.com/wp-content/uploads/2022/08/vnstat.png
[44]: https://itsfoss.com/wp-content/uploads/2022/08/vnstat-l.png
[45]: https://itsfoss.com/deprecated-linux-commands/
[46]: https://linuxhandbook.com/man-pages/
