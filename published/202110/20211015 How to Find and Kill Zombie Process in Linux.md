[#]: subject: "How to Find and Kill Zombie Process in Linux"
[#]: via: "https://itsfoss.com/kill-zombie-process-linux/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "zengyi1001"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13919-1.html"

如何找到并杀掉 Linux 系统中的僵尸进程
======

![][5]

> 这是一个关于如何寻找 Linux 系统僵尸进程并杀死它们的小知识。你也可以从中了解到关于进程和僵尸进程的一些知识。

在了解僵尸进程之前，让我们来复习一下什么是 Linux 进程。

简而言之，[进程][1] 是一个程序的运行实例。它可能运行在前端（比如有交互的进程），也可能运行在后端（比如无交互或自动运行的进程）。它可能是一个父进程（运行期间创建了其他进程），也可能是一个子进程（由其他进程所创建）。

在 Linux 系统中，除 PID 为 0 的第一个 `init` 进程（或 `systemd`）外，其余进程都有父进程。进程也可以拥有自己的子进程。

不相信？可以试试在终端中使用 `pstree` 命令查看进程的树型结构，你能看到系统各个进程的“家族树”。

### Linux系统里的僵尸进程是什么？

子进程死亡后，它的父进程会接收到通知去执行一些清理操作，如释放内存之类。然而，若父进程并未察觉到子进程死亡，子进程就会进入到“<ruby>僵尸<rt>zombie</rt></ruby>”状态。从父进程角度看，子进程仍然存在，即使子进程实际上已经死亡。这就是“<ruby>僵尸进程<rt>zombie process</rt></ruby>”（也被称为“<ruby>已消失进程<rt>defunct process</rt></ruby>”）是如何产生并存在于系统中的。

这里有一个来自 [Turnoff.us](https://turnoff.us/geek/zombie-processes/) 的关于僵尸进程的非常有趣的看法：

![Image credit: Turnoff.us][2]

### 你真的需要关心僵尸进程吗？

重点要说的是，僵尸进程并没有像它的名称那样看起来可怕。

但如果系统的内存已经所剩不多或者有太多的僵尸进程在吃掉内存，问题会变得糟糕。同样，大部分 Linux 系统进程最大 PID 设置为 32768，如果过多僵尸进程导致其他重要任务没有 PID 可用，你的系统会发生崩溃。

这是真实可能发生的，它有一定的概率，特别当存在一个编码糟糕的程序开始大量产生僵尸进程的时候。

在这种情况下，找到并杀死僵尸进程是一个明智的做法。

### 如何找到僵尸进程

Linux 系统中的进程可能处于如下状态中的一种：

  * `D` = 不可中断的休眠
  * `I` = 空闲
  * `R` = 运行中
  * `S` = 休眠
  * `T` = 被调度信号终止
  * `t` = 被调试器终止
  * `Z` = 僵尸状态

那如何查看进程和它的当前状态呢？一个简单的方法是在终端中使用 [top 命令][3]。

![Top command show processes and their status][4]

正如你在上面截图中看到的，截图中共有 250 个任务（进程），其中 1 个处在 “<ruby>运行中<rt>running</rt></ruby>” 状态，248 个进程处于 “<ruby>休眠<rt>sleep</rt></ruby>” 状态，还有一个处于 “<ruby>僵尸<rt>zombie</rt></ruby>” 状态。

现在问题进入下一步，如何杀死 “僵尸” 进程？

### 如何找到并杀死一个僵尸进程？僵尸进程能被杀死吗？

僵尸进程已经死了，要如何才能杀死一个已经死亡的进程呢？

在僵尸电影中，你可以射击僵尸的头部或烧掉它们，但在这里是行不通的。你可以一把火烧了系统来杀死僵尸进程，但这并不是一个可行的方案。

一些人建议发送 `SIGCHLD` 给父进程，但这个信号很可能会被忽略。还有一个方法是杀死父进程来杀死僵尸进程，这听起来很野蛮，但它却是唯一能确保杀死僵尸进程的方法。

首先，通过在终端中 [使用 ps 命令][6] 我们列举僵尸进程，得到它们的进程 ID：

```
ps ux | awk '{if($8=="Z+") print}'
```

`ps ux` 命令输出的第 8 列显示了进程状态。上述命令只会打印所有处在 Z+ 状态（表示僵尸状态）的进程。

确认了进程 ID 后，我们可以得到它的父进程 ID：

```
ps -o ppid= -p <child_id>
```

你也可以将上述两个命令结合在一起，直接得到僵尸进程的 PID 及其父进程的 PID：

```
ps -A -ostat,pid,ppid | grep -e '[zZ]'
```

现在你得到了父进程 ID，使用命令行和得到的 ID 号 [终于可以杀死进程了][7]：

```
kill -9 <parent_process_ID>
```

![Killing parent process][8]

再次运行 `ps` 命令或 `top` 命令，你可以验证僵尸进程是否已经被杀死。

恭喜！现在你知道怎么清理僵尸进程了。

--------------------------------------------------------------------------------

via: https://itsfoss.com/kill-zombie-process-linux/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[zengyi1001](https://github.com/zengyi1001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://tldp.org/LDP/tlk/kernel/processes.html
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/zombies-turnoff.webp?resize=800%2C467&ssl=1
[3]: https://linuxhandbook.com/top-command/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/top-command-view.png?resize=800%2C474&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/kill-zombie-process-linux.jpg?resize=800%2C450&ssl=1
[6]: https://linuxhandbook.com/ps-command/
[7]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/killing-parent-process.png?resize=800%2C180&ssl=1
