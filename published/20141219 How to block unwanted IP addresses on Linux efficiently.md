如何在 Linux 下大量屏蔽恶意 IP 地址
================================================================================

很多情况下，你可能需要在Linux下屏蔽IP地址。比如，作为一个终端用户，你可能想要免受间谍软件或者IP追踪的困扰。或者当你在运行P2P软件时。你可能想要过滤反P2P活动的网络链接。如果你是一名系统管理员，你可能想要禁止垃圾IP地址访问你们的公司邮件服务器。或者你因一些原因想要禁止某些国家访问你的web服务。在许多情况下，然而，你的IP地址屏蔽列表可能会很快地增长到几万的IP。该如何处理这个？

### Netfilter/IPtables 的问题 ###

在Linux中，可以很简单地用netfilter/iptables框架禁止IP地址：

    $ sudo iptables -A INPUT -s 1.1.1.1 -p TCP -j DROP 

如果你想要完全屏蔽一个IP地址段，你可以用下面的命令很简单地做到：

    $ sudo iptables -A INPUT -s 1.1.2.0/24 -p TCP -j DROP 

然而，当你有1000个独立IP地址，且不带CIDR（无类别域间路由）前缀，你该怎么做？你要有1000条iptable规则！这显然这并不适于大规模屏蔽。

    $ sudo iptables -A INPUT -s 1.1.1.1 -p TCP -j DROP
    $ sudo iptables -A INPUT -s 2.2.2.2 -p TCP -j DROP
    $ sudo iptables -A INPUT -s 3.3.3.3 -p TCP -j DROP
    . . . . 

### 什么是IP集? ###

这时候就是[IP集][1]登场了。IP集是一个内核特性，它允许多个（独立）IP地址、MAC地址或者甚至是端口号被编码和有效地存储在位图/哈希内核数据结构中。一旦IP集创建之后，你可以创建一条iptables规则来匹配这个集合。

你马上就会看见IP集合的好处了，它可以让你用一条iptable规则匹配多个ip地址！你可以用多个IP地址和端口号的方式来构造IP集，并且可以动态地更新规则而没有性能影响。

### 在Linux中安装IPset工具 ###

为了创建和管理IP集，你需要使用称为ipset的用户空间工具。

要在Debian、Ubuntu或者Linux Mint上安装：

    $ sudo apt-get install ipset

Fedora或者CentOS/RHEL 7上安装：

    $ sudo yum install ipset 

### 使用IPset命令禁止IP ###

让我通过简单的示例告诉你该如何使用ipset命令。

首先，让我们创建一条新的IP集，名为banthis（名字任意）：

    $ sudo ipset create banthis hash:net

第二个参数(hash:net)是必须的，代表的是集合的类型。IP集有[多个类型][2]。hash:net类型的IP集使用哈希来存储多个CIDR块。如果你想要在一个集合中存储单独的IP地址，你可以使用hash:ip类型。

一旦创建了一个IP集之后，你可以用下面的命令来检查：

    $ sudo ipset list 

![](https://farm8.staticflickr.com/7483/15380353464_825dbc45c2_z.jpg)

这显示了一个可用的IP集合列表，并有包含了集合成员的详细信息。默认上，每个IP集合可以包含65536个元素（这里是CIDR块）。你可以通过追加"maxelem N"选项来增加限制。

    $ sudo ipset create banthis hash:net maxelem 1000000 

现在让我们来增加IP块到这个集合中：

    $ sudo ipset add banthis 1.1.1.1/32
    $ sudo ipset add banthis 1.1.2.0/24
    $ sudo ipset add banthis 1.1.3.0/24
    $ sudo ipset add banthis 1.1.4.10/24 

你会看到集合成员已经改变了。

    $ sudo ipset list 

![](https://farm8.staticflickr.com/7518/15380353474_4d6b9dbf63_z.jpg)

现在是时候去创建一个使用IP集的iptables规则了。这里的关键是使用"-m set --match-set <name>"选项。

现在让我们创建一条让之前那些IP块不能通过80端口访问web服务的iptable规则。可以通过下面的命令：

    $ sudo iptables -I INPUT -m set --match-set banthis src -p tcp --destination-port 80 -j DROP 

如果你愿意，你可以保存特定的IP集到一个文件中，以后可以从文件中还原：

    $ sudo ipset save banthis -f banthis.txt
    $ sudo ipset destroy banthis
    $ sudo ipset restore -f banthis.txt 

上面的命令中，我使用了destory选项来删除一个已有的IP集来看看我是否可以还原它。

### 自动IP地址禁用 ###

现在你应该看到了IP集合的强大了。维护IP黑名单是一件繁琐和费时的工作。实际上，有很多免费或者收费的服务可以来帮你完成这个。一个额外的好处是，让我们看看如何自动将IP黑名单加到IP集中。

首先让我们从[iblocklist.com][3]得到免费的黑名单，这个网站有不同的免费和收费的名单。免费的版本是P2P格式。

接下来我要使用一个名为iblocklist2ipset的开源Python工具来将P2P格式的黑名单转化成IP集。

首先，你需要安装了pip（参考[这个指导][4]来安装pip）。

使用的下面命令安装iblocklist2ipset。

    $ sudo pip install iblocklist2ipset

在一些发行版如Fedora，你可能需要运行：

    $ sudo python-pip install iblocklist2ipset 

现在到[iblocklist.com][5]，抓取任何一个P2P列表的URL（比如"level1"列表）。

![](https://farm8.staticflickr.com/7523/15976824856_80632f35e1_z.jpg)

粘帖URL到下面的命令中。

    $ iblocklist2ipset generate \
    --ipset banthis "http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz" \
    > banthis.txt 

上面的命令运行之后，你会得到一个名为banthis.txt的文件。如果查看它的内容，你会看到像这些：

    create banthis hash:net family inet hashsize 131072 maxelem 237302
    add banthis 1.2.4.0/24
    add banthis 1.2.8.0/24
    add banthis 1.9.75.8/32
    add banthis 1.9.96.105/32
    add banthis 1.9.102.251/32
    add banthis 1.9.189.65/32
    add banthis 1.16.0.0/14

你可以用下面的ipset命令来加载这个文件：

    $ sudo ipset restore -f banthis.txt

现在可以查看自动创建的IP集：

    $ sudo ipset list banthis 

在写这篇文章时候，“level1”类表包含了237,000个屏蔽的IP列表。你可以看到很多IP地址已经加入到IP集中了。

最后，创建一条iptables命令来屏蔽这些坏蛋！

### 总结 ###

这篇文章中，我描述了你该如何用强大的ipset来屏蔽不想要的IP地址。同时结合了第三方工具iblocklist2ipset，这样你就可以流畅地维护你的IP屏蔽列表了。那些对ipset的性能提升好奇的人，下图显示了iptables在使用和不使用ipset的基准测试结果。

![](https://farm8.staticflickr.com/7575/15815220998_e1935c94c0_z.jpg)

告诉我你多么喜欢这个。:-)

--------------------------------------------------------------------------------

via: http://xmodulo.com/block-unwanted-ip-addresses-linux.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://ipset.netfilter.org/
[2]:http://ipset.netfilter.org/features.html
[3]:https://www.iblocklist.com/lists.php
[4]:http://ask.xmodulo.com/install-pip-linux.html
[5]:https://www.iblocklist.com/lists.php
[6]:http://daemonkeeper.net/781/mass-blocking-ip-addresses-with-ipset/