[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11384-1.html)
[#]: subject: (How to freeze and lock your Linux system (and why you would want to))
[#]: via: (https://www.networkworld.com/article/3438818/how-to-freeze-and-lock-your-linux-system-and-why-you-would-want-to.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何冻结和锁定你的 Linux 系统
======

> 冻结终端窗口并锁定屏幕意味着什么 - 以及如何在 Linux 系统上管理这些活动。

![](https://img.linux.net.cn/data/attachment/album/201909/24/230938vgxzv3nrakk0wxnw.jpg)

如何在 Linux 系统上冻结和“解冻”屏幕，很大程度上取决于这些术语的含义。有时“冻结屏幕”可能意味着冻结终端窗口，以便该窗口内的活动停止。有时它意味着锁定屏幕，这样就没人可以在你去拿一杯咖啡时，走到你的系统旁边代替你输入命令了。

在这篇文章中，我们将研究如何使用和控制这些操作。

### 如何在 Linux 上冻结终端窗口

你可以输入 `Ctrl+S`（按住 `Ctrl` 键和 `s` 键）冻结 Linux 系统上的终端窗口。把 `s` 想象成“<ruby>开始冻结<rt>start the freeze</rt></ruby>”。如果在此操作后继续输入命令，那么你不会看到输入的命令或你希望看到的输出。实际上，命令将堆积在一个队列中，并且只有在通过输入 `Ctrl+Q` 解冻时才会运行。把它想象成“<ruby>退出冻结<rt>quit the freeze</rt></ruby>”。

查看其工作的一种简单方式是使用 `date` 命令，然后输入 `Ctrl+S`。接着再次输入 `date` 命令并等待几分钟后再次输入 `Ctrl+Q`。你会看到这样的情景：

```
$ date
Mon 16 Sep 2019 06:47:34 PM EDT
$ date
Mon 16 Sep 2019 06:49:49 PM EDT
```

这两次时间显示的差距表示第二次的 `date` 命令直到你解冻窗口时才运行。

无论你是坐在计算机屏幕前还是使用 PuTTY 等工具远程运行，终端窗口都可以冻结和解冻。

这有一个可以派上用场的小技巧。如果你发现终端窗口似乎处于非活动状态，那么可能是你或其他人无意中输入了 `Ctrl+S`。那么，输入 `Ctrl+Q` 来尝试解决不妨是个不错的办法。

### 如何锁定屏幕

要在离开办公桌前锁定屏幕，请按住  `Ctrl+Alt+L` 或 `Super+L`（即按住 `Windows` 键和 `L` 键）。屏幕锁定后，你必须输入密码才能重新登录。

### Linux 系统上的自动屏幕锁定

虽然最佳做法建议你在即将离开办公桌时锁定屏幕，但 Linux 系统通常会在一段时间没有活动后自动锁定。 “消隐”屏幕（使其变暗）并实际锁定屏幕（需要登录才能再次使用）的时间取决于你个人首选项中的设置。

要更改使用 GNOME 屏幕保护程序时屏幕变暗所需的时间，请打开设置窗口并选择 “Power” 然后 “Blank screen”。你可以选择 1 到 15 分钟或从不变暗。要选择屏幕变暗后锁定所需时间，请进入设置，选择 “Privacy”，然后选择 “Blank screen”。设置应包括 1、2、3、5 和 30 分钟或一小时。

### 如何在命令行锁定屏幕

如果你使用的是 GNOME 屏幕保护程序，你还可以使用以下命令从命令行锁定屏幕：

```
gnome-screensaver-command -l
```

这里是小写的 L，代表“锁定”。

### 如何检查锁屏状态

你还可以使用 `gnome-screensaver` 命令检查屏幕是否已锁定。使用 `--query` 选项，该命令会告诉你屏幕当前是否已锁定（即处于活动状态）。使用 `--time` 选项，它会告诉你锁定生效的时间。这是一个示例脚本：

```
#!/bin/bash

gnome-screensaver-command --query
gnome-screensaver-command --time
```

运行脚本将会输出：

```
$ ./check_lockscreen
The screensaver is active
The screensaver has been active for 1013 seconds.
```

#### 总结

如果你记住了正确的控制方式，那么锁定终端窗口是很简单的。对于屏幕锁定，它的效果取决于你自己的设置，或者你是否习惯使用默认设置。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438818/how-to-freeze-and-lock-your-linux-system-and-why-you-would-want-to.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
