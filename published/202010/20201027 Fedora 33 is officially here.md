[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12764-1.html)
[#]: subject: (Fedora 33 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-33/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 33 正式发布了
======

![][1]

> 本文译自 Fedora 官方发布公告。

今天，我很兴奋地与大家分享数千名 Fedora 项目贡献者辛勤工作的成果：我们的最新版本 Fedora 33 来了! 这是一个有着很多变化的大版本，但我相信所有这些工作也会让您感到舒适，实现我们的目标：即为您带来最新的稳定、强大、健壮的自由和开源软件，并提供许多易于使用的产品。 

如果您不想耽误时间，直接体验，现在就去 <https://getfedora.org/> 下载吧，欲了解详情请继续阅读！

### 找到适合您的 Fedora 风味！

Fedora Edition 是针对桌面、服务器和云环境中各种“体现”特定用途的目标产品，现在它也适用于物联网。

Fedora Workstation 专注于桌面，尤其是面向那些想要“只管去用”的 Linux 操作系统体验的软件开发者。这个版本的特点是 [GNOME 3.38][2]，它一如既往地有很多很棒的改进。新增的 Tour 应用可以帮助新用户学习它们的操作方式。和我们所有其他面向桌面的变体一样，Fedora Workstation 现在使用 [BTRFS 作为默认文件系统][3]。这些发布的版本中带来了很多伟大的增强功能，这个先进的文件系统为之奠定了基础。为了您的视觉享受，Fedora 33 Workstation 现在默认提供了一个动画背景（它会基于一天中的时间变化）。

Fedora CoreOS 是一个新兴的 Fedora 版本。它是一个自动更新的、最小化的操作系统，用于安全地、大规模地运行容器化工作负载。它提供了几个[更新流][4]，可以遵循大致每两周一次的自动更新。目前 **next** 流是基于 Fedora 33 的，**testing** 和 **stable** 流后继也会跟进。您可以从[下载页面][5]中找到关于跟随 **next** 流发布的工件的信息，并在 [Fedora CoreOS 文档][6]中找到关于如何使用这些工件的信息。

新晋升为 Edition 状态的 [Fedora IoT][7]，为物联网生态系统和边缘计算用例提供了坚实的基础。在许多功能之外，Fedora 33 IoT 还引入了<ruby>平台抽象安全<rt>Platform AbstRaction for SECurity</rt></ruby>（PARSEC），这是一个开源倡议，以平台无关的方式为硬件安全和加密服务提供了通用 API。

当然，我们制作的不仅仅是“官方版本”，还有 [Fedora Spin][8]和 [Lab][9]。[Fedora Spin][8] 和 [Lab][9] 针对不同的受众和用例，包括 [Fedora CompNeuro][10]，它为神经科学带来了大量的开源计算建模工具，以及 [KDE Plasma][11] 和 [Xfce][12]等桌面环境。 

此外，别忘了我们还有备用架构：[ARM AArch64、Power 和 S390x][13]。在 Fedora 33 中提供的新功能，AArch64 用户可以使用 .NET Core 语言进行跨平台开发。我们改进了对 Pine64 设备、NVidia Jetson 64 位平台以及 Rockchip 片上系统（SoC）设备的支持，包括 Rock960、RockPro64 和 Rock64。（不过，有个最新的说明：在其中一些设备上可能会出现启动问题。从现有的 Fedora 32 升级是没问题的。更多信息将在[常见错误][14]页面上公布。）

我们也很高兴地宣布，Fedora 云镜像和 Fedora CoreOS 将首次与 Fedora 33 一起在亚马逊的 [AWS 市场][15] 中提供。Fedora 云镜像在亚马逊云中已经存在了十多年，您可以通过 AMI ID 或[点击一下][16]来启动我们的官方镜像。该市场提供了获得同样东西的另一种方式，显著扩大了 Fedora 的知名度。这也将使我们的云镜像可以更快地在新的 AWS 区域中可用。特别感谢 David Duncan 让这一切成为现实！

### 常规改进

无论您使用的是哪种版本的 Fedora，您都会得到开源世界提供的最新版本。遵循我们的 [First][17] 原则，我们更新了关键的编程语言和系统库包，包括 Python 3.9、Ruby on Rails 6.0 和 Perl 5.32。在 Fedora KDE 中，我们沿用了 Fedora 32 Workstation 中的工作，默认启用了 EarlyOOM 服务，以改善低内存情况下的用户体验。

为了让 Fedora 的默认体验更好，我们将 nano 设置为默认编辑器。nano 是一个对新用户友好的编辑器。当然，那些想要像 vi 这样强大的编辑器的用户可以自己设置默认编辑器。

我们很高兴您能试用新版本! 前往 <https://getfedora.org/> 并立即下载它。或者如果您已经在运行 Fedora 操作系统，请按照这个简单的[升级说明][18]进行升级。关于 Fedora 33 新特性的更多信息，请参见[发布说明][19]。

### 关于安全启动的说明

<ruby>安全启动<rt>Secure Boot</rt></ruby>是一种安全标准，它确保只有官方签署的操作系统软件才能加载到您的计算机上。这对于防止持久恶意软件非常重要，因为这些恶意软件可能会隐藏在您的计算机固件中，甚至在重新安装操作系统时也能存活。然而，在 [Boot Hole][20] 漏洞发生后，用于签署 Fedora <ruby>引导加载器<rt>Bootloader</rt></ruby>软件的加密证书将被撤销，并被新的证书取代。由于这将产生大范围的影响，撤销应该要到 2021 年第二季度或更晚才会广泛推行。

然而，一些用户可能已经从其他操作系统或固件更新中收到了这种撤销。在这种情况下，Fedora 将不能在启用了安全启动时进行安装。要说明的是，这不会影响大多数用户。如果它确实影响到了您，您可以暂时禁用安全启动。我们会在大范围的证书撤销之前发布一个用新证书签署的更新，在所有支持的版本上都可以使用，到那时，安全启动应该可以重新启用。

### 万一出现问题时……

如果您遇到问题，请查看 [Fedora 33 常见错误][14]页面；如果您有疑问，请访问我们的 [Ask Fedora][21] 用户支持平台。

### 谢谢大家

感谢在这个发布周期中为 Fedora 项目做出贡献的成千上万的人，尤其是那些在疫情大流行期间为使这个版本准时发布而付出额外努力的人。Fedora 是一个社区，很高兴看到我们如此互相支持。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-33/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/f33-final-816x345.jpg
[2]: https://www.gnome.org/news/2020/09/gnome-3-38-released/
[3]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[4]: https://docs.fedoraproject.org/en-US/fedora-coreos/update-streams/
[5]: https://getfedora.org/en/coreos/download?stream=next
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[7]: https://getfedora.org/iot
[8]: https://spins.fedoraproject.org/
[9]: https://labs.fedoraproject.org/
[10]: https://labs.fedoraproject.org/en/comp-neuro/
[11]: https://spins.fedoraproject.org/en/kde/
[12]: https://spins.fedoraproject.org/en/xfce/
[13]: https://alt.fedoraproject.org/alt/
[14]: https://fedoraproject.org/wiki/Common_F33_bugs
[15]: https://aws.amazon.com/marketplace
[16]: https://getfedora.org/en/coreos/download?tab=cloud_launchable&stream=stable
[17]: https://docs.fedoraproject.org/en-US/project/#_first
[18]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[19]: https://docs.fedoraproject.org/en-US/fedora/f33/release-notes/
[20]: https://access.redhat.com/security/vulnerabilities/grub2bootloader
[21]: http://ask.fedoraproject.org
