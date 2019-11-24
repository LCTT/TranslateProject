[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11608-1.html)
[#]: subject: (What you need to know to be a sysadmin)
[#]: via: (https://opensource.com/article/19/7/be-a-sysadmin)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

你需要知道什么才能成为系统管理员？
======

> 通过获得这些起码的能力，开始你的系统管理员职业。

![](https://img.linux.net.cn/data/attachment/album/201911/24/103900w5m09jyyyeyrnovu.jpg)

昔日的系统管理员整天都在调教用户和摆弄服务器，一天的时间都奔波在几百米长的电缆之间。随着云计算、容器和虚拟机的复杂性的增加，而今依然如此。

以外行人来看，很难准确确定系统管理员的确切职能，因为他们在许多地方都扮演着一个不起眼的角色。没人能在培训中知道自己工作中所需要的一切知识，但是每个人其实都需要一个坚实的基础。如果你想走上系统管理的道路，那么这是你个人自学或在正式培训中应重点关注的内容。

### Bash

当你学习 Bash Shell 时，你学习的不仅是 Bash Shell，你学习的也是 Linux、BSD、MacOS 甚至Windows（在适当条件下）的通用界面。你将了解语法的重要性，因此可以快速适应思科路由器的命令行或微软 PowerShell 等系统，最终你甚至可以学习更强大的语言，如 Python 或 Go。而且，你还会开始进行程序性思考，以便可以分析复杂的问题并将其分解为单个组件，这很关键，因为这就是系统（例如互联网、组织的内部网、Web 服务器、备份解决方案）是如何设计的。

不止于此，还有更多。

由于最近 DevOps 和[容器][2]的发展趋势，了解 Bash shell 变得尤为重要。你的系统管理员职业可能会将你带入一个视基础设施为代码的世界，这通常意味着你必须了解脚本编写的基础知识、[基于 YAML][3]配置的结构，以及如何与[容器][5]（运行在[沙盒文件][6]内部的微型 Linux 系统）[交互][4]。你会知道 Bash 是高效管理激动人心的开源技术的门户，因此请进入 [Bash][7] 世界吧。

#### 资源

有很多方法可以在 Bash shell 中进行练习。

尝试一下[便携式 Linux 发行版][8]。你无需安装 Linux 即可使用 Linux，因此，请拿一块闲置的 U 盘，花个晚上或周末的空闲时光，来适应基于文本的界面。

这里有[几篇很棒的][10] [Bash 文章][9]。

要注意的是 Bash 练习的关键在于要练习，你必须有要做的练习才行。而且，在你知道如何使用 Bash 之前，你可能不知道该练习什么。如果是这样，请去 Over The Wire 玩一下 [Bandit][11] 游戏。这是一款针对绝对初学者的游戏，具有 34 个级别的交互式基本技巧，可让你熟悉 Linux shell。

### Web 服务器设置

一旦你习惯了 Bash，你应该尝试设置一个 Web 服务器。并不是所有的系统管理员都会四处设置 Web 服务器甚至维护 Web 服务器，但是你在安装和启动 HTTP 守护程序、配置 Apache 或 Nginx，设置[正确权限][12]和[配置防火墙][13]时所掌握的技能是你每天都需要使用的技能。经过一些努力，你可能会开始注意到自己的某些工作模式。在尝试管理可用于生产环境的软件和硬件之前，你可能认为某些概念是理所当然的，而你在成为新手的管理员角色时，将不再受到它们的影响。起初这可能会令人沮丧，因为每个人都喜欢在自己做好所做的事情，但这实际上是一件好事。让自己接触新技能，那就是你学习的方式。

此外，你在第一步中付出的努力越多，最终当你在默认的 index.html 上看到胜利的“it works!”就越甜蜜！

#### 资源

David Both 撰写了有关 [Apache Web 服务器][14]配置的出色文章。值得一提的是，请逐步阅读他的后续文章，其中介绍了如何在一台计算机上[托管多个站点][15]。

### DHCP

动态主机配置协议（DHCP）是为网络上的设备分配 IP 地址的系统。在家里，ISP（互联网服务提供商）支持的调制解调器或路由器可能内置了 DHCP 服务器，因此可能不在你的权限范围内。如果你曾经登录家用路由器来调整 IP 地址范围或为某些网络设备设置了静态地址，那么你至少对该概念有所了解。你可能会将其理解为对网络上的设备分配了一种 IP 地址形式的电话号码，并且你可能会意识到计算机之间通过广播发送到特定 IP 地址的消息彼此进行通信。消息标头由路径上的路由器读取，每个消息标头都将消息定向到路径上的第二个逻辑路由器，以达到其最终目标。

即使你了解了这些概念，要从对 DHCP 的基本了解再进一步是架设 DHCP 服务器。安装和配置自己的 DHCP 服务器可能会导致家庭网络中的 DHCP 冲突（如果可以的话，请尽量避免这样做，因为它肯定会干掉你的网络，直到解决为止），要控制地址的分配、创建子网，并监控连接和租赁时间。

更重要的是，设置 DHCP 并尝试不同的配置有助于你了解网络之间的关系。你会了解网络如何在数据传输中表示“分区”，以及必须采取哪些步骤才能将信息从一个网络传递到另一个。这对于系统管理员来说至关重要，因为网络肯定是工作中最重要的方面之一。

#### 资源

在运行自己的 DHCP 服务器之前，请确保家庭路由器（如果有）中的 DHCP 服务器处于非活动状态。一旦启动并运行了 DHCP 服务器，请阅读 Archit Modi 的[网络命令指南][16]，以获取有关如何探索网络的提示。

### 网络电缆

这听起来很普通，但是熟悉网络电缆的工作方式不仅使你的周末变得非常有趣，而且还使你对数据是如何通过缆线的得到了全新的了解。最好的学习方法是去当地的业余爱好商店并购买五类线剥线钳和压线钳以及一些五类线水晶头。然后回家，拿一根备用的以太网电缆，切断水晶头，花一些时间重新制作网线接头，将电缆重新投入使用。

解决了这个难题后，请再做一次，这次创建一条有效的[交叉电缆][17]。

你现在应该还在沉迷于有关电缆管理。如果你有些强迫症，喜欢沿着地板线或桌子的边缘整齐地排列电缆，或者将电缆绑在一起以保持它们的整齐有序，那么就可以使自己免受永久混乱的电缆困扰。你一开始可能不会理解这样做的必要性，但是当你第一次走进服务器机房时，你会马上知道原因。

### Ansible

[Ansible][18] 是配置管理软件，它在系统管理员和 DevOps 之间架起了一座桥梁。系统管理员使用 Ansible 来配置全新安装的操作系统并在计算机上维护特定的状态。DevOps 使用 Ansible 减少了在工具上花费的时间和精力，从而在开发上可以花费更多的时间和精力。作为系统管理员培训的一部分，你应该学习 Ansible，并着眼于 DevOps 实践，因为 DevOps 现在开创的大多数功能将最终成为将来系统管理中工作流的一部分。

Ansible 的好处是你可以立即开始使用它。它是跨平台的，并且可以向上和向下缩放。对于单用户计算机， Ansible 可能是小题大做，但是话又说回来，Ansible 可能会改变你启动虚拟机的方式，或者可以帮助你同步家庭或[家庭实验室][19]中所有计算机的状态。


#### 资源

阅读 Jay LaCroix 的[如何使用 Ansible 管理工作站配置][20]中的典型介绍，以轻松地在日常之中开始使用 Ansible。

### 破坏

由于用户的错误、软件的错误、管理员（就是你！）的错误以及许多其他因素，计算机上会出现问题。无法预测将要失败的原因，因此你的个人系统管理员培训制度的一部分应该是破坏你设置的系统，直到它们失败为止。你自己的实验室基础设施越是脆弱，发现弱点的可能性就越大。而且，你越是经常修复这些弱点，你对解决问题的能力就越有信心。

除了严格设置所有常见的软件和硬件之外，作为系统管理员的主要工作是查找解决方案。有时候，你可能会遇到职位描述之外的问题，甚至可能无法解决，但这完全取决于你的解决方法。

现在，你越多地折腾并努力加以解决，则以系统管理员的身份进行的准备就越充分。

你是系统管理员吗？你是否希望自己为更好的任务做好准备？在下面的评论中写下它们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/be-a-sysadmin

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://www.redhat.com/sysadmin/yaml-tips
[4]: https://opensource.com/article/19/6/how-ssh-running-container
[5]: https://opensource.com/resources/what-are-linux-containers
[6]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[7]: https://opensource.com/article/18/7/admin-guide-bash
[8]: https://opensource.com/article/19/6/linux-distros-to-try
[9]: https://opensource.com/tags/bash
[10]: https://www.redhat.com/sysadmin/managing-files-linux-terminal
[11]: http://overthewire.org/wargames/bandit
[12]: https://opensource.com/article/19/6/understanding-linux-permissions
[13]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[14]: https://opensource.com/article/18/2/how-configure-apache-web-server
[15]: https://opensource.com/article/18/3/configuring-multiple-web-sites-apache
[16]: https://opensource.com/article/18/7/sysadmin-guide-networking-commands
[17]: https://en.wikipedia.org/wiki/Ethernet_crossover_cable
[18]: https://opensource.com/sitewide-search?search_api_views_fulltext=ansible
[19]: https://opensource.com/article/19/6/create-centos-homelab-hour
[20]: https://opensource.com/article/18/3/manage-workstation-ansible
