[#]: subject: "5 Things to Know When Someone Says Linux is Tough"
[#]: via: "https://news.itsfoss.com/things-to-know-linux-is-tough/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 太难了？你需要知道这 5 点
======

如果只有 Windows, macOS, Linux 三种操作系统可供选择，那么大多数人应该都不怎么会考虑 Linux 系统。

服务器一般都会使用 Linux 操作系统，但普通用户的选择则恰好相反。

很多人只是从别人那儿听来的，都没有亲自试过，就觉得 Linux 太难了。

但是 Linux 真有那么难吗？若果真如此，Linux 到底难在哪里呢？

### Linux 难学吗？

与 Windows 和 macOS 相比，Linux（这里指 Linux 发行版）确实有很多独特之处。

但也多亏了这些差别，Linux 发行版具备了 [Windows][1] 与 [macOS][2] 所不具备的的许多优势。

另外，Linux 基本可以满足你的日常需要。在很多情况下，Linux 操作系统的用户界面与 Windows 或者 macOS 的相差并不大，所以用起来也相当方便。

**不信？** 请看这篇：[与 Windows 相似的 Linux 发行版][3]

那么，Linux 有哪些方面会让用户望而却步呢？

在这篇文章中，我将讨论 Linux 让新用户们普遍犯难的问题，希望可以借此让他们对 Linux 有所改观。

### 1\. 软件安装与软件包管理

![][4]

在 Linux 上，安装软件（或软件包）的方法有很多。

你可以从软件中心安装，也可以在终端进行安装，或者从官方软件源下载软件包然后自行手动安装。

再或者，你甚至可以通过[编译源码实现软件安装][5]。

与 Windows 或者 macOS 不同，Linux 系统可不会使用 EXE 文件或 **dmg** 文件。

对于不同的 Linux 发行版，软件包也会有所不同。例如，[DEB 文件可以安装在 Ubuntu 上][6]。

而在 Fedora 系统下，需要[安装 RPM 文件][7]。

在这种情况下，[Flatpak][8] 和 Snaps 应运而生，使得软件安装更为便捷。如果一款软件有对应的 Flatpak 软件包或者 Snaps 软件包，你就可以把它安装在任意一种 Linux 发行版上。

不过，一些 Linux 发行版可能需要用户自行[安装 Flatpak][9] 或者 [Snaps][10]，因为这些发行版默认情况下可能并不支持它们。

所以你要明白，由于 Linux 有很多不同的发行版本，软件安装方式以及软件包的类型也会存在许多区别。不过，只要了解某个发行版所支持的软件包格式以及安装方法，安装软件就简单多了。

### 2\. “终端恐惧症”

![][16]

在 Windows 或 macOS 系统下，你可能不会经常打开命令行或者终端。

可能也就是在故障排除的时候，会需要使用命令行。但在 Linux 系统下，终端的使用频率却非常高。

即便是在[最好用的 Linux 发行版][11]上，你可能也会经常打开终端，输入命令来执行一些任务，比如：

  * 更新软件包列表
  * 通过软件中心移除未安装的软件
  * 添加软件仓库，安装软件



从技术层面讲，你不需要学习复杂的命令，只需记住如何卸载软件包或者安装 Flatpak 程序，就够用了。

通常情况下，软件的官网上会列出安装命令或者说明。针对故障排除，有时也可以在社区论坛上找到需要输入的命令。

所以说，你根本不需要去“记”什么，上网一搜，应有尽有。

不过，一些用户还是觉得这样会很麻烦，所以他们干脆放弃了 Linux。

最终，这些人只要碰到与 Linux 相关的东西，就避而远之，再也提不起兴趣。

### 3\. 安装显卡驱动

![][17]

macOS 不支持第三方显卡，这就意味着它无法实现虚拟化（尤其是 ARM），也无法用来玩游戏。所以，我们应该放弃 macOS，使用 Windows。

另一方面，Windows 和 Linux 一样，都支持游戏和虚拟化技术。如果你用它们不只是看看视频，那就需要安装显卡驱动，实现功能。

在 Windows 上，你需要下载安装显卡的对应驱动。大多数情况下，首次安装的过程中并不会出现问题。

不过，在 Linux 上，最新版本的显卡驱动不一定能够正常运行（尤其是英伟达显卡的驱动）。所以，这已经不是从官网下载安装驱动那么简单的问题了。

如果你的 Linux 发行版带有驱动管理器功能，比如 Linux Mint 操作系统，那事情就简单了。

如果没有的话，你可能需要下载适合自己系统的显卡驱动，格式为 ISO 文件。

总的来说，如果你使用了主流的 Linux 发行版，那么安装显卡驱动并不是一件难事；但是如果你使用的不是主流的发行版，你可能需要在安装之前好好查一查。

### 4\. 软件支持

Windows 和 macOS 上的应用并不一定都有对应的 Linux 版本。

如果软件提供了跨平台支持，就有可能提供 Ubuntu, Fedora 以及 Arch 等 Linux 发行版的对应版本。否则，就只能去找这些软件的替代品了。

所以，很多软件不支持 Linux 系统，就给用户带来了较差的使用体验。

不过，我们列出了一份内容丰富的[必备软件清单][12]，相信能帮助你更好地使用 Linux 系统。

遗憾的是，一些用户没有意识到这一点，仍然不愿意去尝试替代软件。

### 5\. 调整外部设备与部件

![][18]

操作难度和软件支持并不是问题的全部，管理调整电脑外部硬件设备也是一个重要方面。

雷蛇、海盗船以及华硕等许多硬件公司没有为 Linux 提供相应的官方支持。

因此，当用户意识到自己无法那么便捷地管理电脑的 RGB 灯条、风扇配置文件以及冷却设备，他们自然也就不会考虑使用 Linux。

不过你要知道，已经有许多工具可以帮助你应对这一问题，比如：

  * [配置游戏鼠标][13]
  * [调整雷蛇外部设备][14]
  * [监控控制冷却设备][15]



这些工具可能不是官方提供的，但是它们适用于很多外部设备与组件。因此，如果你是因为外部设备和部件没有官方支持而放弃使用 Linux，那么你可以尝试这些工具。

### 总结

我觉得这些都是最为普遍的问题，这些问题导致了 Linux 劝退新手，摊上最难使用的操作系统的名号。

要记住，尝试一款陌生的操作系统总是伴随着新的挑战，需要一定的时间来适应。

Linux 作为一款桌面操作系统，相较于以前，操作难度降低不小。**Ubuntu, Pop!_OS, Linux Mint, Linux Lite** 以及其他 Linux 发行版能让用户更容易上手。

即便 Linux 有了那么多的改善与提升，还是有很多用户不愿意使用它，所以我们想让你了解 Linux 并没有你想象的那么难用。

_如果你的朋友还在纠结上述原因而不肯尝试 Linux，我推荐你把这篇文章分享给他，帮助他进一步了解并使用 Linux。_

_请在下方评论留言。_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/things-to-know-linux-is-tough/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-better-than-windows/
[2]: https://itsfoss.com/linux-vs-mac/
[3]: https://itsfoss.com/windows-like-linux-distributions/
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/appimage-illustration.png?w=1000&ssl=1
[5]: https://itsfoss.com/install-software-from-source-code/
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://itsfoss.com/install-rpm-files-fedora/
[8]: https://itsfoss.com/what-is-flatpak/
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[11]: https://itsfoss.com/best-linux-distributions/
[12]: https://itsfoss.com/essential-linux-applications/
[13]: https://itsfoss.com/piper-configure-gaming-mouse-linux/
[14]: https://itsfoss.com/set-up-razer-devices-linux/
[15]: https://itsfoss.com/coolero/
[16]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/terminal-illustration.png?w=1000&ssl=1
[17]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/gpu-illustration.png?w=1000&ssl=1
[18]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/components-illustration.png?w=1000&ssl=1
