2016：如何选择 Linux 桌面环境
=============================================

![](http://www.linux.com/images/stories/66866/DE-2.png)

Linux 创建了一个友好的环境，为我们提供了选择的可能。比方说，现代大多数的 Linux 发行版都提供不同桌面环境给我们来选择。在本文中，我将挑选一些你可能会在 Linux 中见到的最棒的桌面环境来介绍。

## Plasma

我认为，[KDE 的 Plasma 桌面](https://www.kde.org/workspaces/plasmadesktop/) 是最先进的桌面环境 (LCTT 译注：译者认为，没有什么是最好的，只有最合适的，毕竟每个人的喜好都不可能完全相同)。它是我见过功能最完善和定制性最高的桌面环境；在用户完全自主控制方面，即使是 Mac OS X 和 Windows 也无法与之比拟。

我爱 Plasma，因为它自带了一个非常好的文件管理器 —— Dolphin。而相对应 Gnome 环境，我更喜欢 Plasma 的原因就在于这个文件管理器。使用 Gnome 最大的痛苦就是，它的文件管理器——Files——使我无法完成一些基本任务，比如说，批量文件重命名操作。而这个操作对我来说相当重要，因为我喜欢拍摄，但 Gnome 却让我无法批量重命名这些图像文件。而使用 Dolphin 的话，这个操作就像在公园散步一样简单。

而且，你可以通过插件来增强 Plasma 的功能。Plasma 有大量的基础软件，如 Krita、Kdenlive、Calligra 办公套件、digiKam、Kwrite 以及由 KDE 社区开发维护的大量应用。

Plasma 桌面环境唯一的缺陷就是它默认的邮件客户端——Kmail。它的设置比较困难，我希望 Kmail 设置可以配置地址簿和日历。

包括 openSUSE 在内的多数主流发行版多使用 Plasma 作为默认桌面。

## GNOME

[GNOME](https://www.gnome.org/) (GNU Network Object Model Environment，GNU 网络对象模型环境) 由 [Miguel de Icaza](https://en.wikipedia.org/wiki/Miguel_de_Icaza) 和 Federico Mena 在 1997 年的时候创立，这是因为 KDE 使用了 Qt 工具包，而这个工具包是使用专属许可证 (proprietary license) 发布的。不像提供了大量定制的 KDE，GNOME 专注于让事情变得简单。因为其自身的简单性和易用性，GNOME 变得相当流行。而我认为 GNOME 之所以流行的原因在于，Ubuntu——使用 GNOME 作为默认桌面的主流 Linux 发行版之一——对其有着巨大的推动作用。

随着时代变化，GNOME 也需要作出相应的改变了。因此，开发者在 GNOME 3 中推出了 GNOME 3 Shell，从而引出了它的全新设计规范。但这同时与 Canonical 的 Ubuntu 计划存在者一些冲突，所以 Canonical 为 GNOME 开发了叫做 Unity 的自己的 Shell。最初，GNOME 3 Shell 因很多争议 (issues) 而困扰不已——最明显的是，升级之后会导致很多扩展无法正常工作。由于设计上的重大改版以及各种问题的出现，GNOME 便产生了很多分支（fork），比如 Cinnamon 和 Mate 桌面。

另外，使得 GNOME 让人感兴趣的是，它针对触摸设备做了优化，所以，如果你有一台触屏笔记本电脑的话，GNOME 则是最合适你这台电脑的桌面环境。

在 3.18 版本中，GNOME 已经作出了一些令人印象深刻的改动。其中他们所做的最让人感兴趣的是集成了 Google Drive，用户可以把他们的 Google Drive 挂载为远程存储设备，这样就不必再使用浏览器来查看里边的文件了。我也很喜欢 GNOME 里边自带的那个优秀的邮件客户端，它带有日历和地址簿功能。尽管有这么多些优秀的特性，但它的文件管理器使我不再使用 GNOME ，因为我无法处理批量文件重命名。我会坚持使用 Plasma，一直到 GNOME 的开发者修复了这个小缺陷。

![](http://www.linux.com/images/stories/66866/DE-fig1.png)

## Unity

从技术上来说，[Unity](https://unity.ubuntu.com/) 并不是一个桌面环境，它只是 Canonical 为 Ubuntu 开发的一个图形化 Shell。Unity 运行于 GNOME 桌面之上，并使用很多 GNOME 的应用和工具。Ubuntu 团队分支了一些 GNOME 组件，以便更好的满足 Unity 用户的需求。

Unity 在 Ubuntu 的融合（convergence）计划中扮演着重要角色， 在 Unity 8 中，Canonical 公司正在努力将电脑桌面和移动世界结合到一起。Canonical 同时还为 Unity 开发了许多的有趣技术，比如 HUD (Head-up Display，平视显示)。他们还在 lenses 和 scopes 中通过一种独特的技术来让用户方便地找到特定内容。

即将发行的 Ubuntu 16.04，将会搭载 Unity 8，那时候用户就可以完全体验开发者为该开源软件添加的所有特性了。其中最大的争议之一，Unity 可选取消集成了 Amazon Ads 和其他服务。而在即将发行的版本，Canonical 从 Dash 移除了 Amazon ads，但却默认保证了系统的隐私性。

## Cinnamon

最初，[Cinnamon](https://en.wikipedia.org/wiki/Cinnamon_(software\)) 由 [Linux Mint](http://www.linuxmint.com/) 开发 —— 这是 DistroWatch.com 上统计出来最流行的发行版。就像 Unity，Cinnamon 是 GNOME Shell 的一个分支。但最后进化为一个独立的桌面环境，这是因为 Linux Mint 的开发者分支了 GNOME 桌面中很多的组件到 Cinnamon，包括 Files ——以满足自身用户的需求。

由于 Linux Mint 基于普通版本的 Ubuntu，开发者仍需要去完成 Ubuntu 尚未完成的目标。结果，尽管前途光明，但 Cinnamon 却充满了 Bugs 和问题。随着 17.x 本版的发布，Linux Mint 开始转移到 Ubuntu 的 LTS 版本上，从而他们可以专注于开发 Cinnamon 的核心组件，而不必再去担心代码库。转移到 LTS 的好处是，Cinnamon 变得非常稳定并且基本没有 Bugs 出现。现在，开发者已经开始向桌面环境中添加更多的新特性了。

对于那些更喜欢在 GNOME 基础上有一个很好的类 Windows 用户界面的用户来说，Cinnamon 是他们最好的桌面环境。

## MATE 桌面

[MATE 桌面](http://mate-desktop.com/) 同样是 GNOME 的一个分支，然而，它并不像 Cinnamon 那样由 GNOME 3 分支而来，而是现在已经没有人维护的 GNOME 2 代码库的一个分支。MATE 桌面中的一些开发者并不喜欢 GNOME 3 并且想要“继续坚持” GNOME 2，所以他们使用这个代码库来创建来 MATE。为避免和 GNOME 3 的冲突，他们重命名了全部的包：Nautilus 改为 Caja、Gedit 改为 Pluma 以及 Evince 改为 Atril 等。

尽管 MATE 延续了 GNOME 2，但这并不意味着他们使用过时的技术；相反，他们使用了更新的技术来提供一个现代的 GNOME 2 体验。

拥有相当高的资源使用率才是 MATE 最令人印象深刻之处。你可将它运行在老旧硬件或者更新一些的但不太强大的硬件上，如树梅派 (Raspberry Pi) 或者 Chromebook Flip。使得它更有让人感兴趣的是，把它运行在一些强大的硬件上，可以节省大多数的资源给其他应用，而桌面环境本身只占用很少的资源。

## LXQt

[LXQt](http://lxqt.org/) 继承了 LXDE ——最轻量级的桌面环境之一。它融合了 LXDE 和 Razor-Qt 两个开源项目。LXQt 的首个可用本版（v 0.9）发布于 2015 年。最初，开发者使用了 Qt4 ，之后为了加快开发速度，而放弃了兼容性，他们移动到 Qt5 和 KDE 框架上。我也在自己的 Arch 系统上尝试使用了 LXQt，它的确是一个非常好的轻量级桌面环境。但在完全接过 LXDE 的传承之前，LXQt 仍有一段很长的路需要走。

## Xfce

[Xfce](http://www.xfce.org/) 早于 KDE 桌面环境，它是最古老和最轻量级的桌面环境。Xfce 的最新版本是 4.15，发布于 2015 年，使用了诸如 GTK+ 3 的大量的现代科技。很多发行版都使用了 Xfce 环境以满足特定需求，比如 Ubuntu Studio ——与 MATE 类似——尽量节省系统资源给其他的应用。并且，许多的著名的 Linux 发行版——包括 Manjaro Linux、PC/OS、Salix 和 Mythbuntu ——都把它作为默认桌面环境。

## Budgie

[Budgie](https://solus-project.com/budgie/) 是一个新型的桌面环境，由 Solus Linux 团队开发和维护。Solus 是一个从零开始构建的新型发行版，而 Budgie 则是它的一个核心组件。Budgie 使用了大量的 GNOME 组件，从而提供一个华丽的用户界面。由于没有该桌面环境的更多信息，我特地联系了 Solus 的核心开发者—— Ikey Doherty。他解释说：“我们搭载了自己的桌面环境—— Budgie 桌面。与其他桌面环境不同的是，Budgie 并不是其他桌面的一个分支，它的目标是彻底融入到 GNOME 协议栈之中。它完全从零开始编写，并特意设计来迎合 Solus 提供的体验。我们会尽可能的和 GNOME 的上游团队协同工作，修复 Bugs，并提倡和支持他们的工作”。

## Pantheon

我想，[Pantheon](https://elementary.io/) 不需要特别介绍了吧，那个优美的 elementary OS 就使用它作为桌面。类似于 Budgie，很多人都认为 Pantheon 也不是 GNOME 的一个分支。elementary OS 团队大多拥有良好的设计从业背景，所以他们会近距离关注每一个细节，这使得 Pantheon 成为一个非常优美的桌面环境。偶尔，它可能缺少像 Plasma 等桌面中的某些特性，但开发者实际上是尽其所能的去坚持设计原则。

![](http://www.linux.com/images/stories/66866/DE-3.png)

## 结论

当我写完本文后，我突然意识到来开源和 Linux 的重大好处。总有一些东西适合你。就像 Jon “maddog” Hall 在最近的 SCaLE 14 上说的那样：“是的，现在有 300 多个 Linux 发行版。我可以一个一个去尝试，然后坚持使用我最喜欢的那一个”。

所以，尽情享受 Linux 的多样性吧，最后使用最合你意的那一个。

------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/881107-best-linux-desktop-environments-for-2016

作者：[Swapnil Bhartiya][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/61003
