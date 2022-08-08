[#]: subject: "How to Boot into an Older Kernel By Default in Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/boot-older-kernel-default/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14843-1.html"

如何默认启动到 Linux 系统的旧内核
======

![](https://img.linux.net.cn/data/attachment/album/202207/19/142100e4ympeo7y5w6pwvo.jpg)

这是一个可能的情景。你的系统收到了内核更新，但不知何故，事情不像以前那样顺利。

你意识到，如果你启动到较旧的内核（是的，你可以降级内核），一切都会恢复正常。

高兴之余你会觉得有点儿不爽。因为你不得不在每次启动时手动选择较旧的内核。

一位年长的读者遇到了这个问题。[Linux Mint][1] 中的新内核更新没有按预期工作。启动到较旧的内核“修复”了问题，但麻烦的是在每次启动时要去手动选择较旧的内核。

删除新内核而使用旧内核不是一个好主意，因为新内核将会在下一次系统更新时被安装使用。

因此，我建议设置成默认启动到较旧的 Linux 内核。怎么做？这就是我将在本教程中向你展示的内容。

### 启动至较旧的 Linux 内核

你可能不了解，你的 Linux 发行版会在你的系统上安装多个 Linux 内核。不信？使用以下命令 [列出 Ubuntu 中已安装的内核][2]：

```
apt list --installed | grep linux-image
```

当你升级系统时会获得一个新版本的内核，这时你的系统会自动选择启动至最新的可用内核。

在 [grub][3] 屏幕中，你可以转到<ruby>高级选项<rt>Advanced option</rt></ruby>（较旧的 Linux 版本）：

![ubuntu grub][4]

在这里，你可以看到要启动的可用内核。选择较旧的（不带<ruby>恢复选项<rt>recovery option</rt></ruby> 的条目）：

![grub 高级选项][5]

你不会注意到任何显示的差异。你的文件和应用程序保持不变。

现在你已经启动到旧内核，是时候让你的系统自动启动到它了。

### 使旧内核成为默认启动项

如果你乐于使用 Linux 终端和命令，你可以修改 `/etc/default/grub` 文件并在其中添加以下行：

```
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```

然后使用如下命令 [更新 GRUB][6]：

```
sudo update-grub
```

你在这里所做的是告诉你的系统将当前使用的启动项保存为将来运行 GRUB 的默认启动项。

然而，并不是每个人都善于使用命令行，因此我将专注于一个名为 [Grub Customizer][7] 的 GUI 工具。

#### 安装 Grub Customizer

使用官方 PPA [在基于 Ubuntu 的发行版中安装 Grub Customizer][8]：

```
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer
```

对于其他发行版，请使用你的包管理器来安装此工具。

#### 使用 Grub Customizer 更改默认启动项

当你运行 Grub Customizer 时，它会显示可用的启动项。

![ubuntu 的 grub customizer][9]

在这里你有两个选择。

**选择一：** 选择所需的内核项并使用箭头按钮（显示在顶部菜单上）将其向上移动。

![在 Ubuntu grub 将旧内核向上移动][10]

**选择二：** 将<ruby>先前的启动项<rt>previously booted entry</rt></ruby>设为<ruby>默认启动项<rt>default entry</rt></ruby>。

![将当前启动项设为默认 Ubuntu 启动项][11]

我建议使用第二个选择，因为即使有新的内核更新它也可以工作。

这样你就可以在 Ubuntu 或其他发行版中降级内核，甚至无需删除新内核版本。

请注意，像 Ubuntu 这样的发行版大部分一次只保留两个内核版本。因此，最终你首选的旧内核将在新的内核版本释出时被删除。

这个巧妙的技巧曾助我脱困。当时我 [在 Ubuntu 中安装最新的 Linux 内核][12] ，由于某种原因它与我的音频系统有些兼容问题。

无论是什么原因，你现在都知道如何自动启动到旧内核。

如果有问题或建议，请在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/boot-older-kernel-default/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://linuxmint.com/
[2]: https://learnubuntu.com/list-installed-kernels/
[3]: https://itsfoss.com/what-is-grub/
[4]: https://itsfoss.com/wp-content/uploads/2022/06/ubuntu-grub.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/06/Grub-Advanced-Options.jpg
[6]: https://itsfoss.com/update-grub/
[7]: https://itsfoss.com/customize-grub-linux/
[8]: https://itsfoss.com/install-grub-customizer-ubuntu/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/grub-customizer-ubuntu.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/move-older-kernel-up-the-order-ubntu-grub.png
[11]: https://itsfoss.com/wp-content/uploads/2022/06/make-currently-booted-entry-as-default-ubuntu.png
[12]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
