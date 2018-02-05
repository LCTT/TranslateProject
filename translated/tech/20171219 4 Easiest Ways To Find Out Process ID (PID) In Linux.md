Linux 中 4 个简单的找出进程 ID（PID）的方法
======
每个人都知道 PID，究竟什么是 PID？为什么你想要 PID？你打算用 PID 做什么？你脑子里有同样的问题吗？如果是这样，你就找对地方了解这些细节了。

主要地，我们查询 PID 来杀死一个没有响应的程序，它类似于 Windows 任务管理器。 Linux GUI 也提供相同的功能，但 CLI 是执行 kill 操作的有效方法。

### 什么是进程 ID?

PID 代表进程标识号（process identification），它在大多数操作系统内核（如 Linux、Unix、macOS 和 Windows）中使用。它是在操作系统中创建时自动分配给每个进程的唯一标识号。一个进程是一个正在运行的程序实例。

**建议阅读：** [如何查看 Apache Web 服务器在 Linux 中的运行时间][1]

除了 init 进程外其他所有的进程 ID 每次都会改变，因为 init 始终是系统上的第一个进程，并且是所有其他进程的父进程。它的 PID 是 1。

PID 默认的最大值是 `32,768`。可以在你的系统上运行 `cat /proc/sys/kernel/pid_max` 来验证。在 32 位系统上，32768 是最大值，但是我们可以在 64 位系统上将其设置为最大 2^22（约 4 百万）内的任何值。

你可能会问，为什么我们需要这么多的 PID？因为我们不能立即重用 PID，这就是为什么。另外为了防止可能的错误。

系统正在运行的进程的 PID 可以通过使用 pidof、pgrep、ps 和 pstree 命令找到。

### 方法 1：使用 pidof 命令

pidof 用于查找正在运行的程序的进程 ID。它在标准输出上打印这些 id。为了演示，我们将在 Debian 9（stretch）系统中找出 Apache2 的进程 ID。
```
# pidof apache2
3754 2594 2365 2364 2363 2362 2361

```

从上面的输出中，你可能会遇到难以识别进程 ID 的问题，因为它通过进程名称显示了所有的 PID（包括父进程和子进程）。因此，我们需要找出父 PID（PPID），这是我们要查找的。它可能是第一个数字。在本例中，它是 `3754`，并按降序排列。

### 方法 2：使用 pgrep 命令

pgrep 遍历当前正在运行的进程，并将符合选择条件的进程 ID 列到标准输出中。
```
# pgrep apache2
2361
2362
2363
2364
2365
2594
3754

```

这也与上面的输出类似，但是它将结果从小到大排序，这清楚地说明父 PID 是最后一个。在本例中，它是 `3754`。

**注意：** 如果你有多个进程的进程 ID，那么在使用 pidof 和 pgrep 识别父进程 ID 时可能会遇到麻烦。

### 方法 3：使用 pstree 命令

pstree 将运行的进程显示为一棵树。树的根是 pid，如果省略了 pid 那么就是 init。如果在 pstree 命令中指定了用户名，则显示相应用户拥有的所有进程。

pstree 通过将它们放在方括号中并添加重复计数前缀来可视化地合并相同的分支。
```
# pstree -p | grep "apache2"
 |- apache2(3754) -|-apache2(2361)
 | |-apache2(2362)
 | |-apache2(2363)
 | |-apache2(2364)
 | |-apache2(2365)
 | `-apache2(2594)

```

要单独获取父进程，请使用以下格式。
```
# pstree -p | grep "apache2" | head -1
 |- apache2(3754) -|-apache2(2361)

```

pstree 命令非常简单，因为它分别隔离了父进程和子进程，但这在使用 pidof 和 pgrep 时命令不容易。

### 方法 4：使用 ps 命令

ps 显示活动进程的选择信息。它显示进程 ID（pid=PID）、与进程关联的终端（tname=TTY）、以 [DD-]hh:mm:ss 格式（time=TIME）的累计 CPU 时间、以及执行名（ucmd = CMD）。输出默认是未排序的。
```
# ps aux | grep "apache2"
www-data 2361 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2362 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2363 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2364 0.0 0.4 302652 9732 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2365 0.0 0.4 302652 8400 ? S 06:25 0:00 /usr/sbin/apache2 -k start
www-data 2594 0.0 0.4 302652 8400 ? S 06:55 0:00 /usr/sbin/apache2 -k start
root 3754 0.0 1.4 302580 29324 ? Ss Dec11 0:23 /usr/sbin/apache2 -k start
root 5648 0.0 0.0 12784 940 pts/0 S+ 21:32 0:00 grep apache2

```

从上面的输出中，我们可以根据进程的启动日期轻松地识别父进程 ID（PPID）。在此例中，apache2 启动于 `Dec11`，它是父进程，其他的是子进程。apache2 的 PID 是 `3754`。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/check-find-apache-httpd-web-server-uptime-linux/
