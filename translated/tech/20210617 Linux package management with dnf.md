[#]: subject: (Linux package management with dnf)
[#]: via: (https://opensource.com/article/21/6/dnf-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用 dnf 进行 Linux 包管理
======
了解如何在 Linux 上使用 `dnf` 命令安装软件包，然后下载我们的速查表，让正确的命令触手可及。
![Package wrapped with brown paper and red bow][1]

在计算机系统上安装应用程序非常简单。你将档案（如 `.zip` 文件）中的文件复制到目标计算机上操作系统想要安装的位置。因为我们中的许多人习惯于使用精美的安装程序“向导”来帮助我们在计算机上安装软件，所以这个过程似乎在技术上应该比实际更复杂。

然而，程序的构成是个复杂的问题。用户认为的单个应用程序实际上包含了分散在操作系统中的软件库的各种依赖代码（例如：Linux 上的 .so 文件、Windows 上的 .dll 文件和 macOS 上的 .dylib 文件）。

用户不必担心程序代码之间的复杂的依赖关系，因为 Linux 使用 **<ruby>包管理系统<rt>package management system</rt></ruby>** 来跟踪哪些应用程序需要哪些库，哪些库或应用程序有安全或功能更新，以及每个软件会附带安装哪些额外的数据文件。包管理器本质上是一个安装向导。它们易于使用，提供图形界面和基于终端的界面，让你的生活更轻松。你越了解你的发行版的包管理器，你的生活就会越轻松。

### 在 Linux 上安装应用程序

如果你在使用 Linux 桌面时，偶尔想要安装一个应用程序，那么你可能正在寻找 [GNOME Software][2]，一个桌面应用程序浏览器。

![GNOME Software 程序][3]

它会按你的预期工作：点击它的界面，直到你找到一个看起来有用的应用程序，然后单击 **安装** 按钮。

或者，你可以在 `GNOME Software` 中打开从网络下载的 `.rpm` 或 `.flatpakref` 包，以便它进行安装。

如果你更倾向于使用命令行，请继续阅读！

### 用 dnf 搜索软件

在安装应用程序之前，你可能需要确认它存在于你的发行版的服务器上。通常，使用 `dnf` 搜索应用程序的通用名称就足够了。例如，假设你最近阅读了 [一篇关于 Cockpit 的文章][4] 并决定尝试一下。你可以搜索 `cockpit` 验证该发行版是否包含它：


```
$ dnf search cockpit
 Last metadata expiration check: 0:01:46 ago on Tue 18 May 2021 19:18:15 NZST.
 ==== Name Exactly Matched: cockpit ====
 cockpit.x86_64 : Web Console for Linux servers

==== Name &amp; Summary Matched: cockpit ==
 cockpit-bridge.x86_64 : Cockpit bridge server-side component
 cockpit-composer.noarch : Composer GUI for use with Cockpit
 [...]
```

有一个精确的匹配。上面列出的匹配的包名为 `cockpit.x86_64`，但名称中的 `.x86_64` 部分表示它仅兼容该 CPU 架构。默认情况下，你的系统会安装适配当前 CPU 架构的软件包，因此你可以忽略该扩展名。所以你确认你要查找的包确实简称为 `cockpit`。

现在你可以放心地使用 `dnf install` 安装它。 此步骤需要管理员权限：


```
$ sudo dnf install cockpit
```

一般来说，这就是典型的 `dnf` 工作流：搜索和安装。

然而，有时 `dnf search` 的结果并不清晰，或者你想要关于一个包的更多信息而不仅仅是它的通用名称。有一些相关的 `dnf` 子命令，具体取决于你想要的信息。

### Package 元数据

如果你觉得你的搜索已 _接近_ 想要的结果，但还不确定，查看包的元数据通常会有所帮助，例如项目的网址和描述。要获取此信息，请使用顾名思义的 `dnf info` 命令：


```
$ dnf info terminator
Available Packages
Name         : terminator
Version      : 1.92
Release      : 2.el8
Architecture : noarch
Size         : 526 k
Source       : terminator-1.92-2.el8.src.rpm
Repository   : epel
Summary      : Store and run multiple GNOME terminals in one window
URL          : <https://github.com/gnome-terminator>
License      : GPLv2
Description  : Multiple GNOME terminals in one window.  This is a project to produce
             : an efficient way of filling a large area of screen space with
             : terminals. This is done by splitting the window into a resizeable
             : grid of terminals. As such, you can  produce a very flexible
             : arrangements of terminals for different tasks.
```

这个信息告诉你可用包的版本、跟你系统关联的哪一个存储库提供它、项目的网站以及一个详细的功能描述。

### 哪个包提供的这个文件？

包名称并不总是与您要查找的内容相匹配。例如，假设你正在阅读的文档告诉你必须安装名为 `qmake-qt5` 的东西：


```
$ dnf search qmake-qt5
No matches found.
```

`dnf` 数据库非常广泛，因此你不要局限于搜索完全匹配的内容。你可以使用 `dnf provides` 命令来了解是否有任何东西提供了您正在寻找的作为某个更大包的一部分的内容：


```
$ dnf provides qmake-qt5
qt5-qtbase-devel-5.12.5-8.el8.i686 : Development files for qt5-qtbase
Repo        : appstream
Matched from:
Filename    : /usr/bin/qmake-qt5

qt5-qtbase-devel-5.15.2-3.el8.x86_64 : Development files for qt5-qtbase
Repo        : appstream
Matched from:
Filename    : /usr/bin/qmake-qt5
```

可以确认应用程序 `qmake-qt5` 是名为 `qt5-qtbase-devel` 的包的一部分。它还告诉你，应用程序会安装到 `/usr/bin`，因此你知道安装后它的确切位置。

### 包中包含哪些文件？

有时我发现自己从完全不同的角度了解 `dnf`。有时，我已经确认我的系统上安装了一个应用程序；我只是不知道我是怎么安装的。还有一些时候，我知道我安装了一个特定的软件包，但我不清楚这个软件包到底在我的系统上安装了什么。

如果你需要对包的<ruby>有效负载<rt>payload</rt></ruby>进行 <ruby>逆向工程<rt>reverse engineer</rt></ruby>，可以使用 `dnf repoquery` 命令和 `--list` 选项。这将查看存储库中有关包的元数据，并返回该包提供的所有文件的列表：


```
$ dnf repoquery --list qt5-qtbase-devel
/usr/bin/fixqt4headers.pl
/usr/bin/moc-qt5
/usr/bin/qdbuscpp2xml-qt5
/usr/bin/qdbusxml2cpp-qt5
/usr/bin/qlalr
/usr/bin/qmake-qt5
/usr/bin/qvkgen
/usr/bin/rcc-qt5
[...]
```

这些列表可能很长，使用 `less` 或你喜欢的翻页命令配合管道操作会有所帮助。

### 移除应用程序

如果你决定系统中不再需要某个应用程序，可以使用 `dnf remove` 卸载它，该包本身安装的文件以及不再需要的任何依赖项都会被移除：


```
$ dnf remove bigapp
```

有时，你发现随着一个应用程序一起安装的依赖项对后来安装的其他应用程序很有用。如果两个包需要相同的依赖项，`dnf remove`  _不会_ 删除依赖项。在安装和卸载大量应用程序之后，到处都有一个孤立的包的现象并不少见。大约每年我都要执行一次 `dnf autoremove` 来清除所有未使用的软件包：


```
$ dnf autoremove
```

这不是必需的，但这是一个让我的电脑感觉更好的大扫除步骤。

### 了解 dnf

你对包管理器的工作方式了解得越多，在必要时安装和查询应用程序就越容易。即便你不是 `dnf` 的重度使用者，当你发现自己与基于 RPM 的发行版交互时，了解它也会很有用。

告别 `yum` 后，我最喜欢的包管理器之一是 `dnf` 命令。虽然我不喜欢它的所有子命令，但我发现它是目前最鲁棒的<ruby>包管理系统<rt>package management system</rt></ruby>之一。 [**下载我们的 `dnf` 速查表**][5] 习惯该命令，不要害怕尝试一些新技巧。一旦熟悉了它，您可能会发现很难使用其他任何东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/dnf-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://wiki.gnome.org/Apps/Software
[3]: https://opensource.com/sites/default/files/gnome-software.png (The GNOME Software app)
[4]: https://opensource.com/article/20/11/cockpit-server-management
[5]: https://opensource.com/downloads/dnf-cheat-sheet
