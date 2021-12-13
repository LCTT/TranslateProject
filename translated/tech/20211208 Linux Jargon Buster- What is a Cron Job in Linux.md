[#]: subject: "Linux Jargon Buster: What is a Cron Job in Linux?"
[#]: via: "https://itsfoss.com/cron-job/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "jrglinux"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

# Linux 中的定时任务（Cron Job）介绍

在本期的《`Linux Jargon Buster`系列》文章中，你将了解到 `Linux` 中的 `cron` 定时任务功能。你将通过学习编辑 `crontab` 文件来创建 `cron jobs`（定时任务，译注：为保持原味，这样的术语就不翻译，读者知道即可）。



### 何为 Linux cron job

`Cron` 是一个用于按计划运行短小且快速命令的实用命令行工具。该工具是一个方便、经典的系统管理工具，通过和其他工具结合使用可以自动运行各式各样的任务。比如，有些人通过 `rsync` 和 `cron` 结合使用，在特定的时间自动创建每日备份和每周备份。也有些人使用 `cron` 来分析服务器日志，并且结合邮件系统功能，在日志检测到错误时自动发送告警邮件。

`Cron` 就如同”瑞士军刀“一样，可以多场景多样化使用。尽可能发挥你的想象，去挖掘它的功能。

其实很容易上手 `cron` 使用，只需要几秒钟。不过在我们开始上手之前，先来讨论下几个经常容易混淆的概念。



### Cron vs cron job vs crontab

有三个术语比较容易混淆：`cron`，`cron job` 和 `crontab`，让我们来看看它们的含义：

| 术语         | 含义                                                         |
| ------------ | ------------------------------------------------------------ |
| cron         | 这是安装在系统上的实际执行定时任务的[daemon][1]              |
| cron job     | 一个 `Linux job` 是指一段起来并运行的程序。`Cron` 进程可以按照约定的时间计划运行各种任务，这样的任务通常叫做`"cron jobs"`（定时任务） |
| [crontab][2] | 这是一个文件，用于定义定时任务。一个 `crontab` 文件可以通过表格形式（每一行就是一个定时任务）定义多个定时任务 |

来看一个简单例子：创建一个 `cron job`，每小时向` crontabl_log.tx`t 文件打印 `"Linux is cool!" `。

```shell
0 * * * *  echo "Linux is Cool!" >> ~/crontab_log.txt
```

是不是这么个简单 `cron job` 例子都让你感到惊恐，这是因为你需要懂得如何去读懂一个定时任务的属性。

我将在后文中讲述这个基础理论知识。



### 上手 Cron

我们通过另一个例子来看看 `Cron` 如何工作。

为了创建 `Cron jobs`，或者是 `cron` 将要执行的命令任务，你只需要运行：

```shell
crontab -e
```

这将会打开一个文件，用于编辑 `cron jobs`：

![Crontab default view][3]

其中，所有以 `#` 开头的行都是注释，用于指导你如何使用 `cron`，如果觉得没用可以删除它们。

我们将创建如下任务，作为我们的第一个 `cron job`：

```shell
* * * * * touch ~/crontab_test
```

让我快速看看该任务将会做什么：

Cron jobs 都是以 `分钟 小时 天 月 周 命令`形式呈现`（minute hour day month week command）`。

* 分钟（`minute）`是指该任务在哪一分钟会被执行。所以，该值为 `0` 则代表在每个小时开始运行，`5` 则代表在每个小时的第5分钟会运行。
* 小时（`hour`）是指该任务在一天中的哪个小时会被执行，取值范围为 `0-23`。没有 `24` 的原因是 `23` 时的末尾是半夜 `11:59`，然后就是每天的开始 `0` 时。`minutes` 的取值范围定义逻辑与之类似。
* 天（`day`）是指一个月中的哪一天执行该任务，取值范围是 `1-31`（不同于前面的分钟和小时从 `0` 开始取值）。
* 月（`month`）是指该任务在哪个月被执行，取值范围是 `1-12`。
* 周（`week`）是指该任务在星期几被执行，从 `Sunday` 开始算起，取值范围是`0-6`。
* 命令（`command`），则是你想要运行的命令任务。

![][4]

如果想对 "分钟 小时 天 月 周" 部分有更详细的理解，可以参考 [Crontab guru 网站][5]，该网站可以帮助理解正在执行什么。

下面之前的例子 *** * * * * touch ~/crontab_test**，每分钟创建 `~/crontab_test`文件。

让我们将该任务编辑进 `crontab` 然后看看执行结果：

![][6]

等到下一分钟，你就会发现你的 `home` 路径下多了文件 `crontab_test`:

![][7]

这便是 `cron` 的基础应用示例。



### 一个实用的 cron job 示例

假设你想创建一个脚本，用于拷贝多个目录内容到一个路径并打包作为备份，该如何实现？

通过 `cron` 定时任务就可以很容易实现该功能。

请看如下脚本：

```shell
#!/usr/bin/bash
echo "Backing up..."
mkdir -p ~/.local/tmp/
tar -Pc ~/Documents/ -f ~/.local/tmp/backup.gz
```

该脚本做了如下事情：

1. 确保备份路径目录 `~/.local/tmp/` 存在。
2. 将目录 `~/Documents/` 下的所有内容打包至文件 `~/.local/tmp/backup.gz`。

我们先来手动运行该脚本，看看它到底如何工作。

首先，我们在 `~` 目录下创建该脚本，命令为 `backup_script`，如下图所示：

![][8]

然后编辑 `backup_script` 脚本，写入上面那个脚本代码。

接着，赋予 `backup_script` 可执行权限：

![][9]

最后运行脚本 `~/backup_script`，进行功能验证：

![][10]

你可以通过运行命令 `tar -xf ~/.local/tmp/backup.gz -C <output_dir>` 来进行备份恢复，这里 `<output_dir>` 是指文件要恢复到的路径目录。

接下来，就可以用 `cron` 工具来进行定时任务运行该脚本了。

举个例子，假设需要每天的凌晨 3 点运行该备份脚本，你可以在 `crontab` 中输入如下命令：

```shell
* 3 * * * ~/backup_script
```

这样你就可以每天自动进行备份操作了。



### 后记

本文简单介绍了 `cron jobs` 定时任务功能。尽管我不确定 Linux 桌面用户使用该功能多不多，但我知道 `cron job` 定时任务功能被许多系统管理员广泛应用。如果你有什么想法，欢迎在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cron-job/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[jrglinux](https://github.com/jrglinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-daemons/
[2]: https://linuxhandbook.com/crontab/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/crontab-file.webp?resize=800%2C673&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/crontab-explanation.webp?resize=800%2C450&ssl=1
[5]: https://crontab.guru/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cron-example-1.webp?resize=557%2C241&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/result-of-cron-job.webp?resize=557%2C241&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-example.webp?resize=548%2C295&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-example-1.webp?resize=548%2C385&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-result.png?resize=800%2C220&ssl=1
