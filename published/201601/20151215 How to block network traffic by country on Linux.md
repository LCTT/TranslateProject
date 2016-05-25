如何在 Linux 中根据国家位置来阻断网络流量
================================================================================

作为一名维护 Linux 生产服务器的系统管理员，你可能会遇到这样一些情形：你需要**根据地理位置，选择性地阻断或允许网络流量通过。** 例如你正经历一次由注册在某个特定国家的 IP 发起的 DoS 攻击；或者基于安全考虑，你想阻止来自未知国家的 SSH 登录请求；又或者你的公司对某些在线视频有分销权，它要求只能在特定的国家内合法发行；抑或是由于公司的政策，你需要阻止某个本地主机将文件上传至任意一个非美国的远程云端存储。

所有的上述情形都需要设置防火墙，使之具有**基于国家位置过滤流量**的功能。有几个方法可以做到这一点，其中之一是你可以使用 TCP wrappers 来为某个应用（例如 SSH，NFS， httpd）设置条件阻塞。但其缺点是你想要保护的那个应用必须以支持 TCP wrappers 的方式构建。另外，TCP wrappers 并不总是能够在各个平台中获取到（例如，Arch Linux [放弃了][2]对它的支持）。另一种方式是结合基于国家的 GeoIP 信息，设置 [ipset][3]，并将它应用到 iptables 的规则中。后一种方式看起来更有希望一些，因为基于 iptables 的过滤器是与应用无关的，且容易设置。

在本教程中，我将展示 **另一个基于 iptables 的 GeoIP 过滤器，它由 xtables-addons 来实现**。对于那些不熟悉它的人来说， xtables-addons 是用于 netfilter/iptables 的一系列扩展。一个包含在 xtables-addons 中的名为 xt\_geoip 的模块扩展了 netfilter/iptables 的功能，使得它可以根据流量来自或流向的国家来进行过滤，IP 掩蔽（NAT）或丢包。若你想使用 xt\_geoip，你不必重新编译内核或 iptables，你只需要使用当前的内核构建环境（/lib/modules/\`uname -r`/build）以模块的形式构建 xtables-addons。同时也不需要进行重启。只要你构建并安装了 xtables-addons ， xt\_geoip 便能够配合 iptables 使用。

至于 xt\_geoip 和 ipset 之间的比较，[xtables-addons 的官方网站][3] 上是这么说的： 相比于 ipset，xt\_geoip 在内存占用上更胜一筹，但对于匹配速度，基于哈希的 ipset 可能更有优势。

在教程的余下部分，我将展示**如何使用 iptables/xt\_geoip 来根据流量的来源地或流入的国家阻断网络流量**。

### 在 Linux 中安装 xtables-addons ###

下面介绍如何在各种 Linux 平台中编译和安装 xtables-addons。

为了编译 xtables-addons，首先你需要安装一些依赖软件包。

#### 在 Debian，Ubuntu 或 Linux Mint 中安装依赖 ####

    $ sudo apt-get install iptables-dev xtables-addons-common libtext-csv-xs-perl pkg-config

#### 在 CentOS，RHEL 或 Fedora 中安装依赖 ####

CentOS/RHEL 6 需要事先设置好 EPEL 仓库（为 perl-Text-CSV\_XS 所需要）。

    $ sudo yum install gcc-c++ make automake kernel-devel-`uname -r` wget unzip iptables-devel perl-Text-CSV_XS

#### 编译并安装 xtables-addons ####

从 `xtables-addons` 的[官方网站][4] 下载源码包，然后按照下面的指令编译安装它。

    $ wget http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-2.10.tar.xz
    $ tar xf xtables-addons-2.10.tar.xz
    $ cd xtables-addons-2.10
    $ ./configure
    $ make
    $ sudo make install

需要注意的是，对于基于红帽的系统（CentOS、RHEL、Fedora），它们默认开启了 SELinux，所以有必要像下面这样调整 SELinux 的策略。否则，SELinux 将阻止 iptables 加载 xt\_geoip 模块。

    $ sudo chcon -vR --user=system_u /lib/modules/$(uname -r)/extra/*.ko
    $ sudo chcon -vR --type=lib_t /lib64/xtables/*.so

### 为 xtables-addons 安装 GeoIP 数据库 ###

下一步是安装 GeoIP 数据库，它将被 xt\_geoip 用来查询 IP 地址与国家地区之间的对应关系。方便的是，`xtables-addons` 的源码包中带有两个帮助脚本，它们被用来从 MaxMind 下载 GeoIP 数据库并将它转化为 xt\_geoip 可识别的二进制形式文件；它们可以在源码包中的 geoip 目录下找到。请遵循下面的指导来在你的系统中构建和安装 GeoIP 数据库。

    $ cd geoip
    $ ./xt_geoip_dl
    $ ./xt_geoip_build GeoIPCountryWhois.csv
    $ sudo mkdir -p /usr/share/xt_geoip
    $ sudo cp -r {BE,LE} /usr/share/xt_geoip

根据 [MaxMind][5] 的说明,他们的 GeoIP 数据库能够以 99.8% 的准确率识别出 ip 所对应的国家，并且每月这个数据库将进行更新。为了使得本地安装的 GeoIP 数据是最新的，或许你需要设置一个按月执行的 [cron job][6] 来时常更新你本地的 GeoIP 数据库。

### 阻断来自或流向某个国家的网络流量 ###

一旦 xt\_geoip 模块和 GeoIP 数据库安装好后，你就可以在 iptabels 命令中使用 geoip 的匹配选项。

    $ sudo iptables -m geoip --src-cc country[,country...] --dst-cc country[,country...]

你想要阻断流量的那些国家是使用[2个字母的 ISO3166 代码][7] 来特别指定的（例如 US（美国）、CN（中国）、IN（印度）、FR（法国））。

例如，假如你想阻断来自也门（YE） 和 赞比亚（ZM）的流量，下面的 iptabels 命令便可以达到此目的。

    $ sudo iptables -I INPUT -m geoip --src-cc YE,ZM -j DROP

假如你想阻断流向中国（CN） 的流量，可以运行下面的命令：

    $ sudo iptables -A OUTPUT -m geoip --dst-cc CN -j DROP

匹配条件也可以通过在 `--src-cc` 或 `--dst-cc` 选项前加 `!` 来达到相反的目的：

假如你想在你的服务器上阻断来自所有非美国的流量，可以运行：

    $ sudo iptables -I INPUT -m geoip ! --src-cc US -j DROP

![](https://c2.staticflickr.com/6/5654/23665427845_050241b03f_c.jpg)

#### 对于使用 Firewall-cmd 的用户 ####

某些发行版本例如 CentOS/RHEL7 或 Fedora 已经用 firewalld 替代了 iptables 来作为默认的防火墙服务。在这些系统中，你可以类似使用 xt\_geoip 那样，使用 firewall-cmd 来阻断流量。利用 firewall-cmd 命令，上面的三个例子可被重新写为：

    $ sudo firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -m geoip --src-cc YE,ZM -j DROP
    $ sudo firewall-cmd --direct --add-rule ipv4 filter OUTPUT 0 -m geoip --dst-cc CN -j DROP
    $ sudo firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -m geoip ! --src-cc US -j DROP

### 总结 ###

在本教程中，我展示了使用 iptables/xt\_geoip 来根据流量的来源地或流入的国家轻松地阻断网络流量。假如你有这方面的需求，把它部署到你的防火墙系统中可以使之成为一个实用的办法。作为最后的警告，我应该提醒你的是：在你的服务器上通过基于 GeoIP 的流量过滤来禁止特定国家的流量并不总是万无一失的。GeoIP 数据库本身就不是很准确或齐全，且流量的来源或目的地可以轻易地通过使用 VPN、Tor 或其他任意易受攻击的中继主机来达到欺骗的目的。基于地理位置的过滤器甚至可能会阻止本不该阻止的合法网络流量。在你决定把它部署到你的生产环境之前请仔细考虑这个限制。

--------------------------------------------------------------------------------

via: http://xmodulo.com/block-network-traffic-by-country-linux.html

作者：[Dan Nanni][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.archlinux.org/news/dropping-tcp_wrappers-support/
[2]:http://xmodulo.com/block-unwanted-ip-addresses-linux.html
[3]:http://xtables-addons.sourceforge.net/geoip.php
[4]:http://xtables-addons.sourceforge.net/
[5]:https://support.maxmind.com/geoip-faq/geoip2-and-geoip-legacy-databases/how-accurate-are-your-geoip2-and-geoip-legacy-databases/
[6]:http://ask.xmodulo.com/add-cron-job-linux.html
[7]:https://en.wikipedia.org/wiki/ISO_3166-1
