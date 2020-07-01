[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12284-1.html)
[#]: subject: (How to Remove Files Older than N Days Using Tmpwatch/Tmpreaper on Linux)
[#]: via: (https://www.2daygeek.com/how-to-remove-files-older-than-n-days-using-tmpwatch-tmpreaper-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何使用 Tmpwatch/Tmpreaper 删除旧文件
======

![](https://img.linux.net.cn/data/attachment/album/202006/05/091806zrnwahdl9fdyznrw.jpg)

你可能忘记了删除计算机上某个目录中不再需要的文件的操作。这可能是“下载”或任何其他目录。它可能已经增长了一段时间。

即便有足够的存储空间，你也应该删除它们，因为这会在列出文件时降低系统速度。同样，当一个目录中有成千上万个文件时，它可能很会很臃肿。

当你不知道要检查的文件名时，很难在特定目录中找到文件。

我们可以通过结合使用 `find` 命令和一些组合来做到这一点，我们过去已经写过一篇文章。

* [使用 Bash 脚本在 Linux 中删除早于 “X” 天的文件/文件夹][1]

今天，我们将向你展示如何在 Linux 上使用 Tmpwatch 程序来实现这一目标。

### 什么是 tmpwatch

`tmpwatch` 会在指定目录中递归删除指定时间段内未被访问的文件。通常，它用于自动清除临时文件系统目录，例如 `/tmp` 和 `/var/tmp`。

它只会删除空目录、常规文件和符号链接。它不会切换到其他文件系统，并避开了属于根用户的 `lost+found` 目录。

默认情况下，`tmpwatch` 会根据文件的 atime（访问时间）而不是 mtime（修改时间）删除文件。

你可以在 `tmpwatch` 命令中添加其他参数来更改这些行为。

**警告：** 请不要在 `/` 中运行 `tmpwatch` 或 `tmpreaper`，因为该程序中没有防止这种情况的机制。

### 如何在 Linux 上安装 tmpwatch

可以在官方仓库中按以下方式安装 `tmpwatch`。

对于 RHEL/CentOS 6 系统，请使用 [yum 命令][2]安装 `tmpwatch`。

```
$ sudo yum install -y tmpwatch
```

对于 Debian 和 Ubuntu 系统，请使用 [apt 命令][3] 或 [apt-get 命令][4] 安装 `tmpreaper`。

```
$ sudo apt-get install tmpreaper
```

对于 openSUSE 系统，请使用 [zypper 命令][5] 安装 `tmpwatch`。

```
$ sudo zypper install -y tmpwatch
```

对于 Fedora 系统，请使用 [dnf 命令][6] 安装 `tmpwatch`。

```
$ sudo dnf install -y tmpwatch
```

**请注意：** 如果你使用的是基于 Debian 的系统，请使用 `tmpreaper` 而不是 `tmpwatch`。所有示例都可以如预期工作。

### 了解关键选项和参数

* `atime`（文件上次访问时间）：显示命令或脚本等任意进程最后一次访问文件中数据的时间。
* `mtime`（文件上次修改时间）：显示修改文件内容或保存文件的时间。除非是更改文件属性，否则大多数情况下 `ctime` 和 `mtime` 会相同。
* `ctime`（文件上次更改时间）：显示文件元数据更改时间。这意味着更改文件属性的时间（如所有权或组等）。
* `dirmtime`（目录的上次修改时间）：显示目录的上一次修改时间。

时间参数定义删除文件的阈值。

* `d` – 天
* `h` – 小时
* `m` – 分钟
* `s` – 秒

### 如何使用 tmpwatch 命令删除一段时间未访问的文件

正如我在本文开头所说，`tmpwatch` 默认根据文件访问时间（`atime`）来删除文件。另外，由于小时是默认参数，因此如果使用小时单位，那么无需在时间上添加后缀。

例如，运行以下命令以递归方式删除过去 5 个小时未访问的文件。

```
# tmpwatch 5 /tmp
```

运行以下命令删除最近 10 个小时未修改的文件。如果要使用修改时间（`mtime`）来删除文件，那么需要在 `tmpwatch` 命令中添加 `-m` 选项。

```
# tmpwatch -m 10 /home/daygeek/Downloads
```

### 如何使用 tmpwatch 命令删除超过 “X” 天未访问的文件

如果要使用天数删除文件，那么需要添加后缀 `d`。以下示例删除了 30 天以上的文件。

```
# tmpwatch 30d /home/daygeek/Downloads
```

### 如何使用 tmpwatch 命令删除一段时间内未访问的所有文件

以下命令将基于修改时间（`mtime`）删除所有类型的文件，而不仅仅是常规文件、符号链接和目录。

```
# tmpwatch -am 12 /tmp
```

### 如何在 tmpwatch 中排除目录

以下命令将删除过去 10 个小时未修改的所有文件，并排除目录。

```
# tmpwatch -am 10 --nodirs /home/daygeek/Downloads
```

### 如何在 tmpwatch 中排除特定路径

以下命令将删除过去 10 个小时未被修改的所有文件，除了下面排除的文件夹。

```
# tmpwatch -am 10 --exclude=/home/daygeek/Downloads/Movies /home/daygeek/Downloads
```

### 如何在 tmpwatch 中排除特定模式

以下命令将删除过去 10 小时未被修改的所有文件，除了满足下面列出的模式的文件。

```
# tmpwatch -am 10 --exclude-pattern='*.pdf' /home/daygeek/Downloads
```

### 如何让 tmpwatch 命令空运行

如果要空运行，请运行以下命令。

```
# tmpwatch -t 5h /home/daygeek/Downloads
```

### 如何设置 cronjob 来使用 tmpwatch 定期删除文件

默认情况下，它在 `/etc/cron.daily/tmpreaper` 目录下有一个 [cronjob][7] 文件。该 cronjob 根据位于 `/etc/timereaper.conf` 中的配置文件工作。你可以根据需要自定义文件。

它每天运行一次，并删除 7 天之前的文件。

另外，如果你希望常规执行某项操作，那么可以根据需要手动添加一个 cronjob。

```
# crontab -e

0 10 * * * /usr/sbin/tmpwatch 15d /home/daygeek/Downloads
```

上面的 cronjob 将在每天上午 10 点删除早于 15 天的文件。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-remove-files-older-than-n-days-using-tmpwatch-tmpreaper-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11490-1.html
[2]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[7]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
