[#]: subject: (How to Install Steam on Fedora [Beginner’s Tip])
[#]: via: (https://itsfoss.com/install-steam-fedora/)
[#]: author: (John Paul https://itsfoss.com/author/john/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13302-1.html)

如何在 Fedora 上安装 Steam
======

![](https://img.linux.net.cn/data/attachment/album/202104/16/090703cg4t5npnseskhxhv.jpg)

Steam 对 Linux 游戏玩家来说是最好的东西了。由于 Steam，你可以在 Linux 上玩成百上千的游戏。

如果你还不知道，Steam 是最流行的 PC 游戏平台。2013 年，它开始可以在 Linux 使用。[Steam 最新的 Proton 项目][1] 允许你在 Linux 上玩为 Windows 平台创建的游戏。这让 Linux 游戏库增强了许多倍。

![][2]

Steam 提供了一个桌面客户端，你可以用它从 Steam 商店下载或购买游戏，然后安装并玩它。

过去我们曾讨论过 [在 Ubuntu 上安装 Steam][3]。在这个初学者教程中，我将向你展示在 Fedora Linux 上安装 Steam 的步骤。

### 在 Fedora 上安装 Steam

要在 Fedora 上使用 Steam，你必须使用 RMPFusion 软件库。[RPMFusion][4] 是一套第三方软件库，其中包含了 Fedora 选择不与它们的操作系统一起发布的软件。它们提供自由（开源）和非自由（闭源）的软件库。由于 Steam 在非自由软件库中，你将只安装那一个。

我将同时介绍终端和图形安装方法。

#### 方法 1：通过终端安装 Steam

这是最简单的方法，因为它需要的步骤最少。只需输入以下命令即可启用仓库：

```
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

你会被要求输入密码。然后你会被要求验证是否要安装这些仓库。你同意后，仓库安装就会完成。

要安装 Steam，只需输入以下命令：

```
sudo dnf install steam
```

![Install Steam via command line][5]

输入密码后按 `Y` 接受。安装完毕后，打开 Steam，玩一些游戏。

#### 方法 2：通过 GUI 安装 Steam

你可以从软件中心 [启用 Fedora 上的第三方仓库][6]。打开软件中心并点击菜单。

![][7]

在 “软件仓库” 窗口中，你会看到顶部有一个 “第三方软件仓库”。点击 “安装” 按钮。当提示你输入密码时，就完成了。

![][8]

安装了 Steam 的 RPM Fusion 仓库后，更新你系统的软件缓存（如果需要），并在软件中心搜索 Steam。

![Steam in GNOME Software Center][9]

安装完成后，打开 GNOME 软件中心，搜索 Steam。找到 Steam 页面后，点击安装。当被问及密码时，输入你的密码就可以了。

安装完 Steam 后，启动应用，输入你的 Steam 帐户详情或注册它，然后享受你的游戏。

### 将 Steam 作为 Flatpak 使用

Steam 也可以作为 Flatpak 使用。Fedora 上默认安装 Flatpak。在使用该方法安装 Steam 之前，我们必须安装 Flathub 仓库。

![Install Flathub][10]

首先，在浏览器中打开 [Flatpak 网站][11]。现在，点击标有 “Flathub repository file” 的蓝色按钮。浏览器会询问你是否要在 GNOME 软件中心打开该文件。点击确定。在 GNOME 软件中心打开后，点击安装按钮。系统会提示你输入密码。

如果你在尝试安装 Flathub 仓库时出现错误，请在终端运行以下命令：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

安装好 Flathub 仓库后，你需要做的就是在 GNOME 软件中心搜索 Steam。找到后，安装它，你就可以开始玩了。

![Fedora Repo Select][12]

Flathub 版本的 Steam 也有几个附加组件可以安装。其中包括一个 DOS 兼容工具和几个 [Vulkan][13] 和 Proton 工具。

![][14]

我想这应该可以帮助你在 Fedora 上使用 Steam。享受你的游戏 :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-steam-fedora/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/steam-play-proton/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2017/05/Steam-Store.jpg?resize=800%2C382&ssl=1
[3]: https://itsfoss.com/install-steam-ubuntu-linux/
[4]: https://rpmfusion.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/install-steam-fedora.png?resize=800%2C588&ssl=1
[6]: https://itsfoss.com/fedora-third-party-repos/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/software-meni.png?resize=800%2C672&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repo-gui.png?resize=746%2C800&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gnome-store-steam.jpg?resize=800%2C434&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/flatpak-install-button.jpg?resize=800%2C434&ssl=1
[11]: https://www.flatpak.org/setup/Fedora/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/fedora-repo-select.jpg?resize=800%2C434&ssl=1
[13]: https://developer.nvidia.com/vulkan
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/steam-flatpak-addons.jpg?resize=800%2C434&ssl=1
