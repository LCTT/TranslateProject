Linux存储的未来
================================================================================
> **摘要**：Linux系统的软件开发者们正致力于使Linux支持更多种类的文件和存储方案。

波士顿 - 在[Linux基金会][1]最近的[Vault][2]展示会上，全都是关于文件系统和存储方案的讨论。你可以会觉得关于这两个主题并没有什么值得讨论的最新进展，但事实并非如此。

![](http://zdnet2.cbsistatic.com/hub/i/r/2015/03/12/c8f92cc2-b963-4238-80a0-d785ec93698c/resize/770x578/08d93a8a393d3f50b2a56e6b0e7a0ca9/btrfs-1.jpg)

对Linux文件系统，比如Btrfs，和存储方案的支持正在持续发展中。 -- Facebook

自从Linus提出“[讨厌的、生锈的机械磁盘]”的观点以来，存储技术已经走过一段长路，Linux也始终保持跟进。比如说，近几年来，[闪存已经逐渐成为企业服务器的主要存储器][4]，[持久化内存][5]也正给我们带来拥有DRAM一般快速的存储。与此同时，大数据、云计算和容器化技术正给Linux引入新的应用场景。

为了应对挑战，Linux开发者们一边继续扩展已有的文件系统和存储程序，一边致力于开发新的方案。

### Btrfs ###

例如，Chris Mason，一位来自Facebook的软件工程师，也是[Btrfs][6]（念做 Butter FS）的维护者之一，介绍了Facebook是如何使用这种文件系统。Btrfs拥有文件系统固有的许多优点，比如既能处理大量的小文件，也能处理大小可达16EB的单个文件；支持RAID ；内置的文件系统压缩，以及集成了对多种存储设备的支持。

当然，Facebook的服务器也运行在Linux上。更准确地讲，是运行在一个基于[CentOS][7]的内部发行版上，它是基于3.10和3.18版的内核。对Facebook来说，真正的收获是Btrfs在Facebook持续更新的用户操作所带来的巨大的IOPS（每秒钟输入输出的操作数）的负载下依旧保持稳定和快速。

这就是好消息，但坏消息是对于像MySQL一样的传统DBMS（数据库管理系统）来说Btrfs还是太慢了。对此，Facebook采用了[XFS][8]。为了协同这两种文件系统，Facebook又用到了一种叫做[Gluster][9]的开源分布式文件系统。

Facebook，一直与上游的负责Btrfs的Linux内核开发者保持密切联系，致力于提高Btrfs在DBMS上的速度。Mason和他的同事的目标是在[RocksDB][10]数据库上使用Btrfs，RocksDB是一种为提供快速存储开发的持久化键值存储系统，可以作为客户端服务器模式数据库的基础部分。

当然Btrfs也还存在一些问题，比如，如果有用户傻到用数据把硬盘几乎要撑爆时，Btrfs会在硬盘被完全装满前阻止用户继续写入。对某些工程来说，比如[CoreOS][12]，一款依赖容器化的企业版Linux系统，这种问题是致命的。[因此，CoreOS已经切换到使用xt4和overlayfs了][11]。

Btrfs的开发人员正致力于数据去重。在这一点上，当文件系统中拥有超过一个的相同文件时，会自动删除多余文件。正如Mason所说，“并非每个人都需要这个功能，但如果有人需要，那就是真的有用！”

在正在开展的重要性工作中，Btrfs并非是唯一的文件系统。John Spary，[Red Hat][13]的一位高级软件工程师，提到了另一款名为[Ceph][14]的分布式文件系统。

### Ceph FS ###

Ceph提供了一种分布式对象存储方案和文件系统，反过来它依托于一种使用商用硬件集群的弹性的、可扩展的存储模型（RADOS）。配合RADOS块设备（RBD）和RADOS对象网关（RGW），Ceph提供了一种[POSIX][15]接口的文件系统 -- Ceph FS。尽管RBD和RGW已经在生产环境中使用了一段时间，但使Ceph FS适用于生产的工作还是进行中。

[Rad Hat，在收购Ceph的母公司Inktank后][16]，在2014年一直致力于使CephFS适用于生产环境。不管怎样，Spray说，“有些人已经在生产中使用了它；我们对此表示担忧，毕竟它还没有准备好。”然而，Spray也补充说，“这具有两面性，因为一方面这是让人担心的，另一方面我们又从用户获得了真正有用的反馈和测试。”

这是因为尽管Ceph对象存储很好地支持扩展，但Ceph Fs，作为一种兼容POSIX的文件系统，却很难实现扩展。比如，作为一种分布式文件系统，Ceph FS必须解决来自多个客户端的多个写操作。这会导致全有或全无的情况，即一个客户端可以写入，但其它客户端必须等待，也会产生文件加锁的情形，即相比普通文件系统中更加复杂。

但是，Ceph FS仍值得去做，正如Spray所说，“因为兼容POSIX的文件系统是操作系统通用的。”这并不是说Ceph FS就一无是处。“它并不是支离破碎的，相反它奏效了。所缺的是修复和监控工具。”

Red Hat目前正致力于完成[fsck][17]和日志修复工具开发、快照强化、更好客户端访问控制，以及云与容器的集成。尽管Ceph FS到目前为止只是一种有潜力或者没前景的文件系统，但仍然值得用在生产环境中。

### 文件与存储的差别与目标 ###

至于文件系统和存储上的更大问题，Jeff Layton，[Primary Data][18]的一位高级软件工程师，解释说为了“在不断开电源的情况下给灾难性的电源故障提供测试”，大量的相关工作正在进行中。这些测试很快会被集成到[xftests][19]中，它是Linux文件系统测试的黄金标准。

Rik van Riel，一位Red Hat的主要软件工程师，谈到了解决持久化内存产品的问题。你可以把它们作为存储器或者内存。但是，如果你现在把它们作为内存来用，是不能为备份创建快照。真正的问题是：van Riel确信人们会尝试使用持久的内存作这两种用途，这会导致出现和“如果不备份，你会如何处理一个200GB大小的持久化内存数据库？”类似的情形发生。更糟的是，现在日志系统也无法和持久化的内存一起发挥作用。

正确的答案是什么呢？Linux至今还没有一个，但编程人员们正在努力寻找答案。

因此，尽管Linux支持很多文件系统，可以使用这里以外的任何一种存储器来存储数据，但是仍然有很多工作要做。技术从来不会止步不前。Linux，正运行在移动设备、桌面电脑、服务器、云端和超级计算机上等几乎所有的主流设备上，必须跟紧存储的发展步伐，不管它们以何种形式出现。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linux-storage-futures/

作者：[Steven J. Vaughan-Nichols][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/sjvn/
[1]:http://www.linuxfoundation.org/
[2]:http://events.linuxfoundation.org/events/vault
[3]:http://www.wired.com/2012/10/linus-torvalds-hard-disks/
[4]:http://www.zdnet.com/article/sandisk-launches-infiniflash-aims-to-bring-flash-array-costs-down/
[5]:http://events.linuxfoundation.org/sites/events/files/eeus13_wheeler.pdf
[6]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[7]:http://www.centos.org/
[8]:http://oss.sgi.com/projects/xfs/
[9]:http://www.gluster.org/
[10]:http://rocksdb.org/
[11]:http://lwn.net/Articles/627232/
[12]:https://coreos.com/
[13]:http://www.redhat.com/
[14]:http://ceph.com/
[15]:http://pubs.opengroup.org/onlinepubs/9699919799/
[16]:http://www.zdnet.com/article/red-hat-acquires-inktank-for-175m/
[17]:http://linux.die.net/man/8/fsck
[18]:http://primarydata.com/
[19]:http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=summary




