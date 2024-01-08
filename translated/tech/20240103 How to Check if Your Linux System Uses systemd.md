[#]: subject: "How to Check if Your Linux System Uses systemd"
[#]: via: "https://itsfoss.com/check-if-systemd/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何检查你的 Linux 系统是否使用 systemd
======

每个主流 Linux 发行版（包括 Ubuntu、Fedora、openSUSE 和 Arch）默认都使用 systemd。

但是有[许多非 systemd 发行版][1]，例如使用轻量级 runit 来获得更好性能的 Void Linux 或主要使用 sysvinit 的 Devuan。

当你尝试遵循某些教程或文档并且其中包含特定于 systemd 或某些其他 init 服务的命令时，就会出现问题。

这时，你必须检查你的 Linux 系统使用的是 systemd 还是其他系统。

一种方法是检查 PID 为 1 的进程（毕竟，init 系统是 Linux 系统上运行的第一个进程）。

````

     ps 1

````

但它的输出可能会产生误导，因为它经常显示 `/sbin/init`，这只是实际 init 进程的软链接。

如果你[跟随该符号链接][2]，就可以获取 init 系统信息。有两种方法：

   * 使用 stat 命令
   * 使用 readlink 命令



那么让我们从第一个开始。

📋

这些方法在 6 个 init 系统中进行了测试： Systemd、OpenRC、SysVnint、Busybox、runit 和 s6。

### 方法 1：使用 stat 命令检查 systemd 是否正在使用

以下是如何使用 stat 命令来了解你正在使用的 init 系统：

```

    stat /sbin/init

```

如果你使用的是 systemd 支持的发行版，那么它将显示以下输出：

![][3]

但是，如果你使用 systemd 之外的其他任何东西，它将显示 init 名称，除非你使用 SysVnit，它只会显示 `init` 而不是 `sysvnit`：

![SysVnit only displays "init" instead of sysvnit][4]

### 方法 2：使用 readlink 命令检查 init 系统

与之前的方法不同，当你使用 readlink 命令时，它只会打印 init 系统的名称。

因此，如果你想知道你是否正在使用 Systemd，只需使用以下命令：

```

    readlink /sbin/init

```

![][5]

如果你使用 [OpenRC init service][6]，那么它将显示以下输出：

![][7]

但如果你使用 SysVnit，那么它会显示以下输出：

![][8]

### 我为你写的小“脚本”

另一种方法是检查 `/run/systemd/system` 目录是否存在。

好吧，最简单的找出方法是在终端中[使用 if-else bash 命令][9]，它将检查你是否正在运行由 systemd 驱动的发行版：

```

    if [ -d /run/systemd/system ]; then echo "System is running systemd"; else echo "System is not running systemd"; fi

```

![][10]

### 有关 systemd 的更多信息

当你知道你正在使用 systemd 支持的发行版，你就可以[使用 systemctl 命令管理服务][11]：

![][12]

想要从头开始[创建一个 systemd 服务][13]？ 你也可以那样做：

![][12]

我希望本指南对你有所帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-if-systemd/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/systemd-free-distros/
[2]: https://linuxhandbook.com/follow-symbolic-link/
[3]: https://itsfoss.com/content/images/2023/12/Use-the-stat-command-to-find-if-you-are-using-systemd-or-not.png
[4]: https://itsfoss.com/content/images/2023/12/Check-if-you-are-using-SysVnit-in-Linux-or-not.png
[5]: https://itsfoss.com/content/images/2023/12/Use-the-readlink-command-to-find-if-you-are-using-systemd-or-not-something-else.png
[6]: https://wiki.gentoo.org/wiki/OpenRC/openrc-init
[7]: https://itsfoss.com/content/images/2023/12/find-if-you-are-using-openrc-as-init-system.png
[8]: https://itsfoss.com/content/images/2023/12/How-to-find-out-if-you-are-using-SysVnit-as-init-system-in-Linux.png
[9]: https://itsfoss.com/bash-if-else/
[10]: https://itsfoss.com/content/images/2023/12/A-simple-if-else-statement-to-know-if-you-are-using-systemd-distro-or-not.png
[11]: https://linuxhandbook.com/systemctl-commands/
[12]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[13]: https://linuxhandbook.com/create-systemd-services/
