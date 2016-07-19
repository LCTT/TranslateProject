IT 运行在云端，而云运行在 Linux 上。你怎么看？
===================================================================

> IT 正在逐渐迁移到云端。那又是什么驱动了云呢？答案是 Linux。 当连微软的 Azure 都开始拥抱 Linux 时，你就应该知道这一切都已经改变了。

![](http://zdnet1.cbsistatic.com/hub/i/r/2016/06/24/7d2b00eb-783d-4202-bda2-ca65d45c460a/resize/770xauto/732db8df725ede1cc38972788de71a0b/linux-owns-cloud.jpg)

*图片： ZDNet*

不管你接不接受， 云正在接管 IT 已经成为现实。 我们这几年见证了 [ 云在内部 IT 的崛起 ][1] 。 那又是什么驱动了云呢？ 答案是 Linux 。

[Uptime Institute][2] 最近对 1000 个 IT 决策者进行了调查，发现约 50% 左右的资深企业 IT 决策者认为在将来[大部分的 IT 工作应该放在云上 ][3] 或托管网站上。在这个调查中，23% 的人认为这种改变即将发生在明年，有 70% 的人则认为这种情况会在四年内出现。

这一点都不奇怪。 我们中的许多人仍热衷于我们的物理服务器和机架， 但一般运营一个自己的数据中心并不会产生任何的经济效益。

很简单， 只需要对比你[运行在你自己的硬件上的资本费用（CAPEX）和使用云的业务费用（OPEX）][4]即可。 但这并不是说你应该把所有的东西都一股脑外包出去，而是说在大多数情况下你应该把许多工作都迁移到云端。 

相应地，如果你想充分地利用云，你就得了解 Linux 。

[亚马逊的 AWS][5]、 [Apache CloudStack][6]、 [Rackspace][7]、[谷歌的 GCP][8]  以及 [ OpenStack ][9] 的核心都是运行在 Linux 上的。那么结果如何？截至到 2014 年， [在 Linux 服务器上部署的应用达到所有企业的 79% ][10]，而 在 Windows 服务器上部署的则跌到 36%。从那时起， Linux 就获得了更多的发展动力。

即便是微软自身也明白这一点。

Azure 的技术主管 Mark Russinovich 曾说，仅仅在过去的几年内微软就从[四分之一的 Azure 虚拟机运行在 Linux 上][11] 变为[将近三分之一的 Azure 虚拟机运行在 Linux 上][12]。

试想一下。微软，一家正逐渐将[云变为自身财政收入的主要来源][13] 的公司，其三分之一的云产业依靠于 Linux 。

即使是到目前为止， 这些不论喜欢或者不喜欢微软的人都很难想象得到[微软会从一家以商业软件为基础的软件公司转变为一家开源的、基于云服务的企业][14] 。

Linux 对于这些专用服务器机房的渗透甚至比它刚开始的时候更深了。 举个例子， [Docker 最近发行了其在 Windows 10 和 Mac OS X 上的公测版本 ][15] 。 这难道是意味着 [Docker][16] 将会把其同名的容器服务移植到 Windows 10 和  Mac 上吗？ 并不是的。

在这两个平台上， Docker 只是运行在一个 Linux 虚拟机内部。 在 Mac OS 上是 HyperKit ，在 Windows 上则是 Hyper-V 。 在图形界面上可能看起来就像另一个 Mac 或 Windows 上的应用， 但在其内部的容器仍然是运行在 Linux 上的。

所以，就像大量的安卓手机和 Chromebook 的用户压根就不知道他们所运行的是 Linux 系统一样。这些 IT 用户也会随之悄然地迁移到 Linux 和云上。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/it-runs-on-the-cloud-and-the-cloud-runs-on-linux-any-questions/

作者：[Steven J. Vaughan-Nichols][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]: http://www.zdnet.com/article/2014-the-year-the-cloud-killed-the-datacenter/
[2]: https://uptimeinstitute.com/
[3]: http://www.zdnet.com/article/move-to-cloud-accelerating-faster-than-thought-survey-finds/
[4]: http://www.zdnet.com/article/rethinking-capex-and-opex-in-a-cloud-centric-world/
[5]: https://aws.amazon.com/
[6]: https://cloudstack.apache.org/
[7]: https://www.rackspace.com/en-us
[8]: https://cloud.google.com/
[9]: http://www.openstack.org/
[10]: http://www.zdnet.com/article/linux-foundation-finds-enterprise-linux-growing-at-windows-expense/
[11]: http://news.microsoft.com/bythenumbers/azure-virtual
[12]: http://www.zdnet.com/article/microsoft-nearly-one-in-three-azure-virtual-machines-now-are-running-linux/
[13]: http://www.zdnet.com/article/microsofts-q3-azure-commercial-cloud-strong-but-earnings-revenue-light/
[14]: http://www.zdnet.com/article/why-microsoft-is-turning-into-an-open-source-company/
[15]: http://www.zdnet.com/article/new-docker-betas-for-azure-windows-10-now-available/
[16]: http://www.docker.com/

