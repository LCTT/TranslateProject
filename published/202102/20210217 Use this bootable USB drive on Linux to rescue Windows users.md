[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13143-1.html)
[#]: subject: (Use this bootable USB drive on Linux to rescue Windows users)
[#]: via: (https://opensource.com/article/21/2/linux-woeusb)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

如何在 Linux 中创建 USB 启动盘来拯救 Windows 用户
======

> WoeUSB 可以在 Linux 中制作 Windows 启动盘，并帮助你的朋友解锁他们罢工的机器。

![](https://img.linux.net.cn/data/attachment/album/202102/22/143829x0gm1gkmw1yb1zu8.jpg)

人们经常要求我帮助他们恢复被锁死或损坏的 Windows 电脑。有时，我可以使用 Linux USB 启动盘来挂载 Windows 分区，然后从损坏的系统中传输和备份文件。

有的时候，客户丢失了他们的密码或以其他方式锁死了他们的登录账户凭证。解锁账户的一种方法是创建一个 Windows 启动盘来修复计算机。微软允许你从网站下载 Windows 的副本，并提供创建 USB 启动盘的工具。但要使用它们，你需要一台 Windows 电脑，这意味着，作为一个 Linux 用户，我需要其他方法来创建一个 DVD 或 USB 启动盘。我发现在 Linux 上创建 Windows USB 很困难。我的可靠工具，如 [Etcher.io][2]、[Popsicle][3]（适用于 Pop!_OS）和 [UNetbootin][4]，或者从命令行使用 `dd` 来创建可启动媒体，都不是很成功。

直到我发现了 [WoeUSB-ng][5]，一个 [GPL 3.0][6] 许可的 Linux 工具，它可以为 Windows Vista、7、8 和 10 创建一个 USB 启动盘。这个开源软件有两个程序：一个命令行工具和一个图形用户界面 （GUI） 版本。

### 安装 WoeUSB-ng

GitHub 仓库包含了在 Arch、Ubuntu、Fedora 或使用 pip3 [安装][7] WoeUSB-ng 的说明。

如果你是受支持的 Linux 发行版，你可以使用你的包管理器安装 WoeUSB-ng。或者，你可以使用 Python 的包管理器 [pip][8] 来安装应用程序。这在任何 Linux 发行版中都是通用的。这些方法在功能上没有区别，所以使用你熟悉的任何一种。

我运行的是 Pop!_OS，它是 Ubuntu 的衍生版本，但由于对 Python 很熟悉，我选择了 pip3 安装：

```
$ sudo pip3 install WoeUSB-ng
```

### 创建一个启动盘

你可以从命令行或 GUI 版本使用 WoeUSB-ng。

要从命令行创建一个启动盘，语法要求命令包含 Windows ISO 文件的路径和一个设备。（本例中是 `/dev/sdX`。使用 `lsblk` 命令来确定你的驱动器）

```
$ sudo woeusb --device Windows.iso /dev/sdX
```

你也可以启动该程序，以获得简单易用的界面。在 WoeUSB-ng 应用程序窗口中，找到 `Windows.iso` 文件并选择它。选择你的 USB 目标设备（你想变成 Windows 启动盘的驱动器）。这将会删除这个驱动器上的所有信息，所以要谨慎选择，然后仔细检查（再三检查）你的选择！

当你确认正确选择目标驱动器后，点击 **Install** 按钮。

![WoeUSB-ng UI][9]

创建该介质需要 5 到 10 分钟，这取决于你的 Linux 电脑的处理器、内存、USB 端口速度等。请耐心等待。

当这个过程完成并验证后，你将有可用的 Windows USB 启动盘，以帮助其他人修复 Windows 计算机。

### 帮助他人

开源就是为了帮助他人。很多时候，你可以通过使用基于 Linux 的[系统救援 CD][11] 来帮助 Windows 用户。但有时，唯一的帮助方式是直接从 Windows 中获取，而 WoeUSB-ng 是一个很好的开源工具，它可以让这成为可能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-woeusb

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://etcher.io/
[3]: https://github.com/pop-os/popsicle
[4]: https://github.com/unetbootin/unetbootin
[5]: https://github.com/WoeUSB/WoeUSB-ng
[6]: https://github.com/WoeUSB/WoeUSB-ng/blob/master/COPYING
[7]: https://github.com/WoeUSB/WoeUSB-ng#installation
[8]: https://opensource.com/downloads/pip-cheat-sheet
[9]: https://opensource.com/sites/default/files/uploads/woeusb-ng-gui.png (WoeUSB-ng UI)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://www.system-rescue.org/
