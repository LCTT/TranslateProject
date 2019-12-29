[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11726-1.html)
[#]: subject: (How to Update Grub on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/update-grub/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 和其它 Linux 发行版上更新 grub
======

![](https://img.linux.net.cn/data/attachment/album/201912/29/110155d51bhogs5ezp5p71.png)

在这篇文章中，你将学习在 Ubuntu 或任何其它 Linux 发行版上更新 grub 。你也将学习一个或两个关于更新这个 grub 过程如何工作的事情。

### 如何更新 grub

Ubuntu 和很多其它的 Linux 发行版提供一个易使用的称为 `update-grub` 命令行实用程序。

为更新 grub ，你所要的全部工作就是使用 `sudo` 在终端中运行这个命令。

```
sudo update-grub
```

你应该看到一个像这样的输出：

```
[email protected]:~$ sudo update-grub
[sudo] password for abhishek:
Sourcing file `/etc/default/grub'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-5.0.0-37-generic
Found initrd image: /boot/initrd.img-5.0.0-37-generic
Found linux image: /boot/vmlinuz-5.0.0-36-generic
Found initrd image: /boot/initrd.img-5.0.0-36-generic
Found linux image: /boot/vmlinuz-5.0.0-31-generic
Found initrd image: /boot/initrd.img-5.0.0-31-generic
Found Ubuntu 19.10 (19.10) on /dev/sda4
Found MX 19 patito feo (19) on /dev/sdb1
Adding boot menu entry for EFI firmware configuration
done
```

你可能看到一个类似的称为 `update-grub2` 的命令。不需要在 `update-grub` 和 `update-grub2` 之间感到害怕或不知所措。这两个命令执行相同的动作。

大约在 10 年前，当 grub2 刚刚被引进时，`update-grub2` 命令也被引进。现在，`update-grub2` 只是一个链接到 `update-grub` 的符号，它们都更新 grub2 配置（因为 grub2 是默认的）。

#### 不能找到 update-grub 命令？这里是在这种情况下该做什么

它可能是，你的 Linux 发行版可能没有可用的 `update-grub` 命令。

在这种情况下你该做什么？你如何在这样一个 Linux 发行版上更新 grub ？

在这里不需要惊慌。`update-grub` 命令只是一个入口，用于运行 `grub-mkconfig -o /boot/grub/grub.cfg` 来生成 grub2 配置文件。

这意味着你可以在任意 Linux 发行版上使用下面的命令更新 grub ：

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

当然，记住 `update-grub` 命令比上面的命令容易很多，这是为什么它在一开始被创建的原因。

### update-grub 是如何工作的？

当你安装一个 Linux 发行版时，它（通常）要求你安装 [grub 启动引导程序][1]。

grub 的一部分安装在 MBR/ESP 分区上。grub 的剩余部分保留在 Linux 发行版的 `/boot/grub` 目录中。

依据它的 [man 页面][2]，`update-grub` 通过查找 `/boot` 目录来工作。所有以 [vmlinuz-][3] 开头的文件将被作为内核来对待，并且它们将得到一个 grub 菜单项。它也将为与所找到内核版本相同的 [ramdisk][4] 镜像添加 initrd 行。

它也使用 [os-prober][5] 为其它操作系统查找所有磁盘分区。如果找到其它操作系统，它添加它们到 grub 菜单。

![Representational image of Grub Menu][6]

### 为什么你需要更新 grub ？

在有很多场景下你需要更新 grub。

假设你修改 grub 配置文件（`/etc/default/grub`）以 [更改默认启动顺序][7] 或减少默认启动时间。除非你更新 grub ，否则你的修改将不会生效。

另一种情况是，你在同一个电脑系统上安装多个 Linux 发行版。

例如，在我的 Intel NUC 上，我有两个磁盘。第一个磁盘有 Ubuntu 19.10 ，并且我在其上面安装了 Ubuntu 18.04 。第二个操作系统（Ubuntu 18.04）安装了其自己的 grub ，现在 grub 启动屏幕由 Ubuntu 18.04 grub 控制。

在第二个磁盘上，我安装了 MX Linux ，但是这次我没有安装 grub。我希望现有的 grub（由 Ubuntu 18.04 控制）来处理所有的操作系统项目。

现在，在这种情况中，在 Ubuntu 18.04 上的 grub 需要更新，以便它能够看到 [MX Linux][8] 。

![][9]

如上图所示，当我更新 grub 时，它在 18.04 上找到很多安装的 Linux 内核, 以及在不同的分区上 Ubntu 19.10 和 MX Linux 。

如果你想让 MX Linux 控制 grub ，我可以使用 [grub-install][10] 命令来在 MX Linux 上安装 grub，然后在 MX Linux 上的 grub 将开始控制 grub 启动屏幕。你已经明白这点，对吧？

使用一个像 [Grub Customizer][11] 的 GUI 工具是在 grub 中进行更改的一种简单的方法。

### 最后…

最初，我打算保持它为一篇短文作为一种快速提示。但是后来我想解释一些与之相关的东西，以便（相对）新的 Linux 用户能够学到更多，而不仅仅是一个简单命令。

你喜欢它吗？你有一些问题或建议吗？请随意发表评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-grub/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/GNU_GRUB
[2]: https://manpages.debian.org/testing/grub-legacy/update-grub.8.en.html
[3]: https://www.ibm.com/developerworks/community/blogs/mhhaque/entry/anatomy_of_the_initrd_and_vmlinuz?lang=en
[4]: https://en.wikipedia.org/wiki/Initial_ramdisk
[5]: https://packages.debian.org/sid/utils/os-prober
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/grub_screen.png?ssl=1
[7]: https://itsfoss.com/grub-customizer-ubuntu/
[8]: https://mxlinux.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/update_grub.png?ssl=1
[10]: https://www.gnu.org/software/grub/manual/grub/html_node/Installing-GRUB-using-grub_002dinstall.html
[11]: https://itsfoss.com/customize-grub-linux/
