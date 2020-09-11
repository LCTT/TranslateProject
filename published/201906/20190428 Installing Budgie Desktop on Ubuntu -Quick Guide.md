[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10919-1.html)
[#]: subject: (Installing Budgie Desktop on Ubuntu [Quick Guide])
[#]: via: (https://itsfoss.com/install-budgie-ubuntu/)
[#]: author: (Atharva Lele https://itsfoss.com/author/atharva/)

在 Ubuntu 上安装 Budgie 桌面
======

> 在这个逐步的教程中学习如何在 Ubuntu 上安装 Budgie 桌面。

在所有[各种 Ubuntu 版本][1]中，[Ubuntu Budgie][2] 是最被低估的版本。它外观优雅，而且需要的资源也不多。

阅读这篇 《[Ubuntu Budgie 点评][3]》或观看下面的视频，了解 Ubuntu Budgie 18.04 的外观如何。

- [Ubuntu 18.04 Budgie Desktop Tour [It's Elegant]](https://youtu.be/KXgreWOK33k)

如果你喜欢 [Budgie 桌面][5]但你正在使用其他版本的 Ubuntu，例如默认 Ubuntu 带有 GNOME 桌面，我有个好消息。你可以在当前的 Ubuntu 系统上安装 Budgie 并切换桌面环境。

在这篇文章中，我将告诉你到底该怎么做。但首先，对那些不了解 Budgie 的人进行一点介绍。

Budgie 桌面环境主要由 [Solus Linux 团队开发][6]。它的设计注重优雅和现代使用。Budgie 适用于所有主流 Linux 发行版，可以让用户在其上尝试体验这种新的桌面环境。Budgie 现在非常成熟，并提供了出色的桌面体验。

> 警告
>
> 在同一系统上安装多个桌面可能会导致冲突，你可能会遇到一些问题，如面板中缺少图标或同一程序的多个图标。
>
> 你也许不会遇到任何问题。是否要尝试不同桌面由你决定。

### 在 Ubuntu 上安装 Budgie

此方法未在 Linux Mint 上进行测试，因此我建议你 Mint 上不要按照此指南进行操作。

对于正在使用 Ubuntu 的人，Budgie 现在默认是 Ubuntu 仓库的一部分。因此，我们不需要添加任何 PPA 来下载 Budgie。

要安装 Budgie，只需在终端中运行此命令即可。我们首先要确保系统已完全更新。

```
sudo apt update && sudo apt upgrade
sudo apt install ubuntu-budgie-desktop
```

下载完成后，你将看到选择显示管理器的提示。选择 “lightdm” 以获得完整的 Budgie 体验。

![Select lightdm][7]

安装完成后，重启计算机。然后，你会看到 Budgie 的登录页面。输入你的密码进入主屏幕。

![Budgie Desktop Home][8]

### 切换到其他桌面环境

![Budgie login screen][9]

你可以单击登录名旁边的 Budgie 图标获取登录选项。在那里，你可以在已安装的桌面环境（DE）之间进行选择。就我而言，我看到了 Budgie 和默认的 Ubuntu（GNOME）桌面。

![Select your DE][10]

因此，无论何时你想登录 GNOME，都可以使用此菜单执行此操作。

### 如何删除 Budgie

如果你不喜欢 Budgie 或只是想回到常规的以前的 Ubuntu，你可以如上节所述切换回常规桌面。

但是，如果你真的想要删除 Budgie 及其组件，你可以按照以下命令回到之前的状态。

**在使用这些命令之前先切换到其他桌面环境：**

```
sudo apt remove ubuntu-budgie-desktop ubuntu-budgie* lightdm
sudo apt autoremove
sudo apt install --reinstall gdm3
```

成功运行所有命令后，重启计算机。

现在，你将回到 GNOME 或其他你有的桌面。

### 你对 Budgie 有什么看法？

Budgie 是[最佳 Linux 桌面环境][12]之一。希望这个简短的指南帮助你在 Ubuntu 上安装了很棒的 Budgie 桌面。

如果你安装了 Budgie，你最喜欢它的什么？请在下面的评论中告诉我们。像往常一样，欢迎任何问题或建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-budgie-ubuntu/

作者：[Atharva Lele][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/atharva/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/which-ubuntu-install/
[2]: https://ubuntubudgie.org/
[3]: https://itsfoss.com/ubuntu-budgie-18-review/
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://github.com/solus-project/budgie-desktop
[6]: https://getsol.us/home/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_select_dm.png?fit=800%2C559&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_homescreen.jpg?fit=800%2C500&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_lockscreen.png?fit=800%2C403&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_lockscreen_select_de.png?fit=800%2C403&ssl=1
[11]: https://itsfoss.com/snapd-error-ubuntu/
[12]: https://itsfoss.com/best-linux-desktop-environments/
