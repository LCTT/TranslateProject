[#]: collector: "lujun9972"
[#]: translator: "wyxplus"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13215-1.html"
[#]: subject: "Managing processes on Linux with kill and killall"
[#]: via: "https://opensource.com/article/20/1/linux-kill-killall"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"

在 Linux 上使用 kill 和 killall 命令来管理进程
======

> 了解如何使用 ps、kill 和 killall 命令来终止进程并回收系统资源。

![](https://img.linux.net.cn/data/attachment/album/202103/18/230625q6g65gz6ugdk8ygr.jpg)

在 Linux 中，每个程序和<ruby>守护程序<rt>daemon</rt></ruby>都是一个“<ruby>进程<rt>process</rt></ruby>”。 大多数进程代表一个正在运行的程序。而另外一些程序可以派生出其他进程，比如说它会侦听某些事件的发生，然后对其做出响应。并且每个进程都需要一定的内存和处理能力。你运行的进程越多，所需的内存和 CPU 使用周期就越多。在老式电脑（例如我使用了 7 年的笔记本电脑）或轻量级计算机（例如树莓派）上，如果你关注过后台运行的进程，就能充分利用你的系统。

你可以使用 `ps` 命令来查看正在运行的进程。你通常会使用 `ps` 命令的参数来显示出更多的输出信息。我喜欢使用 `-e` 参数来查看每个正在运行的进程，以及 `-f` 参数来获得每个进程的全部细节。以下是一些例子：

```
$ ps
    PID TTY          TIME CMD
  88000 pts/0    00:00:00 bash
  88052 pts/0    00:00:00 ps
  88053 pts/0    00:00:00 head
```
```
$ ps -e | head
    PID TTY          TIME CMD
      1 ?        00:00:50 systemd
      2 ?        00:00:00 kthreadd
      3 ?        00:00:00 rcu_gp
      4 ?        00:00:00 rcu_par_gp
      6 ?        00:00:02 kworker/0:0H-events_highpri
      9 ?        00:00:00 mm_percpu_wq
     10 ?        00:00:01 ksoftirqd/0
     11 ?        00:00:12 rcu_sched
     12 ?        00:00:00 migration/0
```
```
$ ps -ef | head
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 13:51 ?        00:00:50 /usr/lib/systemd/systemd --switched-root --system --deserialize 36
root           2       0  0 13:51 ?        00:00:00 [kthreadd]
root           3       2  0 13:51 ?        00:00:00 [rcu_gp]
root           4       2  0 13:51 ?        00:00:00 [rcu_par_gp]
root           6       2  0 13:51 ?        00:00:02 [kworker/0:0H-kblockd]
root           9       2  0 13:51 ?        00:00:00 [mm_percpu_wq]
root          10       2  0 13:51 ?        00:00:01 [ksoftirqd/0]
root          11       2  0 13:51 ?        00:00:12 [rcu_sched]
root          12       2  0 13:51 ?        00:00:00 [migration/0]
```

最后的例子显示最多的细节。在每一行，`UID`（用户 ID）显示了该进程的所有者。`PID`（进程 ID）代表每个进程的数字 ID，而 `PPID`（父进程 ID）表示其父进程的数字 ID。在任何 Unix 系统中，进程是从 1 开始编号，是内核启动后运行的第一个进程。在这里，`systemd` 是第一个进程，它催生了 `kthreadd`，而 `kthreadd` 还创建了其他进程，包括 `rcu_gp`、`rcu_par_gp` 等一系列进程。

### 使用 kill 命令来管理进程

系统会处理大多数后台进程，所以你不需要操心这些进程。你只需要关注那些你所运行的应用创建的进程。虽然许多应用一次只运行一个进程（如音乐播放器、终端模拟器或游戏等），但其他应用则可能创建后台进程。其中一些应用可能当你退出后还在后台运行，以便下次你使用的时候能快速启动。

当我运行 Chromium（作为谷歌 Chrome 浏览器所基于的开源项目）时，进程管理便成了问题。 Chromium 在我的笔记本电脑上运行非常吃力，并产生了许多额外的进程。现在我仅打开五个选项卡，就能看到这些 Chromium 进程：

```
$ ps -ef | fgrep chromium
jhall      66221   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
jhall      66230   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
[...]
jhall      66861   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
jhall      67329   65132  0 15:45 pts/0    00:00:00 grep -F chromium
```

我已经省略一些行，其中有 20 个 Chromium 进程和一个正在搜索 “chromium" 字符的 `grep` 进程。

```
$ ps -ef | fgrep chromium | wc -l
21
```

但是在我退出 Chromium 之后，这些进程仍旧运行。如何关闭它们并回收这些进程占用的内存和  CPU 呢？

`kill` 命令能让你终止一个进程。在最简单的情况下，你告诉 `kill` 命令终止你想终止的进程的 PID。例如，要终止这些进程，我需要对 20 个 Chromium 进程 ID 都执行 `kill` 命令。一种方法是使用命令行获取 Chromium 的 PID，而另一种方法针对该列表运行 `kill`：


```
$ ps -ef | fgrep /usr/lib64/chromium-browser/chromium-browser | awk '{print $2}'
66221
66230
66239
66257
66262
66283
66284
66285
66324
66337
66360
66370
66386
66402
66503
66539
66595
66734
66848
66861
69702

$ ps -ef | fgrep /usr/lib64/chromium-browser/chromium-browser | awk '{print $2}' > /tmp/pids
$ kill $(cat /tmp/pids)
```

最后两行是关键。第一个命令行为 Chromium 浏览器生成一个进程 ID 列表。第二个命令行针对该进程 ID 列表运行 `kill` 命令。

### 介绍 killall 命令

一次终止多个进程有个更简单方法，使用 `killall` 命令。你或许可以根据名称猜测出，`killall` 会终止所有与该名字匹配的进程。这意味着我们可以使用此命令来停止所有流氓 Chromium 进程。这很简单：

```
$ killall /usr/lib64/chromium-browser/chromium-browser
```

但是要小心使用 `killall`。该命令能够终止与你所给出名称相匹配的所有进程。这就是为什么我喜欢先使用 `ps -ef` 命令来检查我正在运行的进程，然后针对要停止的命令的准确路径运行 `killall`。

你也可以使用 `-i` 或 `--interactive` 参数，来让 `killkill` 在停止每个进程之前提示你。

`killall` 还支持使用 `-o` 或 `--older-than` 参数来查找比特定时间更早的进程。例如，如果你发现了一组已经运行了好几天的恶意进程，这将会很有帮助。又或是，你可以查找比特定时间更晚的进程，例如你最近启动的失控进程。使用 `-y` 或 `--young-than` 参数来查找这些进程。

### 其他管理进程的方式

进程管理是系统维护重要的一部分。在我作为 Unix 和 Linux 系统管理员的早期职业生涯中，杀死非法作业的能力是保持系统正常运行的关键。在如今，你可能不需要亲手在 Linux 上的终止流氓进程，但是知道 `kill` 和 `killall` 能够在最终出现问题时为你提供帮助。

你也能寻找其他方式来管理进程。在我这个案例中，我并不需要在我退出浏览器后，使用 `kill` 或 `killall` 来终止后台 Chromium 进程。在 Chromium 中有个简单设置就可以进行控制：

![Chromium background processes setting][2]

不过，始终关注系统上正在运行哪些进程，并且在需要的时候进行干预是一个明智之举。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/linux-kill-killall

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 "Penguin with green background"
[2]: https://opensource.com/sites/default/files/uploads/chromium-settings-continue-running.png "Chromium background processes setting"
