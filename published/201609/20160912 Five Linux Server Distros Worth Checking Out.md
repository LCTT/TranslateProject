5 个值得了解的 Linux 服务器发行版
=========

> 你在 Distrowatch.com 上看到列出的将近 300 个 Linux 发行版本中，几乎任何一个发行版都可以被用来作为服务器系统。下面是一些相对于其他发行版而言比较突出的一些发行版。

![](http://windowsitpro.com/site-files/windowsitpro.com/files/imagecache/large_img/uploads/2016/09/cloudservers.jpg)

你在 Distrowatch.com 上看到列出的将近 300 个 Linux 发行版本中，几乎任何一个发行版都可以被用来作为服务器系统，在 Linux 发展的早期，给用户提供的一直是“全能”发行版，例如 Slackware、Debian 和 Gentoo 可以为家庭和企业作为服务器完成繁重的工作。那或许对业余爱好者是不错的，但是它对于专业人员来说也有好多不必要的地方。

首先，这里有一些发行版可以作为文件和应用服务器，给工作站提供常见外围设备的共享，提供网页服务和其它我们希望服务器做的任何工作，不管是在云端、在数据中心或者在服务器机架上，除此之外没有别的用途。

下面是 5 个最常用的 Linux 发行版的简单总结，而且每一个发行版都可以满足小型企业的需求。

### Red Hat Enterprise Linux（RHEL）

这或许是最有名的 Linux 服务器发行版了。RHEL 以它在高要求的至关重要的任务上坚如磐石的稳定性而出名，例如运行着纽约证券交易系统。红帽也提供了业内最佳的服务支持。

那么红帽 Linux 的缺点都有什么呢？ 尽管红帽以提供首屈一指的客户服务和支持而出名，但是它的支持订阅费用并不便宜。有人可能会指出，这的确物有所值。确实有便宜的 RHEL 第三方服务，但是你或许应该在这么做之前做一些研究。

### CentOS

任何喜欢 RHEL，但是又不想给红帽付费来获得支持的人都应该了解一下 CentOS，它基本上是红帽企业版 Linux 的一个分支。尽管这个项目 2004 年左右才开始，但它在 2014 年得到了红帽的官方支持，而它现在雇佣可这个项目的大多数开发者，这意味着安全补丁和漏洞修复提交到红帽不久后就会在 CentOS 上可用。

如果你想要部署 CentOS，你将需要有 Linux 技能的员工，因为没有了技术支持，你基本上只能靠自己。有一个好消息是 CentOS 社区提供了十分丰富的资源，例如邮件列表、Web 论坛和聊天室，所以对那些寻找帮助的人来说，社区帮助还是有的。

### Ubuntu Server

当许多年前 Canonical 宣布它将要推出一个服务器版本的 Ubuntu 的时候，你可能会听到过嘲笑者的声音。然而嘲笑很快变成了惊奇，Ubuntu Server 迅速地站稳了脚跟。部分原因是因为其来自 Debian 派生的基因，Debian 长久以来就是一个备受喜爱的 Linux 服务器发行版，Ubuntu 通过提供一般人可以支付的起的技术支持费用、优秀的硬件支持、开发工具和很多亮点填补了这个市场空隙。

那么 Ubuntu Server 有多么受欢迎呢？最近的数据表明它正在成为在 OpenStack 和 Amazon Elastic Compute Cloud 上[部署最多的操作系统][1]。在那里 Ubuntu Server 超过了位居第二的 Amazon Linux 的 Amazon Machine Image 一大截，而且让第三位 Windows 处于尘封的地位。另外一个调查显示 Ubuntu Server 是[使用最多的 Linux web 服务器][2]。

### SUSE Linux Enterprise Server（SLES）

这个源自德国的发行版在欧洲有很大的用户群，而且在本世纪初由 Novell 公司引起的 PR 问题出现之前，它一直都是大西洋这边的排名第一服务器发行版。在那段漫长的时期之后，SUSE 在美国获得了发展，而且它的使用或许加速了惠普企业公司将它作为[ Linux 首选合作伙伴][3]。

SLES 稳定而且易于维护，这正是很久以来对于一个好的 Linux 发行版所期待的东西。付费的 7*24 小时快速响应技术支持可以供你选择，使得这发行版很适合关键任务的部署。

### ClearOS

基于 RHEL，之所以这里要包括 [ClearOS][4] 是因为它对于每个人来说都足够简单，甚至是没有专业知识的人都可以去配置它。它定位于服务中小型企业，它也可以被家庭用户用来作为娱乐服务器，为了简单易用我们可以基于 Web 界面进行管理，它是以“构建你的 IT 基础设施应该像在智能手机上下载 app 一样简单”为前提来定制的。

最新的 7.2 发行版本，包括了一些可能并不“轻量级”的功能，例如对微软 Hyper-V 技术的 VM 支持，支持 XFS 和 BTRFS 文件系统，也支持 LVM 和 IPv6。这些新特性在免费版本或者在并不算贵的带着各种支持选项的专业版中都是可用的。 

--------------------------------------------------------------------------------

via: http://windowsitpro.com/industry/five-linux-server-distros-worth-checking-out

作者：[Christine Hall][a]
译者：[LinuxBars](https://github.com/LinuxBars)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://windowsitpro.com/industry/five-linux-server-distros-worth-checking-out
[1]: http://www.zdnet.com/article/ubuntu-linux-continues-to-dominate-openstack-and-other-clouds/
[2]: https://w3techs.com/technologies/details/os-linux/all/all
[3]: http://windowsitpro.com/industry/suse-now-hpes-preferred-partner-micro-focus-pact
[4]: https://www.clearos.com/