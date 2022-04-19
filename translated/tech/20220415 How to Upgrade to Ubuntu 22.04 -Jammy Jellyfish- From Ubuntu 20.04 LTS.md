[#]: subject: "How to Upgrade to Ubuntu 22.04 “Jammy Jellyfish” From Ubuntu 20.04 LTS"
[#]: via: "https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何从 Ubuntu 20.04 LTS 升级到 Ubuntu 22.04 “Jammy Jellyfish” 
======
这里是你从 Ubuntu 20.04 LTS 升级到 Ubuntu 之前，你所需要采取的完整步骤和预防措施。
[Ubuntu 22.04 LTS Jammy Jellyfish][1] 将在2022年04月21日发布。我建议你在04月21日之后的一两个月后再升级。理想的情况下，如果你在第一次修正版本发布后，才计划升级到任意主要版本，这会是最好的选择。

但是，如果你迫切想要体验 Ubuntu 22.04 带来的令人震惊的更改和特色功能，那么，接下来请阅读用于完美升级过程的步骤。

### 在升级前

在任何升级前，遵循一些最佳的惯例总是更加明智的。这会防止出现一些升级后的问题，并引领通往成功的升级流程。

  * 备份你的 home 目录中的数据到另一个驱动器或 USB 存储器，包括：图片、视频或其他的个人文件。
  * 如果你在一个不稳定的系统中运行，保持在 [Ubuntu 的 LIVE USB ][2] 系统之中。
  * 如果你打算升级 GNOME 工作站，请先禁用所有的 GNOME 扩展，因为这些扩展与 GNOME 3.36+ 不兼容。
  * 在成功的升级后，你可以一次启用一个扩展。
  * 运行命令 `sudo apt update && sudo apt upgrade` 以确保你的系统是最新的软件包
  * 关闭所有你正在运行的应用程序。
  * 重新启动你的系统。



话虽如此，如果你准备好了，接下来遵循下面的指令来从 Ubuntu 20.04 LTS 升级到 Ubuntu 22.04 。

### 从 Ubuntu 20.04 和 Ubuntu 21.10 升级到 Ubuntu 22.04

#### 在2022年04月21日之前

如果你想在发布日期前升级，打开一个终端窗口，并运行下面的命令。

```

    sudo do-release-upgrade -d

```

![Upgrade to Ubuntu 22.04 LTS from Ubuntu 20.04 LTS][3]

上面的命令将系统地使用 "jammy" 来覆盖 "focal" 分支以获取新的软件包。不仅如此，这个命令也会禁用你这些年所可能添加的所有的第三方 PPA 。

此外，这个命令将花费一些时间才完成，这主要取决于你的网速。

除此之外，注意终端上偶尔出现的提示，它需要你输入 Y 或 N 。另外，如果你中途取消升级过程，这些第三方 PPA 也将会被禁用。因此，你必须手动启用它们。

![Summary of the upgrade][4]

最后，这个命令将计算升级系统所需软件包的大小，并给予你估算所需时间的概述，如下图所示。请仔细地阅读它，并给予升级到 Ubuntu 22.04 LTS Jammy Jellyfish 的权限。

[][5]

请参考:  Ubuntu 22.04 Jammy Jellyfish 每日构建版本现在已经可用

在升级过程完成后，重新启动你的系统，享受令人兴奋的 Ubuntu 22.04 LTS 。

#### 在2022年04月21日之后

在2022年04月21日当天或之后，直到2022年07月第一次修正版本发布，Ubuntu 都不会给予你任何关于升级的可见的提示，因为在解决了最初错误后的第一次修正版本会被认为是最稳定的版本。

这意味着，你要么等到07月，你要么强制升级。如何强制升级？打开软件包和更新，转到更新标签页。更改“<ruby>通知我新的 ubuntu 版本<rt>Settings notify me of new ubuntu version</rt></ruby>” 为 “<ruby>任意新的 ubuntu 版本<rt>any new version</rt></ruby>”。

在你完成后，你应该会在桌面上看到一个升级提示。遵循屏幕上的指令，接着继续升级过程。

这个提示也会计算升级系统所列软件包所需的时间，因此，仔细的阅读更新程序的输出内容。在你准备好了以后，开始升级过程。

最后，在升级过程完成后，重新启动系统，享受全新的 Ubuntu 22.04 LTS Jammy Jellyfish 。

#### 从 Ubuntu 21.10 升级到 Ubuntu 22.04

针对 Ubuntu 21.10 ，你也可以参考上面严格的指令来升级。从 Ubuntu 21.10 升级到 Ubuntu 22.04 不需要额外的步骤。

#### 升级到 Ubuntu 22.04 的过程将花费多长的时间?

根据我的测试，在默认安装的情况下，整个升级过程需要30多分钟。对于你的系统来说，安装时间可能会更多一些，这取决于你安装的软件包的多少，以及你所安装 ubuntu 版本的时间。因此，相应地计划你的时间。

### 总结

最后，我希望这些步骤能帮助你成功地升级你的 Ubuntu 系统为 Jammy Jellyfish 。如果你正在打算升级，祝你一切顺利。

请在下面的评论区中告诉我升级过程是如何进行的。

* * *

我们带来最新的科技、软件新闻和重要的题材。通过 [Telegram][6]、[Twitter][7]、[YouTube][8] 和 [Facebook][8] 保持联系、不错过一次更新!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://releases.ubuntu.com/22.04/
[2]: https://www.debugpoint.com/2018/09/how-to-create-ubuntu-linux-os-bootable-usb-in-windows/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/Upgrade-to-Ubuntu-22.04-LTS-from-Ubuntu-20.04-LTS-1024x540.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Summary-of-the-upgrade-1024x581.jpg
[5]: https://www.debugpoint.com/2021/10/ubuntu-22-04-daily-builds/
[6]: https://t.me/debugpoint
[7]: https://twitter.com/DebugPoint
[8]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[9]: https://facebook.com/DebugPoint
