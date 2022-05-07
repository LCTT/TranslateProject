[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14557-1.html)
[#]: subject: (Watching activity on Linux with watch and tail commands)
[#]: via: (https://www.networkworld.com/article/3529891/watching-activity-on-linux-with-watch-and-tail-commands.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 watch 和 tail 命令监视 Linux 上的活动
======

![](https://img.linux.net.cn/data/attachment/album/202205/07/091736ja5yt2yottef0kl4.jpg)

> watch 和 tail 命令可以帮助监视 Linux 系统上的活动。本文介绍了这两个命令的一些有用的使用方法。

`watch` 和 `tail` 命令为持续监视 Linux 系统上的活动提供了一些有趣的选项。

也就是说，你可以通过 `watch` 来显示谁已登录，并随着用户登录和注销不断更新，而不是仅仅提出问题并获得答案（例如询问 `who` 并获取当前登录用户的列表）。

使用 `tail`，你可以显示文件的底部并在添加内容时查看内容。这种监控一般非常有用，并且比定期运行命令所需的工作更少。

### 使用 watch 命令

使用 `watch` 的最简单示例之一是使用命令 `watch who`。你会看到一个列表，其中显示了谁登录了，以及他们登录的时间和登录位置。请注意，默认设置是每两秒更新一次显示（左上角），日期和时间（右上角）将按该间隔自行更新。用户列表将随着用户登录和注销而增长和缩小。

```
$ watch who
```

此命令将显示如下所示的登录列表：

```
Every 2.0s: who                              dragonfly: Thu Feb 27 10:52:00 2020

nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

你可以通过添加 `-n` 选项（例如 `-n 10`）来修改更新间的不同秒数，以修改更新间隔，从而获取较少的更新频率。

```
$ watch -n 10 who
```

上述命令将以新的间隔显示，并且显示的时间更新频率较低，从而使显示时间与所选间隔保持一致。

```
Every 10.0s: who                             dragonfly: Thu Feb 27 11:05:47 2020

nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

如果你希望仅查看命令的输出，而不是标题（前 2 行），则可以通过添加 `-t`（无标题）选项来省略这些行。

```
$ watch -t who
```

然后，你的屏幕将显示如下所示：

```
nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

如果每次运行监视的命令时，输出都是相同的，则只有标题行（如果未省略）会更改。其余显示的信息将保持不变。

如果你希望 `watch` 命令在它正在监视的命令的输出发生更新后立即退出，则可以使用 `-g`（将其视为“<ruby>离开<rt>go away</rt></ruby>”）选项。例如，如果你只是在等待其他人开始登录系统，则可以选择执行此操作。

你还可以使用 `-d`（<ruby>差异<rt>differences</rt></ruby>）选项突出显示显示输出中的更改。突出显示只会持续一个间隔（默认为 2 秒），但有助于引起你对更新的注意。

下面是一个更复杂的示例，该示例使用 `watch` 命令显示正在侦听连接的服务及其使用的端口。虽然输出不太可能更改，但它会提醒你任何新服务正在启动或关闭。

```
$ watch 'sudo lsof -i -P -n | grep LISTEN'
```

值得注意的是，正在运行的命令需要用引号扩起来，以确保不会将 `watch` 命令的输出发送到 `grep` 命令。

使用 `watch -h` 命令将为你提供命令选项的列表。

```
$ watch -h

Usage:
 watch [options] command

Options:
  -b, --beep             beep if command has a non-zero exit
  -c, --color            interpret ANSI color and style sequences
  -d, --differences[=<permanent>]
                         highlight changes between updates
  -e, --errexit          exit if command has a non-zero exit
  -g, --chgexit          exit when output from command changes
  -n, --interval <secs>  seconds to wait between updates
  -p, --precise          attempt run command in precise intervals
  -t, --no-title         turn off header
  -x, --exec             pass command to exec instead of "sh -c"

 -h, --help     display this help and exit
 -v, --version  output version information and exit
```

### 使用 tail -f

`tail -f` 命令与 `watch` 有一些相同之处。它也会在添加文件时显示文件的底部和其他内容。你不必一次又一次地运行 `tail` 命令，而是运行一个命令并获得可重复更新显示视图的结果。例如，你可以使用如下命令查看系统日志：

```
$ tail -f /var/log/syslog
```

某些文件（如 `/var/log/wtmp`）不适合这种类型的处理，因为它们的格式不是普通文本文件，但是通过组合 `watch` 和 `tail`，你可以获得类似的结果，如下所示：

```
watch 'who /var/log/wtmp | tail -20'
```

无论有多少用户仍处于登录状态，此命令都将只显示最近的 5 次登录。如果发生其他登录，显示结果将添加一行记录并删除顶行记录。

```
Every 60.0s: who /var/log/wtmp | tail -5    dragonfly: Thu Feb 27 12:46:07 2020

shs      pts/0        2020-02-27 08:07 (192.168.0.5)
nemo     pts/1        2020-02-27 08:26 (192.168.0.5)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
nemo     pts/1        2020-02-27 11:34 (192.168.0.5)
dory     pts/1        2020-02-27 12:14 (192.168.0.5)
```

对你有时可能想要监视的信息，无论监视进程、登录名还是系统资源，`watch` 和 `tail -f` 命令都可以提供自动更新视图，从而使监视任务变得更加容易。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529891/watching-activity-on-linux-with-watch-and-tail-commands.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[Starryi](https://github.com/Starryi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
