[#]: subject: "How I manage my own virtual network with ZeroTier"
[#]: via: "https://opensource.com/article/22/5/zerotier-network"
[#]: author: "Kevin Sonney https://opensource.com/users/ksonney"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我如何用 ZeroTier 管理自己的虚拟网络
======
ZeroTier 是一个加密的虚拟网络主干，允许多台机器像在一个网络上一样通信。

![Person drinking a hat drink at the computer][1]
（图片由： [Jonas Leupe][2] 发布于 [Unsplash][3]）

*自动化是现在的一个热门话题。在我作为网站可靠性工程师（SRE）的日常工作中，我的部分职责是将尽可能多的重复性任务自动化。但是我们当中有多少人在日常生活、非工作生活中这样做呢？ 今年，我专注于自动化工作，以便我们可以专注于重要的事情。*

在实现一切自动化的同时，我遇到了一些远程站点的困难。我不是一个网络专家，所以我开始研究我的选择。在研究了各种虚拟专用网络（VPN）、硬件端点、防火墙规则以及支持多个远程站点的所有东西后，我感到困惑、暴躁，并对这一切的复杂性感到沮丧。

然后我发现了 [ZeroTier][4]。ZeroTier 是一个加密的虚拟网络主干，允许多台机器像在一个网络上一样通信。代码全部是开源的，你可以自行托管控制器，或者使用 [ZeroTierOne][5] 服务，有免费或付费计划。我现在使用的是它们的免费计划，它很强大、稳固，而且非常稳定.

因为我使用的是网络服务，所以我不打算详细介绍运行控制器和根服务。ZeroTier 在他们的[文档][6]中对如何做到这一点有完整的参考，而且非常好。

在 Web 用户界面中创建了我自己的虚拟网络之后，客户端的安装几乎是微不足道的。ZeroTier 有 APT、RPM、FreeBSD 和许多其他平台的软件包，所以让第一个节点上线不需要什么努力。

安装完毕后，客户端就会连接到控制器服务，并为节点生成一个唯一的 ID。在 Linux 上，你使用 `zerotier-cli` 命令来加入一个网络，使用 `zerotier-cli join NETWORKID` 命令：

```
$ sudo zerotier-cli info
200 info 469584783a 1.x.x ONLINE
```

你也可以使用 `zerotier-cli` 来获得连接和可用节点的列表，改变网络设置，并离开网络。

![Image of Setting up a New Node][7]
（图片由：Kevin Sonney，CC BY-SA 4.0）

在加入一个网络后，你必须批准该节点的访问，可以通过网络控制台或调用应用程序编程接口（API）。这两种方法在 ZeroTier 网站上都有记录。连接两个节点后，无论你身在何处或位于防火墙的哪一侧，你都可以相互连接，就像你们在同一个建筑的同一个网络中。我的主要用例之一是[远程访问我的家庭助理设置][8]，而不需要打开防火墙端口或将其暴露在互联网上（关于我的家庭助理设置和相关服务的更多信息，见后文）。

我自己做的一件事是为内部 DNS 设置了一个 [Beta ZeroNDS 服务][9]。这为我管理自己的名称服务或为我所有的私人主机和 IP 地址创建公共记录节省了很多复杂性。我发现说明是非常直接的，并且能够在大约 5 分钟内为我的私人网络建立一个 DNS 服务器。每个客户必须允许 Zerotier 设置 DNS，这在 GUI 客户中非常简单。要使它在 Linux 客户端上使用，请使用：

```
$ sudo zerotier-cli setNETWORKID allowDNS=1
```

在你添加和删除主机时，不需要其他更新，它“就能工作”。

```
$ sudo zerotier-cli info
200 info 469584845a 1.x.y ONLINE
$ sudo zerotier-cli join
93afae596398153a 200 join OK
$ sudo zerotier-cli peers
200 peers
<ztaddr> <ver> <role> <lat> <link> <TX> <RX> <path>
61d294b9cb - PLANET 112 DIRECT 7946 2812 50.7.73.34/9993
62f865ae71 - PLANET 264 DIRECT 7946 2681 50.7.76.38/9993
778cde7190 - PLANET 61 DIRECT 2944 2901 103.195.13.66/9993
93afae5963 1.x LEAF 77 DIRECT 2945 2886 35.188.31.177/41848
992fcf1db7 - PLANET RECT 79124 DI47 2813 195. 181.173.159/9993
```

我只提到了它所有功能的表面。ZeroTier 还允许在 ZeroTier 网络之间建立桥接，高级路由规则等。它们甚至有一个 [Terraform provider][10] 和一个[很棒的 Zerotier 文章][11]清单。到今天为止，我正在使用 ZeroTier 连接四个物理站点的机器，其中三个在 NAT 防火墙后面。Zerotier 的设置很简单，而且管理起来几乎完全不费力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/zerotier-network

作者：[Kevin Sonney][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://github.com/zerotier
[5]: https://www.zerotier.com/pricing
[6]: https://docs.zerotier.com
[7]: https://opensource.com/sites/default/files/2022-04/SecondDay02-2.png
[8]: https://opensource.com/article/22/5/remote-home-assistant
[9]: https://github.com/zerotier/zeronsd
[10]: https://github.com/zerotier/terraform-provider-zerotier
[11]: https://github.com/zerotier/awesome-zerotier
