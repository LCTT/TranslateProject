如何在 Linux 系统中结束结束进程或是中止程序
======

> 在 Linux 中有几种使用命令行或图形界面终止一个程序的方式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/x_stop_terminate_program_kill.jpg?itok=9rM8i9x8)

进程出错的时候，您可能会想要中止或是杀掉这个进程。在本文中，我们将探索在命令行和图形界面中终止进程或是应用程序，这里我们使用 [gedit][1] 作为样例程序。

### 使用命令行或字符终端界面

#### Ctrl + C

在命令行中调用 `gedit` （如果您没有使用 `gedit &` 命令）程序的一个问题是 shell 会话被阻塞，没法释放命令行提示符。在这种情况下，`Ctrl + C` （`Ctrl` 和 `C` 的组合键） 会很管用。这会终止 `gedit` ，并且所有的工作都将丢失（除非文件已经被保存）。`Ctrl + C` 会给 `gedit` 发送了 `SIGINT` 信号。这是一个默认终止进程的停止信号，它将指示 shell 停止 `gedit` 的运行，并返回到主函数的循环中，您将返回到提示符。

```
$ gedit
^C
```

#### Ctrl + Z

它被称为挂起字符。它会发送 `SIGTSTP` 信号给进程。它也是一个停止信号，但是默认行为不是杀死进程，而是挂起进程。

下面的命令将会停止（杀死/中断） `gedit` 的运行，并返回到 shell 提示符。

```
$ gedit
^Z
[1]+  Stopped                 gedit
$
```

一旦进程被挂起（以 `gedit` 为例），将不能在 `gedit` 中写入或做任何事情。而在后台，该进程变成了一个作业，可以使用 `jsbs` 命令验证。

```
$ jobs
[1]+  Stopped                 gedit
```

`jobs` 允许您在单个 shell 会话中控制多个进程。您可以终止，恢复作业，或是根据需要将作业移动到前台或是后台。

让我们在后台恢复 `gedit`，释放提示符以运行其它命令。您可以通过 `bg` 命令来做到，后跟作业 ID（注意上面的 `jobs` 命令显示出来的 `[1]`，这就是作业 ID）。

```
$ bg 1
[1]+ gedit &amp;
```

这和直接使用 `gedit &` 启动程序效果差不多：

```
$ gedit &amp;
```

### 使用 kill

`kill` 命令提供信号的精确控制，允许您通过指定信号名或是信号数字为进程发送信号，后跟进程 ID 或是 PID。

我喜欢 `kill` 命令的一点是它也能够根据作业 ID 控制进程。让我们使用 `gedit &` 命令在后台开启 `gedit` 服务。假设通过 `jobs` 命令我得到了一个 `gedit` 的作业 ID，让我们为 `gedit` 发送 `SIGINT` 信号：

```
$ kill -s SIGINT %1
```

作业 ID 需要使用 `%` 前缀，不然 `kill` 会将其视作 PID。

不明确指定信号，`kill` 仍然可以工作。此时，默认会发送能中断进程的 `SIGTERM` 信号。执行 `kill -l` 可以查看信号名列表，使用 `man kill` 命令阅读手册。

### 使用 killall

如果您不想使用特定的工作 ID 或者 PID，`killall` 允许您使用特定的进程名。中断 `gedit` 最简单的 `killall` 使用方式是：

```
$ killall gedit
```

它将终止所有名为 `gedit` 的进程。和 `kill` 相似，默认发送的信号是  `SIGTERM`。使用 `-I` 选项忽略进程名的大小写。

```
$ gedit &amp;
[1] 14852

$ killall -I GEDIT
[1]+  Terminated              gedit
```

查看手册学习更多 `killall` 命令选项（如 `-u`）。

### 使用 xkill

您是否遇见过播放器崩溃，比如 [VLC][2] 灰屏或挂起？现在你可以像上面一样获得进程的 PID 来杀掉它，或者使用 `xkill` 命令终止应用程序。

![Using xkill][3]

`xkill` 允许您使用鼠标关闭窗口。仅需在终端执行 `xkill` 命令，它将会改变鼠标光标为一个 **X** 或是一个小骷髅图标。在你想关闭的进程窗口上点击 **x**。小心使用 `xkill`，如手册描述的一致，它很危险。我已经提醒过您了！

参阅手册，了解上述命令更多信息。您还可以接续探索 `pkill` 和 `pgrep` 命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-kill-process-stop-program-linux

作者：[Sachin Patil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psachin
[1]:https://wiki.gnome.org/Apps/Gedit
[2]:https://www.videolan.org/vlc/index.html
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/xkill_gedit.png?itok=TBvMw0TN (Using xkill)
