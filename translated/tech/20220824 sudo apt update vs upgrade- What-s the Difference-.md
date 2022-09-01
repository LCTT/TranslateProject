[#]: subject: "sudo apt update vs upgrade: What’s the Difference?"
[#]: via: "https://itsfoss.com/apt-update-vs-upgrade/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "Yufei-Yan"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

sudo apt update 和 upgrade：区别是什么？
======

如果想让你的 Ubuntu 或者 Debian 系统保持更新，要用 **sudo apt update** 和 **sudo apt upgrade** 命令组合。

一些以前的教程也会提到 **sudo apt-get update** 和 **sudo apt-get upgrade**。

apt 和 apt-get 命令运行起来几乎一样，除了一些细微的差别，后面我会讨论。

我们首先讨论一下 update 和 upgrade 的区别。这两个难道不是一样的吗？

### apt update 和 upgrade 的区别

尽管听上去运行 apt update 可以给你一个包的最新版本，然而这并不正确。update命令只会获得系统上所有包的最新信息，并不会下载或者安装任何一个包。而是 apt upgrade 命令来把这些包下载和升级到最新版本。

还是有点困惑？让我来接着解释。我建议[阅读包管理器的概念][1]。这个会帮你更好的理解这些东西。

![Linux Package Manager Explanation][2]

基本上，你的系统在一个所有可用包的数据库（缓存）上工作。注意，这个缓存或者数据库并不包含这些包本身，仅仅是关于包的元数据（版本，仓库，依赖等）。

如果你不更新这个数据库，系统就不会知道是否有更新的版本。

当你运行 apt update 或者 apt-get update 命令，它会获取这些包的最新元数据（包的版本等）。

![apt update][3]

这时候本地缓存就被更新了，有一些包可以升级。用 sudo apt upgrade 可以升级所有（可升级的）包。

它会显示要升级的包，并且通过回车（默认选择是 Y）或者点击 Y 键进行确认。要在这个阶段取消升级，可以点击 N。

![apt upgrade][4]

下面这些可能会帮助你记忆：

* apt update：更新包缓存（可以知道包的哪些版本可以被安装或升级）
* apt upgrade：升级包到最新版本

因为有一些管理员命令，需要作为 root 运行。因此需要使用 sudo 配合其他命令。sudo 使你能够作为 root 在 Ubuntu 和 Debian 上运行命令。

既然理解了 update 和 upgrade 是如何一起运行的，我们来讨论一下 apt 和 apt-get 的用法。

### apt 还是 apt-get？应该用哪个？

Debian 和 Ubuntu 使用的是 APT 包管理系统。不要和 apt 命令弄混了。

有许多和 APT 包管理交互的命令；apt-get、apt、dpkg、aptitude等。

这里面最受欢迎的就是 apt-get 命令。它是一个<ruby>低层级<rt>low-level</rt></ruby>且功能丰富的命令。apt 是 apt-get 命令的简化版本。

可以[读一下这篇文章来了解 atp 和 apt-get 命令的不同][5]。下面重点讨论这些命令中 update 和 upgrade 选项的区别。

#### apt update vs apt-get update

`apt-get update` 和 `apt update` 做的是同样的事，都是更新本地包缓存，这样的话你的系统就知道有哪些包的版本是可用的。

从技术上讲，其实并没有区别。然而，apt update 在一个方面比 apt-get update 做的好，**它会告诉你可升级的包的数量**。

```
Hit:15 https://ppa.launchpadcontent.net/slimbook/slimbook/ubuntu jammy InRelease
Fetched 213 kB in 4s (55.8 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
6 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

apt-get update 甚至不会告诉你包是否可以升级。

![apt get update][6]

![apt update output][7]

从 apt 中可以看到[列出可升级的包][8]，而 apt-get 甚至没有这个选项。

```
[email protected]:~$ apt list --upgradable
Listing... Done
fprintd/jammy-updates 1.94.2-1ubuntu0.22.04.1 amd64 [upgradable from: 1.94.2-1]
gnome-control-center-data/jammy-updates,jammy-updates 1:41.7-0ubuntu0.22.04.4 all [upgradable from: 1:41.7-0ubuntu0.22.04.1]
gnome-control-center-faces/jammy-updates,jammy-updates 1:41.7-0ubuntu0.22.04.4 all [upgradable from: 1:41.7-0ubuntu0.22.04.1]
gnome-control-center/jammy-updates 1:41.7-0ubuntu0.22.04.4 amd64 [upgradable from: 1:41.7-0ubuntu0.22.04.1]
libpam-fprintd/jammy-updates 1.94.2-1ubuntu0.22.04.1 amd64 [upgradable from: 1.94.2-1]
vivaldi-stable/stable 5.4.2753.40-1 amd64 [upgradable from: 5.4.2753.37-1]
```

现在来比较一下两个命令中 upgrade 的选项。

#### apt upgrade vs apt-get upgrade

apt-get upgrade 和 apt upgrade 命令根据本地包缓存（通过 update 命令更新）的数据，安装可升级包的最新版本。

然而，apt upgrade 命令会做两件与 apt-get upgrade 不同的事情。

**apt upgrade 命令可以升级 Linux 内核版本，apt-get upgrade 不能**。apt-get 命令需要使用 [apt-get dist-upgrade][9] 来升级内核版本。

![apt-get upgrade command cannot upgrade Linux kernel version][10]

这是因为升级内核版本意味着安装一个全新的包。apt-get upgrade 命令不能安装一个新的包。它只能升级现有的包。

apt upgrade 比 apt-get 做的好的另一件小事是，它会在底部**显示一个进度条**。

![apt upgrade progress bar][11]

### 总结

update 和 upgrade 两个词很相似，这就是为什么很多新用户会感到困惑。有时候，我觉得 apt update 命令应该和 apt upgrade 命令合并。

我意思是 upgrade（所有已安装的包）和 update（本地包元数据缓存）一起完成工作。为什么要有两个分开的命令呢？把这两个领命合成一个 upgrade 命令吧。Fedora 就是这样对 DNF 命令进行了改进。不过这只是我的观点。

我希望这篇文章可以解释一些关于 apt-get update，apt-get upgrade 和 apt update 以及 apt upgrade 命令的问题。

如果有任何问题，请与我联系。

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-update-vs-upgrade/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[https://github.com/Yufei-Yan](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/package-manager/
[2]: https://itsfoss.com/wp-content/uploads/2020/10/linux-package-manager-explanation.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/apt-update.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/apt-upgrade.png
[5]: https://itsfoss.com/apt-get-upgrade-vs-dist-upgrade/
[6]: https://itsfoss.com/wp-content/uploads/2022/08/apt-get-update.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/apt-update-output.png
[8]: https://itsfoss.com/apt-list-upgradable/
[9]: https://itsfoss.com/apt-get-upgrade-vs-dist-upgrade/
[10]: https://itsfoss.com/wp-content/uploads/2022/08/apt-get-upgrade.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/apt-upgrade-progress-bar.png
