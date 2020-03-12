[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11903-1.html)
[#]: subject: (How to Change the Default Terminal in Ubuntu)
[#]: via: (https://itsfoss.com/change-default-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 中更改默认终端
======

<ruby>终端<rt>Terminal</rt></ruby>是 Linux 系统的关键部分。它能让你通过 shell 访问 Linux 系统。Linux 上有多个终端应用（技术上称为终端仿真器）。

大多数[桌面环境][1]都有自己的终端实现。它们的外观可能有所不同，并且可能有不同的快捷键。例如，[Guake 终端][2]对高级用户非常有用，它提供了一些可能无法在发行版默认终端中使用的功能。

你可以在系统上安装其他终端，并将其设为默认，并能通过[快捷键 Ctrl+Alt+T][3] 打开。

现在问题来了，如何在 Ubuntu 中更改默认终端。它没有遵循[更改 Ubuntu 中的默认应用][4]的标准方式，要怎么做？

### 更改 Ubuntu 中的默认终端

![][5]

在基于 Debian 的发行版中，有一个方便的命令行程序，称为 [update-alternatives][6]，可用于处理默认应用。

你可以使用它来更改默认的命令行文本编辑器、终端等。为此，请运行以下命令：

```
sudo update-alternatives --config x-terminal-emulator
```

它将显示系统上存在的所有可作为默认值的终端仿真器。当前的默认终端标有星号。

```
abhishek@nuc:~$ sudo update-alternatives --config x-terminal-emulator 
There are 2 choices for the alternative x-terminal-emulator (providing /usr/bin/x-terminal-emulator).

  Selection    Path                             Priority   Status
------------------------------------------------------------
  0            /usr/bin/gnome-terminal.wrapper   40        auto mode
  1            /usr/bin/gnome-terminal.wrapper   40        manual mode
* 2            /usr/bin/st                       15        manual mode

Press <enter> to keep the current choice[*], or type selection number:
```

你要做的就是输入选择编号。对我而言，我想使用 GNOME 终端，而不是来自 [Regolith 桌面][7]的终端。

```
Press <enter> to keep the current choice[*], or type selection number: 1
update-alternatives: using /usr/bin/gnome-terminal.wrapper to provide /usr/bin/x-terminal-emulator (x-terminal-emulator) in manual mode
```

> **自动模式 vs 手动模式**
>
> 你可能已经在 `update-alternatives` 命令的输出中注意到了自动模式和手动模式。
> 
> 如果选择自动模式，那么在安装或删除软件包时，系统可能会自动决定默认应用。该决定受优先级数字的影响（如上一节中的命令输出所示）。
> 
> 假设你的系统上安装了 5 个终端仿真器，并删除了默认的仿真器。现在，你的系统将检查哪些仿真器处于自动模式。如果有多个，它将​​选择优先级最高的一个作为默认仿真器。

我希望你觉得这个小技巧有用。随时欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-default-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-desktop-environments/
[2]: http://guake-project.org/
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://itsfoss.com/change-default-applications-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/switch_default_terminal_ubuntu.png?ssl=1
[6]: https://manpages.ubuntu.com/manpages/trusty/man8/update-alternatives.8.html
[7]: https://itsfoss.com/regolith-linux-desktop/
