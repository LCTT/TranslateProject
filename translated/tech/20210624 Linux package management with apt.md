[#]: subject: (Linux package management with apt)
[#]: via: (https://opensource.com/article/21/6/apt-linux)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用 apt 进行 Linux 包管理
======
学习如何使用 apt 命令在基于 Debian 的 Linux 发行版上安装软件包，然后下载我们的速查表，让正确的命令触手可及。
![绿色背景的 bash 标志][1]

[包管理器][2] 可帮助你处理 Linux 系统的计算机上软件的更新、卸载、故障排除等问题。Seth Kenlon 写了 [使用 `dnf` 进行 Linux 包管理][3] 一文，介绍了如何使用 dnf 这款命令行包管理工具，在 RHEL、CentOS、Fedora、Mageia、OpenMandriva 和其他 Linux 发行版中安装软件。

Debian 和基于 Debian 的发行版（例如 MX Linux、Deepin、Ubuntu）以及基于 Ubuntu 的发行版（例如 Linux Mint 和 Pop!_OS）都有`apt`，一个“相似但不同”的工具。在本文中，我将按照 Seth 的示例（但使用 `apt`）向你展示如何使用它。

在一开始，我想先提一下四个跟 `apt` 相关的软件安装工具：

  * [Synaptic][4] 是为 `apt` 服务的一个基于 GTK+ 的图形用户界面（GUI）的前端工具。
  * [Aptitude][5] 是为 `apt` 服务的一个基于 Ncurses 的全屏命令行前端工具。
  * `apt` 的前身有 `apt-get`、`apt-cache` 等工具。
  * [Dpkg][6] 是在 `apt` 包管理器背后处理繁杂事务的”幕后工作者“。



还有其他的包管理系统，例如 [Flatpak][7] 和 [Snap][8]，你可能会在 Debian 和基于 Debian 的系统上遇到它们，但我不打算在这里讨论。还有一些应用程序“商店”，例如 [GNOME 软件][9]，与 `apt` 和其他打包技术重叠；我也不打算在这里讨论它们。最后，还有其他 Linux 发行版，例如 [Arch][10] 和 [Gentoo][11] 既不使用 `dnf` 也不使用 `apt`，我也不打算在这里讨论它们！

上面我讲了这么多我不想提及的内容，您可能怀疑 `apt` 到底还能处理多少软件。这么说吧，在我的 Ubuntu 20.04 上，`apt` 可以让我使用 69,371 个软件包，从 `0ad` ，一款古代战争题材的即时战略游戏，到 `zzuf`，一个透明的应用程序输入模糊器。一点也不差。

### 使用 apt 搜索软件

使用 `apt` 软件包管理器的第一步是找到感兴趣的软件包。Seth 的 `dnf` 文章以 [Cockpit][12] 服务器管理应用程序为例。用 `apt` 我会输入如下命令：


```
$ apt search cockpit
Sorting... Done
Full Text Search... Done
389-ds/hirsute,hirsute 1.4.4.11-1 all
  389 Directory Server suite - metapackage

cockpit/hirsute,hirsute 238-1 all
  Web Console for Linux servers

...
$
```

上面的第二个包就是你要的那个（以 `cockpit/hirsute` 开头的那一行）。如果你决定要安装它，输入：


```
`$ sudo apt install cockpit`
```

`apt` 将负责安装 Cockpit 以及使其工作所需的所有部件或 _依赖_。有时我们不太确定这是我们所需要的。了解更多的信息可能有助于你决定是否真的要安装此应用程序。

### 包元数据

要了解有关软件包的更多信息，使用 `apt show` 命令：


```
$ apt show cockpit
Package: cockpit
Version: 238-1
Priority: optional
Section: universe/admin
Origin: Ubuntu
Maintainer: Ubuntu Developers &lt;[ubuntu-devel-discuss@lists.ubuntu.com][13]&gt;
Original-Maintainer: Utopia Maintenance Team &lt;[pkg-utopia-maintainers@lists.alioth.debian.org][14]&gt;
Bugs: <https://bugs.launchpad.net/ubuntu/+filebug>
Installed-Size: 88.1 kB
Depends: cockpit-bridge (&gt;= 238-1), cockpit-ws (&gt;= 238-1), cockpit-system (&gt;= 238-1)
Recommends: cockpit-storaged (&gt;= 238-1), cockpit-networkmanager (&gt;= 238-1), cockpit-packagekit (&gt;= 238-1)
Suggests: cockpit-doc (&gt;= 238-1), cockpit-pcp (&gt;= 238-1), cockpit-machines (&gt;= 238-1), xdg-utils
Homepage: <https://cockpit-project.org/>
Download-Size: 21.3 kB
APT-Sources: <http://ca.archive.ubuntu.com/ubuntu> hirsute/universe amd64 Packages
Description: Web Console for Linux servers
 The Cockpit Web Console enables users to administer GNU/Linux servers using a
 web browser.
 .
 It offers network configuration, log inspection, diagnostic reports, SELinux
 troubleshooting, interactive command-line sessions, and more.

$
```

特别要注意的是 `Description` 字段，它会告诉你更多关于应用程序的信息。`Depends` 字段说明还必须安装什么，而 `Recommends` 则显示建议安装的其他（如果有的话）合作组件。`Homepage` 字段会提供一个网址，通过它你可以了解更多。

### 哪个包提供的这个文件？

有时你并不知道包名，但你知道包里一定包含着的某个文件。Seth 以 `qmake-qt5` 程序作为示例。使用 `apt search` 找不到它：


```
$ apt search qmake-qt5
Sorting... Done
Full Text Search... Done
$
```

但是，另一个有关联的命令 `apt-file` 可以用来探索包内部：


```
$ apt-file search qmake-qt5
qt5-qmake-bin: /usr/share/man/man1/qmake-qt5.1.gz
$
```

这时会显示一个 `qmake-qt5` 的手册页。它是一个名为 `qt5-qmake-bin` 的包的一部分。注意，此包名称颠倒了字符串 `qmake` 和 `qt5` 的顺序。

### 包里包含哪些文件？

方便的 `apt-file` 命令会列出给定的包中包含哪些文件。例如：


```
$ apt-file list cockpit
cockpit: /usr/share/doc/cockpit/TODO.Debian
cockpit: /usr/share/doc/cockpit/changelog.Debian.gz
cockpit: /usr/share/doc/cockpit/copyright
cockpit: /usr/share/man/man1/cockpit.1.gz
cockpit: /usr/share/metainfo/cockpit.appdata.xml
cockpit: /usr/share/pixmaps/cockpit.png
$
```

注意，这与 `apt show` 命令提供的信息不同，后者列出了包的依赖（其他必须安装的包）。

### 移除一个应用程序

你还可以使用 `apt` 移除软件包。例如，要移除`apt-file` 应用程序：


```
`$ sudo apt purge apt-file`
```

注意必须由超级用户运行 `apt` 才能安装或移除应用程序。

移除一个包并不会自动移除 `apt` 在此过程中安装的所有依赖项。不过，一点点的工作就很容易去除这些残留：


```
`$ sudo apt autoremove`
```

### 认识一下 apt

正如 Seth 所写的，“你对包管理器的工作方式了解得越多，在需要安装和查询应用程序时就会越容易。”

即便你不是 `apt` 的重度使用者，当你需要在命令行中安装或删除软件包时（例如，在一台远程服务器上或遵循某些热心肠发布的操作指南时），掌握一些 apt 的知识也会很有用。在某些软件创作者仅提供了一个裸 `.pkg` 文件的情况下，可能还需要了解一些关于 Dkpg 的知识（如上所述）。

我发现 Synaptic 包管理器在我的桌面上是一个非常有用的工具，但出于各种目的，我也在少数维护的服务器上使用着 `apt`。

**[下载我们的 `apt` 速查表][15]** 习惯该命令并尝试一些新技巧。一旦你这样做了，你可能会发现很难再使用其他任何东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/apt-linux

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/21/2/linux-package-management
[3]: https://opensource.com/article/21/5/dnf
[4]: https://www.nongnu.org/synaptic/
[5]: https://wiki.debian.org/Aptitude
[6]: https://wiki.debian.org/Teams/Dpkg
[7]: https://flatpak.org/
[8]: https://snapcraft.io/
[9]: https://wiki.gnome.org/Apps/Software
[10]: https://archlinux.org/
[11]: https://www.gentoo.org/
[12]: https://opensource.com/article/20/11/cockpit-server-management
[13]: mailto:ubuntu-devel-discuss@lists.ubuntu.com
[14]: mailto:pkg-utopia-maintainers@lists.alioth.debian.org
[15]: https://opensource.com/downloads/apt-cheat-sheet
