怎样在 Linux 命令行下杀死一个进程
============================================================

> Linux 的命令行里面有用来停止正在运行的进程的所有所需工具。Jack Wallen 将为您讲述细节。

![stop processes](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/stop-processes.jpg?itok=vfNx8VRz "stop processes")

想像一下：你打开了一个程序（可能来自于你的桌面菜单或者命令行），然后开始使用这个程序，没想到程序会锁死、停止运行、或者意外死机。你尝试再次运行该程序，但是它反馈说原来的进程没有完全关闭。

你该怎么办？你要结束进程。但该如何做？不管你信与不信，最好的解决方法大都在命令行里。值得庆幸的是， Linux 有供用户杀死错误的进程的每个必要的工具，然而，你在执行杀死进程的命令之前，你首先需要知道进程是什么。该如何处理这一类的任务。一旦你能够掌握这种工具，它实际是十分简单的……

让我来介绍给你这些工具。

我来概述的步骤是每个 Linux 发行版都能用的，不论是桌面版还是服务器版。我将限定只使用命令行，请打开你的终端开始输入命令吧。

### 定位进程

杀死一个没有响应的进程的第一个步骤是定位这个进程。我用来定位进程的命令有两个：`top` 和 `ps` 命令。`top` 是每个系统管理员都知道的工具，用 `top` 命令，你能够知道到所有当前正在运行的进程有哪些。在命令行里，输入 `top` 命令能够就看到你正在运行的程序进程（图1）

![top](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/killa.jpg?itok=95cUI9Lh "top")

*图 1： top 命令给出你许多的信息。*

从显示的列表中你能够看到相当重要的信息，举个例子，Chrome 浏览器反映迟钝，依据我们的 `top` 命令显示，我们能够辨别的有四个 Chrome 浏览器的进程在运行，进程的 pid 号分别是 3827、3919、10764 和 11679。这个信息是重要的，可以用一个特殊的方法来结束进程。

尽管 `top` 命令很是方便，但也不是得到你所要信息最有效的方法。 你知道你要杀死的 Chrome 进程是那个，并且你也不想看 `top` 命令所显示的实时信息。 鉴于此，你能够使用 `ps` 命令然后用 `grep` 命令来过滤出输出结果。这个 `ps` 命令能够显示出当前进程列表的快照，然后用 `grep` 命令输出匹配的样式。我们通过 `grep` 命令过滤 `ps` 命令的输出的理由很简单：如果你只输入 `ps` 命令，你将会得到当前所有进程的列表快照，而我们需要的是列出 Chrome 浏览器进程相关的。所以这个命令是这个样子：

```
ps aux | grep chrome
```

这里 `aux` 选项如下所示：

*   a =  显示所有用户的进程
*   u =  显示进程的用户和拥有者
*   x =  也显示不依附于终端的进程

当你搜索图形化程序的信息时，这个 `x` 参数是很重要的。

当你输入以上命令的时候，你将会得到比图 2 更多的信息，而且它有时用起来比 `top` 命令更有效。

![ps command](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/killb.jpg?itok=vyWIuTva "ps command")

*图 2：用 ps 命令来定位所需的内容信息。*

### 结束进程

现在我们开始结束进程的任务。我们有两种可以帮我们杀死错误的进程的信息。

* 进程的名字
* 进程的 ID （PID）

你用哪一个将会决定终端命令如何使用，通常有两个命令来结束进程：

*   `kill` -  通过进程 ID 来结束进程
*   `killall` -  通过进程名字来结束进程

有两个不同的信号能够发送给这两个结束进程的命令。你发送的信号决定着你想要从结束进程命令中得到的结果。举个例子，你可以发送 `HUP`（挂起）信号给结束进程的命令，命令实际上将会重启这个进程。当你需要立即重启一个进程（比如就守护进程来说），这是一个明智的选择。你通过输入 `kill -l` 可以得到所有信号的列表，你将会发现大量的信号。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/killc.jpg?itok=9ewRHFW2)

*图 3： 可用的结束进程信号。*

最经常使用的结束进程的信号是：

| Signal Name  | Single Value  | Effect         |
|-----------|-----------|----------|
| SIGHUP | 1 | 挂起 |
| SIGINT | 2 | 键盘的中断信号 |
| SIGKILL | 9 | 发出杀死信号 |
| SIGTERM | 15 | 发出终止信号 |
| SIGSTOP | 17, 19, 23 | 停止进程 |

好的是，你能用信号值来代替信号名字。所以你没有必要来记住所有各种各样的信号名字。

所以，让我们现在用 `kill` 命令来杀死 Chrome 浏览器的进程。这个命令的结构是：

```
kill SIGNAL PID
```

这里 SIGNAL 是要发送的信号，PID 是被杀死的进程的 ID。我们已经知道，来自我们的 `ps` 命令显示我们想要结束的进程 ID 号是 3827、3919、10764 和 11679。所以要发送结束进程信号，我们输入以下命令：

```
kill -9 3827
kill -9 3919
kill -9 10764
kill -9 11679
```

一旦我们输入了以上命令，Chrome 浏览器的所有进程将会成功被杀死。

我们有更简单的方法！如果我们已经知道我们想要杀死的那个进程的名字，我们能够利用 `killall` 命令发送同样的信号，像这样：

```
killall -9 chrome
``` 

附带说明的是，上边这个命令可能不能捕捉到所有正在运行的 Chrome 进程。如果，运行了上边这个命令之后，你输入 `ps aux | grep chrome` 命令过滤一下，看到剩下正在运行的 Chrome 进程有那些，最好的办法还是回到 `kIll` 命令通过进程 ID 来发送信号值 `9` 来结束这个进程。

### 结束进程很容易

正如你看到的，杀死错误的进程并没有你原本想的那样有挑战性。当我让一个顽固的进程结束的时候，我趋向于用 `killall`命令来作为有效的方法来终止，然而，当我让一个真正的活跃的进程结束的时候，`kill`命令是一个好的方法。

-------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/5/how-kill-process-command-line

作者：[JACK WALLEN][a]
译者：[hwlog](https://github.com/hwlog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/creative-commons-zero
[5]:https://www.linux.com/files/images/killajpg
[6]:https://www.linux.com/files/images/killbjpg
[7]:https://www.linux.com/files/images/killcjpg
[8]:https://www.linux.com/files/images/stop-processesjpg
