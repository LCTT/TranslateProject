CentOS vs Ubuntu：哪个对服务器更好？
============================================================

![](https://thishosting.rocks/wp-content/uploads/2017/01/centos-vs-ubuntu.jpg.webp)

已经决定买一个VPS，但还不能决定使用哪个 Linux 发行版？我们都经历过。在考虑到了所有的发行版后，即使对 Linux 发行版而言，这个[_决定_][3]甚至可能是压倒性的。虽然两个最广泛使用和最流行的服务器发行版是 CentOS 和 Ubuntu。这是管理员、初学者和专业人士之间的主要困境。有了（和更多）发行版的经验，我们决定在用于服务器时比较 CentOS 和 Ubuntu。

### 快速浏览

| ![CentOS](https://thishosting.rocks/wp-content/uploads/2017/01/centos-logo-50.png.webp) CentOS | ![Ubuntu](https://thishosting.rocks/wp-content/uploads/2017/01/ubuntu-logo-50.png.webp) Ubuntu |
| --- | --- |
| 基于 Red Hat Linux Enterprise | 基于 Debian |
| 更少频率更新 | 经常更新 |
| 可以更稳定和更安全，因为不经常更新。 | 更新的软件包可能不稳定，不安全，这是不可能的，因为他们在推出正式发布前进行了大量测试。 |
| 没有足够的教程和更小的用户群 | 丰富的文档，活跃的社区和大量的在线教程|
| 对初学者困难，因为没有流行和广泛使用的基于 Red Hat 桌面发行版| 更容易为已经熟悉桌面版 Ubuntu 的初学者使用|
| 支持 cPanel | 不支持 cPanel |
| .rpm 软件包和 “yum” 软件包管理器 | .deb 软件包和 “apt-get” 软件包管理器 |
| 在 [DigitalOcean][1] 免费试用 CentOS 服务器 | 在[DigitalOcean][2] 免费试用 Ubuntu 服务器 |

### 哪个对新手更好？

Ubuntu。一如往常那样，它高度取决于你的需求和以前的经验，但一般来说，Ubuntu 是初学者的更好的选择。主要是因为这两个原因：

*   Ubuntu有一个庞大的社区，随时可以免费提供帮助。我指的是真正的大。数以千计的用户在数百个不同的在线论坛和组内。甚至有现实生活中的大会。你仍然可以为 CentOS 找到很多教程和帮助，特别是对于简单的 LAMP 栈和流行的应用程序而言。
*   Ubuntu 服务器对于以前使用过 Ubuntu 桌面的人来说会容易得多。 CentOS 和 Fedora 也是如此，但是 Ubuntu 桌面版比任何其他基于 Linux 的家庭版本更受欢迎。

所以，如果你是一个初学者，而且没有任何特殊要求，那就去使用 Ubuntu 服务器。 更好的是，如果你从一个[便宜的托管服务提供商][4]那购买服务，你可以在你的服务器上进行实验，还有一个[专业的 24/7 支持团队][7]准备好帮助你。

### 哪个在商业上更好？

CentOS。再说一次，你仍然可以使用 Ubuntu 作为商业网站或公司内部服务器，但 CentOS 有它的优势：

*   CentOS（可以说）更稳定以及更安全。由于 CentOS 的更新频率较低，这意味着软件测试的时间更长，并且只有真正稳定的版本才会得到发布。如果你使用 CentOS，你不会在一个新的有 bug 版本的应用程序得到任何稳定性问题，因为你不会得到那个新的有 bug 的版本。
*   大多数控制面板（包括最受欢迎的控制面板 - cPanel）仅支持CentOS。所以这意味着如果你是一个网络托管公司，或者如果你是一个有很多客户的网络代理，并且需要一个控制面板 - CentOS 是一个更好的选择。

### 尝试一下它们并选择一个

如果你还是不能决定，你可以免费试试它们。你可以在本地安装或使用 live 镜像。你还可以从 [Vultr][6] 和 [DigitalOcean][7] 买到便宜的 VPS（$5/月）。你可以在几秒钟内启动 CentOS/Ubuntu 服务器。当你通过推广链接（如我们的）注册，你可能会得到免费金额 - 这意味着你会真的可以免费试用。

### 哪个更快？

它们在速度方面是相同的。它们和在你的硬件上运行一样快。它们将与你配置它们一样快。不管怎样，你都应该正确配置并且保护所有的服务器、配置和应用程序。

你会使用哪个发行版？想告诉我们我们是怎样一群[这里插入发行版]的拥趸么？请随时留下评论。

--------------------------------------------------------------------------------

作者简介：

![](https://secure.gravatar.com/avatar/434d2dd9d04f6ef4952470e716b4d20c?s=80&d=retro&r=pg)

我的大多数 Linux 服务器部署都是针对企业客户端的，所以我对文章作者在引用 GUI 客户端版本中对任何服务器管理功能感到困惑。通常，即使在虚拟专用服务器（VPN）环境中，许多服务提供商也会在 CentOS、Ubuntu上或经常部署的 OpenSuse Leap 和 FreeBSD 10+ 服务器操作系统上使用 WebMin、VirtualAdmin 或类似工具作为控制面板。

CentOS 在许多业务程序以及高级网络/虚拟化和云计算环境方面具有优于 Ubuntu 的优势，并且 CentOS 充分利用 SELinux 框架用于加强的安全层，目前在 Ubuntu 中不可用（或不容易）。

这种类型的比较通常是多余的，因为几乎总是有特定的和细微的要求和服务器实现的需求，将决定哪个发行版具有更多的优势或目的 - 基于技术专家/托管公司的专业知识和广泛的经验。

--------------------------------------------------------------------------------

via: https://thishosting.rocks/centos-vs-ubuntu-server/

作者：[W. Anderson][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks/centos-vs-ubuntu-server/
[1]:https://thishosting.rocks/go/digitalocean/
[2]:https://thishosting.rocks/go/digitalocean/
[3]:https://thishosting.rocks/how-to-choose-web-hosting/
[4]:https://thishosting.rocks/best-cheap-managed-vps/
[5]:https://thishosting.rocks/support/
[6]:https://thishosting.rocks/go/vultr/
[7]:https://thishosting.rocks/go/digitalocean/
