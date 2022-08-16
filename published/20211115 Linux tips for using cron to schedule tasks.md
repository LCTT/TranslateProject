[#]: subject: "Linux tips for using cron to schedule tasks"
[#]: via: "https://opensource.com/article/21/11/cron-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "Veryzzj"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14932-1.html"

使用 cron 定时任务的小技巧
======

> 通过使用这个简单而强大的 Linux 命令行工具，来安排备份、文件清理以及其他任务。 

![](https://img.linux.net.cn/data/attachment/album/202208/15/151143fjdses6bdj2nj1j5.jpg)

在计算机上让任务按照有规律并且可预测的时间表运行很重要。作为人类，我们有时会因为分心、脑子里想太多，或是度假而记不住要做的事情。计算机真的很擅长按计划做事，但在计算机采取行动之前，人类必须对计算机进行编程。

在某种程度上，cron 系统是编程的初级简单入门。通过编辑一个文件就可以让计算机做你想让它做的事。你甚至不需要知道文件保存在哪里。只需键入一个简单的命令，输入你希望电脑遵循的 “配方”，并保存。从那时起，计算机会在指定时间执行你的指令，直到被告知停止。

从设计上来看，cron 不是一个复杂的系统。这里有一些你需要了解的内容。

### cron 是什么？

cron 命令在 Linux 和 Unix 中无处不在，而且它经常被模仿和重塑，以至于它几乎成了按计划发生的事情的一个通用术语。它是自动化的一种形式，尽管有不同的实现方式（比如 Dillon's cron、Vixie's cron、chrony 和其他），以及像 anacron 和 systemd 定时器这样的变化，但其语法和工作流程几十年来一直保持着基本一致。

cron 在一个 “<ruby>假脱机<rt>spool</rt></ruby>” 系统上工作，像打印机和电子邮件一样。如果不你知道打印机和电子邮件使用假脱机也没关系，因为假脱机文件的意义在于，你不需要想太多。在 Linux 系统中，`/var/spool` 目录被设计为重要但低级的文件的中心枢纽，用户不需要直接与之交互。 在 `/var/spool` 中管理的一个假脱机是 cron 表（简称为 “crontab”）。 包括你在内的每个用户在 Linux 系统中都有一个 crontab。用户可以编辑、查看和删除自己的 crontab。除此之外，用户可以使用 crontab 来安排任务。cron 系统监控 crontab，并确保一个 crontab 中列出的任何工作都能在其指定时间执行。

### 编辑 cron 设置

你可以使用 `crontab` 命令和 `-e`（代表“编辑”）选项来编辑你的 crontab。默认情况下，大多数系统会调用 `vim` 文本编辑器。如果你和我一样，不使用 Vim，那么你可以在 `~/.bashrc` 文件中为自己设置一个不同的编辑器。我把我的设置为 Emacs，但你也可以试试 [Nano][4]、[Kate][5]，或者任何你喜欢的编辑器。`EDITOR` 环境变量定义了你在终端使用的文本编辑器，而 `VISUAL` 变量定义了你在图形模式下使用的编辑器：

```
export EDITOR=nano
export VISUAL=kate
```

更新设置后刷新你的 shell 会话：

```
$ source ~/.bashrc
```

现在你可以用喜欢的编辑器编辑 crontab：

```
$ crontab -e
```

#### 为任务执行安排时间

cron 系统本质上是一个日历系统。可以通过五个不同的属性告诉 cron 需要让一个任务多长时间运行一次：分、时、日、月、星期。这些属性的顺序是固定的，并且不一定是直观的，你可以把它们看作是过滤器或掩码。默认情况下，你可以理解为所有东西都被设置为“总是”或者“每一个”。此命令将在全年的每一天每小时每分钟运行 `touch /tmp/hello`：

```
* * * * * touch /tmp/hello
```

可以通过设置每个属性的具体定义来限制这个包罗万象的时间安排表。使任务在每个小时的 30 分钟时运行，将分钟设置为 `30`：

```
30 * * * * touch /tmp/hello
```

可以通过一个具体的小时来进一步约束这个指令。使任务在每个凌晨 3:30 运行：

```
30 3 * * * touch /tmp/hello
```

你也可以让这个任务只在每个月的第一天运行：

```
30 3 1 * * touch /tmp/hello
```

你可以用 `1` 至 `12` 表示 1 至 12 月来设置月份，用 `0` 至 `6` 表示周日至周六来设置星期。这项任务在 4 月份的周一的 3:15 运行：

```
15 3 * 4 1 touch /tmp/hello
```

### 设置增量

所有这些设置都与一个固定时间 _完全_ 匹配。使用 cron 符号设置可以在特定时间段后运行任务，例如，每 15 分钟运行一个任务：

```
*/15 * * * * touch /tmp/hello
```

每三天在上午 10 点运行任务：

```
* 10 */3 * * touch /tmp/hello
```

每 6 小时运行一次任务：

```
* */6 * * * touch /tmp/hello
```

### Cron 速记符

现代的 cron 实现已经为常见的时间安排表添加了方便的速记符，包括：

* `@hourly`：每小时
* `@daily`：每天
* `@weekly`：每周
* `@monthly`：每月
* `@yearly` 或 `@annually`：每年

### 列出 cron 任务

使用 `crontab` 命令，查看计划中的 cron 任务列表：

```
$ crontab -l
15 3 * 4 1 touch /tmp/hello
```

### 删除一个 crontab

当一个 crontab 任务不需要时，可以使用 `-r` 选项来删除它：

```
$ crontab -r -i
```

`-i` 选项代表 _交互式_。它在删除文件之前会提示你进行确认。

### Cron 可以做什么

知道如何使用 cron 是一回事，但但知道它的用途是另一回事。经典用例就是备份计划。如果你的电脑一天中大部分时间都是开着的，或者整天整夜地开着，那么可以为重要分区进行例行备份。我会在每天凌晨 3 点在主要数据分区上运行一个名为 `rdiff-backup` 的备份程序：

```
$ crontab -l | grep rdiff
* 3 * * * rdiff-backup /data/ /vault/
```

另一个常见的用途是系统维护。在我的 Slackware 桌面上，每周五下午会更新本地版本库目录：

```
$ crontab -l | grep slack
* 14 * * 5 sudo slackpkg update
```

我还会每 3 天在 15:00 运行一个 Ansible 脚本来 [清理我的下载文件夹][6] ：

```
$ crontab -l | grep ansible
* 15 */3 * * ansible-playbook /home/seth/Ansible/cleanup.yaml
```

有一些重复数据删除脚本、文件大小和 `/tmp` 目录的监视器、照片调整器、文件移动工具以及很多琐碎的任务，你可以安排在后台运行，以帮助保持系统不受干扰。有了 cron，计算机可以以我希望我的实体公寓能够做到的方式来照顾自己。

### 记住 cron 的设置

除了想明白你为什么需要 cron 之外，根据我的经验，cron 最难的事情是记住它的语法。重复这句话给自己听，反反复复，直到你记牢它：

> 分、时、日、月、星
> 
> 分、时、日、月、星
> 
> 分、时、日、月、星

更好的做法是，去 [下载我们免费的速查表][7] ，这样当你最需要它时，它触手可及！

> **[Cron 速查表][7]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[Veryzzj](https://github.com/Veryzzj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ "Linux keys on the keyboard for a desktop computer"
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/20/7/systemd-timers
[4]: https://opensource.com/article/20/12/gnu-nano
[5]: https://opensource.com/article/20/12/kate-text-editor
[6]: https://opensource.com/article/21/9/keep-folders-tidy-ansible
[7]: https://opensource.com/downloads/linux-cron-cheat-sheet
