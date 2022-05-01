[#]: subject: "How to Upgrade to Ubuntu 22.04 “Jammy Jellyfish” From Ubuntu 20.04 LTS"
[#]: via: "https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14490-1.html"

如何从 Ubuntu 20.04 LTS 升级到 Ubuntu 22.04 “Jammy Jellyfish” 
======

![](https://img.linux.net.cn/data/attachment/album/202204/20/081835mfrb93flhqrz9dou.jpg)
s
> 本文介绍从 Ubuntu 20.04 LTS 升级到 Ubuntu 之前，你所需要采取的完整步骤和预防措施。

[Ubuntu 22.04 LTS Jammy Jellyfish][1] 将在 2022 年 4 月 21 日发布。我建议你在该日期之后的一两个月后再升级。理想的情况下，如果你在第一次修正版本发布后，才计划升级到任意主要版本，这会是最好的选择。

但是，如果你迫切想要体验 Ubuntu 22.04 带来的令人震惊的更改和特色功能，那么，接下来请阅读用于完美升级过程的步骤。

### 在升级前

在任何升级前，遵循一些最佳的惯例总是更加明智的。这会防止出现一些升级后的问题，并引领通往成功的升级流程。

  * 备份你的家目录中的数据到另一个驱动器或 USB 存储器，包括：图片、视频或其他的个人文件。
  * 如果你遇到一个不稳定的系统行，请保留一个准备好的 [Ubuntu 的现场 USB][2]。
  * 如果你打算升级 GNOME 工作站，请先禁用所有的 GNOME 扩展，因为这些扩展与 GNOME 3.36+ 不兼容。
  * 在成功的升级后，你可以逐一启用这些扩展。
  * 运行命令 `sudo apt update && sudo apt upgrade` 以确保你的系统是最新的软件包。
  * 关闭所有你正在运行的应用程序。
  * 重新启动你的系统。

说到这里，如果你准备好了，接下来遵循下面的说明来从 Ubuntu 20.04 LTS 升级到 Ubuntu 22.04 。

### 从 Ubuntu 20.04 和 Ubuntu 21.10 升级到 Ubuntu 22.04

#### 在 2022 年 4 月 21 日之前

如果你想在发布日期前升级，打开一个终端窗口，并运行下面的命令。

```
sudo do-release-upgrade -d
```

![Upgrade to Ubuntu 22.04 LTS from Ubuntu 20.04 LTS][3]

上面的命令将使用 “jammy” 来覆盖系统中的 “focal” 分支，以获取新的软件包。不仅如此，这个命令也会禁用你这些年可能添加的所有的第三方 PPA 。

此外，这个命令将花费一些时间才完成，这主要取决于你的网速。

除此之外，注意终端上偶尔出现的提示，它需要你输入 `Y` 或 `N` 。另外，如果你中途取消升级过程，这些第三方 PPA 也不会被启用，你必须手动启用它们。

![Summary of the upgrade][4]

最后，这个命令将计算升级系统所需软件包的大小，并估算所需时间，摘要如下图所示。请仔细地阅读它，并允许升级到 Ubuntu 22.04 LTS Jammy Jellyfish。

在升级过程完成后，重新启动你的系统，享受令人兴奋的 Ubuntu 22.04 LTS 。

#### 在 2022 年 4 月 21 日之后

在 2022 年 4 月 21 日当天或之后，直到 2022 年 07 月第一次修正版本发布，Ubuntu 都不会给予你任何可视化的升级提示，因为第一个修改版本被认为是初始错误被消除后最稳定的版本。

这意味着，你要么等到 7 月，你要么强制升级。如何强制升级？打开“<ruby>软件和更新<rt>Software and Updates</rt></ruby>”，转到“<ruby>更新<rt>Updates</rt></ruby>”标签页。更改“<ruby>通知我有新的 Ubuntu 版本<rt>Settings notify me of new ubuntu version</rt></ruby>” 为 “<ruby>任意新的 Ubuntu 版本<rt>any new version</rt></ruby>”。

在完成后，你应该会在桌面上看到一个升级提示。遵循屏幕上的指示，接着继续升级过程。

这个提示也会计算升级系统所列软件包所需的时间，因此，仔细的阅读更新程序的输出内容。在你准备好了以后，开始升级过程。

最后，在升级过程完成后，重新启动系统，享受全新的 Ubuntu 22.04 LTS Jammy Jellyfish 。

#### 从 Ubuntu 21.10 升级到 Ubuntu 22.04

针对 Ubuntu 21.10 ，你也可以参考上面确切说明来升级。从 Ubuntu 21.10 升级到 Ubuntu 22.04 不需要额外的步骤。

#### 升级到 Ubuntu 22.04 的过程需要多长的时间?

根据我的测试，在默认安装的情况下，整个升级过程需要 30 多分钟。根据你安装的软件包的数量和安装的年限，你的系统可能会更多。因此，相应地计划你的时间。

### 总结

最后，我希望这些步骤能帮助你成功地升级你的 Ubuntu 系统到 Jammy Jellyfish 。如果你正在打算升级，祝你一切顺利。

请在下面的评论区中告诉我升级过程是如何进行的。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

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
