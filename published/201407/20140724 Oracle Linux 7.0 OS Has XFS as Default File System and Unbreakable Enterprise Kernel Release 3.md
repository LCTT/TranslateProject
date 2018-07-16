Oracle Linux 7.0发布！
===
![The new Oracle Linux 7.0 is out](http://i1-news.softpedia-static.com/images/news2/Oracle-Linux-7-0-OS-Has-XFS-as-Default-File-System-and-Unbreakable-Enterprise-Kernel-Release-3-451894-2.jpg)

**Oracle已经发布了Oracle Linux 7.0操作系统，新系统带来了大量的新特性，比如“第三代坚不可摧的内核 UEK”（Unbreakable Enterprise Kernel Release 3）和一个新的默认文件系统**

为了这次新的发行版的发布，Oracle的开发者们已经放出过两个预览版，现在最终版终于来了。果然，它有着大量的改进，其中包括使用新的XFS作为默认的文件系统**[注：原文为操作系统，应该是笔误]**，可选的Btrfs文件系统，Linux Containers (LXC)， DTrace，Ksplice，加强版Xen和UEK R3。

作为广泛流行的文件系统EXT4的对抗者，XFS有一个显著优势。它所允许用户的文件系统的大小达到了500TB，这比你在EXT4文件系统中所能达到最大值的十倍还多。唯一的缺点是单个文件的大小最大仅为16TB。

这个发行版的一大特色是它支持两种内核。一个是红帽兼容性内核(RHCK)，基于Linux内核版本3.10，第二个是Oracle自己的内核版本“第三代坚不可摧的内核”（UEK R3），版本号从3.8.13开始，因为它基于3.8的Linux内核。你或许还记得Linux内核3.8.x已经寿终正寝，但是看来Oracle一直在维护着自己的分支。

“已经能够从Oracle软件发布云上下载了，Oracle Linux 7可以免费下载和部署。所有的bug修复和安全勘误会被发布到Oracle的公共yum服务器上，不管有没有付费，用户都能安装同样的代码，并且从免费到付费的迁移十分简单，无需重新安装。”

“当发布最新的Linux更新，工具以及推送给客户和参与者新功能的时候，需要为现代化的数据中心提供企业级的解决方案。为此最新的发行版是构建在Oracle对OpenStack这样的新兴技术提供支持的基础上，”从官方声明可以看出。

通过变更记录来看，Ksplice已经为了实现零宕机的内核完成了安全更新和bug修复，systemd也成了新的系统管理工具，Grub2现在是默认的启动引导程序，并且支持新的固件类型（比如UEFI），还有一个加强版Anaconda安装器，一个新的Apache Web服务器，支持GPT，和大量的安全特性被添加进来。

更多关于最新的Oracle Linux发行版的详细内容可以参考官方[声明][1]。

立即下载Oracle Linux 7.0：


- [Oracle Enterprise Linux 6.5 (ISO) 64-bit][2][iso] [3 GB]
- [Oracle Enterprise Linux 6.5 (ISO) 32-bit][3][iso] [3.60 GB]
- [Oracle Enterprise Linux 7.0 (ISO) 64-bit][4][iso] [4.50 GB]


---------------------------------

原文: http://news.softpedia.com/news/Oracle-Linux-7-0-OS-Has-XFS-as-Default-File-System-and-Unbreakable-Enterprise-Kernel-Release-3-451894.shtml

作者：[Silviu Stahie][a]
译者：[guodongxiaren](https://github.com/guodongxiaren)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie
[1]:http://www.oracle.com/us/corporate/press/2245947
[2]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/i386/OracleLinux-R6-U5-Server-i386-dvd.iso
[3]:http://mirrors.dotsrc.org/oracle-linux/OL6/U5/x86_64/OracleLinux-R6-U5-Server-x86_64-dvd.iso
[4]:https://edelivery.oracle.com/linux/
