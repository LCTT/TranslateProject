如何启动进入 Linux 命令行
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-boot-into-linux-command-line_orig.jpg)

可能有时候你启动 Linux 时需要或者希望不使用 GUI（图形用户界面），也就是没有 X，而是选择命令行。不管是什么原因，幸运的是，直接启动进入 Linux 命令行 非常简单。它需要在其他内核选项之后对引导参数进行简单的更改。此更改将系统引导到指定的运行级别。

### ​为什么要这样做？

如果你的系统由于无效配置或者显示管理器损坏或任何可能导致 GUI 无法正常启动的情况而无法运行 Xorg，那么启动到命令行将允许你通过登录到终端进行故障排除（假设你知道要怎么做），并能做任何你需要做的东西。引导到命令行也是一个很好的熟悉终端的方式，不然，你也可以为了好玩这么做。

### ​访问 GRUB 菜单

在启动时，你需要访问 GRUB 启动菜单。如果在每次启动计算机时菜单未设置为显示，那么可能需要在系统启动之前按住 `SHIFT` 键。在菜单中，需要选择 Linux 发行版条目。高亮显示后该条目，按下 `e` 编辑引导参数。

 [![zorin os grub menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnu-grub_orig.png)][3] 
 
较老的 GRUB 版本遵循类似的机制。启动管理器应提供有关如何编辑启动参数的说明。

### ​​指定运行级别

​会出现一个编辑器，你将看到 GRUB 会解析给内核的选项。移动到以 `linux` 开头的行（旧的 GRUB 版本可能是 `kernel`，选择它并按照说明操作）。这指定了要解析给内核的参数。在该行的末尾（可能会出现跨越多行，具体取决于你的终端分辨率），只需指定要引导的运行级别，即 `3`（多用户模式，纯文本）。

 [![customize grub menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_orig.png)][4] 

按下 `Ctrl-X` 或 `F10` 将使用这些参数启动系统。开机和以前一样。唯一改变的是启动的运行级别。

这是启动后的页面：

[![boot linux in command line](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_1_orig.png)][5] 

### 运行级别

你可以指定不同的运行级别，默认运行级别是 `5` （多用户图形界面）。`1` 启动到“单用户”模式，它会启动进入 root shell。`3` 提供了一个多用户命令行系统。

### 从命令行切换

在某个时候，你可能想要运行显示管理器来再次使用 GUI，最快的方法是运行这个：

```
$ sudo init 5
```

就这么简单。就我个人而言，我发现命令行比使用 GUI 工具更令人兴奋和上手。不过，这只是我的个人偏好。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/how-to-boot-into-linux-command-line

作者：[LinuxAndUbuntu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/linux
[2]:http://www.linuxandubuntu.com/home/category/distros
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnu-grub_orig.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_orig.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_1_orig.png
