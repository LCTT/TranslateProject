8 个用于有效地管理进程的 Linux 命令
======

> 通过这些关键的命令来全程管理你的应用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg)

一般来说，应用程序进程的生命周期有三种主要状态：启动、运行和停止。如果我们想成为称职的管理员，每个状态都可以而且应该得到认真的管理。这八个命令可用于管理进程的整个生命周期。

### 启动进程

启动进程的最简单方法是在命令行中键入其名称，然后按回车键。如果要启动 Nginx web 服务器，请键入 `nginx` 。也许您只是想看看其版本。

```
alan@workstation:~$ nginx

alan@workstation:~$ nginx -v
nginx version: nginx/1.14.0
```

### 查看您的可执行路径

以上启动进程的演示是假设可执行文件位于您的可执行路径中。理解这个路径是可靠地启动和管理进程的关键。管理员通常会为他们想要的目的定制这条路径。您可以使用 `echo $PATH` 查看您的可执行路径。

```
alan@workstation:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
```

#### WHICH

使用 `which` 命令查看可执行文件的完整路径。

```
alan@workstation:~$ which nginx
/opt/nginx/bin/nginx
```

我将使用流行的 web 服务器软件 Nginx 作为我的例子。假设安装了 Nginx。如果执行 `which nginx` 的命令什么也不返回，那么是找不到 Nginx 了，因为它只搜索您指定的可执行路径。有三种方法可以补救一个进程不能简单地通过名字启动的情况。首先是键入完整路径 —— 虽然，我不情愿输入全部路径，您会吗？

```
alan@workstation:~$ /home/alan/web/prod/nginx/sbin/nginx -v
nginx version: nginx/1.14.0
```

第二个解决方案是将应用程序安装在可执行文件路径中的目录中。然而，这有时可能是办不到的，特别是如果您没有 root 权限。

第三个解决方案是更新您的可执行路径环境变量，包括要使用的特定应用程序的安装目录。这个解决方案是与 shell 相关的。例如，Bash 用户需要在他们的 `.bashrc` 文件中编辑 `PATH=` 行。

```
PATH="$HOME/web/prod/nginx/sbin:$PATH"
```

现在，重复您的 `echo` 和 `which` 命令或者尝试检查版本。容易多了！

```
alan@workstation:~$ echo $PATH
/home/alan/web/prod/nginx/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

alan@workstation:~$ which nginx
/home/alan/web/prod/nginx/sbin/nginx

alan@workstation:~$ nginx -v                                                
nginx version: nginx/1.14.0
```

### 保持进程运行

#### NOHUP

注销或关闭终端时，进程可能不会继续运行。这种特殊情况可以通过在要使用 `nohup` 命令放在要运行的命令前面让进程持续运行。此外，附加一个`&` 符号将会把进程发送到后台，并允许您继续使用终端。例如，假设您想运行 `myprogram.sh` 。

```
nohup myprogram.sh &
```

`nohup` 会返回运行进程的 PID。接下来我会更多地谈论 PID。

###  管理正在运行的进程

每个进程都有一个唯一的进程标识号 (PID) 。这个数字是我们用来管理每个进程的。我们还可以使用进程名称，我将在下面演示。有几个命令可以检查正在运行的进程的状态。让我们快速看看这些命令。

#### PS

最常见的是 `ps` 命令。`ps` 的默认输出是当前终端中运行的进程的简单列表。如下所示，第一列包含 PID。

```
alan@workstation:~$ ps
PID TTY          TIME CMD
23989 pts/0    00:00:00 bash
24148 pts/0    00:00:00 ps
```

我想看看我之前启动的 Nginx 进程。为此，我告诉 `ps` 给我展示每一个正在运行的进程（`-e`）和完整的列表（`-f`）。

```
alan@workstation:~$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 Aug18 ?        00:00:10 /sbin/init splash
root         2     0  0 Aug18 ?        00:00:00 [kthreadd]
root         4     2  0 Aug18 ?        00:00:00 [kworker/0:0H]
root         6     2  0 Aug18 ?        00:00:00 [mm_percpu_wq]
root         7     2  0 Aug18 ?        00:00:00 [ksoftirqd/0]
root         8     2  0 Aug18 ?        00:00:20 [rcu_sched]
root         9     2  0 Aug18 ?        00:00:00 [rcu_bh]
root        10     2  0 Aug18 ?        00:00:00 [migration/0]
root        11     2  0 Aug18 ?        00:00:00 [watchdog/0]
root        12     2  0 Aug18 ?        00:00:00 [cpuhp/0]
root        13     2  0 Aug18 ?        00:00:00 [cpuhp/1]
root        14     2  0 Aug18 ?        00:00:00 [watchdog/1]
root        15     2  0 Aug18 ?        00:00:00 [migration/1]
root        16     2  0 Aug18 ?        00:00:00 [ksoftirqd/1]
alan     20506 20496  0 10:39 pts/0    00:00:00 bash
alan     20520  1454  0 10:39 ?        00:00:00 nginx: master process nginx
alan     20521 20520  0 10:39 ?        00:00:00 nginx: worker process
alan     20526 20506  0 10:39 pts/0    00:00:00 man ps
alan     20536 20526  0 10:39 pts/0    00:00:00 pager
alan     20564 20496  0 10:40 pts/1    00:00:00 bash
```

您可以在上面 `ps` 命令的输出中看到 Nginx 进程。这个命令显示了将近 300 行，但是我在这个例子中缩短了它。可以想象，试图处理 300 行过程信息有点混乱。我们可以将这个输出输送到 `grep`，过滤一下仅显示 nginx。

```
alan@workstation:~$ ps -ef |grep nginx
alan     20520  1454  0 10:39 ?        00:00:00 nginx: master process nginx
alan     20521 20520  0 10:39 ?        00:00:00 nginx: worker process
```

确实更好了。我们可以很快看到，Nginx 有 20520 和 20521 的 PID。

#### PGREP

`pgrep` 命令更加简化单独调用 `grep` 遇到的问题。

```
alan@workstation:~$ pgrep nginx
20520
20521
```

假设您在一个托管环境中，多个用户正在运行几个不同的 Nginx 实例。您可以使用 `-u` 选项将其他人排除在输出之外。

```
alan@workstation:~$ pgrep -u alan nginx
20520
20521
```

#### PIDOF


另一个好用的是 `pidof`。此命令将检查特定二进制文件的 PID，即使另一个同名进程正在运行。为了建立一个例子，我将我的 Nginx 复制到第二个目录，并以相应的路径前缀启动。在现实生活中，这个实例可能位于不同的位置，例如由不同用户拥有的目录。如果我运行两个 Nginx 实例，则`pidof` 输出显示它们的所有进程。

```
alan@workstation:~$ ps -ef |grep nginx
alan     20881  1454  0 11:18 ?        00:00:00 nginx: master process ./nginx -p /home/alan/web/prod/nginxsec
alan     20882 20881  0 11:18 ?        00:00:00 nginx: worker process
alan     20895  1454  0 11:19 ?        00:00:00 nginx: master process nginx
alan     20896 20895  0 11:19 ?        00:00:00 nginx: worker process
```

使用 `grep` 或 `pgrep` 将显示 PID 数字，但我们可能无法辨别哪个实例是哪个。

```
alan@workstation:~$ pgrep nginx
20881
20882
20895
20896
```

`pidof` 命令可用于确定每个特定 Nginx 实例的 PID。

```
alan@workstation:~$ pidof /home/alan/web/prod/nginxsec/sbin/nginx
20882 20881

alan@workstation:~$ pidof /home/alan/web/prod/nginx/sbin/nginx
20896 20895
```

#### TOP

`top` 命令已经有很久的历史了，对于查看运行进程的细节和快速识别内存消耗等问题是非常有用的。其默认视图如下所示。

```
top - 11:56:28 up 1 day, 13:37,  1 user,  load average: 0.09, 0.04, 0.03
Tasks: 292 total,   3 running, 225 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.1 us,  0.2 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16387132 total, 10854648 free,  1859036 used,  3673448 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 14176540 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
17270 alan      20   0 3930764 247288  98992 R   0.7  1.5   5:58.22 gnome-shell
20496 alan      20   0  816144  45416  29844 S   0.5  0.3   0:22.16 gnome-terminal-
21110 alan      20   0   41940   3988   3188 R   0.1  0.0   0:00.17 top
    1 root      20   0  225564   9416   6768 S   0.0  0.1   0:10.72 systemd
    2 root      20   0       0      0      0 S   0.0  0.0   0:00.01 kthreadd
    4 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 kworker/0:0H
    6 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 mm_percpu_wq
    7 root      20   0       0      0      0 S   0.0  0.0   0:00.08 ksoftirqd/0
```

可以通过键入字母 `s` 和您喜欢的更新秒数来更改更新间隔。为了更容易监控我们的示例 Nginx 进程，我们可以使用 `-p` 选项并传递 PID 来调用 `top`。这个输出要干净得多。

```
alan@workstation:~$ top -p20881 -p20882 -p20895 -p20896

Tasks:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.8 us,  1.3 sy,  0.0 ni, 95.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16387132 total, 10856008 free,  1857648 used,  3673476 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 14177928 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
20881 alan      20   0   12016    348      0 S   0.0  0.0   0:00.00 nginx
20882 alan      20   0   12460   1644    932 S   0.0  0.0   0:00.00 nginx
20895 alan      20   0   12016    352      0 S   0.0  0.0   0:00.00 nginx
20896 alan      20   0   12460   1628    912 S   0.0  0.0   0:00.00 nginx
```

在管理进程，特别是终止进程时，正确确定 PID 是非常重要。此外，如果以这种方式使用 `top`，每当这些进程中的一个停止或一个新进程开始时，`top` 都需要被告知有新的进程。

### 终止进程

#### KILL

有趣的是，没有 `stop` 命令。在 Linux 中，有 `kill` 命令。`kill` 用于向进程发送信号。最常用的信号是“终止”（`SIGTERM`）或“杀死”（`SIGKILL`）。然而，还有更多。下面是一些例子。完整的列表可以用 `kill -L` 显示。

```
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM

```

注意第 9 号信号是 `SIGKILL`，通常，我们会发出比如 `kill -9 20896` 这样的命令。默认信号是 15，这是 `SIGTERM`。请记住，许多应用程序都有自己的停止方法。Nginx 使用 `-s` 选项传递信号，如 `stop` 或 `reload`。通常，我更喜欢使用应用程序的特定方法来停止操作。然而，我将演示用 `kill` 命令来停止 Nginx 进程 20896，然后用 `pgrep` 确认它已经停止。PID 20896 就不再出现。

```
alan@workstation:~$ kill -9 20896
 
alan@workstation:~$ pgrep nginx
20881
20882
20895
22123
```

#### PKILL

命令 `pkill` 类似于 `pgrep`，因为它可以按名称搜索。这意味着在使用 `pkill` 时必须非常小心。在我的 Nginx 示例中，如果我只想杀死一个 Nginx 实例，我可能不会选择使用它。我可以将 Nginx 选项 `-s  stop` 传递给特定的实例来消除它，或者我需要使用 `grep` 来过滤整个 `ps` 输出。

```
/home/alan/web/prod/nginx/sbin/nginx -s stop
/home/alan/web/prod/nginxsec/sbin/nginx -s stop
```

如果我想使用 `pkill`，我可以包括 `-f` 选项，让 `pkill` 过滤整个命令行参数。这当然也适用于 `pgrep`。所以，在执行 `pkill -f` 之前，首先我可以用 `pgrep -a` 确认一下。

```
alan@workstation:~$ pgrep -a nginx
20881 nginx: master process ./nginx -p /home/alan/web/prod/nginxsec
20882 nginx: worker process
20895 nginx: master process nginx
20896 nginx: worker process
```

我也可以用 `pgrep -f` 缩小我的结果。`pkill` 使用相同参数会停止该进程。

```
alan@workstation:~$ pgrep -f nginxsec
20881
                                           
alan@workstation:~$ pkill -f nginxsec
```

`pgrep`（尤其是 `pkill`）要记住的关键点是，您必须始终确保搜索结果准确性，这样您就不会无意中影响到错误的进程。

大多数这些命令都有许多命令行选项，所以我总是建议阅读每一个命令的 [man 手册页][1]。虽然大多数这些命令都存在于 Linux、Solaris 和 BSD 等平台上，但也有一些不同之处。在命令行工作或编写脚本时，始终测试并随时准备根据需要进行更正。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-commands-process-management

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[1]: https://www.kernel.org/doc/man-pages/
