[#]: subject: "Here are the New Features Coming to Ubuntu 22.04 LTS"
[#]: via: "https://itsfoss.com/ubuntu-22-04-release-features/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14177-1.html"

即将出现在 Ubuntu 22.04 LTS 中的新功能
======

> 这是一篇持续更新的文章，其中列出了即将发布的 Ubuntu 22.04 LTS “Jammy Jellyfish” 中增加的所有主要功能。

![](https://img.linux.net.cn/data/attachment/album/202201/14/111922mmsbgysrekae996b.jpg)

Ubuntu 的粉丝们！现在是时候为下一个大版本，也就是 Ubuntu 22.04 LTS 感到激动了。是的。这是一个长期支持版本，它将被支持五年，直到 2027 年 4 月。

即将发布的 LTS 版本带来了一些新的功能。如果你正在使用 Ubuntu 20.04 LTS，你会注意到许多视觉上的变化。如果你正在使用 Ubuntu 21.10，你已经看到了大量的变化，但在这个即将发布的版本中仍然会有一些新的变化。

在我向你展示 22.04 中新的预期新功能之前，让我们看看它将在什么时候发布。

### Ubuntu 22.04 发布时间表

Ubuntu 22.04 的稳定版计划于 2022 年 4 月 21 日发布。开发工作已经在紧锣密鼓地进行，它将遵循如下发布时间表：

  * 2022 年 2 月 24 日：功能冻结
  * 2022 年 3 月 17 日：用户界面冻结
  * 2022 年 3 月 31 日：测试版发布
  * 2022 年 4 月 14 日：候选版本
  * **2022 年 4 月 21 日：最终稳定版本**

现在你知道了重要的发布日期，是时候了解一下 Ubuntu 22.04 LTS 将带来的新功能了。

### Ubuntu 22.04 LTS “Jammy Jellyfish” 的新功能

由于开发工作仍在进行中，许多新功能会在不久的将来陆续加入。我将在它们被发现时进行更新。

现在，这里是 Ubuntu 22.04 中主要的已确认和预期的新功能。

#### GNOME 42 和随之而来的视觉变化

GNOME 42 将于 2022 年 3 月发布。它将被包含在 Ubuntu 22.04 中。

像往常一样，Ubuntu 将使用定制的 GNOME 版本，所以不是所有的 GNOME 42 的变化都会反映在这里。然而，由于使用了新的 libadwaita 和迁移到了 GTK 4，你还是应该看到一些视觉变化。

![GNOME 42 有一个重新打造的屏幕截图工具][1]

你应该看到一个界面崭新的设置程序和重新打造的屏幕截图工具。GNOME 42 还将更新一些 GNOME 应用程序，如 Boxes，并引入一个新的文本编辑器。然而，我认为 Ubuntu 会坚持使用 Gedit 作为其默认的文本编辑器。

#### Grub 2.06 和它带来的麻烦

Ubuntu 22.04 LTS 将拥有 [Grub 引导加载程序][2] 2.06 版本，但其中有一个问题，它的 os-prober 功能默认是禁用的。

这意味着，如果你在一个双启动系统上，Grub 不会探测其他操作系统，因此它不会在 Grub 中列出 Windows（或其他操作系统）。一些升级到 Ubuntu 22.04 开发版本的人已经 [开始面临这个问题][3]。

这并不是说这个问题不能被解决，有一个变通办法。

安装 os-prober（通常已经安装），然后编辑 `/etc/default/grub` 文件，在这个文件中加入 `GRUB_DISABLE_OS_PROBER=false`。保存这个文件，[更新 Grub][4]，Grub 现在应该可以看到其他操作系统了。

#### 新的固件更新程序

正如 [OMG! Ubuntu][5] 报道的那样，Ubuntu 22.04 可能会有一个新的固件更新程序。

通常情况下，GNOME 软件中心能够处理固件更新，即使在 Ubuntu 的 Snap 版本中。尽管如此，开发团队仍在努力开发一个专门的 GUI 工具来处理固件更新。

![图片来源：OMG! Ubuntu][6]

这个新工具基本上是 `fwupd` 的基于 Flutter 和 Dart 的 GUI 前端，`fwupd` 是一个命令行工具，用于获取 [Linux 供应商的固件][7]。

#### 新的安装程序

![新的 Ubuntu 安装程序][8]

这个基于 Flutter 的新安装程序已经开发了很长时间。它本来应该和 Ubuntu 21.10 一起推出，但并没如期实现。有一个单独的 Ubuntu 21.10 预览版，其中有这个新的安装程序，它将成为 Ubuntu 22.04 的默认安装程序。

新的安装程序与 Ubuntu 桌面风格无缝整合，从而使 Ubuntu 22.04 从一开始就具有更现代的外观和感觉。

#### 改进对树莓派的支持

随着 20.10 版本的发布，Ubuntu 开始支持树莓派设备上运行桌面版。虽然它可以在 8GB 版本的树莓派上工作，但在 4GB 上却很吃力，在 2GB 型号上也无法工作。

随着 Ubuntu 22.04 的推出，其性能应该会得到改善，特别是它 [引入了 zswap][9]。

#### 其他变化

在软件供应方面，你应该看到一些其他变化。大多数著名的软件应该有较新的版本。其中一些是：

  * OpenSSL 3.0
  * Ruby 3.0
  * Python 3.10
  * PHP 8.1
  * GCC 11（预计）

目前还没有确认，但更有可能的是 Ubuntu 22.04 将采用 Linux 内核 5.17。

正如我之前所说，一切正在开发中，一旦有更多的新功能被披露，我将立即更新这篇文章。

### 获取 Ubuntu 22.04 LTS

**警告**：Ubuntu 22.04 仍在努力开发中，你不应该在生产机器或你的主系统上使用它。

如果你想在备用机或虚拟机上测试它，你可以从 Ubuntu 的网站上下载日常构建版。

- [下载 Ubuntu 22.04 日常构建版（不稳定）][10]

如果你在备用机上使用 Ubuntu 20.04 LTS 或 Ubuntu 21.10，你可以强制升级到开发分支。

### 你期待 Ubuntu 22.04 的哪些功能？

很明显，GNOME 42 将是 Ubuntu 22.04 的最大亮点。你希望在这个新的 LTS 版本中看到哪些功能？

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-22-04-release-features/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/gnome-42-screenshot-tool.png?resize=800%2C600&ssl=1
[2]: https://itsfoss.com/what-is-grub/
[3]: https://itsfoss.community/t/windows-10-boot-option-missing-in-grub-after-upgrading-to-ubuntu-22-04-developer-version/8306/5
[4]: https://itsfoss.com/update-grub/
[5]: https://www.omgubuntu.co.uk/2021/11/ubuntu-is-working-on-a-new-firmware-updater-app
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/gnome-firmware-on-ubuntu.jpg?resize=800%2C436&ssl=1
[7]: https://fwupd.org/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/ubuntu-new-installer.jpeg?resize=720%2C478&ssl=1
[9]: https://www.omgubuntu.co.uk/2022/01/ubuntu-on-raspberry-pi-4-2gb-zswap
[10]: https://cdimage.ubuntu.com/daily-live/current/
