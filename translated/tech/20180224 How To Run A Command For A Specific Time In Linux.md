如何在 Linux 中的特定时间运行命令
======
![](https://www.ostechnix.com/wp-content/uploads/2018/02/Run-A-Command-For-A-Specific-Time-In-Linux-1-720x340.png)

有一天，我使用 rsync 将大文件传输到局域网上的另一个系统。由于它是非常大的文件，大约需要 20 分钟才能完成。我不想再等了，我也不想按 CTRL+C 来终止这个过程。我只是想知道在类 Unix 操作系统中是否有简单的方法可以在特定的时间运行一个命令，并且一旦超时就自动杀死它 - 因此有了这篇文章。请继续阅读。

### 在 Linux 中在特定时间运行命令

我们可以用两种方法做到这一点。

#### 方法 1 - 使用 “timeout” 命令

最常用的方法是使用 **timeout** 命令。对于那些不知道的人来说，timeout 命令会有效地限制一个进程的绝对执行时间。timeout 命令是 GNU coreutils 包的一部分，因此它预装在所有 GNU/Linux 系统中。

假设你只想运行一个命令 5 秒钟，然后杀死它。为此，我们使用：
```
$ timeout <time-limit-interval> <command>

```

例如，以下命令将在 10 秒后终止。
```
$ timeout 10s tail -f /var/log/pacman.log

```

![][2]

你也可以不用在秒数后加后缀 “s”。以下命令与上面的相同。
```
$ timeout 10 tail -f /var/log/pacman.log

```

其他可用的后缀有：

  * ‘m‘ 代表分钟。
  * ’h‘ 代表小时。
  * ’d‘ 代表天。



如果你运行这个 **tail -f /var/log/pacman.log** 命令，它将继续运行，直到你按 CTRL+C 手动结束它。但是，如果你使用 **timeout** 命令运行它，它将在给定的时间间隔后自动终止。如果该命令在超时后仍在运行，则可以发送 **kill** 信号，如下所示。
```
$ timeout -k 20 10 tail -f /var/log/pacman.log

```

在这种情况下，如果 tail 命令在 10 秒后仍然运行，timeout 命令将在 20 秒后发送一个 kill 信号并结束。

有关更多详细信息，请查看手册页。
```
$ man timeout

```

有时，某个特定程序可能需要很长时间才能完成并最终冻结你的系统。在这种情况下，你可以使用此技巧在特定时间后自动结束该进程。

另外，可以考虑使用 **cpulimit**，一个简单的限制进程的 CPU 使用率的程序。有关更多详细信息，请查看下面的链接。

#### 方法 2 - 使用 “Timelimit” 程序

Timelimit 使用提供的参数执行给定的命令，并在给定的时间后使用给定的信号终止进程。首先，它会发送警告信号，然后在超时后发送 **kill** 信号。

与 timeout 不同，Timelimit 有更多选项。你可以传递参数数量，如 killsig、warnsig、killtime、warntime 等。它存在于基于 Debian 的系统的默认仓库中。所以，你可以使用命令来安装它：
```
$ sudo apt-get install timelimit

```

对于基于 Arch 的系统，它在 AUR 中存在。因此，你可以使用任何 AUR 助手进行安装，例如 [**Pacaur**][3]、[**Packer**][4]、[**Yay**][5]、[**Yaourt**][6] 等。

对于其他发行版，请[**在这里**][7]下载源码并手动安装。安装 Timelimit 后，运行下面的命令一段特定的时间，例如 10 秒钟：
```
$ timelimit -t10 tail -f /var/log/pacman.log

```

如果不带任何参数运行 timelimit，它将使用默认值：warntime=3600 秒、warnsig=15、killtime=120、killsig=9。有关更多详细信息，请参阅本指南最后给出的手册页和项目网站。
```
$ man timelimit

```

今天就是这些。我希望对你有用。还有更好的东西。敬请关注！

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/run-command-specific-time-linux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/02/Timeout.gif
[3]:https://www.ostechnix.com/install-pacaur-arch-linux/
[4]:https://www.ostechnix.com/install-packer-arch-linux-2/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:http://devel.ringlet.net/sysutils/timelimit/#download
