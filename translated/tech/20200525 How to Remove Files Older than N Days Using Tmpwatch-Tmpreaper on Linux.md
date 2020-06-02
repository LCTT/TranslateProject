[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Remove Files Older than N Days Using Tmpwatch/Tmpreaper on Linux)
[#]: via: (https://www.2daygeek.com/how-to-remove-files-older-than-n-days-using-tmpwatch-tmpreaper-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上使用 Tmpwatch/Tmpreaper 删除早于 N 天的文件
======

你可能错过了删除计算机上某个目录中不再需要的文件的操作。

这可以是“下载”或任何其他目录。

它可能已经增长了一段时间。

如果有足够的存储空间，那么你应删除它们，因为这会在列出文件时降低系统速度。

同样，当一个目录中有成千上万个文件时，它可能很会很臃肿。

当你不知道要检查的文件名时，很难在特定目录中找到文件。

我们可以通过结合使用 find 命令和一些组合来做到这一点，我们过去已经写过一篇文章。

  * [**使用 Bash 脚本在 Linux 中删除早于 “X” 天的文件/文件夹**][1]
  * [**如何在 Linux 中查找和删除早于 “X” 天和 “X” 小时的文件**][1]
  * [**如何在 Linux 中自动删除或清理 /tmp 文件夹内容？**][1]



今天，我们将向你展示如何在 Linux 上使用 Tmpwatch 程序来实现这一目标。

### 什么是 Tmpwatch

Tmpwatch 递归删除指定时间段内未在指定目录中被访问的文件。

通常，它用于自动清除临时文件系统目录，例如 /tmp 和 /var/tmp。

它仅删除空目录、常规文件和符号链接。

它不会切换到其他文件系统，并避免了属于根用户的 “lost+found” 目录。

默认情况下，tmpwatch 会根据文件的 atime （访问时间）而不是 mtime （修改时间）删除文件。

你可以在 tmpwatch 命令中添加其他参数来更改此行为。

**警告：** 请不要在 “/” 中运行 “tmpwatch” 或 “tmpreaper”，因为程序中没有防止这种情况的机制。

### 如何在 Linux 上安装 Tmpwatch

可以在官方仓库中按以下方式安装 Tmpwatch。

对于 **RHEL/CentOS 6** 系统，请使用 **[yum 命令][2]**安装 Tmpwatch。

```
$ sudo yum install -y tmpwatch
```

对于 **Debian** 和 **Ubuntu** 系统，请使用 **[apt 命令][3]** 或 **[apt-get 命令][4]** 安装 Tmpreaper。

```
$ sudo apt-get install tmpreaper
```

对于 **openSUSE** 系统，请使用 **[zypper 命令][5]** 安装 Tmpwatch。

```
$ sudo zypper install -y tmpwatch
```

对于 **Fedora** 系统，请使用 **[dnf 命令][6]** 安装 Tmpwatch。

```
$ sudo dnf install -y tmpwatch
```

**请注意：** 如果你使用的是基于 Debian 的系统，请使用 “tmpreaper” 而不是 tmpwatch。所有例子都将按预期工作。

### 了解关键选项和参数

  * **atime**（文件上次访问时间）– atime 显示命令或脚本等任意进程最后一次访问文件中数据的时间。
  * **mtime**（文件上次修改时间）– mtime 显示你修改文件内容或保存文件的时间。除非文件属性被更新，否则大多数情况下 ctime 和 mtime 会相同。
  * **ctime**（文件上次更改时间）– ctime 显示文件元数据更改时间。这意味着更改文件属性的时间（如所有权或组等）。
  * **dirmtime**（目录的上次修改时间）– dirmtime 显示目录的上一次修改时间。



time 参数定义删除文件的阈值。

  * d – 天
  * h – 小时
  * m – 分钟
  * s – 秒



### 如何使用 Tmpwatch 命令删除一段时间未访问的文件

正如我在本文开头所说，Tmpwatch 默认（atime）根据文件访问时间删除文件。另外，由于小时是默认参数，因此如果使用小时单位，那么无需在时间上添加后缀。

例如，运行以下命令以递归方式删除过去 5 个小时未访问的文件。

```
# tmpwatch 5 /tmp
```

运行以下命令删除最近 10 个小时未修改的文件。如果要使用 mtime 删除文件，那么需要在 tmpwatch 命令中添加 “-m” 选项。

```
# tmpwatch -m 10 /home/daygeek/Downloads
```

### 如何使用 Tmpwatch 命令删除超过 “X” 天未访问的文件

如果要使用天数删除文件，那么需要添加后缀 “d”。以下示例删除了 30 天以上的文件。

```
# tmpwatch 30d /home/daygeek/Downloads
```

### 如何使用 Tmpwatch 命令删除一段时间内未访问的所有文件

以下命令将删除所有文件类型，而不仅仅是基于 mtime 的常规文件、符号链接和目录。

```
# tmpwatch -am 12 /tmp
```

### 如何在 Tmpwatch 中排除目录

以下命令将删除所有文件，并排除过去 10 个小时未修改的目录。

```
# tmpwatch -am 10 --nodirs /home/daygeek/Downloads
```

### 如何在 Tmpwatch 中排除特定路径

以下命令将删除所有文件，除了下面在过去 10 个小时未被修改的文件夹。

```
# tmpwatch -am 10 --exclude=/home/daygeek/Downloads/Movies /home/daygeek/Downloads
```

### 如何在 Tmpwatch 中排除特定模式

以下命令将删除所有文件，除了下面在过去 10 小时未被修改的满足该模式的文件。

```
# tmpwatch -am 10 --exclude-pattern='*.pdf' /home/daygeek/Downloads
```

### 如何让 Tmpwatch 命令空运行

如果要空运行，请运行以下命令。

```
# tmpwatch -t 5h /home/daygeek/Downloads
```

### 如何设置 cronjob 来使用 Tmpwatch 定期删除文件

默认情况下，它在 **“/etc/cron.daily/tmpreaper”** 目录下有一个 **[cronjob][7]** 文件。该 cronjob 根据位于 **“/etc/timereaper.conf”** 中的配置文件工作。你可以根据需要自定义文件。

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
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/bash-script-to-delete-files-folders-older-than-x-days-in-linux/
[2]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[7]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
