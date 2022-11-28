[#]: subject: "Monitor your Linux system in your terminal with procps-ng"
[#]: via: "https://opensource.com/article/21/8/linux-procps-ng"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13713-1.html"

在终端监控你的 Linux 系统
======

> 如何找到一个程序的进程 ID（PID）。最常见的 Linux 工具是由 procps-ng 包提供的，包括 `ps`、`pstree`、`pidof` 和 `pgrep` 命令。

![](https://img.linux.net.cn/data/attachment/album/202108/24/092948gyyv6nvbn77x7y6o.jpg)

在 [POSIX][2] 术语中，<ruby>进程<rt>process</rt></ruby>是一个正在进行的事件，由操作系统的内核管理。当你启动一个应用时就会产生一个进程，尽管还有许多其他的进程在你的计算机后台运行，包括保持系统时间准确的程序、监测新的文件系统、索引文件，等等。

大多数操作系统都有某种类型的系统活动监视器，因此你可以了解在任何特定时刻有哪些进程在运行。Linux 有一些供你选择，包括 GNOME 系统监视器和 KSysGuard。这两个软件在桌面环境都很有用，但 Linux 也提供了在终端监控系统的能力。不管你选择哪一种，对于那些积极管理自己电脑的人来说，检查一个特定的进程是一项常见的任务。

在这篇文章中，我演示了如何找到一个程序的进程 ID（PID）。最常见的工具是由 [procps-ng][3] 包提供的，包括 `ps`、`pstree`、`pidof` 和 `pgrep` 命令。

### 查找一个正在运行的程序的 PID

有时你想得到一个你知道正在运行的特定程序的进程 ID（PID）。`pidof` 和 `pgrep` 命令可以通过命令名称查找进程。

`pidof` 命令返回一个命令的 PID，它按名称搜索确切的命令：

```
$ pidof bash
1776 5736
```

`pgrep` 命令允许使用正则表达式：

```
$ pgrep .sh
1605
1679
1688
1776
2333
5736
$ pgrep bash
5736
```

### 通过文件查找 PID

你可以用 `fuser` 命令找到使用特定文件的进程的 PID。

```
$ fuser --user ~/example.txt          
/home/tux/example.txt: 3234(tux)
```

### 通过 PID 获得进程名称

如果你有一个进程的 PID 编号，但没有生成它的命令，你可以用 `ps` 做一个“反向查找”：

```
$ ps 3234
PID TTY   STAT  TIME COMMAND
5736 pts/1  Ss   0:00 emacs
```

### 列出所有进程

`ps` 命令列出进程。你可以用 `-e` 选项列出你系统上的每一个进程：

```
PID TTY          TIME CMD
  1 ?         00:00:03 systemd
  2 ?         00:00:00 kthreadd
  3 ?         00:00:00 rcu_gp
  4 ?         00:00:00 rcu_par_gp
  6 ?         00:00:00 kworker/0:0H-events_highpri
[...]
5648 ?        00:00:00 gnome-control-c
5656 ?        00:00:00 gnome-terminal-
5736 pts/1    00:00:00 bash
5791 pts/1    00:00:00 ps
5792 pts/1    00:00:00 less
(END)
```

### 只列出你的进程

`ps -e` 的输出可能会让人不知所措，所以使用 `-U` 来查看一个用户的进程：

```
$ ps -U tux | less
 PID TTY          TIME CMD
3545 ?        00:00:00 systemd
3548 ?        00:00:00 (sd-pam)
3566 ?        00:00:18 pulseaudio
3570 ?        00:00:00 gnome-keyring-d
3583 ?        00:00:00 dbus-daemon
3589 tty2     00:00:00 gdm-wayland-ses
3592 tty2     00:00:00 gnome-session-b
3613 ?        00:00:00 gvfsd
3618 ?        00:00:00 gvfsd-fuse
3665 tty2     00:01:03 gnome-shell
[...]
```

这样就减少了 200 个（可能是 100 个，取决于你运行的系统）需要分类的进程。

你可以用 `pstree` 命令以不同的格式查看同样的输出：

```
$ pstree -U tux -u --show-pids
[...]
├─gvfsd-metadata(3921)─┬─{gvfsd-metadata}(3923)
│           └─{gvfsd-metadata}(3924)
├─ibus-portal(3836)─┬─{ibus-portal}(3840)
│          └─{ibus-portal}(3842)
├─obexd(5214)
├─pulseaudio(3566)─┬─{pulseaudio}(3640)
│         ├─{pulseaudio}(3649)
│         └─{pulseaudio}(5258)
├─tracker-store(4150)─┬─{tracker-store}(4153)
│           ├─{tracker-store}(4154)
│           ├─{tracker-store}(4157)
│           └─{tracker-store}(4178)
└─xdg-permission-(3847)─┬─{xdg-permission-}(3848)
            └─{xdg-permission-}(3850)
```

### 列出进程的上下文

你可以用 `-u` 选项查看你拥有的所有进程的额外上下文。

```
$ ps -U tux -u
USER  PID %CPU %MEM    VSZ   RSS TTY STAT START  TIME COMMAND
tux  3545  0.0  0.0  89656  9708 ?   Ss   13:59  0:00 /usr/lib/systemd/systemd --user
tux  3548  0.0  0.0 171416  5288 ?   S    13:59  0:00 (sd-pam)
tux  3566  0.9  0.1 1722212 17352 ?  S<sl 13:59  0:29 /usr/bin/pulseaudio [...]
tux  3570  0.0  0.0 664736  8036 ?   SLl  13:59  0:00 /usr/bin/gnome-keyring-daemon [...]
[...]
tux  5736  0.0  0.0 235628  6036 pts/1 Ss 14:18  0:00 bash
tux  6227  0.0  0.4 2816872 74512 tty2 Sl+14:30  0:00 /opt/firefox/firefox-bin [...]
tux  6660  0.0  0.0 268524  3996 pts/1 R+ 14:50  0:00 ps -U tux -u
tux  6661  0.0  0.0 219468  2460 pts/1 S+ 14:50  0:00 less
```

### 用 PID 排除故障

如果你在某个特定的程序上有问题，或者你只是好奇某个程序在你的系统上还使用了什么资源，你可以用 `pmap` 查看运行中的进程的内存图。

```
$ pmap 1776
5736:   bash
000055f9060ec000   1056K r-x-- bash
000055f9063f3000     16K r---- bash
000055f906400000     40K rw---   [ anon ]
00007faf0fa67000   9040K r--s- passwd
00007faf1033b000     40K r-x-- libnss_sss.so.2
00007faf10345000   2044K ----- libnss_sss.so.2
00007faf10545000      4K rw--- libnss_sss.so.2
00007faf10546000 212692K r---- locale-archive
00007faf1d4fb000   1776K r-x-- libc-2.28.so
00007faf1d6b7000   2044K ----- libc-2.28.so
00007faf1d8ba000      8K rw--- libc-2.28.so
[...]
```

### 处理进程 ID

procps-ng 软件包有你需要的所有命令，以调查和监控你的系统在任何时候的使用情况。无论你是对 Linux 系统中各个分散的部分如何结合在一起感到好奇，还是要对一个错误进行调查，或者你想优化你的计算机的性能，学习这些命令都会为你了解你的操作系统提供一个重要的优势。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-procps-ng

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/system-monitor-splash.png?itok=0UqsjuBQ (System monitor)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://gitlab.com/procps-ng
