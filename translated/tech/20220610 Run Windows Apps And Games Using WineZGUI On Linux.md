[#]: subject: "Run Windows Apps And Games Using WineZGUI On Linux"
[#]: via: "https://ostechnix.com/winezgui-run-windows-apps-and-games-on-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 上使用 WineZGUI 运行 Windows 应用和游戏
======
WineZGUI - 一个使用 Zenity 的 Wine GUI 前台

不久前，我们写了关于 **[Bottles][1]** 的文章，这是一个开源的图形应用，可以在 Linux 操作系统上轻松运行 Windows 软件和游戏。今天，我们将讨论一个类似的有趣项目。向 **WineZGUI** 打个招呼，它是一个 Wine GUI 前台，可以**[在 Linux 上用 Wine 运行 Windows 应用和游戏][2]**。


#### 内容

1. 什么是 WineZGUI？
2. Bottles 与 WineZGUI
3. 如何在 Linux 中安装 WineZGUI
4. 在 Linux 中用 WineZGUI 运行 Windows 应用和游戏
5. 总结

### 什么是 WineZGUI？

WineZGUI 是一个 Bash 脚本的集合，它允许你轻松地管理 wine 前缀，并在 Linux 上使用 **Zenity** 提供更容易的 wine 游戏体验。

使用 WineZGUI，我们可以直接从文件管理器中启动 Windows exe 文件或游戏，而无需安装它们。

WineZGUI 为每个应用或游戏创建快捷方式，以便于访问，同时也为每个 exe 二进制文件创建单独的前缀。

当你用 WineZGUI 启动一个 Windows exe 文件时，它会提示你是否使用默认的 wine 前缀或创建一个新的前缀。默认的前缀是 `~/.local/share/winezgui/default`。

如果你选择为 windows 二进制文件或 exe 创建一个新的前缀，WineZGUI 将尝试从 exe 文件中提取产品名称和图标，并创建一个桌面快捷方式。

当你以后启动相同的 exe 或二进制文件时，它将建议你用先前的相关前缀来运行它。

说得通俗一点，WineZGUI 只是一个用于官方原始 wine 的 Wine 和 winetricks 的简单 GUI。当我们启动一个 exe 来玩游戏时，Wine 前缀的设置是自动的。

你只需打开一个 exe，它就会创建一个前缀和一个桌面快捷方式，并从该 exe 中提取名称和图标。

它使用 **exiftool** 和 **icotool** 工具来分别提取名称和图标。你可以通过现有的前缀打开一个 exe 来启动该游戏，或者使用桌面快捷方式。

WineZGUI 是一个在 GitHub 上免费托管的 shell 脚本。你可以抓取源代码，改进它，修复错误和增加功能。

### Bottles Vs WineZGUI

你可能想知道 WineZGUI 与 Bottles 相比如何。但这些应用之间有一个微妙的区别。

**Bottles 是面向前缀的**和**面向运行器的**。意思是：Bottles 首先创建一个前缀，然后使用不同的 exe 文件。Bottles 不会记住 exe 的前缀。Bottles 使用不同的运行器。

**WineZGUI 是面向 exe 的**。它使用 exe 只为该 exe 创建一个前缀。下次我们打开一个 exe 时，它将询问是否用现有的 exe 前缀启动。

WineZGUI 不提供像 **bottles** 或 **[lutris][3]** 那样的高级功能，如运行程序、在线安装程序等。

### 如何在 Linux 中安装 WineZGUI

确保你已经安装了 WineZGUI 的必要先决条件。

**Debian/Ubuntu：**

```
$ sudo dpkg --add-architecture i386
$ sudo apt install zenity wine winetricks libimage-exiftool-perl icoutils gnome-terminal
```

**Fedora：**

```
$ sudo dnf install zenity wine winetricks perl-Image-ExifTool icoutils gnome-terminal
```

官方推荐的安装 WineZGUI 的方法是使用 **[Flatpak][4]**。

安装完 Flatpak 后，逐一运行以下命令，在 Linux 中安装 WineZGUI。

```
$ flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

```
$ flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-21.08
```

```
$ wget https://github.com/fastrizwaan/WineZGUI-Releases/releases/download/WineZGUI-0.4_20220608/io.github.WineZGUI_0_4_20220608.flatpak
```

```
$ flatpak --user -y install io.github.WineZGUI_0_4_20220608.flatpak
```

### 在 Linux 中用 WineZGUI 运行 Windows 应用和游戏

从 Dash 或菜单中启动 WineZGUI。

![Launch WineZGUI][5]

这就是 WineZGUI 的默认界面的样子。

![WineZGUI Interface][6]

正如你在上面的截图中看到的，WineZGUI 的界面非常简单易懂。从主窗口中，你可以：

* 打开一个 EXE 文件。
* 打开 Winetricks GUI 和 CLI。
* 启动 Wine 配置。
* 启动资源管理器。
* 打开 BASH shell。
* 关闭所有的应用/游戏，包括 WineZGUI 界面。
* 删除 wine 前缀。
* 查看已安装的 WineZGUI 版本。

为了演示，我将打开一个 .exe 文件。

在下一个窗口中，选择要运行的 EXE 文件。在我的例子中，它是 WinRAR。

![Choose The EXE File To Run][7]

接下来，你是想用默认的前缀运行 EXE 文件，还是创建一个新的前缀。我选择默认的前缀。

![Run WinRAR With Default Prefix][8]

几秒钟后，会出现 WinRAR 安装向导。点击安装，继续。

![Install WinRAR In Linux][9]

点击 OK 来完成 WinRAR 的安装。

![Complete WinRAR Installation][10]

点击“运行 WinRAR” 来启动它。

![Run WinRAR][11]

下面是 WinRAR 在我的 Fedora 36 桌面上的运行情况!

![WinRAR Is Running In Fedora Using Wine][12]

### 总结

WineZGUI 是俱乐部的新人。 如果你正在寻找一种在 Linux 桌面上使用 Wine 运行 Windows 应用和游戏的更简单方法，WineZGUI 可能是一个不错的选择。

在 WineZGUI 的帮助下，用户可以选择在与 `.exe` 相同的文件夹中创建一个 wine 前缀，并创建一个相对链接的 `.desktop` 条目来自动执行此操作。

原因是使用 wine 前缀备份和删除游戏更容易，并且让它生成一个 `.desktop` 将使其能够适应移动和转移。

一个很酷的场景是使用应用进行设置，然后将 wine 前缀分享给你的朋友和其他人，他们只需要一个具有所有依赖性和保存的工作 wine 前缀。

请试一试它，在下面的评论区告诉我们你对这个项目的看法。

**资源：**

* [WineZGUI GitHub 仓库][13]

--------------------------------------------------------------------------------

via: https://ostechnix.com/winezgui-run-windows-apps-and-games-on-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/run-windows-software-on-linux-with-bottles/
[2]: https://ostechnix.com/run-windows-games-softwares-ubuntu-16-04/
[3]: https://ostechnix.com/manage-games-using-lutris-linux/
[4]: https://ostechnix.com/how-to-install-and-use-flatpak-in-linux/
[5]: https://ostechnix.com/wp-content/uploads/2022/06/Launch-WineZGUI.png
[6]: https://ostechnix.com/wp-content/uploads/2022/06/WineZGUI-Interface.png
[7]: https://ostechnix.com/wp-content/uploads/2022/06/Choose-The-EXE-File-To-Run.png
[8]: https://ostechnix.com/wp-content/uploads/2022/06/Run-WinRAR-With-Default-Prefix.png
[9]: https://ostechnix.com/wp-content/uploads/2022/06/Install-WinRAR-In-Linux.png
[10]: https://ostechnix.com/wp-content/uploads/2022/06/Complete-WinRAR-Installation.png
[11]: https://ostechnix.com/wp-content/uploads/2022/06/Run-WinRAR.png
[12]: https://ostechnix.com/wp-content/uploads/2022/06/WinRAR-Is-Running-In-Fedora-Using-Wine.png
[13]: https://github.com/fastrizwaan/WineZGUI
