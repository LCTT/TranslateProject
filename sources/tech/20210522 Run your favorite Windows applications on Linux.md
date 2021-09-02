[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run your favorite Windows applications on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-wine)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在你的Linux系统上运行Windows软件！
======

WINE是一个让你在Linux系统上运行windows本地程序的开源项目。
![Computer screen with files or windows open][1]

2021年，有很多原因让人们比以往更加喜欢Linux系统。在这一系列的文章中，我们将分享21个使用Linux系统的理由。下面将介绍如何使用WINE实现从windows系统到Linux系统的无缝转换。

你是否有一个程序只能在windows平台上运行？是不是由于某一个程序阻碍了你使用Linux系统？如果是这样的话，你将会很想了解WINE，这是一个开源项目，它彻底地改变了了
Windows系统核心库，让原生Windows程序能运行在你的Linux系统上。

WINE 的意思是“Wine不是一个模糊测试器”，它使用了驱动这项技术的代码。自从1993年以来，极客们一直致力于将应用程序的任何WIndows API调用转换成[POSIX][2]


这是一个惊人的编程壮举，尤其是这个项目是独立运行的，没有微软的帮助（至少来讲），但是有限制。应用程序离Windows API的核心越来越远，WINE就无法预料到应用程序的需求。 有一些供应商可以弥补这一点，特别是[Codeweavers][3] 和[Valve Software][4]。需要得到支持的应用程序的生产商，与进行开发的公司和人没有协调。因此例如在更新软件上，从[WINE headquarters][5]到获得到“黄金”支持地位时，可能会存在一些延迟时间。
However, if you're looking to run a well-known Windows application on Linux, the chances are good that WINE is ready for it.
然而，如果你你希望在Linux上运行一个著名的Windows应用程序的时候，那么WINE很可能已经准备好了。

### 安装WINE

你可以从Fedora,CentOS Stream,或者RHEL等发型版本的软件储存仓库安装WINE。

```
`$ sudo dnf install wine`
```

在Debian, Linux Mint,Elementary上的安装方法相似：


```
`$ sudo apt install wine`
```

WINE不是一个你启动的应用程序，它是一个你启动Windows应用程序的后端支持软件。你WINE的第一次打交道很可能发生在你在Linux上启动Windows应用程序时。

### 安装应用程序

[TinyCAD][6]是一个很好的设计电路的开源应用程序，但只适用于Windows系统。虽然它是一个小程序，但它的确包含了不少.NET组件，因此应该对于WINE来说有一点压力。

首先，下载TinyCAD的安装程序，与Windows安装程序的常见情况一样，它是一个EXE文件。下载后双击运行它。

![WINE TinyCAD installation wizard][7]

首先通过WINE安装的步骤就如在Windows上安装软件相同。一般都采用默认方案安装，尤其是在使用WINE的时候。WINE的运行环境是独立的，隐藏在你的硬件驱动**drive_c**文件中，可以让Windows程序如在Windows系统中一般采用管理员的的权限运行在模拟的系统环境中。

![WINE TinyCAD installation and destination drive][8]

WINE TinyCAD 的运行位置

安装后，应用程序通常会为你启动。如果你准备好进行测试，请启动应用程序。 

### 运行Windows应用程序

除了安装后立即启动外，通常启动WINE应用程序的方式与启动本机Linux应用程序的方式相同。无论你是使用应用程序菜单还是活动屏幕应用程序的名称，在WINE中运行的桌面Windows应用程序基本上都被视为Linux上的本机应用程序。

![TinyCAD running with WINE][9]

TinyCAD通过WINE得到运行支持

### 当WINE崩溃时

大多数我在使用WINE运行的应用程序，包括TinyCAD，或者其他的程序都能正常运行。然而，有一些例外情况，当你等了几个月后，看看WINE的开发人员（或者说有游戏，软件）
是否能赶上开发进度，或者说你可以联系Codeweavers这样的供应商，了解他们是否销售对于你需要的应用程序支持。
### WINE是“欺骗”，但“是有益处”

一些Linux用户认为，如果你使用WINE，你就是在Linux上“作弊”。也许会有这种感觉，但WINE是一个开源项目，它允许用户切换到Linux，并且仍然可以运行他们工作或爱好所需的应用程序。如果WINE解决了你的问题，并让你更加方便的使用Linux系统，那么就使用它，并接受Linux系统的灵活性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-wine

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hongsofwing](https://github.com/hongsofwing)
校对：[hongsofwing](https://github.com/hongsofwing)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://www.codeweavers.com/crossover
[4]: https://github.com/ValveSoftware/Proton
[5]: http://winehq.org
[6]: https://sourceforge.net/projects/tinycad/
[7]: https://opensource.com/sites/default/files/wine-tinycad-install.jpg
[8]: https://opensource.com/sites/default/files/wine-tinycad-drive_0.jpg
[9]: https://opensource.com/sites/default/files/wine-tinycad-running.jpg
