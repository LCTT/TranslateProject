[#]: subject: "How to kill a zombie process on Linux"
[#]: via: "https://opensource.com/article/21/10/linux-zombie-process"
[#]: author: "Anderson Silva https://opensource.com/users/ansilva"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13941-1.html"

如何在 Linux 上杀死一个僵尸进程
======

> 要杀死一个僵尸进程，你必须从进程列表中删除其名称。

![](https://img.linux.net.cn/data/attachment/album/202111/01/095024jyrvo8ss5jnxysqo.jpg)

万圣节快乐！

这里有一个和 Unix 纪元一样古老的故事。自从有了 C 和 Unix，以及（后来的）Linux，我们就有了“<ruby>僵尸<rt>zombie</rt></ruby>”。具体来说，有一些进程被标记为“<ruby>僵尸进程<rt>zombie process</rt></ruby>”。一些人误解它，另一些人忽视它，而它对我们许多人试图 “杀死” 这些进程的努力免疫，没有什么成效。这是为什么呢？

### Linux 中的进程是什么？

这一切始于执行 Linux 中的一个程序时，当它被执行时，它的运行实例被称为进程。你可以用 [ps 命令][2] 查看你的 Linux 环境中的所有进程：

```
$ ps -ax
        PID TTY         STAT   TIME COMMAND
        1 ?     Ss      0:01 /usr/lib/systemd/systemd rhgb --switched-root --sys
        2 ?     S       0:00 [kthreadd]
        3 ?     I<      0:00 [rcu_gp]
        4 ?     I<      0:00 [rcu_par_gp]
```

有时一个进程启动另一个进程，使第一个进程成为第二个进程的父进程。`pstree` 命令是一个很好的工具，可以让你看到系统中进程的“家谱”：

```
$ pstree -psn
systemd(1)─┬─systemd-journal(952)
        ├─systemd-udevd(963)
        ├─systemd-oomd(1137)
        ├─systemd-resolve(1138)
        ├─systemd-userdbd(1139)─┬─systemd-userwor(12707)
        │                     ├─systemd-userwor(12714)
        │                     └─systemd-userwor(12715)
        ├─auditd(1140)───{auditd}(1141)
        ├─dbus-broker-lau(1164)───dbus-broker(1165)
        ├─avahi-daemon(1166)───avahi-daemon(1196)
        ├─bluetoothd(1167)
```

每个进程在系统中都会被分配一个编号。进程编号（PID）1 被分配给启动过程中执行的第一个进程，PID 1 之后的每一个进程都是它的子孙。PID 1 进程是初始化进程，在大多数新版本的 Linux 中，它只是一个指向 `systemd` 程序的符号链接。

### 用 kill 命令结束一个进程

你可以用 `kill` 命令来终止 Linux 系统中的进程。尽管名字叫 “杀死”，但 `kill` 命令和其他一些命令，如 `pkill` 和 `killall`，都是为向一个或多个进程发送信号而编写/设计的。当没有指定信号时，它发送的默认信号是 `SIGTERM` 信号，以终止进程。

当一个父进程死亡或被杀死，而其子进程没有跟随其父进程的死亡，我们称该进程为“<ruby>孤儿进程<rt>orphan process</rt></ruby>”。

### 如何杀死一个僵尸进程

另一方面，僵尸进程是不能被“杀死”的！你可能会问为什么？因为它们已经死了！

每一个子进程，当被终止时，都会成为一个僵尸进程，然后被父进程删除。当进程退出并释放它所使用的资源时，它的名字仍然在操作系统的进程表中。这时，父进程的工作就是把它的名字从进程表中删除。如果没有删除，我们就有了僵尸进程，它不再是一个真正的进程，而只是操作系统进程表上的一个条目。

这就是为什么试图对一个<ruby>失效的<rt>defunct</rt></ruby>（僵尸）进程执行 “杀死” 命令，即使使用 `-9`（`SIGKILL`）选项也不起作用，因为没有什么可以杀死的。

因此，要杀死一个僵尸进程，比如从进程列表（进程表）中删除其名称，你必须杀死其父进程。例如，如果 PID 5878 是一个僵尸进程，而它的父进程是 PID 4809，那么要杀死僵尸进程（5878），就必须结束父进程（4809）：

```
$ sudo kill -9 4809  # 4809 是父进程，而非僵尸
```

我对僵尸的最后一句警告：在杀死父进程时要非常小心。如果一个进程的父进程是 PID 1，而你杀了它，你就会重新启动自己！

而这将是一个更可怕的故事！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-zombie-process

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ganapathy-kumar-unsplash.jpg?itok=5-DT99NA (Full moon on a hazy night)
[2]: https://opensource.com/article/21/8/linux-procps-ng
