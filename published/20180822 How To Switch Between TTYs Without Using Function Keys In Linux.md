如何在 Linux 中不使用功能键在 TTY 之间切换
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Switch-Between-TTYs-720x340.png)

本简要指南介绍了在类 Unix 操作系统中如何在不使用功能键的情况下切换 TTY。在进一步讨论之前，我们将了解 TTY 是什么。正如在 AskUbuntu 论坛的一个[答案][1]中所提到的，**TTY**这个词来自 **T**ele**TY**pewriter（电传打字机）。在 Unix 的早期，连接到计算机的用户终端就是机电的电传机或电传打字机（简称 tty）。从那时起，TTY 这个名称继续用于纯文本控制台。如今，所有文本控制台都代表虚拟控制台，而不是物理控制台。TTY 命令打印连接到标准输入的终端的文件名。

### 在 Linux 中切换 TTY

默认情况下，Linux 中有 7 个 tty。它们被称为 tty1、tty2……tty7。1 到 6 的 tty 只是命令行。第 7 个 tty 是 GUI（你的 X 桌面会话）。你可以使用 `CTRL+ALT+Fn` 键在不同的 TTY 之间切换。例如，要切换到 tty1，我们按下 `CTRL+ALT+F1`。这就是 tty1 在 Ubuntu 18.04 LTS 服务器中的样子。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/tty1.png)

如果你的系统没有 X 会话， 只需要按下 `Alt+Fn` 键，不需要按下 `CTRL`。

在某些 Linux 版本中（例如，从 Ubuntu 17.10 开始），登录屏开始使用 1 号虚拟控制台。因此，你需要按 `CTRL+ALT+F3` 到 `CTRL+ALT+F6` 来访问虚拟控制台。要返回桌面环境，请在 Ubuntu 17.10 及更高版本上按下 `CTRL+ALT+F2` 或 `CTRL+ALT+F7`。

目前为止我们看到我们可以使用 `CTRL+ALT+Fn`（`F1` - `F7`）在 TTY 之间轻松切换。但是，如果出于任何原因你不想使用功能键，那么在 Linux 中有一个名为 `chvt` 的简单命令。

`chvt N` 命令让你切换到前台终端 N，这与按 `CTRL+ALT+Fn` 相同。如果它不存在，则创建相应的屏幕。

让我们试试显示当前的 tty：

```
$ tty
```

我的 Ubuntu 18.04 LTS 服务器的示例输出。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/tty-command-output.png)

现在让我们切换到 tty2。为此，请输入：

```
$ sudo chvt 2
```

记住你需要在 `chvt` 命令一同使用 `sudo`。

现在，使用命令检查当前的 tty：

```
$ tty
```

你会看到 tty 现在已经改变了。

同样，你可以使用 `sudo chvt 3` 切换到 tty3，使用 `sudo chvt 4` 切换到 tty4 等等。

当任何一个功能键不起作用时，`chvt` 命令会很有用。

要查看活动虚拟控制台的总数，请运行：

```
$ fgconsole
2
```

如你所见，我的系统中有两个活动的虚拟终端。

你可以使用以下命令查看下一个未分配的虚拟终端：

```
$ fgconsole --next-available
3
```

如果虚拟控制台不是前台控制台，并且它没有打开任何进程来读取或写入，并且未在其屏幕上选择任何文本，则它是未使用的。

要移除未使用的虚拟终端，只需键入：

```
$ deallocvt
```

上面的命令为所有未使用的虚拟控制台释放内核内存和数据结构。简单地说，此命令将释放连接到未使用的虚拟控制台的所有资源。

有关更多详细信息，请参阅相应命令的手册页。

```
$ man tty
$ man chvt
$ man fgconsole
$ man deallocvt
```

就是这些了。希望这很有用。还有更多的好东西。敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://askubuntu.com/questions/481906/what-does-tty-stand-for
