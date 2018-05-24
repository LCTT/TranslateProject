如何在 Linux 系统中结束结束进程或是中止程序
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/x_stop_terminate_program_kill.jpg?itok=9rM8i9x8)

进程出错的时候，您可能会想要中止或是中断这个进程。本文，我们将在命令行和图形界面中探索进程或是应用程序的中断，这里我们使用 [gedit][1] 作为样例程序。

### 使用命令行、终端字符

#### Ctrl + C

在命令行中调用 `gedit` （如果您没有使用 `gedit &` 命令）程序发生错误时，shell 会话被阻塞，将不会释放出相应的错误提示，此下，`Ctrl + C` （Ctrl 和 C 的组合键） 会很管用。`gedit` 会被中断，由于 `Ctrl + C` 给 `gedit` 发送了 `SIGINT` 信号，之前的所有工作都将丢失（除非文件已经被保存）。`SIGINT` 是一个会默认执行进程中断的终止信号，它将指示 shell 终止 `gedit` 的运行，并返回到主函数的循环中，此时，您将得到提示语。

```
$ gedit
^C
```

#### Ctrl + Z

它被称为挂起字符，能够为进程发送 `SIGTSTP` 信号。它也是一个中止信号，但是默认行为不是杀死进程，而是挂起进程。

下面的命令将会停止（杀死/中断） `gedit` 的运行，并返回 shell 提示。
```
   $ gedit
   ^Z
   [1]+  Stopped                 gedit
   $
```

一旦进程被挂起（以 `gedit` 为例），将不能在 `gedit` 中做任何事情。而在后台，该进程任然是一个作业，可以使用 `jsbs` 命令验证。
```
  $ jobs
  [1]+  Stopped                 gedit
```

`jobs` 允许您在单个 shell 会话中控制多个进程。您可以在前台或是后台终止，恢复或是移动作业。

让我们在后台恢复 `gedit`，释放提示并运行其它命令吧。您可以根据作业 ID（注意，`jobs` 命令显示出来的 `[1]` 就是作业 ID）使用 `bg` 命令恢复进程。
```
   $ bg 1
   [1]+ gedit &amp;
```

这和直接使用 `gedit &` 启动程序效果差不多：
```
   $ gedit &amp;
```

### 使用 kill

`kill` 命令提供信号的精确控制，允许您通过进程 ID 或是 PID，根据特定的信号名或是信号数字为进程发送信号。

`kill` 命令能够根据作业 ID 控制进程，这一点是我喜欢的。让我们使用 `gedit &` 命令在后台开启 `gedit` 服务。假设通过 `jobs` 命令我得到了一个 `gedit` 的作业 ID，让我们为 `gedit` 发送 `SIGINT` 信号吧：
```
   $ kill -s SIGINT %1
```

作业 ID 需要使用 `%` 前缀，不然 `kill` 会将其视作 PID。

不明确指定的信号，`kill` 仍然可以工作。此时，默认会发送能中断进程的 `SIGTERM` 信号。执行 `kill -l` 查看信号名列表，使用 `man kill` 命令阅读手册。

### 使用 killall

如果您不想使用特定的工作 ID 或者 PID，`killall` 允许您使用特定的进程名。中断 `gedit` 最简单的 `killall` 使用方式是：
```
   $ killall gedit
```

它将终止所有名为 `gedit` 的进程。和 `kill` 想死，默认发送的信号时  `SIGTERM`。
This will kill all the processes with the name `gedit`. Like `kill`, the default signal is `SIGTERM`. 使用 `-I` 选项忽略大小写。
```
   $ gedit &amp;
   [1] 14852

   $ killall -I GEDIT
   [1]+  Terminated              gedit
```

查看手册学习更多 `killall` 命令选项（如 `-u`）。

### 使用 xkill

您是否遇见过播放器崩溃，比如 [VLC][2] 灰屏或挂起？现在，获得程序 PID 之后，您就可以使用 `xkill` 命令终止应用程序。

![Using xkill][3]

`xkill` 允许您使用鼠标关闭窗口。仅需在终端执行 `xkill` 命令，它将会改变鼠标光标为一个 **X** 或是一个骷髅图标。点击您想关闭的进程窗口上的 **X**。小心使用 `xkill`，如手册描述的一致，它很危险。我已经提醒过您了！

参阅手册，了解上述命令更多信息。您还可以接续探索 `pkill` 和 `pgrep` 命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-kill-process-stop-program-linux

作者：[Sachin Patil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psachin
[1]:https://wiki.gnome.org/Apps/Gedit
[2]:https://www.videolan.org/vlc/index.html
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/xkill_gedit.png?itok=TBvMw0TN (Using xkill)
