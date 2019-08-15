[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Get Linux Kernel 5.0 in Ubuntu 18.04 LTS)
[#]: via: (https://itsfoss.com/ubuntu-hwe-kernel/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 18.04 LTS 中获取 Linux 5.0 内核
======

_ **最近发布的 Ubuntu 18.04.3 包括 Linux 5.0 内核中的几个新功能和改进，但默认情况下没有安装。本教程演示了如何在 Ubuntu 18.04 LTS 中获取 Linux 5 内核。** _

[Subscribe to It’s FOSS YouTube Channel for More Videos][1]

[Ubuntu 18.04 的第三个“点发布版”在这里][2]，它带来了新的稳定版本的 GNOME 组件、livepatch 桌面集成和内核 5.0。

可是等等！什么是“点发布版”（point release）？让我先解释一下。

### Ubuntu LTS 点发布版

Ubuntu 18.04 于 2018 年 4 月发布，由于它是一个长期支持 （LTS） 版本，它将一直支持到 2023 年。从那时起，已经有许多 bug 修复，安全更新和软件升级。如果你今天下载 Ubuntu 18.04，你需要在[在安装 Ubuntu 后首先安装这些更新][3]。

当然，这不是一种理想情况。这就是 Ubuntu 提供这些“点发布版”的原因。点发布版包含所有功能和安全更新以及自 LTS 版本首次发布以来添加的 bug 修复。如果你今天下载 Ubuntu，你会得到 Ubuntu 18.04.3 而不是 Ubuntu 18.04。这节省了在新安装的 Ubuntu 系统上下载和安装数百个更新的麻烦。

好了！现在你知道“点发布版”的概念了。你如何升级到这些点发布版？答案很简单。只需要像平时一样[更新你的 Ubuntu 系统][4]，这样你将在最新的点发布版上了。

你可以[查看 Ubuntu 版本][5]来了解正在使用的版本。我检查了一下，因为我用的是 Ubuntu 18.04.3，我以为我的内核会是 5。当我[查看 Linux 内核版本][6]时，它仍然是基本内核 4.15。

![Ubuntu Version And Linux Kernel Version Check][7]

这是为什么？如果 Ubuntu 18.04.3 有 Linux 5.0 内核，为什么它仍然使用 Linux 4.15 内核？这是因为你必须通过选择 LTS 支持栈（通常称为 HWE）手动请求在 Ubuntu LTS 中安装新内核。

### 使用 HWE 在Ubuntu 18.04 中获取 Linux 5.0 内核

默认情况下，Ubuntu LTS 将保持在最初发布的 Linux 内核上。 [硬件支持栈][9]（HWE）为现有的 Ubuntu LTS 版本提供了更新的内核和 xorg 支持。

最近发生了一些变化。如果你下载了 Ubuntu 18.04.2 或更新的桌面版本，那么就会为你启用 HWE，默认情况下你将获得新内核以及常规更新。

对于服务器版本以及下载了 18.04 和 18.04.1 的人员，你需要安装 HWE 内核。完成后，你将获得 Ubuntu 提供的更新的 LTS 版本内核。

要在 Ubuntu 桌面上安装 HWE 内核以及更新的 xorg，你可以在终端中使用此命令：

```
sudo apt install --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
```

如果你使用的是 Ubuntu 服务器版，那么就不会有 xorg 选项。所以只需在 Ubutnu 服务器版中安装 HWE 内核：

```
sudo apt-get install --install-recommends linux-generic-hwe-18.04
```

完成 HWE 内核的安装后，重启系统。现在你应该拥有更新的 Linux 内核了。

**你在 Ubuntu 18.04 中获取 5.0 内核了么？**

请注意，下载并安装了 Ubuntu 18.04.2 的用户已经启用了 HWE。所以这些用户将能轻松获取 5.0 内核。

在 Ubuntu 中启用 HWE 内核遇到困难了么？这完全取决于你。[Linux 5.0 内核][10]有几项性能改进和更好的硬件支持。你将从新内核获益。

你怎么看？你会安装 5.0 内核还是宁愿留在 4.15 内核上？

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-hwe-kernel/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/channel/UCEU9D6KIShdLeTRyH3IdSvw
[2]: https://ubuntu.com/blog/enhanced-livepatch-desktop-integration-available-with-ubuntu-18-04-3-lts
[3]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[4]: https://itsfoss.com/update-ubuntu/
[5]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[6]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/ubuntu-version-and-kernel-version-check.png?resize=800%2C300&ssl=1
[9]: https://wiki.ubuntu.com/Kernel/LTSEnablementStack
[10]: https://itsfoss.com/linux-kernel-5/
