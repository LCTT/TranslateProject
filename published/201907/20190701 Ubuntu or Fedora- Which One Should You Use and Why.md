[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11059-1.html)
[#]: subject: (Ubuntu or Fedora: Which One Should You Use and Why)
[#]: via: (https://itsfoss.com/ubuntu-vs-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

你应该选择 Ubuntu 还是 Fedora？
======

> 选择 Ubuntu 还是 Fedora？它们的区别是什么？哪一个更好？你应该使用哪一个？看看这篇对比 Ubuntu 和 Fedora 的文章吧。

[Ubuntu][1] 和 [Fedora][2] 都是最流行的 Linux 发行版之一，在两者之间做出选择实非易事。在这篇文章里，我会对比一下 Ubuntu 和 Fedora 的不同特点，帮助你进行决策。

请注意，这篇文章主要是从桌面版的角度进行对比的。Fedora 或者 Ubuntu 针对容器的特殊版本不会被考虑在内。

### Ubuntu vs Fedora: 哪一个更好？

![Ubuntu Vs Fedora][3]

不同 Linux 发行版之间的区别主要体现在以下几个方面：

  * 基础发行版（Debian、红帽、Arch，或者是从头做起）
  * 安装方式
  * 支持的桌面环境
  * 软件包管理、软件支持和更新
  * 硬件支持
  * 开发团队（由企业支持，还是由业余爱好者创建）
  * 发布周期
  * 社区和线上支持

下面我们来看一下 Ubuntu 和 Fedora 之间的相似之处和不同之处。掌握了这些信息之后，也许就更容易在两者之间做出选择了。

#### 安装方式

Ubuntu 的 Ubiquity 安装器是最好用的安装器之一。我认为这是让 Ubuntu 如此流行的重要原因之一，因为在 2004 年 Ubuntu 刚刚诞生的时候，安装 Linux 还是一个很庞大的工程。

Ubuntu 安装器可以让你在大约 10 分钟左右完成安装。大多数情况下，它还可以识别出机器里安装的 Windows 系统，并且只需要几下点击就可以实现 Ubuntu 和 Windows 的双系统启动。

锦上添花的是，在安装 Ubuntu 的过程中你还可以进行系统更新，或者是安装第三方编译码器。

![Ubuntu Installer][4]

Fedora 使用的是 Anaconda 安装器，拥有简单易用的界面，同样简化了安装过程。

![Fedora Installer | Image Credit Fedora Magazine][5]

Fodora 还提供了一个可以在 Windows 操作系统上下载并创建 Fedora live USB 的写入工具。不过我在大约两年前尝试使用它的时候并不成功，最后使用了一个常规的创建 live USB 的软件。

根据我的经验，安装 Ubuntu 要比安装 Fedora 容易一些。不过这并不是说安装 Fedora 有多困难，只是 Ubuntu 更简单而已。

#### 桌面环境

Ubuntu 和 Fedora 默认都使用 GNOME 桌面环境。

![GNOME Desktop in Fedora][6]

Fedora 使用的是原装的 GNOME 桌面，而 Ubuntu 则在此基础上做了个性化调整，让它看起来就像 Ubuntu 之前使用的 Unity 桌面环境。

![GNOME desktop customized by Ubuntu][7]

除了 GNOME，Ubuntu 和 Fedora 都提供了一些其它桌面环境的版本。

Ubuntu 有 Kubuntu、Xubuntu、Lubuntu 等版本，分别提供不同的桌面环境。虽然它们都是 Ubuntu 的官方版本，但是却不是由 Canonical 的 Ubuntu 团队直接开发的，而是由另外的团队开发。

Fedora 通过 [Fedora Spins][8] 的方式提供了一些不同桌面环境的版本。和 Kubuntu、Lubuntu 等版本不同的是，这些版本并非由独立团队开发，而是由 Fedora 核心团队开发的。

#### 软件包管理和可用软件数量

Ubuntu 使用 APT 软件包管理器提供软件并进行管理（包括应用程序、库，以及其它所需编解码器），而 Fedora 使用 DNF 软件包管理器。

[Ubuntu 拥有庞大的软件仓库][10]，能够让你轻松安装数以千计的程序，包括 FOSS（LCTT 译注：Free and Open-Source Software 的缩写，自由开源软件）和非 FOSS 的软件。Fedora 则只专注于提供开源软件。虽然这一点在最近的版本里有所转变，但是 Fedora 的软件仓库在规模上仍然比 Ubuntu 的要逊色一些。

一些第三方软件开发者为 Linux 提供像 .exe 文件一样可以点击安装的软件包。在 Ubuntu 里这些软件包是 .deb 格式的，在 Fedora 里是 .rpm 格式的。

大多数软件供应商都为 Linux 用户提供 DEB 和 RPM 文件，但是我也经历过供应商只提供 DEB 文件的情况。比如说 SEO 工具 [Screaming Frog][11] 就只提供 DEB 软件包。反过来，一个软件只有 RPM 格式但是没有 DEB 格式这种情况就极其罕见了。

#### 硬件支持

一般来说，Linux 在 WiFi 适配器和显卡的兼容性上容易出现问题，Ubuntu 和 Fedora 都受此影响。以 Nvidia 为例，它的 [开源驱动程序 Nouveau 经常会引发系统启动时假死机之类的问题][12]。

在 Ubuntu 上你可以轻松安装专有驱动程序作为补充。在很多情况下，这样可以获得对硬件更好的支持。

![Installing proprietary driver is easier in Ubuntu][13]

Fedora 则坚持使用开源软件，所以在 Fedora 上安装专有驱动程序就比较困难了。

#### 线上支持和用户群

Ubuntu 和 Fedora 都通过社区论坛提供了很好的线上支持。Ubuntu 主要有两个论坛：[UbuntuForums][14] 和 [Ask Ubuntu][15]。Fedora 主要的论坛则是 [Ask Fedora][16]。

就用户群体而言，Fedora 有着庞大的用户数量。不过 Ubuntu 更为流行，用户数量甚至更为庞大。

Ubuntu 的流行催生了很多专注于 Ubuntu 的网站和博客。所以相比 Fedora，你可以得到更多关于 Ubuntu 的故障排除指导和学习材料。

#### 发布周期

Fedora 每六个月发布一个新版本，每个版本有九个月的支持周期。也就是说，你必须在六个月到九个月之间进行一次系统升级。进行 Fedora 版本升级并不是一件困难的事情，但是需要良好的网络连接。并非所有人都喜欢每九个月进行一次 1.5 GB 的版本升级。

Ubuntu 有两种版本：常规发布版本和长期支持（LTS）发布版本。常规版本和 Fedora 比较类似，每隔六个月发布一次，有九个月的支持周期。

而长期支持发布版本则每两年发布一次，有五年的支持周期。常规发布版本探索新功能特性和新的软件版本，而长期支持发布版本则支持旧版本软件。对于不喜欢经常改变、青睐稳定性的人来说，这是一个很好的选择。

#### 强大的基础发行版

Ubuntu 是基于 [Debian][17] 发行版的。Debian 是最大的社区项目之一，并且也是 [自由软件][18] 世界里最受尊敬的项目之一。

Fedora 则是红帽公司的一个社区项目。红帽公司是一个专注于 Linux 发行版的公司。Fedora 充当了一个“试验田”的角色（用技术术语来说叫做“上游”），用来在红帽企业级 Linux 发布新功能之前对这些新功能进行试验。

#### 在背后支持的企业

Ubuntu 和 Fedora 都有来自母公司的支持。Ubuntu 源自 [Canonical][21] 公司，而 Fedora 源自 [红帽公司][22]（现在是 [IBM 的一部分][23]）。背后企业的支持非常重要，因为可以确保 Linux 发行版良好的维护。

有一些发行版是由一群独立的业余爱好者们共同创建的，但是在工作压力之下经常会结束。你也许见过一些还算比较流行的发行版项目仅仅是因为这个原因而终止了。很多这样的发行版由于开发者没有足够的业余时间可以投入到项目上而不得不终止，比如 [Antergos][24] 和 Korora。

Ubuntu 和 Fedora 的背后都有基于 Linux 的企业的支持，这让它们比其它独立的发行版更胜一筹。

#### Ubuntu vs Fedora：服务端

到目前为止，我们在 Ubuntu 和 Fedora 之间的对比主要都集中在桌面端。不过如果不考虑一下服务端的话，对 Linux 的讨论就不能算是完整的。

![Ubuntu Server][25]

Ubuntu 不仅在桌面端很流行，在服务端也有很强的存在感。如果你能够在桌面端熟练使用 Ubuntu，那么也不会对 Ubuntu 服务器版本感到陌生。我就是从使用 Ubuntu 桌面端开始的，现在我的网站都运行在 Ubuntu 服务器上。

Fedora 同样有服务端版本，并且也有人在使用。但是大多数系统管理者不会喜欢一个每九个月就需要重启升级的服务器。

学习 Fedora 可以更好地帮助你使用红帽企业级 Linux（RHEL）。RHEL 是一个付费产品，你需要购买订阅才可以使用。如果你希望在服务器上运行一个和 Fedora 或者红帽类似的操作系统，我推荐使用 CentOS。[CentOS][26] 同样是红帽公司附属的一个社区项目，但是专注于服务端。

### 结论

你可以看到，Ubuntu 和 Fedora 有很多相似之处。不过就可用软件数量、驱动安装和线上支持来说，Ubuntu 的确更有优势。**Ubuntu 也因此成为了一个更好的选择，尤其是对于没有经验的 Linux 新手而言。**

如果你想要熟悉红帽的话，Fedora 是一个很好的开始。如果你对 Linux 有一定经验，或者是只想要使用开源软件，Fedora 就是一个很棒的选择。

最终还是需要你自己来决定是使用 Fedora 还是 Ubuntu。我会建议为两个发行版分别创建一个 live USB，并且在虚拟机上体验一下。

你对于 Ubuntu vs Fedora 的看法是什么呢？你更喜欢哪一个发行版，为什么？在评论里分享你的看法吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-vs-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://getfedora.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/ubuntu-vs-fedora.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/03/install-linux-inside-windows-10.jpg?resize=800%2C479&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/fedora-installer.png?resize=800%2C598&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnome-desktop-fedora.png?resize=800%2C450&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/applications_menu.jpg?resize=800%2C450&ssl=1
[8]: https://spins.fedoraproject.org/
[9]: https://itsfoss.com/system-76-galago-pro/
[10]: https://itsfoss.com/ubuntu-repositories/
[11]: https://www.screamingfrog.co.uk/seo-spider/#download
[12]: https://itsfoss.com/fix-ubuntu-freezing/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/software_updates_additional_drivers_nvidia.png?resize=800%2C523&ssl=1
[14]: https://ubuntuforums.org/
[15]: https://askubuntu.com/
[16]: https://ask.fedoraproject.org/
[17]: https://www.debian.org/
[18]: https://www.fsf.org/
[19]: https://en.wikipedia.org/wiki/Upstream_(software_development)
[20]: https://itsfoss.com/manage-startup-applications-ubuntu/
[21]: https://canonical.com/
[22]: https://www.redhat.com/en
[23]: https://itsfoss.com/ibm-red-hat-acquisition/
[24]: https://itsfoss.com/antergos-linux-discontinued/
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/ubuntu-server.png?resize=800%2C232&ssl=1
[26]: https://centos.org/
