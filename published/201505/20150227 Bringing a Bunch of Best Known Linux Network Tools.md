一大波你可能不知道的 Linux 网络工具
================================================================================
如果要在你的系统上监控网络，那么使用命令行工具是非常实用的，并且对于 Linux 用户来说，有着许许多多现成的工具可以使用，如： nethogs, ntopng, nload, iftop, iptraf, bmon, slurm, tcptrack, cbm, netwatch, collectl, trafshow, cacti, etherape, ipband, jnettop, netspeed 以及 speedometer。

鉴于世上有着许多的 Linux 专家和开发者，显然还存在其他的网络监控工具，但在这篇教程中，我不打算将它们所有包括在内。

上面列出的工具都有着自己的独特之处，但归根结底，它们都做着监控网络流量的工作，只是通过各种不同的方法。例如 nethogs 可以被用来展示每个进程的带宽使用情况，以防你想知道究竟是哪个应用在消耗了你的整个网络资源； iftop 可以被用来展示每个套接字连接的带宽使用情况，而像 nload 这类的工具可以帮助你得到有关整个带宽的信息。

### 1) nethogs ###

nethogs 是一个免费的工具，当要查找哪个 PID (注：即 process identifier，进程 ID) 给你的网络流量带来了麻烦时，它是非常方便的。它按每个进程来分组带宽，而不是像大多数的工具那样按照每个协议或每个子网来划分流量。它功能丰富，同时支持 IPv4 和 IPv6，并且我认为，若你想在你的 Linux 主机上确定哪个程序正消耗着你的全部带宽，它是来做这件事的最佳的程序。

一个 Linux 用户可以使用 **nethogs** 来显示每个进程的 TCP 下载和上传速率，可以使用命令 **nethogs eth0** 来监控一个指定的设备，上面的 eth0 是那个你想获取信息的设备的名称，你还可以得到有关正在传输的数据的传输速率信息。

对我而言， nethogs 是非常容易使用的，或许是因为我非常喜欢它，以至于我总是在我的 Ubuntu 12.04 LTS 机器中使用它来监控我的网络带宽。

例如要想使用混杂模式来嗅探，可以像下面展示的命令那样使用选项 -p： 

    nethogs -p wlan0

假如你想更多地了解 nethogs 并深入探索它，那么请毫不犹豫地阅读我们做的关于这个网络带宽监控工具的整个教程。

（LCTT 译注：关于 nethogs 的更多信息可以参考：https://linux.cn/article-2808-1.html ）

### 2) nload ###

nload 是一个控制台应用，可以被用来实时地监控网络流量和带宽使用情况，它还通过提供两个简单易懂的图表来对流量进行可视化。这个绝妙的网络监控工具还可以在监控过程中切换被监控的设备，而这可以通过按左右箭头来完成。

![network monitoring tools in linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload8.png)

正如你在上面的截图中所看到的那样，由 nload 提供的图表是非常容易理解的。nload 提供了有用的信息，也展示了诸如被传输数据的总量和最小/最大网络速率等信息。

而更酷的是你只需要直接运行 nload 这个工具就行，这个命令是非常的短小且易记的：

    nload

我很确信的是：我们关于如何使用 nload 的详细教程将帮助到新的 Linux 用户，甚至可以帮助那些正寻找关于 nload 信息的老手。

（LCTT 译注：关于 nload 的更新信息可以参考：https://linux.cn/article-5114-1.html ）

### 3) slurm ###

slurm 是另一个 Linux 网络负载监控工具，它以一个不错的 ASCII 图来显示结果，它还支持许多按键用以交互，例如 **c** 用来切换到经典模式， **s** 切换到分图模式， **r** 用来重绘屏幕， **L** 用来启用 TX/RX 灯（注：TX，发送流量；RX，接收流量） ，**m** 用来在经典分图模式和大图模式之间进行切换， **q** 退出 slurm。
 
![linux network load monitoring tools](http://blog.linoxide.com/wp-content/uploads/2013/12/slurm2.png)

在网络负载监控工具 slurm 中，还有许多其它的按键可用，你可以很容易地使用下面的命令在 man 手册中学习它们。

    man slurm

slurm 在 Ubuntu 和 Debian 的官方软件仓库中可以找到，所以使用这些发行版本的用户可以像下面展示的那样，使用 apt-get 安装命令来轻松地下载它：

    sudo apt-get install slurm

我们已经在一个[教程](http://linoxide.com/ubuntu-how-to/monitor-network-load-slurm-tool/)中对 slurm 的使用做了介绍，不要忘记和其它使用 Linux 的朋友分享这些知识。 
 
### 4) iftop ###

当你想显示连接到网卡上的各个主机的带宽使用情况时，iftop 是一个非常有用的工具。根据 man 手册，**iftop** 在一个指定的接口或在它可以找到的第一个接口（假如没有任何特殊情况，它应该是一个对外的接口）上监听网络流量，并且展示出一个表格来显示当前的一对主机间的带宽使用情况。

通过在虚拟终端中使用下面的命令，Ubuntu 和 Debian 用户可以在他们的机器中轻易地安装 iftop：

    sudo apt-get install iftop

在你的机器上，可以使用下面的命令通过 yum 来安装 iftop：

    yum -y install iftop
    
（LCTT 译注：关于 nload 的更多信息请参考：https://linux.cn/article-1843-1.html ）

### 5) collectl ###

collectl 可以被用来收集描述当前系统状态的数据，并且它支持如下两种模式：

- 记录模式
- 回放模式

**记录模式** 允许从一个正在运行的系统中读取数据，然后将这些数据要么显示在终端中，要么写入一个或多个文件或一个套接字中。

**回放模式**

根据 man 手册，在这种模式下，数据从一个或多个由记录模式生成的数据文件中读取。

Ubuntu 和 Debian 用户可以在他们的机器上使用他们默认的包管理器来安装 colletcl。下面的命令将为他们做这个工作：

    sudo apt-get install collectl

还可以使用下面的命令来安装 collectl， 因为对于这些发行版本（注：这里指的是用 yum 作为包管理器的发行版本），在它们官方的软件仓库中也含有 collectl：

    yum install collectl
    
（LCTT 译注：关于 collectl 的更多信息请参考： https://linux.cn/article-3154-1.html ）

### 6) Netstat ###

Netstat 是一个用来监控**传入和传出的网络数据包统计数据**的接口统计数据命令行工具。它会显示 TCP 连接 (包括上传和下行)，路由表，及一系列的网络接口（网卡或者SDN接口）和网络协议统计数据。

Ubuntu 和 Debian 用户可以在他们的机器上使用默认的包管理器来安装 netstat。Netsta 软件被包括在 net-tools 软件包中，并可以在 shell 或虚拟终端中运行下面的命令来安装它：

    sudo apt-get install net-tools

CentOS, Fedora, RHEL 用户可以在他们的机器上使用默认的包管理器来安装 netstat。Netstat 软件被包括在 net-tools 软件包中，并可以在 shell 或虚拟终端中运行下面的命令来安装它：

    yum install net-tools

运行下面的命令使用 Netstat 来轻松地监控网络数据包统计数据：

    netstat

![Netstat](http://blog.linoxide.com/wp-content/uploads/2015/02/netstat.png)

更多的关于 netstat 的信息，我们可以简单地在 shell 或终端中键入 man netstat 来了解：

    man netstat

![man netstat](http://blog.linoxide.com/wp-content/uploads/2015/02/man-netstat.png)

（LCTT 译注：关于 netstat 的更多信息请参考：https://linux.cn/article-2434-1.html  ）

### 7) Netload ###

netload 命令只展示一个关于当前网络荷载和自从程序运行之后传输数据总的字节数目的简要报告，它没有更多的功能。它是 netdiag 软件的一部分。

我们可以在 fedora 中使用 yum 来安装 Netload，因为它在 fedora 的默认软件仓库中。但假如你运行的是 CentOS 或 RHEL，则我们需要安装 [rpmforge 软件仓库][1]。

    # yum install netdiag

Netload 是默认仓库中 netdiag 的一部分，我们可以轻易地使用下面的命令来利用 **apt** 包管理器安装 **netdiag**：

    $ sudo apt-get install netdiag 

为了运行 netload，我们需要确保选择了一个正在工作的网络接口的名称，如 eth0, eh1, wlan0, mon0等，然后在 shell 或虚拟终端中运行下面的命令：

    $ netload wlan2

注意： 请将上面的 wlan2 替换为你想使用的网络接口名称，假如你想通过扫描了解你的网络接口名称，可以在一个虚拟终端或 shell 中运行 `ip link show` 命令。

### 8) Nagios ###

Nagios 是一个领先且功能强大的开源监控系统，它使得网络或系统管理员可以在服务器的各种问题影响到服务器的主要事务之前，发现并解决这些问题。 有了 Nagios 系统，管理员便可以在一个单一的窗口中监控远程的 Linux 、Windows 系统、交换机、路由器和打印机等。它会显示出重要的警告并指出在你的网络或服务器中是否出现某些故障，这可以间接地帮助你在问题发生前就着手执行补救行动。  

Nagios 有一个 web 界面，其中有一个图形化的活动监视器。通过浏览网页 http://localhost/nagios/ 或 http://localhost/nagios3/ 便可以登录到这个 web 界面。假如你在远程的机器上进行操作，请使用你的 IP 地址来替换 localhost，然后键入用户名和密码，我们便会看到如下图所展示的信息：

![在 Chromium 浏览器中的 Nagios3](http://blog.linoxide.com/wp-content/uploads/2015/02/nagios3-ubuntu.png)

（LCTT 译注：关于 Nagios 的更多信息请参考：https://linux.cn/article-2436-1.html ）

### 9) EtherApe ###

EtherApe 是一个针对 Unix 的图形化网络监控工具，它仿照了 etherman 软件。它支持链路层、IP 和 TCP 等模式，并支持以太网, FDDI, 令牌环, ISDN, PPP, SLIP 及 WLAN 设备等接口，以及一些封装格式。主机和连接随着流量和协议而改变其尺寸和颜色。它可以过滤要展示的流量，并可从一个文件或运行的网络中读取数据包。

在 CentOS、Fedora、RHEL 等 Linux 发行版本中安装 etherape 是一件容易的事，因为在它们的官方软件仓库中就可以找到 etherape。我们可以像下面展示的命令那样使用 yum 包管理器来安装它：

     yum install etherape

我们也可以使用下面的命令在 Ubuntu、Debian 及它们的衍生发行版本中使用 **apt** 包管理器来安装 EtherApe ：

    sudo apt-get install etherape

在 EtherApe 安装到你的系统之后，我们需要像下面那样以 root 权限来运行 etherape：

    sudo etherape

然后， **etherape** 的 **图形用户界面** 便会被执行。接着，在菜单上面的 **捕捉** 选项下，我们可以选择 **模式**(IP，链路层，TCP) 和 **接口**。一切设定完毕后，我们需要点击 **开始** 按钮。接着我们便会看到类似下面截图的东西：

![EtherApe](http://blog.linoxide.com/wp-content/uploads/2015/02/etherape.png)
 
### 10) tcpflow ###

tcpflow 是一个命令行工具，它可以捕捉 TCP 连接(流)的部分传输数据，并以一种方便协议分析或除错的方式来存储数据。它重构了实际的数据流并将每个流存储在不同的文件中，以备日后的分析。它能识别 TCP 序列号并可以正确地重构数据流，不管是在重发还是乱序发送状态下。

通过 **apt** 包管理器在 Ubuntu 、Debian 系统中安装 tcpflow 是很容易的，因为默认情况下在官方软件仓库中可以找到它。

    $ sudo apt-get install tcpflow

我们可以使用下面的命令通过 **yum** 包管理器在 Fedora 、CentOS 、RHEL 及它们的衍生发行版本中安装 tcpflow：

    # yum install tcpflow

假如在软件仓库中没有找到它或不能通过 yum 包管理器来安装它，则我们需要像下面展示的那样从 **http://pkgs.repoforge.org/tcpflow/** 上手动安装它：

假如你运行 64 位的 PC：

    # yum install --nogpgcheck http://pkgs.repoforge.org/tcpflow/tcpflow-0.21-1.2.el6.rf.x86_64.rpm

假如你运行 32 位的 PC：

    # yum install --nogpgcheck http://pkgs.repoforge.org/tcpflow/tcpflow-0.21-1.2.el6.rf.i686.rpm

我们可以使用 tcpflow 来捕捉全部或部分 tcp 流量，并以一种简单的方式把它们写到一个可读的文件中。下面的命令就可以完成这个事情，但我们需要在一个空目录中运行下面的命令，因为它将创建诸如  x.x.x.x.y-a.a.a.a.z 格式的文件，运行之后，只需按 Ctrl-C 便可停止这个命令。 

     $ sudo tcpflow -i eth0 port 8000

注意：请将上面的 eth0 替换为你想捕捉的网卡接口名称。

### 11) IPTraf ###

[IPTraf][2] 是一个针对 Linux 平台的基于控制台的网络统计应用。它生成一系列的图形，如 TCP 连接的包/字节计数、接口信息和活动指示器、 TCP/UDP 流量故障以及局域网内设备的包/字节计数。

在默认的软件仓库中可以找到 IPTraf，所以我们可以使用下面的命令通过 **apt** 包管理器轻松地安装 IPTraf：

    $ sudo apt-get install iptraf

我们可以使用下面的命令通过 **yum** 包管理器轻松地安装 IPTraf：

    # yum install iptraf

我们需要以管理员权限来运行 IPTraf，并带有一个有效的网络接口名。这里，我们的网络接口名为 wlan2，所以我们使用 wlan2 来作为参数：
 
    $ sudo iptraf wlan2

![IPTraf](http://blog.linoxide.com/wp-content/uploads/2015/02/iptraf.png)

开始通常的网络接口统计，键入：

    # iptraf -g

查看接口 eth0 的详细统计信息，使用：

    # iptraf -d eth0  

查看接口 eth0 的 TCP 和 UDP 监控信息，使用：

    # iptraf -z eth0

查看接口 eth0 的包的大小和数目，使用：

    # iptraf -z eth0

注意:请将上面的 eth0 替换为你的接口名称。你可以通过运行`ip link show`命令来检查你的接口。

（LCTT 译注：关于 iptraf 的更多详细信息请参考：https://linux.cn/article-5430-1.html  ）

### 12) Speedometer ###

Speedometer 是一个小巧且简单的工具，它只用来绘出一幅包含有通过某个给定端口的上行、下行流量的好看的图。

在默认的软件仓库中可以找到 Speedometer ，所以我们可以使用下面的命令通过 **yum** 包管理器轻松地安装 Speedometer：

    # yum install speedometer

我们可以使用下面的命令通过 **apt** 包管理器轻松地安装 Speedometer：

    $ sudo apt-get install speedometer

Speedometer 可以简单地通过在 shell 或虚拟终端中执行下面的命令来运行：

     $ speedometer -r wlan2 -t wlan2

![Speedometer](http://blog.linoxide.com/wp-content/uploads/2015/02/Speedometer.png)

注：请将上面的 wlan2 替换为你想要使用的网络接口名称。

### 13) Netwatch ###

Netwatch 是 netdiag 工具集里的一部分，它也显示当前主机和其他远程主机的连接情况，以及在每个连接中数据传输的速率。

我们可以使用 yum 在 fedora 中安装 Netwatch，因为它在 fedora 的默认软件仓库中。但若你运行着 CentOS 或 RHEL ， 我们需要安装 [rpmforge 软件仓库][3]。

    # yum install netwatch

Netwatch 是 netdiag 的一部分，可以在默认的软件仓库中找到，所以我们可以轻松地使用下面的命令来利用 **apt** 包管理器安装 **netdiag**：

    $ sudo apt-get install netdiag 

为了运行 netwatch， 我们需要在虚拟终端或 shell 中执行下面的命令：

    $ sudo netwatch -e wlan2 -nt

![Netwatch](http://blog.linoxide.com/wp-content/uploads/2015/02/netwatch.png)

注意： 请将上面的 wlan2 替换为你想使用的网络接口名称，假如你想通过扫描了解你的网络接口名称，可以在一个虚拟终端或 shell 中运行 `ip link show` 命令。

### 14) Trafshow ###

Trafshow 同 netwatch 和 pktstat 一样，可以报告当前活动的连接里使用的协议和每个连接中数据传输的速率。它可以使用 pcap 类型的过滤器来筛选出特定的连接。

我们可以使用 yum 在 fedora 中安装 trafshow ，因为它在 fedora 的默认软件仓库中。但若你正运行着 CentOS 或 RHEL ， 我们需要安装 [rpmforge 软件仓库][4]。

	# yum install trafshow

Trafshow 在默认仓库中可以找到，所以我们可以轻松地使用下面的命令来利用 **apt** 包管理器安装它：

    $ sudo apt-get install trafshow 

为了使用 trafshow 来执行监控任务，我们需要在虚拟终端或 shell 中执行下面的命令：

    $ sudo trafshow -i wlan2

![Trafshow](http://blog.linoxide.com/wp-content/uploads/2015/02/trafshow-all.png)

为了专门监控 tcp 连接，如下面一样添加上 tcp 参数：

     $ sudo trafshow -i wlan2 tcp

![Trafshow tcp](http://blog.linoxide.com/wp-content/uploads/2015/02/trafshow-tcp.png)

注意： 请将上面的 wlan2 替换为你想使用的网络接口名称，假如你想通过扫描了解你的网络接口名称，可以在一个虚拟终端或 shell 中运行 `ip link show` 命令。

### 15) Vnstat ###

与大多数的其他工具相比，Vnstat 有一点不同。实际上它运行着一个后台服务或守护进程，并时刻记录着传输数据的大小。另外，它可以被用来生成一个网络使用历史记录的报告。

我们需要开启 EPEL 软件仓库，然后运行 **yum** 包管理器来安装 vnstat。

    # yum install vnstat

Vnstat 在默认软件仓库中可以找到，所以我们可以使用下面的命令运行 **apt** 包管理器来安装它：

    $ sudo apt-get install vnstat

不带有任何选项运行 vnstat 将简单地展示出从该守护进程运行后数据传输的总量。
 
    $ vnstat

![vnstat](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat.png)

为了实时地监控带宽使用情况，使用 ‘-l’ 选项(live 模式)。然后它将以一种非常精确的方式来展示上行和下行数据所使用的带宽总量，但不会显示任何有关主机连接或进程的内部细节。

     $ vnstat -l

![Vnstat 实时模式](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat-live.png)

完成了上面的步骤后，按 Ctrl-C 来停止，这将会得到如下类型的输出：

![Vnstat 实时结果](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat-live-result.png)

### 16) tcptrack ###

[tcptrack][5] 可以展示 TCP 连接的状态，它在一个给定的网络端口上进行监听。tcptrack 监控它们的状态并展示出排序且不断更新的列表，包括来源/目标地址、带宽使用情况等信息，这与 **top** 命令的输出非常类似 。

鉴于 tcptrack 在软件仓库中，我们可以轻松地在 Debian、Ubuntu 系统中从软件仓库使用 **apt** 包管理器来安装 tcptrack。为此，我们需要在 shell 或虚拟终端中执行下面的命令：

    $ sudo apt-get install tcptrack

我们可以通过 yum 在 fedora 中安装它，因为它在 fedora 的默认软件仓库中。但若你运行着 CentOS 或 RHEL 系统，我们需要安装 [rpmforge 软件仓库][6]。为此，我们需要运行下面的命令：
 
    # wget http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

    # rpm -Uvh rpmforge-release*rpm

    # yum install tcptrack

注：这里我们下载了 rpmforge-release 的当前最新版本，即 0.5.3-1，你总是可以从 rpmforge 软件仓库中下载其最新版本，并请在上面的命令中替换为你下载的版本。

**tcptrack** 需要以 root 权限或超级用户身份来运行。执行 tcptrack 时，我们需要带上要监视的网络接口 TCP 连接状况的接口名称。这里我们的接口名称为 wlan2，所以如下面这样使用：

    sudo tcptrack -i wlan2

![tcptrack](http://blog.linoxide.com/wp-content/uploads/2015/02/tcptrack.png)

假如你想监控特定的端口，则使用：

    # tcptrack -i wlan2 port 80

![tcptrack port 80](http://blog.linoxide.com/wp-content/uploads/2015/02/tcptrack-port-80.png)

请替换上面的 80 为你想要监控的端口号。注意： 请将上面的 wlan2 替换为你想使用的网络接口名称，假如你想通过扫描了解你的网络接口名称，可以在一个虚拟终端或 shell 中运行 `ip link show` 命令。

### 17) CBM ###

CBM （ Color Bandwidth Meter） 可以展示出当前所有网络设备的流量使用情况。这个程序是如此的简单，以至于都可以从它的名称中看出其功能。CBM 的源代码和新版本可以在 [http://www.isotton.com/utils/cbm/][7] 上找到。

鉴于 CBM 已经包含在软件仓库中，我们可以简单地使用 **apt** 包管理器从 Debian、Ubuntu 的软件仓库中安装 CBM。为此，我们需要在一个 shell 窗口或虚拟终端中运行下面的命令：

    $ sudo apt-get install cbm

我们只需使用下面展示的命令来在 shell 窗口或虚拟终端中运行 cbm：

    $ cbm

![Color Bandwidth Meter](http://blog.linoxide.com/wp-content/uploads/2015/02/cbm.png)

### 18) bmon ###

[Bmon][8] （ Bandwidth Monitoring） ，是一个用于调试和实时监控带宽的工具。这个工具能够检索各种输入模块的统计数据。它提供了多种输出方式，包括一个基于 curses 库的界面，轻量级的HTML输出，以及 ASCII 输出格式。

bmon 可以在软件仓库中找到，所以我们可以通过使用 apt 包管理器来在 Debian、Ubuntu 中安装它。为此，我们需要在一个 shell 窗口或虚拟终端中运行下面的命令：

    $ sudo apt-get install bmon

我们可以使用下面的命令来运行 bmon 以监视我们的网络状态：

    $ bmon

![bmon](http://blog.linoxide.com/wp-content/uploads/2015/02/bmon.png)

### 19) tcpdump ###

[TCPDump][9] 是一个用于网络监控和数据获取的工具。它可以为我们节省很多的时间，并可用来调试网络或服务器的相关问题。它可以打印出在某个网络接口上与布尔表达式相匹配的数据包所包含的内容的一个描述。

tcpdump 可以在 Debian、Ubuntu 的默认软件仓库中找到，我们可以简单地以 sudo 权限使用 apt 包管理器来安装它。为此，我们需要在一个 shell 窗口或虚拟终端中运行下面的命令：

    $ sudo apt -get install tcpdump

tcpdump 也可以在 Fedora、CentOS、RHEL 的软件仓库中找到。我们可以像下面一样通过 yum 包管理器来安装它：

    # yum install tcpdump

tcpdump 需要以 root 权限或超级用户来运行，我们需要带上我们想要监控的 TCP 连接的网络接口名称来执行 tcpdump 。在这里，我们有 wlan2 这个网络接口，所以可以像下面这样使用：

    $ sudo tcpdump -i wlan2

![tcpdump](http://blog.linoxide.com/wp-content/uploads/2015/02/tcpdump.png)

假如你只想监视一个特定的端口，则可以运行下面的命令。下面是一个针对 80 端口(网络服务器)的例子：

    $ sudo tcpdump -i wlan2 'port 80'

![tcpdump port](http://blog.linoxide.com/wp-content/uploads/2015/02/tcpdump-port.png)

### 20) ntopng ###

[ntopng][20] 是 ntop 的下一代版本。它是一个用于展示网络使用情况的网络探头，在一定程度上它与 top 针对进程所做的工作类似。ntopng 基于 libpcap 并且它以可移植的方式被重写，以达到可以在每一个 Unix 平台 、 MacOSX 以及 Win32 上运行的目的。

为了在 Debian，Ubuntu 系统上安装 ntopng，首先我们需要安装 **编译 ntopng 所需的依赖软件包**。你可以通过在一个 shell 窗口或一个虚拟终端中运行下面的命令来安装它们：

    $ sudo apt-get install libpcap-dev libglib2.0-dev libgeoip-dev redis-server wget libxml2-dev build-essential checkinstall

现在，我们需要像下面一样针对我们的系统手动编译 ntopng ：

    $ sudo wget http://sourceforge.net/projects/ntop/files/ntopng/ntopng-1.1_6932.tgz/download
    $ sudo tar zxfv ntopng-1.1_6932.tgz
    $ sudo cd ntopng-1.1_6932
    $ sudo ./configure
    $ sudo make
    $ sudo make install

这样，在你的 Debian 或 Ubuntu 系统上应该已经安装上了你编译的 ntopng 。

我们已经有了有关 ntopng 的使用方法的[教程](linoxide.com/monitoring-2/ntopng-network-monitoring-tool/)，它既可以在命令行也可以在 Web 界面中使用，我们可以前往这些教程来获得有关 ntopng 的知识。

### 结论 ###

在这篇文章中，我们介绍了一些在 Linux 下的网络负载监控工具，这对于系统管理员甚至是新手来说，都是很有帮助的。在这篇文章中介绍的每一个工具都具有其特点，不同的选项等，但最终它们都可以帮助你来监控你的网络流量。

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/network-monitoring-tools-linux/

作者：[Bobbin Zachariah][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://pkgs.org/centos-7/repoforge-x86_64/netwatch-1.0c-1.el7.rf.x86_64.rpm.html
[2]:http://iptraf.seul.org/
[3]:http://pkgs.org/centos-7/repoforge-x86_64/netwatch-1.0c-1.el7.rf.x86_64.rpm.html
[4]:http://pkgs.org/centos-6/epel-x86_64/trafshow-5.2.3-6.el6.x86_64.rpm.html
[5]:http://linux.die.net/man/1/tcptrack
[6]:http://pkgs.org/centos-6/repoforge-x86_64/tcptrack-1.4.0-1.el6.rf.x86_64.rpm.html
[7]:http://www.isotton.com/utils/cbm/
[8]:https://github.com/tgraf/bmon/
[9]:http://www.tcpdump.org/
[10]:http://www.ntop.org/