CoreOS，一款 Linux 容器发行版
============================================================

![](https://cdn-images-1.medium.com/max/1600/1*znkOJQnw5_8Ko8VMEpRlpg.png)

> CoreOS，一款最新的 Linux 发行版本，支持自动升级内核软件，提供各集群间配置的完全控制。

关于使用哪个版本的 Linux 服务器系统的争论，常常是以这样的话题开始的：

> 你是喜欢基于 [Red Hat Enterprise Linux （RHEL）][1] 的 [CentOS][2] 或者 [Fedora][3]，还是基于 [Debian][4] 的 [Ubuntu][5]，抑或 [SUSE][6] 呢？

但是现在，一款名叫 [CoreOS 容器 Linux][7] 的 Linux 发行版加入了这场“圣战”。[这个最近在 Linode 服务器上提供的 CoreOS][8]，和它的老前辈比起来，它使用了完全不同的实现方法。

你可能会感到不解，这里有这么多成熟的 Linux 发行版本，为什么要选择用 CoreOS ？借用 Linux 主干分支的维护者，也是 CoreOS 顾问的 Greg Kroah-Hartman 先生的一句话：

> CoreOS 可以控制发行版的升级（基于 ChromeOS 代码），并结合了 Docker 和潜在的核对/修复功能，这意味着不用停止或者重启你的相关进程，就可以[在线升级][9]。测试版本已经支持此功能，这是史无前例的。

当 Greg Kroah-Hartman 做出这段评价时，CoreOS 还处于 α 测试阶段，当时也许就是在硅谷的一个车库当中，[开发团队正在紧锣密鼓地开发此产品][10]，但 CoreOS 不像最开始的苹果或者惠普，其在过去的四年当中一直稳步发展。

当我参加在旧金山举办的 [2017 CoreOS 大会][11]时，CoreOS 已经支持谷歌云、IBM、AWS 和微软的相关服务。现在有超过 1000 位开发人员参与到这个项目中，并为能够成为这个伟大产品的一员而感到高兴。

究其原因，CoreOS 从开始就是为容器而设计的轻量级 Linux 发行版，其起初是作为一个 [Docker][12] 平台，随着时间的推移， CoreOS 在容器方面走出了自己的道路，除了 Docker 之外，它也支持它自己的容器 [rkt][13] （读作 rocket ）。

不像大多数其他的 Linux 发行版，CoreOS 没有包管理器，取而代之的是通过 Google ChromeOS 的页面自动进行软件升级，这样能提高在集群上运行的机器/容器的安全性和可靠性。不用通过系统管理员的干涉，操作系统升级组件和安全补丁可以定期推送到 CoreOS 容器。

你可以通过 [CoreUpdate 和它的 Web 界面][14]上来修改推送周期，这样你就可以控制你的机器何时更新，以及更新以多快的速度滚动分发到你的集群上。

CoreOS 通过一种叫做 [etcd][15] 的分布式配置服务来进行升级，etcd 是一种基于 [YAML][16] 的开源的分布式哈希存储系统，它可以为 Linux 集群容器提供配置共享和服务发现等功能。

此服务运行在集群上的每一台服务器上，当其中一台服务器需要下线升级时，它会发起领袖选举，以便服务器更新时整个Linux 系统和容器化的应用可以继续运行。

对于集群管理，CoreOS 之前采用的是 [fleet][17] 方法，这将 etcd 和 [systemd][18] 结合到分布式初始化系统中。虽然 fleet 仍然在使用，但 CoreOS 已经将 etcd 加入到 [Kubernetes][19] 容器编排系统构成了一个更加强有力的管理工具。

CoreOS 也可以让你定制其它的操作系统相关规范，比如用 [cloud-config][20] 的方式管理网络配置、用户账号和 systemd 单元等。

综上所述，CoreOS 可以不断地自行升级到最新版本，能让你获得从单独系统到集群等各种场景的完全控制。如 CoreOS 宣称的，你再也不用为了改变一个单独的配置而在每一台机器上运行 [Chef][21] 了。

假如说你想进一步的扩展你的 DevOps 控制，[CoreOS 能够轻松地帮助你部署 Kubernetes][22]。

CoreOS 从一开始就是构建来易于部署、管理和运行容器的。当然，其它的 Linux　发行版，比如 RedHat 家族的[原子项目][23]也可以达到类似的效果，但是对于那些发行版而言是以附加组件的方式出现的，而 CoreOS 从它诞生的第一天就是为容器而设计的。

当前[容器和 Docker 已经逐渐成为商业系统的主流][24]，如果在可预见的未来中你要在工作中使用容器，你应该考虑下 CoreOS，不管你的系统是在裸机硬件上、虚拟机还是云上。

如果有任何关于 CoreOS 的观点或者问题，还请在评论栏中留言。如果你觉得这篇博客还算有用的话，还请分享一下~

---

关于博主：Steven J. Vaughan-Nichols 是一位经验丰富的 IT 记者，许多网站中都刊登有他的文章，包括 [ZDNet.com][25]、[PC Magazine][26]、[InfoWorld][27]、[ComputerWorld][28]、[Linux Today][29] 和 [eWEEK][30] 等。他拥有丰富的 IT 知识 - 而且他曾参加过智力竞赛节目 Jeopardy ！他的相关观点都是自身思考的结果，并不代表 Linode 公司，我们对他做出的贡献致以最真诚的感谢。如果想知道他更多的信息，可以关注他的 Twitter [_@sjvn_][31]。

--------------------------------------------------------------------------------

via: https://medium.com/linode-cube/the-what-why-and-wow-behind-the-coreos-container-linux-fa7ceae5593c

作者：[Steven J. Vaughan-Nichols][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[wxy](https://github.com/wxy)

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
