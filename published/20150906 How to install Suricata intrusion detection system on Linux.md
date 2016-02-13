如何在 Linux 系统上安装 Suricata 入侵检测系统
================================================================================

随着安全威胁的不断发生，入侵检测系统（IDS）在如今的数据中心环境中显得尤为必要。然而，随着越来越多的服务器将他们的网卡升级到10GB/40GB以太网，对如此线路上的硬件进行计算密集型的入侵检测越来越困难。其中一种提升入侵检测系统性能的途径是**多线程入侵检测系统**，它将 CPU 密集型的深度包检测工作并行的分配给多个并发任务来完成。这样的并行检测可以充分利用多核硬件的优势来轻松提升入侵检测系统的吞吐量。在这方面有两个知名的开源项目，分别是 [Suricata][1] 和 [Bro][2]。

这个教程里，我会向大家演示**如何在 Linux 服务器上安装和配置 Suricata 入侵检测系统**

### 在 Linux 上安装 Suricata IDS ###

让我们从源文件来构建 Suricata，但在此之前，需要按如下所示先安装几个依赖包。

#### 在 Debian, Ubuntu 或者 Linux Mint 操作系统上安装依赖包 ####

    $ sudo apt-get install wget build-essential libpcre3-dev libpcre3-dbg automake autoconf libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libjansson-dev

#### 在 CentOS, Fedora 或者 RHEL 操作系统上安装依赖包 ####

    $ sudo yum install wget libpcap-devel libnet-devel pcre-devel gcc-c++ automake autoconf libtool make libyaml-devel zlib-devel file-devel jansson-devel nss-devel

一旦将所有依赖包安装完毕，我们就可以继续安装 Suricata 了。

首先从 [http://suricata-ids.org/download/][3] 下载 Suricata 源代码，然后构建它。撰写这篇文章的时候，其最新版本号为 2.0.8 。

    $ wget http://www.openinfosecfoundation.org/download/suricata-2.0.8.tar.gz
    $ tar -xvf suricata-2.0.8.tar.gz
    $ cd suricata-2.0.8
    $ ./configure --sysconfdir=/etc --localstatedir=/var

以下是配置信息的样例。

    Suricata Configuration:
      AF_PACKET support:                       yes
      PF_RING support:                         no
      NFQueue support:                         no
      NFLOG support:                           no
      IPFW support:                            no
      DAG enabled:                             no
      Napatech enabled:                        no
      Unix socket enabled:                     yes
      Detection enabled:                       yes
    
      libnss support:                          yes
      libnspr support:                         yes
      libjansson support:                      yes
      Prelude support:                         no
      PCRE jit:                                yes
      LUA support:                             no
      libluajit:                               no
      libgeoip:                                no
      Non-bundled htp:                         no
      Old barnyard2 support:                   no
      CUDA enabled:                            no

现在可以编译、安装了。

    $ make
    $ sudo make install

Suricata 源代码带有默认的配置文件。按照如下方法安装这些默认配置文件即可。

    $ sudo make install-conf

正如你所料，如果没有IDS规则集的话，Suricata 什么用也没有。幸好 Makefile 为我们提供了 IDS 规则集的安装选项。安装方法如下。

    $ sudo make install-rules

以上的规则安装命令会从 [EmergingThreats.net][4] 上下载可用的社区规则集快照，并且将其存储在 /etc/suricata/rules 目录下。

![](https://farm1.staticflickr.com/691/20482669553_8b67632277_c.jpg)

### 首次配置 Suricata IDS ###

现在到了配置 Suricata 的时候了。配置文件的位置是 **/etc/suricata/suricata.yaml**。参照以下命令，用文本编辑器打开这个文件。

    $ sudo vi /etc/suricata/suricata.yaml

文件中有一些运行所需的基本配置。

为`default-log-dir`关键字指定 Suricata 日志文件所在的位置。

    default-log-dir: /var/log/suricata/

在`vars`部分下方，你会发现几项对 Suricata 来说很重要变量。`HOME_NET`变量需要指定 Suricata 检查的网络。被分配给 `EXTERNAL_NET` 变量的 `!$HOME_NET` 代表除本地网络之外的其他网络。`XXX_PORTS`变量用来辨别不同服务所用到的端口号。需要注意的是无论使用什么端口，Suricata 都可以自动检测 HTTP 流量。所以是不是正确指定端口就显得没那么重要了。

    vars:
        HOME_NET: "[192.168.122.0/24]"
        EXTERNAL_NET: "!$HOME_NET"
        HTTP_PORTS: "80"
        SHELLCODE_PORTS: "!80"
        SSH_PORTS: 22

`host-os-policy` 部分用于防御利用操作系统网络栈的自身行为来逃避检测的一些知名攻击手段（例如：TCP reassembly）。作为对策，通过针对目标操作系统而对检测引擎算法进行微调，现代 IDC 提供了“基于目标”的检测手段。因此，如果你知道某台主机运行了什么操作系统的话，将这个信息提供给 Suricata 就可以大幅提高检测的成功率。这就是 `host-os-policy` 存在的意义。本例中，默认的 IDC 策略是 Linux 系统。如果针对某个 IP 地址没有指定操作系统信息，Suricata 会默认应用基于 Linux 系统的检测策略。如下，当捕获到对 192.168.122.0/28 和 192.168.122.155通讯时，Suricata 就会应用基于 Windows 系统的检测策略。

    host-os-policy:
      # These are Windows machines.
      windows: [192.168.122.0/28, 192.168.122.155]
      bsd: []
      bsd-right: []
      old-linux: []
      # Make the default policy Linux.
      linux: [0.0.0.0/0]
      old-solaris: []
      solaris: ["::1"]
      hpux10: []
      hpux11: []
      irix: []
      macos: []
      vista: []
      windows2k3: []

在 `threading` 部分下，你可以为不同的 Suricata 线程指定 CPU 关联。默认状态下，[CPU 关联][5] 是被禁止使用的 (`set-cpu-affinity: no`)，这意味着 Suricata 会分配其线程到所有可用的 CPU 核心上。Suricata 会默认为每一个 CPU 核心创建一个检测线程。你可以通过指定 `detect-thread-ratio: N` 来调整此行为。此处会创建 N*M 个检测线程，M 代表 CPU 核心总数。

    threading:
      set-cpu-affinity: no
      detect-thread-ratio: 1.5

通过以上对线程的设置，Suricata 会创建 1.5*M 个检测线程，M 是系统的 CPU 核心总数。

如果你想对 Suricata 配置有更多的了解，可以去翻阅默认配置文件。里边配有有大量的注释以供你清晰理解。

### 使用 Suricata 进行入侵监控 ###

现在是时候让 Suricata 跑起来了，但在这之前还有一个步骤需要去完成。

当你使用 pcap 捕获模式的时候，强烈建议关闭 Suricata 监听网卡上的任何的包卸载（例如 LRO/GRO）功能。这些功能会干扰包的实时捕获行为。

按照以下方法关闭 eth0 接口的 LRO/GRO 功能。

    $ sudo ethtool -K eth0 gro off lro off

这里要注意，在使用某些网卡的情况下，你会看到如下警告信息。忽略它们就行了，这些信息只不过告诉你你的网卡不支持 LRO 功能而已。

    Cannot change large-receive-offload

Suricata 支持许多运行模式。运行模式决定着 IDC 会使用何种线程。以下命令可以查看所有 [可用的运行模式][6]。

    $ sudo /usr/local/bin/suricata --list-runmodes

![](https://farm6.staticflickr.com/5730/20481140934_25080d04d7_c.jpg)

Suricata 使用的默认运行模式是 autofp（"auto flow pinned load balancing"==“自动流绑定负载均衡” 的缩写）。这个模式下，来自某一个流的包会被分配到一个单独的检测线程中。这些流会根据未被处理的包的最低数量来分配相应的线程。

最后，让我们将 Suricata 运行起来，看看它表现如何。

    $ sudo /usr/local/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal

![](https://farm1.staticflickr.com/701/21077552366_c577746e36_c.jpg)

本例中，我们在一个8核心系统中监控 eth0 网络接口。如上所示，Suricata 创建了13个包处理线程和3个管理线程。包处理线程中包括一个 PCAP 包捕获线程，12个检测线程(由8*1.5得出)。这表示 IDS 内的1个包捕获线程均衡负载到12个检测线程中。管理线程包括1个流管理和2个计数/统计相关线程。

以下是一个关于Suricata处理的线程截图(由 [htop][7] 绘制)。

![](https://farm6.staticflickr.com/5775/20482669593_174f8f41cb_c.jpg)

Suricata 检测日志存储在 /var/log/suricata 目录下。

    $ tail -f /var/log/suricata/fast.log

----------

    04/01/2015-15:47:12.559075  [**] [1:2200074:1] SURICATA TCPv4 invalid checksum [**] [Classification: (null)] [Priority: 3] {TCP} 172.16.253.158:22 -> 172.16.253.1:46997
    04/01/2015-15:49:06.565901  [**] [1:2200074:1] SURICATA TCPv4 invalid checksum [**] [Classification: (null)] [Priority: 3] {TCP} 172.16.253.158:22 -> 172.16.253.1:46317
    04/01/2015-15:49:06.566759  [**] [1:2200074:1] SURICATA TCPv4 invalid checksum [**] [Classification: (null)] [Priority: 3] {TCP} 172.16.253.158:22 -> 172.16.253.1:46317

日志也可以提供 Json 格式以便导入：

    $ tail -f /var/log/suricata/eve.json

----------
    {"timestamp":"2015-04-01T15:49:06.565901","event_type":"alert","src_ip":"172.16.253.158","src_port":22,"dest_ip":"172.16.253.1","dest_port":46317,"proto":"TCP","alert":{"action":"allowed","gid":1,"signature_id":2200074,"rev":1,"signature":"SURICATA TCPv4 invalid checksum","category":"","severity":3}}
    {"timestamp":"2015-04-01T15:49:06.566759","event_type":"alert","src_ip":"172.16.253.158","src_port":22,"dest_ip":"172.16.253.1","dest_port":46317,"proto":"TCP","alert":{"action":"allowed","gid":1,"signature_id":2200074,"rev":1,"signature":"SURICATA TCPv4 invalid checksum","category":"","severity":3}}

### 总结 ###

这篇教程中，我为大家演示了如何在一台多核 Linux 服务器上安装 Suricata 入侵检测系统。不同于单线程的 [Snort IDS][8] ，Suricata 可以很容易的从多核硬件的多进程特性所带来的好处中获益。定制 Suricata 来最大化其效能和检测范围是一个很好的主意。Suricata 的粉丝们维护着一个 [在线 Wiki][9]，如果你打算将 Suricata 部署到你的环境中，我强烈建议你去那儿取取经。

如果你现在已经开始使用 Suricata 了的话，把你的经验也分享出来吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/install-suricata-intrusion-detection-system-linux.html

作者：[Dan Nanni][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://suricata-ids.org/
[2]:https://www.bro.org/
[3]:http://suricata-ids.org/download/
[4]:http://rules.emergingthreats.net/
[5]:http://xmodulo.com/run-program-process-specific-cpu-cores-linux.html
[6]:https://redmine.openinfosecfoundation.org/projects/suricata/wiki/Runmodes
[7]:http://ask.xmodulo.com/view-threads-process-linux.html
[8]:http://xmodulo.com/how-to-compile-and-install-snort-from-source-code-on-ubuntu.html
[9]:https://redmine.openinfosecfoundation.org/projects/suricata/wiki
