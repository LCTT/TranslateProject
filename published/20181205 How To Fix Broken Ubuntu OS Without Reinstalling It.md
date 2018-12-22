[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (How To Fix Broken Ubuntu OS Without Reinstalling It)
[#]: via: (https://www.ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)
[#]: url: (https://linux.cn/article-10367-1.html)

如何不重装修复损坏的 Ubuntu 系统
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Fix-Broken-Ubuntu-OS-720x340.jpg)

今天，我在升级我的 Ubuntu 18.04 LTS 系统。不幸的是，在更新 Ubuntu 时中途断电，系统关机。电源恢复后，我再次启动系统。在登录页面输入密码后，它变成空白并且没有响应。键盘和鼠标也没有作用。我只看到一个空白的屏幕！值得庆幸的是，它只是一台测试机，并且没有重要的数据。我可以直接擦除整个系统然后重新安装。但是，我不想这样做。由于我没有什么可失去的，我只是想不重装修复我损坏的 Ubuntu 系统，并且我成功了！如果你发现自己处于像我这样的境地，不要惊慌。这个简短的教程描述了如何在不丢失数据的情况下轻松修复损坏的 Ubuntu 系统，而无需重新安装。

### 修复损坏的 Ubuntu 系统

首先，尝试使用 live cd 登录并**在外部驱动器中备份数据**。以防这个方法没用，你仍然可以获取数据并重新安装系统！

在登录页上，按下 `CTRL+ALT+F1` 切换到 tty1。你可以在[此处][1]了解有关在 TTY 之间切换的更多信息。

现在，逐个输入以下命令来修复损坏的 Ubuntu Linux。

```
$ sudo rm /var/lib/apt/lists/lock
$ sudo rm /var/lib/dpkg/lock
$ sudo rm /var/lib/dpkg/lock-frontend
$ sudo dpkg --configure -a
$ sudo apt clean
$ sudo apt update --fix-missing
$ sudo apt install -f
$ sudo dpkg --configure -a
$ sudo apt upgrade
$ sudo apt dist-upgrade
```

最后，使用命令重启系统：

```
$ sudo reboot
```

你现在可以像往常一样登录到你的 Ubuntu 系统。

我做完这些步骤后，我 Ubuntu 18.04 测试系统中的所有数据都还在，一切都之前的一样。此方法可能不适用于所有人。但是，这个小小的技巧对我有用，并且比重装节省了一些时间。如果你了解其他更好的方法，请在评论区告诉我。我也会在本指南中添加它们。

这是这些了。希望这篇文章有用。

还有更多好东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/
