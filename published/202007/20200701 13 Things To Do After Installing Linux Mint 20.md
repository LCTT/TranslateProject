[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12404-1.html)
[#]: subject: (13 Things To Do After Installing Linux Mint 20)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-linux-mint-20/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

安装 Linux Mint 20 后需要做的 13 件事
======

![](https://img.linux.net.cn/data/attachment/album/202007/11/113643ich99s7y7kw7ckw9.jpg)

Linux Mint 毫无疑问是 [最佳 Linux 发行版][1] 之一，特别是考虑到 [Linux Mint 20][2] 的功能，我确信你也会同意这一说法。

假设你错过了我们的新闻报道，[Linux Mint 20 终于可以下载了][3]。

当然，如果你使用 Linux Mint 有一段时间了，你可能知道最好做一些什么。但是，对于新用户来说，在安装 Linux Mint 20 后，你需要做一些事，让你的体验更比以往任何时候都好。

### 在安装 Linux Mint 20 后建议做的事

在这篇文章中，我将列出其中一些要做的事来帮助你改善 Linux Mint 20 的用户体验。

#### 1、执行一次系统更新

![][4]

安装后首先应该马上检查的是 —— 使用更新管理器进行系统更新，如上图所示。

为什么？因为你需要构建可用软件的本地缓存。更新所有软件包的更新也是一个好主意。

如果你喜欢使用终端，只需输入下面的命令来执行系统更新：

```
sudo apt update && sudo apt upgrade -y
```

#### 2、使用 Timeshift 来创建系统快照

![][5]

如果你想在意外更改或错误更新后快速地恢复系统状态，有一个系统快照总是很有用的。

因此，如果你希望能够随时备份你的系统状态，那么使用 Timeshift 配置和创建系统快照是超级重要的。

如果你还不知道如何使用它的话，你可以遵循我们 [使用 Timeshift][6] 的详细指南。

#### 3、安装有用的软件

尽管在 Linux Mint 20 中已经安装有一些有用的预安装应用程序，你可能需要安装一些没有随之一起出炉的必不可少的应用程序。

你可以简单地使用软件包管理器或 synaptic 软件包管理器来查找和安装所需要的软件。

对于初学者来说，如果你想探索各种各样的工具，那么你可以遵循我们的 [必不可少的 Linux 应用程序][7] 的列表。

也参见：

- [75 个最常用的 Linux 应用程序（2018 年）](https://linux.cn/article-10099-1.html)
- 100 个最佳 Ubuntu 应用（[上](https://linux.cn/article-11044-1.html)、[中](https://linux.cn/article-11048-1.html)、[下](https://linux.cn/article-11057-1.html)）

这里是一个我最喜欢的软件包列表，我希望你也来尝试一下：

  * [VLC 多媒体播放器][8] 用于视频播放
  * [FreeFileSync][9] 用来同步文件
  * [Flameshot][10] 用于截图
  * [Stacer][11] 用来优化和监控系统
  * [ActivityWatch][12] 用来跟踪你的屏幕时间并保持高效唤醒

#### 4、自定义主题和图标

![][13]

当然，这在技术上不是必不可少的事，除非你想更改 Linux Mint 20 的外观和感觉。

但是，[在 Linux Mint 中更改主题和图标是非常容易的][14] ，而不需要安装任何额外的东西。

你会在欢迎屏幕中获得优化外观的选项。或者，你只需要进入 “主题”，并开始自定义主题。

![][15]

为此，你可以搜索它或在系统设置中如上图所示找到它。

根据你正在使用的桌面环境，你也可以看看可用的 [最佳图标主题][16]。

#### 5、启用 Redshift 来保护你的眼睛

![][17]

你可以在 Linux Mint 上搜索 “[Redshift][18]”，并启用它以在晚上保护你的眼睛。如你在上面的截图所见，它将根据时间自动地调整屏幕的色温。

你可能想启用自动启动选项，以便它在你重新启动计算机时自动启动。它可能与 [Ubuntu 20.04 LTS][19] 的夜光功能不太一样，但是如果你不需要自定义时间表或微调色温的能力，那么它就足够好了。

#### 6、启用 snap（如果需要的话）

尽管 Ubuntu 比前所未有的更倾向于推崇使用 Snap，但是 Linux Mint 团队却反对使用它。因此，它禁止 APT 使用 snapd。

因此，你将无法获得 snap 开箱即用的支持。然而，你迟早会意识到一些软件包只以 Snap 的格式打包。在这种情况下，你将不得不在 Mint 上启用对 snap 的支持。

```
sudo apt install snapd
```

在你完成后，你可以遵循我们的指南来了解更多关于 [在 Linux 上安装和使用 snap][20] 的信息。

#### 7、学习使用 Flatpak

默认情况下，Linux Mint 带有对 Flatpak 的支持。所以，不管你是讨厌使用 snap 或只是更喜欢使用 Flatpak，在系统中保留它是个好主意。

现在，你只需要遵循我们关于 [在 Linux 上使用 Flatpak][21] 的指南来开始吧！

#### 8、清理或优化你的系统

优化或清理系统总是好的，以避免不必要的垃圾文件占用存储空间。

你可以通过在终端机上输入以下内容，快速删除系统中不需要的软件包：

```
sudo apt autoremove
```

除此之外，你也可以遵循我们 [在 Linux Mint 上释放空间的一些建议][22] 。

#### 9、使用 Warpinator 通过网络发送/接收文件

Warpinator 是 Linux Mint 20 的一个新功能，可以让你在连接到网络的多台电脑上共享文件。这里是它看起来的样子：

![][23]

你只需要在菜单中搜索它就可以开始了！

#### 10、使用驱动程序管理器

![驱动器管理器][24]

如果你正在使用需要驱动程序的 Wi-Fi 设备、NVIDIA 显卡或 AMD 显卡，以及其它设备（如果适用的话）时，驱动程序管理器是一个重要的部分。

你只需要找到驱动程序管理器并启用它。它应该可以检测到正在使用的任何专有驱动程序，或者你也可以使用驱动程序管理器来利用 DVD 来安装驱动程序。

#### 11、设置防火墙

![][25]

在大多数情况下，你可能已经保护了你的家庭网络。但是，如果你想在 Linux Mint 上有一些特殊的防火墙设置，你可以通过在菜单中搜索 “Firewall” 来实现。

正如你在上述截图中所看到的，你可以为家庭、企业和公共设置不同的配置文件。你只需要添加规则，并定义什么是允许访问互联网的，什么是不允许的。

你可以阅读我们关于 [使用 UFW 配置防火墙][26] 的详细指南。

#### 12、学习管理启动应用程序

如果你是一个有经验的用户，你可能已经知道这一点了。但是，新用户经常忘记管理他们的启动应用程序，最终影响了系统启动时间。

你只需要从菜单中搜索 “Startup Applications” ，你可以启动它来查找像这样的东西：

![][27]

你可以简单地切换你想要禁用的那些启动应用程序，添加一个延迟计时器，或从启动应用程序的列表中完全地移除它。

#### 13、安装必不可少的游戏应用程序

当然，如果你对游戏感兴趣，你可能想去阅读我们关于 [在 Linux 上的游戏][28] 的文章来探索所有的选择。

但是，对于初学者来说，你可以尝试安装 [GameHub][29]、[Steam][30] 和 [Lutris][31] 来玩一些游戏。

### 总结

就是这样，各位！在大多数情况下，如果你在安装 Linux Mint 20 后按照上面的要点进行操作，使其发挥出最好的效果，应该就可以了。

我确信你还能够做更多的事。我想知道你喜欢在安装 Linux Mint 20 后马上做了什么。在下面的评论中告诉我你的想法吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-linux-mint-20/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-distributions/
[2]: https://linux.cn/article-12297-1.html
[3]: https://linux.cn/article-12376-1.html
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-system-update.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/snapshot-linux-mint-timeshift.jpeg?ssl=1
[6]: https://linux.cn/article-11619-1.html
[7]: https://linux.cn/article-10165-1.html
[8]: https://www.videolan.org/vlc/
[9]: https://itsfoss.com/freefilesync/
[10]: https://itsfoss.com/flameshot/
[11]: https://itsfoss.com/optimize-ubuntu-stacer/
[12]: https://itsfoss.com/activitywatch/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-theme.png?ssl=1
[14]: https://itsfoss.com/install-icon-linux-mint/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-system-settings.png?ssl=1
[16]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-redshift-1.png?ssl=1
[18]: https://itsfoss.com/install-redshift-linux-mint/
[19]: https://itsfoss.com/ubuntu-20-04-release-features/
[20]: https://itsfoss.com/install-snap-linux/
[21]: https://itsfoss.com/flatpak-guide/
[22]: https://itsfoss.com/free-up-space-ubuntu-linux/
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/mint-20-warpinator-1.png?ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2013/12/Additional-Driver-Linux-Mint-16.png?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-firewall.png?ssl=1
[26]: https://itsfoss.com/set-up-firewall-gufw/
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-startup-applications.png?ssl=1
[28]: https://itsfoss.com/linux-gaming-guide/
[29]: https://itsfoss.com/gamehub/
[30]: https://store.steampowered.com
[31]: https://lutris.net
