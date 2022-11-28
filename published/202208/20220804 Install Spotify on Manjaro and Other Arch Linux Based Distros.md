[#]: subject: "Install Spotify on Manjaro and Other Arch Linux Based Distros"
[#]: via: "https://itsfoss.com/install-spotify-arch/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14965-1.html"

在 Manjaro 和其他基于 Arch Linux 的发行版上安装 Spotify
======

![](https://img.linux.net.cn/data/attachment/album/202208/25/133643nz8h58cl5ly8y6ly.jpg)

> Spotify 不需要介绍。它是最流行的音乐流媒体服务。

你可以 [在 Web 浏览器中播放 Spotify][1]，但如果你经常使用它，使用桌面应用会是一个更好的选择。

为什么呢？因为你可以用媒体键控制播放，得到歌曲的通知，而且不需要担心不小心关闭浏览器标签或窗口。桌面客户端给人一种完整的体验。

Spotify 为 Ubuntu 和 Debian [提供了一个仓库][2]。但在 Arch Linux 上安装 Spotify 呢？

实际上，在 Arch Linux 上获得 Spotify 的桌面应用更加简单。只需使用这个命令：

```
sudo pacman -Syu spotify-launcher
```

这就是在基于 Arch 的 Linux 发行版上安装 Spotify 的众多方法之一，如 Manjaro、[Endeavour OS][3]、[Garuda Linux][4] 等。

在本教程中，我将讨论以下安装 Spotify 的方法：

* 使用 [pacman][5]（你已经在上面看到了，但我们会更深入地挖掘）。
* 使用 [Pamac][6]（Manjaro的软件包管理器）进行安装
* 使用 [Flatpak][7]（通用打包格式）进行安装
* 使用 Snap（Spotify 团队的官方包）。

### 方法 1：使用 pacman 安装 Spotify

Spotify 可在 Arch Linux 的社区仓库中 [找到][8]。它实际上是 Spotify 提供的 APT 仓库的 Rust 实现。

打开你的终端，按以下方式 [使用 pacman 命令][9]：

```
sudo pacman -Syu spotify-launcher
```

安装后，从应用菜单中启动它，并登录开始收听。

![Spotify on Arch Linux][10]

输入下面的命令，将其连同其依赖关系和配置文件一起删除。

```
sudo pacman -Rns spotify-launcher
```

### 方法 2：使用 Pamac 安装 Spotify

如果你使用 Manjaro 或者 [在你的系统中安装了 Pamac][11]，你可以用它来图形化安装 Spotify。

从应用菜单中打开添加/删除软件。点击左上角的搜索图标，搜索 Spotify。然后，选择名为 `spotify-launcher` 的软件包，并点击应用进行安装，如下图所示。

![Using Pamac to install Spotify][12]

你也可以在安装后取消选择该软件包，并点击应用来删除它。

#### 使用 Pamac CLI

是的，Pamac 也有一个命令行界面，你可以通过以下方式使用它来获得 Spotify。

```
pamac install spotify-launcher
```

要删除，使用：

```
pamac remove spotify-launcher
```

### 方法 3：使用 Flatpak 安装 Spotify

许多用户喜欢使用 Flatpak 安装专有应用，因为它提供了沙盒。

在终端输入以下命令来更新你的系统并安装 Flatpak（如果你还没有）。

```
sudo pacman -Syu flatpak
```

然后，使用下面的命令启用 [Flathub 仓库][13]。

```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

现在，通过输入下面的命令安装 Spotify。

```
flatpak install spotify
```

要删除 Spotify 的 Flatpak 包，你可以使用下面的命令。

```
flatpak remove spotify
```

### 方法 4：使用 Snap 安装 Spotify

我知道很多人对 Snap 打包格式的“封闭性”非常反感。然而，Spotify 官方提供了一个 Snap 包。你可以从 Spotify 的开发者那里得到它。

如果你的系统支持 Snap 包，请使用以下命令：

```
sudo snap install spotify
```

如果你以后想删除它，使用这个命令：

```
sudo snap remove spotify
```

### 总结

第一个方法中讨论的 Arch 包是由 [kpcyrd][14] 开发和维护的。你可以在 [这里][15] 查看源代码。

如果你喜欢 Arch Linux 并想支持它，请考虑向该项目捐款。所有的工作都是由社区成员完成的，他们是无偿的志愿者。

如果你在 Arch 上安装 Spotify 有任何问题，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-spotify-arch/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://open.spotify.com/
[2]: https://www.spotify.com/us/download/linux/
[3]: https://endeavouros.com/
[4]: https://garudalinux.org/
[5]: https://wiki.archlinux.org/title/Pacman
[6]: https://wiki.manjaro.org/index.php/Pamac
[7]: https://itsfoss.com/what-is-flatpak/
[8]: https://archlinux.org/packages/community/x86_64/spotify-launcher/
[9]: https://itsfoss.com/pacman-command/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/spotify-e1658764973807.png
[11]: https://itsfoss.com/install-pamac-arch-linux/
[12]: https://itsfoss.com/wp-content/uploads/2022/07/pamac-spotify-e1658764946532.png
[13]: https://flathub.org
[14]: https://github.com/kpcyrd
[15]: https://github.com/kpcyrd/spotify-launcher
