[#]: subject: "Linux Mint Upgrade Tool – Here’s How it Works"
[#]: via: "https://www.debugpoint.com/2022/04/mint-upgrade-tool/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint 升级工具 – 以下是它如何工作的
======
我们通过实际升级测试了 Linux Mint 升级工具（MINTUPGRADE GUI）。 这是我们发现的。

这个工具正在开发中，可能包含 bug。除非你想做实验，否则请不要在你的日常中使用它。

### Linux Mint 升级工具

Linux Mint 团队[宣布][1]，他们建立了一个新的工具来升级 Linux Mint 的重要版本。它被称为 “mintupgrade2”。它目前正在开发中，计划用于升级主要版本。例如，Linux Mint 20 到 21，而不是小版本的升级。

虽然你可以使用标准的 apt 命令来升级版本，然而，Mint 团队认为主要版本的升级是很棘手的。新用户很难进行无缝升级，因为它涉及到终端和一套复杂的命令步骤。

此外，GUI 是 mintupgrade 程序的一个带有附加功能的封装，它带来了一套系统前检查和一键修复的升级过程。

除此之外，mintupgrade 还会检查你是否连接到电源，系统是否是最新的，磁盘空间的可用性和更多的功能。

为了让大家了解它的外观和工作情况，我们使用 LMDE 4 设置了一个测试平台并试一试。

但在这之前，这里有一组快速的功能：

  * 完全由 GUI 驱动的升级过程
  * 多语言支持
  * 升级前检查：系统备份、电源、磁盘空间、删除的软件包列表
  * 可配置
  * 提醒你上一版本的无主软件包的情况
  * 它让你可以选择修复问题



### 它是如何工作的

当我们通过命令 mintupgrade 运行 mint 升级工具时，GUI，友好的欢迎屏幕给你一个很好的起点，开始了升级过程。然后它自己开始进行一系列的检查。

![Starting the upgrade process][2]

除此之外，当它在你的系统中发现一些问题时，它会停下来并给你足够的细节。当你点击修复后，它就可以再次恢复进程。

这还不是全部。如果由于网络或互联网或任何其他问题而中断，它也可以恢复升级过程。

在我们的测试过程中，该工具在我们的测试系统中发现了以下错误，只需点击一下就能修复它们。

![Apt Cache check][3]

![Mint Upgrade detects that system snapshots are not present][4]

![Check for Orphan Packages][5]

![Status before upgrade][6]

![Mint Upgrade can detect the packages that require a downgrade][7]

最后，我们成功地将一个测试系统从 LMDE 4 升级到 LMDE 5。

![Upgrade Complete][8]

#### 如何获得这个升级工具

使用下面的命令，该工具的安装很简单。但正如该团队所建议的，它现在处于 BETA 状态，所以不要用它来进行严肃的升级。

```

    sudo apt update

```

```

    sudo apt install mintupgrade

```

### 结束语

最后，我认为这是 Linux Mint 团队的最好的工具之一。正如你在上面看到的，它自己处理了许多错误。我所做的只是点击“修复”按钮。而这个工具足够聪明，能够理解所有的故障点，并负责补救。

[mintupgrade 工具][9]将在 Linux Mint 21 “Vanessa” 发布前发布，大约在 2022 年第三季度末或第四季度初。

* * *

我们带来最新的技术、软件新闻和重要的东西。通过 [Telegram][10]、[Twitter][11]、[YouTube][12] 和 [Facebook][13] 保持联系，永远不会错过任何更新！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/mint-upgrade-tool/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/04/linux-mint-21-announcement/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Starting-the-upgrade-process.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/Apt-Cache-check-1024x521.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Mint-Upgrade-detects-that-system-snapshots-not-present-1024x522.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Check-for-Orphan-Packages-1024x522.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/04/Status-before-upgrade-1024x528.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Mint-Upgrade-can-detect-the-packages-require-downgrade-1024x612.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Upgrade-Complete-1024x612.jpg
[9]: https://github.com/linuxmint/mintupgrade
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
