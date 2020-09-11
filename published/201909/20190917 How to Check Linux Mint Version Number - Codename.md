[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11360-1.html)
[#]: subject: (How to Check Linux Mint Version Number & Codename)
[#]: via: (https://itsfoss.com/check-linux-mint-version/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何查看 Linux Mint 版本号和代号
======

Linux Mint 每两年发布一次主版本（如 Mint 19），每六个月左右发布一次次版本（如 Mint 19.1、19.2 等）。 你可以自己升级 Linux Mint 版本，而次版本也会自动更新。

在所有这些版本中，你可能想知道你正在使用的是哪个版本。了解 Linux Mint 版本号可以帮助你确定某个特定软件是否适用于你的系统，或者检查你的系统是否已达到使用寿命。

你可能需要 Linux Mint 版本号有多种原因，你也有多种方法可以获取此信息。让我向你展示用图形和命令行的方式获取 Mint 版本信息。

* [使用命令行查看 Linux Mint 版本信息][1]
* [使用 GUI（图形用户界面）查看 Linux Mint 版本信息][2]

### 使用终端查看 Linux Mint 版本号的方法

![][3]

我将介绍几种使用非常简单的命令查看 Linux Mint 版本号和代号的方法。 你可以从 “菜单” 中打开终端，或按 `CTRL+ALT+T`（默认热键）打开。

本文中的最后两个命令还会输出你当前的 Linux Mint 版本所基于的 Ubuntu 版本。

#### 1、/etc/issue

从最简单的 CLI 方法开始，你可以打印出 `/etc/issue` 的内容来检查你的版本号和代号：

```
[email protected]:~$ cat /etc/issue
Linux Mint 19.2 Tina \n \l
```

#### 2、hostnamectl

![hostnamectl][4]

这一个命令（`hostnamectl`）打印的信息几乎与“系统信息”中的信息相同。 你可以看到你的操作系统（带有版本号）以及你的内核版本。

#### 3、lsb_release

`lsb_release` 是一个非常简单的 Linux 实用程序，用于查看有关你的发行版本的基本信息：

```
[email protected]:~$ lsb_release -a
No LSB modules are available.
Distributor ID:    LinuxMint
Description:    Linux Mint 19.2 Tina
Release:    19.2
Codename:    tina
```

**注：** 我使用 `–a` 标签打印所有参数, 但你也可以使用 `-s` 作为简写格式，`-d` 用于描述等 （用 `man lsb_release` 查看所有选项）

#### 4、/etc/linuxmint/info

![/etc/linuxmint/info][5]

这不是命令，而是 Linux Mint 系统上的文件。只需使用 `cat` 命令将其内容打印到终端，然后查看你的版本号和代号。 

#### 5、使用 /etc/os-release 命令也可以获取到 Ubuntu 代号

![/etc/os-release][7]

Linux Mint 基于 Ubuntu。每个 Linux Mint 版本都基于不同的 Ubuntu 版本。了解你的 Linux Mint 版本所基于的 Ubuntu 版本有助你在必须要使用 Ubuntu 版本号的情况下使用（比如你需要在 [Linux Mint 中安装最新的 Virtual Box][8]添加仓库时）。 

`os-release` 则是另一个类似于 `info` 的文件，向你展示 Linux Mint 所基于的 Ubuntu 版本代号。

#### 6、使用 /etc/upstream-release/lsb-release 只获取 Ubuntu 的基本信息

如果你只想要查看有关 Ubuntu 的基本信息，请输出 `/etc/upstream-release/lsb-release`：  
 
```
[email protected]:~$ cat /etc/upstream-release/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"
```

特别提示：[你可以使用 uname 命令查看 Linux 内核版本][9]。

```
[email protected]:~$ uname -r
4.15.0-54-generic
```

**注：** `-r` 代表 release，你可以使用 `man uname` 查看其他信息。

### 使用 GUI 查看 Linux Mint 版本信息

如果你对终端和命令行不满意，可以使用图形方法。如你所料，这个非常明了。

打开“菜单” (左下角)，然后转到“偏好设置 > 系统信息”：

![Linux Mint 菜单][10]

或者，在菜单中，你可以搜索“System Info”：

![Menu Search System Info][11]

在这里，你可以看到你的操作系统（包括版本号），内核和桌面环境的版本号：

![System Info][12]

### 总结

我已经介绍了一些不同的方法，用这些方法你可以快速查看你正在使用的 Linux Mint 的版本和代号（以及所基于的 Ubuntu 版本和内核）。我希望这个初学者教程对你有所帮助。请在评论中告诉我们你最喜欢哪个方法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-linux-mint-version/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: tmp.pL5Hg3N6Qt#terminal
[2]: tmp.pL5Hg3N6Qt#GUI
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/check-linux-mint-version.png?ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/hostnamectl.jpg?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/linuxmint_info.jpg?ssl=1
[6]: https://itsfoss.com/rid-google-chrome-icons-dock-elementary-os-freya/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/os_release.jpg?ssl=1
[8]: https://itsfoss.com/install-virtualbox-ubuntu/
[9]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux_mint_menu.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/menu_search_system_info.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/system_info.png?ssl=1
