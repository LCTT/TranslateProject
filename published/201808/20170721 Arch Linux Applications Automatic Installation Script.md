ArchI0：Arch Linux 应用自动安装脚本
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/ArchI0-Arch-Linux-Applications-Automatic-Installation-Script-720x340.png)

Arch 用户你们好！今天，我偶然发现了一个叫做 “**ArchI0**” 的实用工具，它是基于命令行菜单的 Arch Linux 应用自动安装脚本。使用此脚本是为基于 Arch 的发行版安装所有必要的应用最简易的方式。请注意**此脚本仅适用于菜鸟级使用者**。中高级使用者可以轻松掌握[如何使用 pacman][1]来完成这件事。如果你想学习如何使用 Arch Linux，我建议你一个个手动安装所有的软件。对那些仍是菜鸟并且希望为自己基于 Arch 的系统快速安装所有必要应用的用户，可以使用此脚本。

### ArchI0 – Arch Linux 应用自动安装脚本

此脚本的开发者已经制作了 **ArchI0live** 和 **ArchI0** 两个脚本。你可以通过 ArchI0live 测试应用，无需安装。这可能有助于在将脚本安装到系统之前了解其实际内容。

### 安装 ArchI0

要安装此脚本，使用如下命令通过 Git 克隆 ArchI0 脚本仓库：

```
$ git clone https://github.com/SifoHamlaoui/ArchI0.git
```

上面的命令会克隆 ArchI0 的 Github 仓库内容，在你当前目录的一个名为 ArchI0 的文件夹里。使用如下命令进入此目录：

```
$ cd ArchI0/
```

使用如下命令赋予脚本可执行权限：

```
$ chmod +x ArchI0live.sh
```

使用如下命令执行脚本：

```
$ sudo ./ArchI0live.sh

```

此脚本需要以 root 或 sudo 用户身份执行，因为安装应用需要 root 权限。

> **注意：** 有些人想知道此脚本中开头的那些命令是做什么的，第一个命令是下载 **figlet**，因为此脚本的 logo 是使用 figlet 显示的。第二个命令是安装用来打开并查看许可协议文件的 **Leafpad**。第三个命令是安装用于从 sourceforge 下载文件的 **wget**。第四和第五个命令是下载许可协议文件并用 leafpad 打开。此外，最后的第 6 条命令是在阅读许可协议文件之后关闭它。

输入你的 Arch Linux 系统架构然后按回车键。当其请求安装此脚本时，键入 `y` 然后按回车键。

![][3]

一旦开始安装，将会重定向至主菜单。

![][4]

正如前面的截图， ArchI0 包含有 13 类、90 个容易安装的程序。这 90 个程序刚好足够配置一个完整的 Arch Linux 桌面，可执行日常活动。键入 `a` 可查看关于此脚本的信息，键入 `q` 可退出此脚本。

安装后无需执行 ArchI0live 脚本。可以直接使用如下命令启动：

```
$ sudo ArchI0
```

它会每次询问你选择 Arch Linux 发行版的架构。

```
This script Is under GPLv3 License

Preparing To Run Script
 Checking For ROOT: PASSED
 What Is Your OS Architecture? {32/64} 64
```

从现在开始，你可以从主菜单列出的类别选择要安装的程序。要查看特定类别下的可用程序列表，输入类别号即可。举个例子，要查看**文本编辑器**分类下的可用程序列表，输入 **1** 然后按回车键。

```
This script Is under GPLv3 License

[ R00T MENU ]
Make A Choice
 1) Text Editors
 2) FTP/Torrent Applications
 3) Download Managers
 4) Network managers
 5) VPN clients
 6) Chat Applications
 7) Image Editors
 8) Video editors/Record
 9) Archive Handlers
 10) Audio Applications
 11) Other Applications
 12) Development Environments
 13) Browser/Web Plugins
 14) Dotfiles
 15) Usefull Links
 ------------------------
 a) About ArchI0 Script
 q) Leave ArchI0 Script

Choose An Option: 1
```

接下来，选择你想安装的程序。要返回至主菜单，输入 `q` 然后按回车键。

我想安装 Emacs，所以我输入 `3`。

```
This script Is under GPLv3 License

[ TEXT EDITORS ]
 [ Option ] [ Description ]
 1) GEdit
 2) Geany
 3) Emacs
 4) VIM
 5) Kate
 ---------------------------
 q) Return To Main Menu

Choose An Option: 3
```

现在，Emacs 将会安装至你的 Arch Linux 系统。

![][5]

所选择的应用安装完成后，你可以按回车键返回主菜单。

### 结论

毫无疑问，此脚本让 Arch Linux 用户使用起来更加容易，特别是刚开始使用的人。如果你正寻找快速简单无需使用 pacman 安装应用的方法，此脚本是一个不错的选择。试用一下并在下面的评论区让我们知道你对此脚本的看法。

就这些。希望这个工具能帮到你。我们每天都会推送实用的指南。如果你觉得我们的指南挺实用，请分享至你的社交网络，专业圈子并支持我们。

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/archi0-arch-linux-applications-automatic-installation-script/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/getting-started-pacman/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk-ArchI0_003.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk-ArchI0_004-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/07/pacman-as-superuser_005.png
