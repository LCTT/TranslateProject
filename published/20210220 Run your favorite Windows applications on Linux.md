[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13184-1.html)
[#]: subject: (Run your favorite Windows applications on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-wine)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 Linux 上运行你最喜欢的 Windows 应用程序
======

> WINE 是一个开源项目，它可以协助很多 Windows 应用程序在 Linux 上运行，就好像它们是原生程序一样。

![](https://img.linux.net.cn/data/attachment/album/202103/07/231159kwsn2snlilwbs9ns.jpg)

在 2021 年，有很多比以往更喜欢 Linux 的原因。在这系列中，我将分享使用 Linux 的 21 种原因。这里是如何使用 WINE 来实现从 Windows 到 Linux 的无缝切换。

你有只能在 Windows 上运行的应用程序吗？那一个应用程序阻碍你切换到 Linux 的唯一因素吗？如果是这样的话，你将会很高兴知道 WINE，这是一个开源项目，它几乎重新发明了关键的 Windows 库，使为 Windows 编译的应用程序可以在 Linux 上运行。

WINE 代表着“Wine Is Not an Emulator” ，它指的是驱动这项技术的代码。开源开发者从 1993 年就开始致力将应用程序的任何传入 Windows API 调用翻译为 [POSIX][2] 调用。

这是一个令人十分惊讶的编程壮举，尤其是考虑到这个项目是独立运行的，没有来自微软的帮助（至少可以这样说），但是也有局限性。一个应用程序偏离 Windows API 的 “内核” 越远，WINE 就越不能预期应用程序的请求。有一些供应商可以弥补这一点，尤其是 [Codeweavers][3] 和 [Valve Software][4]。在需要翻译应用程序的制作者和翻译的人们及公司之间没有协调配合，因此，比如说一个更新的软件作品和从 [WINE 总部][5] 获得完美适配状态之间可能会有一些时间上的滞后。

然而，如果你想在 Linux 上运行一个著名的 Windows 应用程序，WINE 可能已经为它准备好了可能性。

### 安装 WINE

你可以从你的 Linux 发行版的软件包存储库中安装 WINE 。在 Fedora、CentOS Stream 或 RHEL 系统上：

```
$ sudo dnf install wine
```

在 Debian、Linux Mint、Elementary 及相似的系统上：

```
$ sudo apt install wine
```

WINE 不是一个你自己启动的应用程序。当启动一个 Windows 应用程序时，它是一个被调用的后端。你与 WINE 的第一次交互很可能就发生在你启动一个 Windows 应用程序的安装程序时。

### 安装一个应用程序

[TinyCAD][6] 是一个极好的用于设计电路的开源应用程序，但是它仅在 Windows 上可用。虽然它是一个小型的应用程序，但是它确实包含一些 .NET 组件，因此应该能对 WINE 进行一些压力测试。

首先，下载 TinyCAD 的安装程序。Windows 安装程序通常都是这样，它是一个 `.exe` 文件。在下载后，双击文件来启动它。

![WINE TinyCAD 安装向导][7]

*TinyCAD 的 WINE 安装向导*

像你在 Windows 上一样逐步完成安装程序。通常最好接受默认选项，尤其是与 WINE 有关的地方。WINE 环境基本上是独立的，隐藏在你的硬盘驱动器上的一个 `drive_c` 目录中，作为 Windows 应用程序使用的一个文件系统的仿真根目录。

![WINE TinyCAD 安装和目标驱动器][8]

*WINE TinyCAD 目标驱动器*

安装完成后，应用程序通常会为你提供启动机会。如果你正准备测试一下它的话，启动应用程序。

### 启动 Windows 应用程序

除了在安装后的第一次启动外，在正常情况下，你启动一个 WINE 应用程序的方式与你启动一个本地 Linux 应用程序相同。不管你使用应用程序菜单、活动屏幕或者只是在运行器中输入应用程序的名称，在 WINE 中运行的桌面 Windows 应用程序都会被视为在 Linux 上的本地应用程序。

![TinyCAD 使用 WINE 运行][9]

*通过 WINE 的支持来运行 TinyCAD*

### 当 WINE 失败时

我在 WINE 中的大多数应用程序，包括 TinyCAD ，都能如期运行。不过，也会有例外。在这些情况下，你可以等几个月来查看 WINE 开发者 （或者，如果是一款游戏，就等候 Valve Software）是否进行追加修补，或者你可以联系一个像 Codeweavers 这样的供应商来查看他们是否出售对你所需要的应用程序的服务支持。

### WINE 是种欺骗，但它用于正道

一些 Linux 用户觉得：如果你使用 WINE 的话，你就是在“欺骗” Linux。它可能会让人有这种感觉，但是 WINE 是一个开源项目，它使用户能够切换到 Linux ，并且仍然能够运行工作或爱好所需的应用程序。如果 WINE 解决了你的问题，让你使用 Linux，那就使用它，并拥抱 Linux 的灵活性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-wine

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

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
