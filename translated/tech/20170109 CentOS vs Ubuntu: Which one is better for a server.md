CentOS 与 Ubuntu：哪个更适合做服务器？
============================================================

![](https://thishosting.rocks/wp-content/uploads/2017/01/centos-vs-ubuntu.jpg.webp)

已经决定买一台虚拟服务器，但还不能决定使用哪个 Linux 发行版？我们都经历过这种困扰。对于 Linux 发行版来说，要在这么多的发行版和种种支流（flavors）中选择一个，那简直能让人崩溃。不过，对于服务器而言，有两个主流的 Linux 发行版，那就是 CentOS 和 Ubuntu。但如何从这两个之中选择，这是摆在管理员、初学者和专业人士面前的主要问题。在对这两个（和更多）发行版有了一定的经验之后，我们决定对这两个发行版用于服务器时做个比较。

### 概览

| ![CentOS](https://thishosting.rocks/wp-content/uploads/2017/01/centos-logo-50.png.webp) CentOS | ![Ubuntu](https://thishosting.rocks/wp-content/uploads/2017/01/ubuntu-logo-50.png.webp) Ubuntu |
| --- | --- |
| 基于 Red Hat Linux Enterprise | 基于 Debian |
| 更新频度较少 | 经常更新 |
| 更稳定和更安全一些，因为不经常更新。 | 更新的软件包可能不稳定，不安全？不会，因为他们在发布到正式版本前进行了大量测试。 |
| 没有足够的教程和用户群较少（LCTT 译注：可能是由于国内外情况不同，在国内，相对 Ubuntu 来说，人们更喜欢用 CentOS 做服务器） | 丰富的文档，活跃的社区和大量的在线教程|
| 对初学者困难，因为基于 Red Hat 桌面发行版不流行 | 更容易为已经熟悉桌面版 Ubuntu 的初学者使用|
| 支持 cPanel | 不支持 cPanel |
| .rpm 软件包和 “yum” 软件包管理器 | .deb 软件包和 “apt-get” 软件包管理器 |
| 在 [DigitalOcean][1] 免费试用 CentOS 服务器 | 在[DigitalOcean][2] 免费试用 Ubuntu 服务器 |

### 哪个更适合新手？

Ubuntu。

一如往常那样，它主要取决于你的需求和以前的经验，但一般来说，Ubuntu 对于初学者来说是更好的选择。主要是因为这两个原因：

* Ubuntu 有一个庞大的社区，随时可以免费提供帮助。我指的是真正的大。数以千计的用户分布在数百个不同的在线论坛和兴趣组内。甚至有现实生活中的大会。你也可以为 CentOS 找到很多教程和帮助，特别是对于简单的 LAMP 栈和流行的应用程序而言。
* Ubuntu 服务器对于以前使用过 Ubuntu 桌面的人来说会容易得多。同样的情况也存在于 CentOS 和 Fedora 之间，但是 Ubuntu 桌面版比任何其他基于 Linux 的家用桌面更受欢迎。

所以，如果你是一个初学者，而且没有任何特殊要求，那就去使用 Ubuntu 服务器。 更好的是，你可以从一个[便宜的托管服务提供商][4]那购买服务，这样你就可以在你的服务器上进行实验，还有一个[专业的 24/7 支持团队][7]准备好帮助你。

### 哪个更适合商用？

CentOS。

同样，你仍然可以使用 Ubuntu 作为商用网站或公司内部服务器，但 CentOS 有它的优势：

* CentOS（可以说）更稳定以及更安全。由于 CentOS 的更新频率较低，这意味着软件测试的时间更长，并且只有真正稳定的版本才会得到发布。如果你使用 CentOS，你不会因新的有 bug 的应用程序版本而遇到任何稳定性问题，因为你不会得到那个新的有 bug 的版本。
* 大多数控制面板（包括最受欢迎的控制面板 - cPanel）仅支持 CentOS。所以这意味着如果你是一个网站托管公司，或者如果你是一个有很多客户的网站服务代理商，并且需要一个控制面板 - CentOS 是一个更好的选择。

### 尝试一下它们并选择一个

如果你还是不能决定，你可以免费试试它们。你可以在本地安装或使用 live 镜像。你还可以从 [Vultr][6] 和 [DigitalOcean][7] 这样的地方买到便宜的 VPS（$5/月）。你可以在几秒钟内启动 CentOS/Ubuntu 服务器。当你通过推广链接（如我们的）注册，你可能会得到免费金额 - 这意味着你会真的可以免费试用。

### 哪个更快？

它们在速度方面是相同的。它们和运行在你自己的硬件上一样快。它们将如你配置的一样快。不管怎样，你都应该正确配置并且保护所有的服务器、配置和应用程序。

你会使用哪个发行版？想告诉我们你是哪个发行版的拥趸么？请随时留下评论。

--------------------------------------------------------------------------------

**文末评论**

W. Anderson：

> 我的大多数 Linux 服务器部署都是针对企业客户的，所以我对文章作者以 GUI 客户端版本来反映任何服务器的管理功能感到困惑。通常，许多服务提供商也会在 CentOS、Ubuntu，或经常部署的 OpenSuse Leap 和 FreeBSD 10+ 服务器操作系统上提供 WebMin、VirtualAdmin 或类似工具作为控制面板，即使是在虚拟专用服务器（VPS）环境中。

> CentOS 在许多商业应用以及高级网络/虚拟化和云计算环境方面具有明显优于 Ubuntu 的优势，并且 CentOS 充分利用 SELinux 框架用于加强的安全层，而目前在 Ubuntu 中则不可用（或不容易）。

> 这种类型的比较通常是多余的，因为几乎总是有特定的和细微的要求，和需要服务器实现的需求，这将决定哪个发行版具有更多的优势或用途 - 基于技术专家/托管公司的专业知识和广泛的经验。

VAN DER BEKEN：

> 正确的比较应该是对 Debian 和 CentOS 进行比较。

> 以我的经验，我使用 CentOS 和 Debian 作为服务器，稍微偏爱 Debian 一点点，因为它的社区。

--------------------------------------------------------------------------------

via: https://thishosting.rocks/centos-vs-ubuntu-server/

作者：[W. Anderson][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks/centos-vs-ubuntu-server/
[1]:https://thishosting.rocks/go/digitalocean/
[2]:https://thishosting.rocks/go/digitalocean/
[3]:https://thishosting.rocks/how-to-choose-web-hosting/
[4]:https://thishosting.rocks/best-cheap-managed-vps/
[5]:https://thishosting.rocks/support/
[6]:https://thishosting.rocks/go/vultr/
[7]:https://thishosting.rocks/go/digitalocean/
