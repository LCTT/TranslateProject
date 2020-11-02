[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12779-1.html)
[#]: subject: (How to Free Up Space in /boot Partition on Ubuntu Linux?)
[#]: via: (https://itsfoss.com/free-boot-partition-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

如何在 Ubuntu Linux 上释放 /boot 分区的空间？
======

前几天，我收到一个警告，`/boot` 分区已经几乎满了，没有剩余空间了。是的，我有一个独立的 `/boot` 分区，我相信现在很少有人这样做了。（LCTT 译注：个人认为保留单独的 /boot 分区是个好的运维经验，除此以外，/tmp、/var 也单独划定分区比较好。）

这是我第一次看到这样一个错误，它让我很迷惑。现在，这里有一些 [方法来释放在 Ubuntu （或基于 Ubuntu 的分区）上的分区][1] ，但是在这种情况下并不是所有的方法都能用。

这就是为什么我决定写这些我释放 `/boot` 分区空间的步骤的原因。

### 如何在 Ubuntu 上释放 /boot 分区的空间

![][2]

我建议你仔细阅读这些解决方案，并由此得出最适合你情况的解决方案。解决方案的操作很容易，但是你需要在你的生产力系统上小心的执行这些解决方案。

#### 方法 1: 使用 apt autoremove

你不必是一名终端专家来做这件事，它只需要一个命令，你将移除未使用的内核来释放 `/boot` 分区中是空间。

你所有要做的事情是，输入:

```
sudo apt autoremove
```

这个命令不仅仅可以移除未使用的内核，而且也将移除你不需要的或工具安装后所不需要的依赖项。

在你输入命令后，它将列出将被移除的东西，你只需要确认操作即可。如果你很好奇它将移除什么，你可以仔细检查一下看看它实际移除了什么。

这里是它应该看起来的样子:

![][3]

你必须按 `Y` 按键来继续。

**值得注意的是，这种方法只在你还剩余一点点空间，并且得到警告的情况下才有效。但是，如果你的 `/boot` 分区已经满了，APT 甚至可能不会工作。**

在接下来的方法中，我将重点介绍两种不同的方法，通过这些方法你可以使用 GUI 和终端来移除旧内核来释放空间。

#### 方法 2: 手动移除未使用的内核

在你尝试 [移除一些旧内核][4] 来释放空间前，你需要识别当前活动的内核，并且确保你不会删除它。

为 [检查你的内核的版本][5] ，在终端中输入下面的命令:

```
uname -r
```

[uname 命令通常用于获取 Linux 系统信息][6]。在这里，这个命令显示当前正在被使用的 Linux 内核。它看起来应该是这样:

![][7]

现在，你已经知道你当前的 Linux 内核是什么，你必须移除一个不同于这个版本的内核。你应该把它记录在某些地方，以便你不会不知不觉地移除它。

接下来，要移除它，你可以使用终端或 GUI。

> 警告!
>
> 在删除内核时一定要额外的小心。只识别和删除旧内核，而不是当前你正在使用的内核，否则你将会拥有一个残缺的系统。

##### 使用一个 GUI 工具来移除旧的 Linux 内核

你可以使用 [Synaptic 软件包管理器][8] 或一个类似 [Stacer][9] 的工具来开始。就我个人而言，当我遇到一个满满的 `/boot` 分区且 APT 损坏时，我使用 [Stacer][6] 来丢弃旧内核。因此，让我向你展示一下它看起的样子。

首先，你需要启动 Stacer ，然后导航到软件包卸载器，如下面屏幕截图所示。

![][10]

在这里，搜索 “image” ，你将找到你所拥有的 Linux 内核。你只需要删除旧内核版本的镜像，而不是当前内核的镜像。

在上面的屏幕截图中，我已经指出了我系统上的当前内核和旧内核，因此你必须注意你系统上的内核。

你没有必要删除任何其它东西，只需要删除旧的内核版本。

同样的，只需要在软件包列表中搜索 “headers” ，并删除如下显示的旧的 “headers” 版本。

![][11]

作为提醒，你 **不会希望移除 `linux-headers-generic`** 。只关注一下那些与其相关的有版本号的就行。

然后，就这样，你完成了所有的工作，APT 将会再次工作，并且你将成功地释放来自 `/boot` 分区的一些空间。同样地，你也可以使用任意其它的软件包管理器来完成这些工作。

#### 使用命令行来移除旧内核

使用命令行来移除旧内核与使用 GUI 来移除旧内核是一样的。因此，如果你没有选择使用 GUI 软件（如果它是一台远程机器/一项远程服务）的权利，或者如果你只是对终端情有独钟，你可以仿效下面的步骤。

首先，使用下面的命令列出所有已安装的内核:

```
ls -l /boot
```

它应该看起来像这样:

![][12]

标记为 “old” 的内核，或者不匹配你当前内核版本，都是未使用的内核，你可以删除它们。

现在，你可以使用 `rm` 命令来移除具体指定来自 `/boot` 分区中的内核，使用下面的命令（一个命令对应一个内核）：

```
sudo rm /boot/vmlinuz-5.4.0-7634-generic
```

务必检查系统的版本 — 这里可能与你的系统的版本不同。

如果你有很多未使用的内核，这将需要一些时间。因此，你也可以下面的命令丢弃多个内核:

```
sudo rm /boot/*-5.4.0-{7634}-*
```

为了清晰起见，你需要用逗号分隔内核版本号的最后一部分/编码，以便同时删除它们。

假设，我有两个旧的内核 5.4.0-7634-generic 和 5.4.0-7624 ，那么命令将是:

```
sudo rm /boot/*-5.4.0-{7634,7624}-*
```

如果你不希望在 grub 启动菜单中再看到这些旧的内核版本，你可以使用下面的命令简单地 [更新 grub][13]：

```
sudo update-grub
```

就这样，你完成了所有的工作。你已经释放了空间，还修复了可能潜在的破损的 APT 问题，如果它是一个在你的 `/boot` 分区填满后出现的重要的问题的话。

在一些情况下，你需要输入这些命令来修复破损的（正如我在论坛中注意到的）：

```
sudo dpkg --configure -a
sudo apt install -f
```

注意，除非你发现 APT 已破损，否则你不需要输入上面的命令。就我个人而言，我不需要这些命令，但是我发现这些命令对论坛上的一些人很有用。

--------------------------------------------------------------------------------

via: https://itsfoss.com/free-boot-partition-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/free-up-space-ubuntu-linux/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/free-boot-space-ubuntu-linux.jpg?resize=800%2C450&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/apt-autoremove-screenshot.jpg?resize=800%2C415&ssl=1
[4]: https://itsfoss.com/remove-old-kernels-ubuntu/
[5]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[6]: https://linuxhandbook.com/uname/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/uname-r-screenshot.jpg?resize=800%2C198&ssl=1
[8]: https://itsfoss.com/synaptic-package-manager/
[9]: https://itsfoss.com/optimize-ubuntu-stacer/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/stacer-remove-kernel.jpg?resize=800%2C562&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/stacer-remove-kernel-header.png?resize=800%2C576&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/command-kernel-list.png?resize=800%2C432&ssl=1
[13]: https://itsfoss.com/update-grub/
