CoreOS，一款新的 Linux 发行版的相关介绍
============================================================

![](https://cdn-images-1.medium.com/max/1600/1*znkOJQnw5_8Ko8VMEpRlpg.png)

#### CoreOS，一款最新的 Linux 发行版本，支持自动升级内核软件，提供各集群间的全部配置操作控制。

关于使用哪个版本的 Linux 系统，我们常常会引发相关的讨论：
你是喜欢基于 [_Red Hat Enterprise Linux (RHEL)_][1] 的 [_CentOS_][2] 或者 [_Fedora_][3]，还是基于 [_Debian_][4] 的 [_Ubuntu_][5]  和  [_SUSE_][6] 呢？

但是现在，一款名叫 [CoreOS Container Linux][7] 的 Linux 发行版进入了我们的视野。和它的老前辈比起来，它使用了完全不同的实现方法，并且最近已经正式被部署到一家名叫 Linode 的美国 VPS 提供商的服务器上，为其提供[相关服务][8]。

你可能会感到不解，这里有这么多成熟的 Linux 发行版本，为什么要选择用 CoreOS ？借用 Linux 主干分支的维护人员，也是 CoreOS 的顾问的 Greg Kroah-Hartman 先生的一句话：

> CoreOS 的发行版升级基于 ChromeOS 代码，不用断开 Docker，支持潜在的修复和核对，这意味着不用停止或者重启你的相关进程，就可以[在线升级][9], 测试版本已经支持此功能，这是史无前例的。

当 Greg Kroah-Hartman 做出这段评价时，CoreOS 还处于 α 的版本阶段，当时[开发团队正在硅谷的一个车库中紧锣密鼓地开发此产品][10]，但 CoreOS 不像最开始的苹果或者惠普，在过去的四年当中一直稳步发展。

当我参加在旧金山举办的 [2017 CoreOS 大会][11]时，CoreOS 已经支持谷歌云、IBM、亚马逊和微软的相关服务。现在有超过 1000 位开发人员参与到这个项目中，并为能够成为这个伟大产品的一员而感到高兴。

究其原因，CoreOS 是基于 get-go 的轻量级容器化 Linux 发行版，最初基于 [Docker][12] 平台，随着版本的更新，现在除了 Docker ，也支持 [rkt][13] 和 自己的容器。

不像大多数其他的 Linux 发行版，CoreOS 没有包管理器，取而代之的是通过 Google ChromeOS 的页面自动进行软件升级，这样能提高在集群上运行的机器/容器的安全性和可靠性。不用通过系统管理员的干涉，操作系统升级组件和安全补丁可以定期自动地上传到 CoreOS 容器进行升级。

你可以通过 [CoreUpdate 接口][14]来修改周期上传的时间,这样你就可以控制软件升级的时间和速率。

CoreOS 通过一种叫做 [etcd][15] 的分布式配置服务来进行升级，etcd 基于 [YAML][16]，是一个开源的分布式哈希表存储系统，它可以为 Linux 集群容器提供服务搜索和共享配置等功能。

此服务可作用于集群上的所有服务器，当其中一台服务器需要升级时，可通过集群选举算法来升级，而其他机器则照常运行。

对于集群管理，CoreOS 之前采用的是 [fleet][17] 方法，这将 etcd 和 [systemd][18] 强耦合到分布式初始化系统中。当 fleet 仍然在运行时，CoreOS 结合 etcd 和 [Kubernetes][19] 容器编制来构成一个更加强有力的管理工具。

CoreOS 也可以让你以声明的方式定义其他操作系统的相关规格，比如用[云配置][20]的方式管理网络配置，用户账号和系统网元等。

综上所述，CoreOS 可以自动升级到最新版本，能让你获得从单独系统到集群等各种场景的完全控制，你再也不用为了改变一个单独的配置而在每一个集群的机器上运行 [Chef][21] 配置了。

所以说，对于运维工程师来说，[CoreOS能够更加快速有效地帮助你部署各种平台系统][22]。

通过CoreOS自下而上的构建，运维人员能够更加容易地部署、管理和运行系统。当然有[原子计画的红帽][23]等其他 Linux 发行版本也可以达到类似的效果，但它是在后续版本中才扩展的附加组件，而 CoreOS 从它诞生的第一天就有了。

当前[基于容器和 Docker 的框架已经逐渐成为商业系统的主流][24]，如果在可预见的未来，你要在工作中使用容器，你最好考虑下 CoreOS，不管你的系统是在云上、虚拟机还是裸机硬件上跑。

* * *
如果有任何关于 CoreOS 的观点或者问题，还请在评论栏中留言。如果你觉得这篇博客还算有用的话，还请分享一下~
* * *

关于博主：Steven J. Vaughan-Nichols 是一位经验丰富的 IT 记者，许多网站中都刊登有他的文章，包括 [_ZDNet.com_][25]  _, _  [_PC Magazine_][26]  _, _  [_InfoWorld_][27]  _, _  [_ComputerWorld_][28]  _, _  [_Linux Today_][29] 和 [_eWEEK_][30] 等. 他拥有丰富的 IT 知识 - 而且他曾参加过智力竞赛节目 Jeopardy ！他的相关观点都是自身思考的结果，并不代表 Linode 公司，我们对他做出的贡献致以最真诚的感谢。如果想知道他更多的信息，可以关注他的 Twitter [_@sjvn_][31].

--------------------------------------------------------------------------------

via: https://medium.com/linode-cube/the-what-why-and-wow-behind-the-coreos-container-linux-fa7ceae5593c

作者：[Steven J. Vaughan-Nichols ][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/linode-cube/the-what-why-and-wow-behind-the-coreos-container-linux-fa7ceae5593c
[1]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[2]:https://www.centos.org/
[3]:https://getfedora.org/
[4]:https://www.debian.org/
[5]:https://www.ubuntu.com/
[6]:https://www.suse.com/
[7]:https://coreos.com/os/docs/latest
[8]:https://www.linode.com/docs/platform/use-coreos-container-linux-on-linode
[9]:https://plus.google.com/+gregkroahhartman/posts/YvWFmPa9kVf
[10]:https://www.wired.com/2013/08/coreos-the-new-linux/
[11]:https://coreos.com/fest/
[12]:https://www.docker.com/
[13]:https://coreos.com/rkt
[14]:https://coreos.com/products/coreupdate/
[15]:https://github.com/coreos/etcd
[16]:http://yaml.org/
[17]:https://github.com/coreos/fleet
[18]:https://www.freedesktop.org/wiki/Software/systemd/
[19]:https://kubernetes.io/
[20]:https://coreos.com/os/docs/latest/cloud-config.html
[21]:https://insights.hpe.com/articles/what-is-chef-a-primer-for-devops-newbies-1704.html
[22]:https://blogs.dxc.technology/2017/06/08/coreos-moves-in-on-cloud-devops-with-kubernetes/
[23]:http://www.projectatomic.io/
[24]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[25]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[26]:http://www.pcmag.com/author-bio/steven-j.-vaughan-nichols
[27]:http://www.infoworld.com/author/Steven-J.-Vaughan_Nichols/
[28]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[29]:http://www.linuxtoday.com/author/Steven+J.+Vaughan-Nichols/
[30]:http://www.eweek.com/cp/bio/Steven-J.-Vaughan-Nichols/
[31]:http://www.twitter.com/sjvn
