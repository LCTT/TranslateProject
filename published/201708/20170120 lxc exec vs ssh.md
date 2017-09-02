lxc exec 介绍
============================================================

最近，我对 `lxc exec` 进行了几个改进。如果你不知道它的话我介绍一下，`lxc exec` 是 [LXD][1] 的客户端工具，使用 [LXD][2] [客户端 api][3] 与 LXD 守护程序通信，并执行用户想要执行的各种程序，以下是你可以使用的一个例子：

[![asciicast](https://asciinema.org/a/100035.png)][4] 

我们的主要目标之一就是使 `lxc exec` 与 `ssh` 类似，因为它是交互式或非交互式远程运行命令的标准。这使得 把 `lxc exec` 做得很好变得有点棘手。

### 1、 处理后台任务

一个长期存在的问题当然是如何正确处理后台任务。这是一个关于 [LXD][5] 2.7 实例的问题的例子：

[![asciicast](https://asciinema.org/a/100040.png)][6] 

你可以看到，在后台执行任务将导致 `lxc exec` 无法退出。许多命令可以触发此问题：

```
chb@conventiont|~
> lxc exec zest1 bash
root@zest1:~# yes &
y
y
y
.
.
.
```

现在没有什么能救你了。`yes` 将会永远直接写入`stdout`。

问题的根源在于 `stdout` 是一直打开着的，但这是必要的，因为它用以确保用户所启动的进程写入的任何数据实际上都是通过我们建立的 websocket 连接读取并发回的。

假如你想这样，运行一个 shell 会话，然后在后台运行一个进程，并马上退出 shell。对不起，它并不能如预期那样。

第一种并且原始的方法是一旦你检测到前台程序（例如 shell）已经退出就直接关闭 `stdout`。但这不像想得那么好，当你运行快速执行程序时，这个问题会变得明显，比如：

```
lxc exec -- ls -al /usr/lib
```

这里 `lxc exec` 进程（和相关的 `forkexec` 进程。但现在不要考虑它，只要记住 `Go` + `setns()` 不相往来就行了……）会在 `stdout` 中所有的_缓冲_数据被读取之前退出。这种情况下将会导致截断输出，没有人想要这样。在尝试使用几个方法来解决问题之后，包括禁用 pty 缓冲（我告诉你，这不太漂亮，也没有如预期工作。）和其他奇怪的思路，我设法通过几个 `poll()` “技巧”（在某种意义上说一个“技巧”）解决了这个问题。现在你终于可以运行后台任务，并且可以完全退出了。如图：

[![asciicast](https://asciinema.org/a/100043.png)][7] 

### 2、 报告由信号引起的退出码

`ssh` 是一个很棒的工具。但有一件事，我一直以来不喜欢当 ssh 运行的命令接收到一个信号时， `ssh` 总是会报告 `-1`，也就是退出码 `255`。当你想要了解导致程序终止的信号时，这很烦人。这就是为什么我最近实施标准 shell 所使用的惯例 `128 + n` 来报告任何由信号导致的退出，其中 `n` 被定义为导致执行程序退出的信号量。例如，在 `SIGKILL` 信号上，你会看到 `128 + SIGKILL = 137`（计算其他致命信号的退出码作为读者的练习）。所以你可以这么做：

```
chb@conventiont|~
> lxc exec zest1 sleep 100
```

现在，将 `SIGKILL` 发送到执行程序（不是 `lxc exec`本身，因为 `SIGKILL` 不可转发）。

```
kill -KILL $(pidof sleep 100)
```

最后检查你程序的退出码：

```
chb@conventiont|~
> echo $?
137
```

瞧。这显然只有当 a) 退出码没有超过 `8` 位计算壁垒，b）当执行程序不使用 `137` 来表示成功（这可真……有趣？！）。这两个论点似乎对我来说都不太有说服力。前者因为致命信号量不_应该_超过这个范围。后者因为（i）这是用户问题，（ii）这些退出代码实际上是保留的（我是_这样认为_。），（iii）你在本地或其他上面运行程序时会遇到同样的问题。

我看到的主要优点是这能够回报执行程序细粒度的退出状态。注意，我们不会报告_所有_被信号杀死的程序实例。比如说，当你的程序能够处理 `SIGTERM` 并且完全退出时，[LXD][8] 没有简单的方法来检测到这个情况并报告说这个程序被信号杀死了。你只会简单地收到退出码 `0`。

### 3、 转发信号

这可能不太有趣（或者也许不是，谁知道呢），但我发现它非常有用。正如你在 `SIGKILL` 案例中看到的那样，我明确地指出，必须将 `SIGKILL` 发送到执行程序，而不是 `lxc exec`命令本身。这是因为 `SIGKILL` 在程序中无法处理。程序可以做的唯一的事情就是去死，像现在这样……像这个例子……马上（你明白了了吧……）。但是程序可以处理很多其他信号 `SIGTERM`、`SIGHUP'，当然也可以处理 `SIGUSR1` 和 `SIGUSR2`。因此，当你发送可以被 `lxc exec` 处理而不是被执行程序处理的信号时，较新版本的 [LXD][9] 会将信号转发到执行进程。这在脚本中非常方便。

无论如何，我希望你觉得这篇小小的 `lxc exec` 文章/胡言乱语有用。享受 [LXD][10] 吧，这是与一只疯狂的美丽的野兽玩耍。请试试在线实验：[https://linuxcontainers.org/lxd/try-it/][11]，对于开发人员看看这里：[https://github.com/lxc/lxd][12] 并给我们补丁。

我们不要求签署任何 CLA，我们遵循内核风格，只要其中有 “Signed-off-by” 这行就好。

--------------------------------------------------------------------------------

via: https://cbrauner.wordpress.com/2017/01/20/lxc-exec-vs-ssh/

作者：[brauner][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://cbrauner.wordpress.com
[1]:https://github.com/lxc/lxd
[2]:https://github.com/lxc/lxd
[3]:https://github.com/lxc/lxd/blob/master/client.go
[4]:https://asciinema.org/a/100035?autoplay=1
[5]:https://github.com/lxc/lxd
[6]:https://asciinema.org/a/100040?autoplay=1
[7]:https://asciinema.org/a/100043?autoplay=1
[8]:https://github.com/lxc/lxd
[9]:https://github.com/lxc/lxd
[10]:https://github.com/lxc/lxd
[11]:https://linuxcontainers.org/lxd/try-it/
[12]:https://github.com/lxc/lxd
