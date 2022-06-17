[#]: subject: "Install apps on Linux with Flatpak"
[#]: via: "https://opensource.com/article/21/11/install-flatpak-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14045-1.html"

用 Flatpak 在 Linux 上安装应用
======

> Flatpak 简化了 Linux 上应用的安装。

![](https://img.linux.net.cn/data/attachment/album/202112/03/133555dxzijlzjp0ibglk0.jpg)

计算机应用由许多小文件组成，它们被链接在一起以执行一系列的任务。因为它们以“应用”的形式出现，在菜单或桌面上有彩色的图标，我们大多数人认为应用是一个单一的、几乎是有形的东西。在某种程度上，这样想是令人欣慰的，因为它们感觉是可以管理的。如果一个应用实际上是散落在你的计算机上的数百个小库和资源文件的组合，那么应用在哪里？撇开存在危机不谈，当一个应用需要一个版本的库，而另一个应用需要一个不同的版本时，会发生什么？

在云计算的世界里，[容器][2] 正变得越来越流行，因为它们为应用提供了隔离和整合。你可以在一个“容器”中安装一个应用需要的所有文件。这样一来，它的库就不会受到其他应用的影响，它所占用的内存也不会将数据泄露到另一个内存空间。所有的东西最后都感觉非常像一个单一的、几乎是 _有形的_ 东西。在 Linux 桌面上，提供了类似的技术的 Flatpak，是一个跨发行版、无守护进程、去中心化的应用交付系统。

### 在 Linux 上安装 Flatpak

你的 Linux 系统可能已经安装了 Flatpak。如果没有，你可以从你的包管理器中安装它：

在 Fedora、Mageia 和类似的发行版上：

```
$ sudo dnf install flatpak
```

在 Elementary、Mint 和其他基于 Debian 的发行版上：

```
$ sudo apt install flatpak
```

在 Slackware 上，Flatpak 可以从 [SlackBuilds.org][3] 获得。

### 选择一个 Flatpak 仓库

你可以通过在你的发行版的软件中心（如 GNOME 上的“软件”）添加一个 Flatpak 仓库，将一个应用安装为 Flatpak。Flatpak 是一个去中心化的系统，意味着任何开发软件的人都可以托管他们自己的仓库。尽管如此，在实践中，[Flathub][4] 是 Flatpak 格式的最大和最流行的应用集合。要将 Flathub 添加到 GNOME “<ruby>软件<rt>Software</rt></ruby>” 或者 KDE “<ruby>发现<rt>Discover</rt></ruby>” 中，请浏览 https://flatpak.org/setup ，找到适合你的发行版的说明，从第二步开始，或者直接下载 [Flatpakrepo][5] 文件。根据你的网络情况，你的软件中心可能需要几分钟的时间来与 Flathub（或另一个 Flatpak 仓库）同步。Flathub 有很多软件，但你的系统上有多少个 Flatpak 仓库是没有限制的，所以如果你发现一个有你想尝试的软件，不要害怕添加一个新的仓库。

![Software Repositories][6]

如果你喜欢在终端工作，你可以用 `flatpak` 命令直接添加到仓库：

```
$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### 安装一个应用

只要你在软件中心添加了 Flatpak 仓库，你就可以像往常一样浏览应用了。

![GNOME Software][8]

点击一个看起来很吸引人的应用，阅读它，当你准备好时点击**安装**按钮。

### 在终端中安装 flatpak

如果你喜欢在终端工作，你可以把 Flatpak 当作一个专门的包管理器。你可以使用 `flatpak search` 命令来搜索一个应用程序：

```
$ flatpak search paint
Name        Description                         Application ID
CorePaint   A simple painting tool              org.cubocore.CorePaint
Pinta       Edit images and paint digitally     com.github.PintaProject.Pinta
Glimpse     Create images and edit photographs  org.glimpse_editor.Glimpse
Tux Paint   A drawing program for children      org.tuxpaint.Tuxpaint
Krita       Digital Painting, Creative Freedom  org.kde.krita
```

用 `flatpak install` 安装：

```
$ flatpak install krita
```

安装后，应用就会与系统中的所有其他应用一起出现在你的应用菜单或活动页上。

### 应用变得简单

Flatpak 通过消除版本冲突，可以使用户轻松安装应用。他们通过在自托管的平台或像 Flathub 这样的公共平台上只需要针对一种软件包格式提供应用，使分发软件变得简单。我在 Fedora Silverblue、CentOS 和 Slackware 上使用 Flatpak，我无法想象现在没有它的生活。在你的下一个应用安装中试试 Flatpak 吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/install-flatpak-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/flatpak-lead-image_0.png?itok=URbhdsDQ (Flatpak)
[2]: https://opensource.com/article/21/7/linux-podman
[3]: http://slackbuilds.org
[4]: http://flathub.org
[5]: https://flathub.org/repo/flathub.flatpakrepo
[6]: https://opensource.com/sites/default/files/uploads/repo.jpg (Software Repositories)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/software.jpg (GNOME Software)
