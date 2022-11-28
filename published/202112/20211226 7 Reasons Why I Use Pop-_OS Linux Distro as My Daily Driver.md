[#]: subject: "7 Reasons Why I Use Pop!_OS Linux Distro as My Daily Driver"
[#]: via: "https://itsfoss.com/why-use-pop-os/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14118-1.html"

我把 Pop!_OS Linux 作为主要系统的 7 个原因
======

![](https://img.linux.net.cn/data/attachment/album/202112/26/115716cr4hqyp8qjrxyqp9.jpg)

Pop!_OS 是向 Linux 初学者和游戏玩家的热门推荐。但是，Pop!_OS 从其他基于 Ubuntu 的发行版中脱颖而出的原因有哪些？为什么你应该考虑把它作为你电脑日常使用的系统？

三年前，我从 Ubuntu 转到了 [Pop!_OS][1]，从那时起它就成了我的日常系统。

让我为你指出选择它作为你的日常操作系统的好处。

### 选择 Pop!_OS 而不是其他 Linux 发行版的原因

请注意，这里列出的一些原因可能是主观的，完全取决于你想要什么，以及你期望的桌面体验。

考虑到这一点，让我强调一下为什么我选择 [Pop!_OS][2] 作为我的主要操作系统，而不是其他 Linux 发行版。

#### 1、单独的 NVIDIA/AMD ISO

![][3]

如果你有一个装有 Nvidia GPU 的机器，使用 [Nouveau][4]（Nvidia 显卡的开源驱动程序）来使其工作是不可行的。

好吧，你的显示器可以工作，但你不能发挥你的显卡的优势。

例如，你会在几乎所有需要利用 GPU 的任务中遇到卡顿和性能问题。

因此，专有的 Nvidia 驱动程序是解决这些问题的唯一解决方案。

而且，为了让添加专有驱动程序能够开箱即用，发行版需要将其包含在 ISO 中，或者提供一个单独的 ISO，其中包含 Nvidia 最新可用的专有驱动程序。

虽然你肯定可以手动安装专有驱动程序，但这并不是完美的体验。

顺便说一句，对于大多数流行的 Linux 发行版，这个过程应该与 [在 Linux Mint 中安装 Nvidia 驱动程序][5] 类似。

![驱动管理器 | Linux Mint (Cinnamon)][6]

请注意，有时你需要排除故障或重新安装正确的（或较早的驱动版本）才能正确使用 Nvidia 显卡。

但是，如果你有单独的 ISO 来支持 Nvidia 的系统或 Nvidia 图形安装模式（如 Zorin OS），那就可以消除手动安装 Nvidia 驱动程序的麻烦。

这不仅仅是为了方便使用，而是 Pop!_OS 通过提供帮助性的 Nvidia ISO 做到了开箱即用。

当我试图手动安装专有驱动程序时，我曾在 Linux Mint、Ubuntu 和其他一些发行版上遇到过问题。因此，Pop!_OS 对于我带有 Nvidia 显卡的系统来说，设置起来非常容易。

#### 2、自动平铺管理器

![][7]

如果没有平铺管理器，你需要不断地拖放（和移动）你的活动窗口来组织它们以便快速访问。

因此，一个窗口平铺管理器可以方便地自动组织你启动的应用程序的活动窗口。

当然，使用平铺管理器的体验会因你的屏幕尺寸而不同，但即使你有一个尺寸不大的 27 英寸显示屏，它也应该会有明显的体验改善。

我自己一直在使用它，即使没有大显示器（或双显示器设置）。

我从来没有在笔记本电脑上使用过它，但整天工作时，拥有一个自动窗口平铺管理器（你可以启用/禁用）听起来是一个有用的功能。

它有助于提高你的多任务处理能力，而不一定要移动到不同的工作空间。

#### 3、使用的便利性

为什么你认为 Ubuntu 是 [最好的 Linux 发行版][8] 之一？

多年来，它一直设法提供易于使用的现代桌面体验。

令人印象深刻的是，System76 已经设法将 Pop!_OS 的用户体验在 Ubuntu 的基础上提升了一个档次。

因此，Pop!_OS 不仅仅是另一个 Ubuntu 发行版，它的应用启动器、应用库、坞站、工作区定制以及其他各种优化都带来了独特的桌面体验。

对于我的使用情况而言，它感觉比 Ubuntu 更好。别忘了，它还包括一些工具，比如 [Popsicle][9]，这些工具在以后的工作中会很方便。

#### 4、较新的 Linux 内核

![Pop!_OS 21.10 具有 Linux 内核 5.15.8][10]

Ubuntu 可能不具有最新和最棒的 Linux 内核，特别是它的 LTS 版本时。

然而，Pop!_OS 尽力提供最新的 Linux 内核版本，即使是在 LTS 版本中。例如，Ubuntu 20.04.3 LTS 包含了 Linux 内核 5.11，但 Pop!_OS 20.04 LTS 具有 Linux 内核 5.13。

对于大多数用户来说，这可能不是什么大问题，但是 Pop!_OS 比其他大多数 Linux 发行版更快地推送了更新的 Linux 内核。

如果你想让你的最新和最棒的硬件与 Linux 发行版很好地配合工作，Pop!_OS 是一个绝妙的选择。

#### 5、应用程序启动器

![][11]

应用程序启动器在快速启动应用程序或在活动窗口之间进行导航时非常方便。

使用快捷方式（也可能是链接到它的宏，就像我使用的那样）调用启动器的能力，使它成为启动应用程序和在它们之间进行导航的最快捷的方式之一。

当然，你可以安装像 [Ulauncher][12] 这样的工具来实现同样的目的。不过，它是预先配置、开箱即用的，不需要任何故障排除，这很方便。

#### 6、快速升级过程

尽管升级 Linux 发行版通常是无忧无虑的，但 Pop!_OS 在每次更新时都尽力完善和改进这个过程。

例如，在 Pop!_OS 21.10 中，他们引入了一些改进措施，以防止升级过程中的冲突，并使其成为一个顺畅的过程。

事实上，我从 Pop!_OS 21.04 升级到 21.10 只需点击几下，没有遇到任何问题。

#### 7、努力改善现代桌面体验

Pop!_OS 可能不是一个 [轻量级 Linux 发行版][13]，但它专注于为现代桌面用户提供一流的体验。

虽然有很多适合老式电脑的 Linux 发行版，但以新一代硬件为目标同样重要。

System76 也在他们的最新笔记本硬件配置上测试过该发行版，Pop!_OS 在这方面表现得非常好。

此外，Pop!_OS 还提供了开箱即用的调整功能，使用户在操作系统方面的体验变得简单。虽然 Linux 就是不断调整和控制你的系统，但 Pop!_OS 似乎成功地使它成为一个主流选择和一个可行的 Ubuntu 替代品，这可能对一些人来说更好。

#### 补充：软件包更新

System76 最近在 [Pop!_OS 21.10 版本][14] 中从 Launchpad 转向了自己的软件库。

这应该能让他们更快地推送更新，并控制软件包以确保用户的最佳体验。

这也应该使 Pop!_Shop 更加有用。因此，这是又一个在我的机器上继续使用 Pop!_OS 的理由。

### 总结

Pop!_OS 在很多地方做的很好。

如果你对选择一个易于使用、与最新硬件兼容、适合各种使用情况的 Linux 发行版感到困惑，我会推荐 Pop!_OS。

上述原因是我坚持使用它的原因，即使在我曾经尝试切换到 Zorin OS 和 Linux Mint 几个月。

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-use-pop-os/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pop-os-vs-ubuntu/
[2]: https://pop.system76.com/
[3]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/pop-os-downloads-iso.png?ssl=1
[4]: https://nouveau.freedesktop.org
[5]: https://itsfoss.com/nvidia-linux-mint/
[6]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/linux-mint-driver-manager.jpg?ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/pop-os-window-tiling.png?ssl=1
[8]: https://itsfoss.com/best-linux-distributions/
[9]: https://github.com/pop-os/popsicle
[10]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/pop-os-21-10-linux-kernel.png?ssl=1
[11]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/pop-os-application-launcher.png?ssl=1
[12]: https://itsfoss.com/ulauncher/
[13]: https://itsfoss.com/lightweight-linux-beginners/
[14]: https://news.itsfoss.com/pop-os-21-10/
