在 Linux 中怎么使用 cron 计划任务
============================================================

> 没有时间运行命令？使用 cron 的计划任务意味着你不用熬夜程序也可以运行。

![How to use cron in Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ "How to use cron in Linux")
Image by : [Internet Archive Book Images][11]. Modified by Opensource.com. [CC BY-SA 4.0][12]

系统管理员（在许多好处中）的挑战之一是在你该睡觉的时候去运行一些任务。例如，一些任务（包括定期循环运行的任务）需要在没有人使用计算机资源的时候去运行，如午夜或周末。在下班后，我没有时间去运行命令或脚本。而且，我也不想在晚上去启动备份或重大更新。

取而代之的是，我使用两个服务功能在我预定的时间去运行命令、程序和任务。[cron][13] 和 at 服务允许系统管理员去安排任务运行在未来的某个特定时间。at 服务指定在某个时间去运行一次任务。cron 服务可以安排任务在一个周期上重复，比如天、周、或月。

在这篇文章中，我将介绍 cron 服务和怎么去使用它。

### 常见（和非常见）的 cron 用途

我使用 cron 服务去安排一些常见的事情，比如，每天凌晨 2:00 发生的定期备份，我也使用它去做一些不常见的事情。

*   许多电脑上的系统时钟（比如，操作系统时间）都设置为使用网络时间协议（NTP）。 NTP 设置系统时间后，它不会去设置硬件时钟，它可能会“漂移”。我使用 cron 基于系统时间去设置硬件时钟。
*   我还有一个 Bash 程序，我在每天早晨运行它，去在每台电脑上创建一个新的 “每日信息” （MOTD）。它包含的信息有当前的磁盘使用情况等有用的信息。
*   许多系统进程和服务，像 [Logwatch][7]、[logrotate][8]、和 [Rootkit Hunter][9]，使用 cron 服务去安排任务和每天运行程序。

crond 守护进程是一个完成 cron 功能的后台服务。

cron 服务检查在 `/var/spool/cron` 和 `/etc/cron.d` 目录中的文件，以及 `/etc/anacrontab` 文件。这些文件的内容定义了以不同的时间间隔运行的 cron 作业。个体用户的 cron 文件是位于 `/var/spool/cron`，而系统服务和应用生成的 cron 作业文件放在 `/etc/cron.d` 目录中。`/etc/anacrontab` 是一个特殊的情况，它将在本文中稍后部分介绍。

### 使用 crontab

cron 实用程序运行基于一个 cron 表（`crontab`）中指定的命令。每个用户，包括 root，都有一个 cron 文件。这些文件缺省是不存在的。但可以使用 `crontab -e` 命令创建在 `/var/spool/cron` 目录中，也可以使用该命令去编辑一个 cron 文件（看下面的脚本）。我强烈建议你，_不要_使用标准的编辑器（比如，Vi、Vim、Emacs、Nano、或者任何其它可用的编辑器）。使用 `crontab` 命令不仅允许你去编辑命令，也可以在你保存并退出编辑器时，重启动 crond 守护进程。`crontab` 命令使用 Vi 作为它的底层编辑器，因为 Vi 是预装的（至少在大多数的基本安装中是预装的）。

现在，cron 文件是空的，所以必须从头添加命令。 我增加下面示例中定义的作业到我的 cron 文件中，这是一个快速指南，以便我知道命令中的各个部分的意思是什么，你可以自由拷贝它，供你自己使用。

```
# crontab -e
SHELL=/bin/bash
MAILTO=root@example.com
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

# backup using the rsbu program to the internal 4TB HDD and then 4TB external
01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2

# Set the hardware clock to keep it in sync with the more accurate system clock
03 05 * * * /sbin/hwclock --systohc

# Perform monthly updates on the first of the month
# 25 04 1 * * /usr/bin/dnf -y update
```

*`crontab` 命令用于查看或编辑 cron 文件。*

上面代码中的前三行设置了一个缺省环境。对于给定用户，环境变量必须是设置的，因为，cron 不提供任何方式的环境。`SHELL` 变量指定命令运行使用的 shell。这个示例中，指定为 Bash shell。`MAILTO` 变量设置发送 cron 作业结果的电子邮件地址。这些电子邮件提供了 cron 作业（备份、更新、等等）的状态，和你从命令行中手动运行程序时看到的结果是一样的。第三行为环境设置了 `PATH` 变量。但即使在这里设置了路径，我总是使用每个程序的完全限定路径。

在上面的示例中有几个注释行，它详细说明了定义一个 cron 作业所要求的语法。我将在下面分别讲解这些命令，然后，增加更多的 crontab 文件的高级特性。

```
01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2
```

*在我的 `/etc/crontab` 中的这一行运行一个脚本，用于为我的系统执行备份。*

这一行运行我自己编写的 Bash shell 脚本 `rsbu`，它对我的系统做完全备份。这个作业每天的凌晨 1:01  (`01 01`) 运行。在这三、四、五位置上的星号（*），像文件通配符一样代表一个特定的时间，它们代表 “一个月中的每天”、“每个月” 和 “一周中的每天”，这一行会运行我的备份两次，一次备份内部专用的硬盘驱动器，另外一次运行是备份外部的 USB 驱动器，使用它这样我可以很保险。

接下来的行我设置了一个硬件时钟，它使用当前系统时钟作为源去设置硬件时钟。这一行设置为每天凌晨 5：03 分运行。

```
03 05 * * * /sbin/hwclock --systohc
```

*这一行使用系统时间作为源来设置硬件时钟。*

我使用的第三个也是最后一个的 cron 作业是去执行一个 `dnf` 或 `yum` 更新，它在每个月的第一天的凌晨 04:25 运行，但是，我注释掉了它，以后不再运行。

```
# 25 04 1 * * /usr/bin/dnf -y update
```

*这一行用于执行一个每月更新，但是，我也把它注释掉了。*

#### 其它的定时任务技巧

现在，让我们去做一些比基本知识更有趣的事情。假设你希望在每周四下午 3:00 去运行一个特别的作业：

```
00 15 * * Thu /usr/local/bin/mycronjob.sh
```

这一行会在每周四下午 3:00 运行 `mycronjob.sh` 这个脚本。

或者，或许你需要在每个季度末去运行一个季度报告。cron 服务没有为 “每个月的最后一天” 设置选项，因此，替代方式是使用下一个月的第一天，像如下所示（这里假设当作业准备运行时，报告所需要的数据已经准备好了）。

```
02 03 1 1,4,7,10 * /usr/local/bin/reports.sh
```

*在季度末的下一个月的第一天运行这个 cron 作业。*

下面展示的这个作业，在每天的上午 9:01 到下午 5:01 之间，每小时运行一次。

```
01 09-17 * * * /usr/local/bin/hourlyreminder.sh
```

*有时，你希望作业在业务期间定时运行。*

我遇到一个情况，需要作业在每二、三或四小时去运行。它需要用期望的间隔去划分小时，比如， `*/3` 为每三个小时，或者 `6-18/3` 为上午 6 点到下午 6 点每三个小时运行一次。其它的时间间隔的划分也是类似的。例如，在分钟位置的表达式 `*/15` 意思是 “每 15 分钟运行一次作业”。

```
*/5 08-18/2 * * * /usr/local/bin/mycronjob.sh
```

*这个 cron 作业在上午 8:00 到下午 18:59 之间，每五分钟运行一次作业。*

需要注意的一件事情是：除法表达式的结果必须是余数为 0（即整除）。换句话说，在这个例子中，这个作业被设置为在上午 8 点到下午 6 点之间的偶数小时每 5 分钟运行一次（08:00、08:05、 08:10、 08:15……18:55 等等），而不运行在奇数小时。另外，这个作业不能运行在下午 7:00 到上午 7:59 之间。（LCTT 译注：此处本文表述有误，根据正确情况修改）

我相信，你可以根据这些例子想到许多其它的可能性。

#### 限制访问 cron

普通用户使用 cron 访问可能会犯错误，例如，可能导致系统资源（比如内存和 CPU 时间）被耗尽。为避免这种可能的问题， 系统管理员可以通过创建一个 `/etc/cron.allow` 文件去限制用户访问，它包含了一个允许去创建 cron 作业的用户列表。（不管是否列在这个列表中，）不能阻止 root 用户使用 cron。

通过阻止非 root 用户创建他们自己的 cron 作业，那也许需要将非 root 用户的 cron 作业添加到 root 的 crontab 中， “但是，等等！” 你说，“不是以 root 去运行这些作业？” 不一定。在这篇文章中的第一个示例中，出现在注释中的用户名字段可以用于去指定一个运行作业的用户 ID。这可以防止特定的非 root 用户的作业以 root 身份去运行。下面的示例展示了一个作业定义，它以 “student” 用户去运行这个作业：

```
04 07 * * * student /usr/local/bin/mycronjob.sh
```

如果没有指定用户，这个作业将以 contab 文件的所有者用户去运行，在这个情况中是 root。

#### cron.d

目录 `/etc/cron.d` 中是一些应用程序，比如 [SpamAssassin][14] 和 [sysstat][15] 安装的 cron 文件。因为，这里没有 spamassassin 或者 sysstat 用户，这些程序需要一个位置去放置 cron 文件，因此，它们被放在 `/etc/cron.d` 中。

下面的 `/etc/cron.d/sysstat` 文件包含系统活动报告（SAR）相关的 cron 作业。这些 cron 文件和用户 cron 文件格式相同。

```
# Run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 1 1
# Generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
```

*sysstat 包安装了 `/etc/cron.d/sysstat` cron 文件来运行程序生成 SAR。*

该 sysstat cron 文件有两行执行任务。第一行每十分钟去运行 `sa1` 程序去收集数据，存储在 `/var/log/sa` 目录中的一个指定的二进制文件中。然后，在每天晚上的 23:53， `sa2` 程序运行来创建一个每日汇总。

#### 计划小贴士

我在 crontab 文件中设置的有些时间看上起似乎是随机的，在某种程度上说，确实是这样的。尝试去安排 cron 作业可能是件很具有挑战性的事， 尤其是作业的数量越来越多时。我通常在我的每个电脑上仅有一些任务，它比起我工作用的那些生产和实验环境中的电脑简单多了。

我管理的一个系统有 12 个每天晚上都运行 cron 作业，另外 3、4 个在周末或月初运行。那真是个挑战，因为，如果有太多作业在同一时间运行，尤其是备份和编译系统，会耗尽内存并且几乎填满交换文件空间，这会导致系统性能下降甚至是超负荷，最终什么事情都完不成。我增加了一些内存并改进了如何计划任务。我还删除了一些写的很糟糕、使用大量内存的任务。

crond 服务假设主机计算机 24 小时运行。那意味着如果在一个计划运行的期间关闭计算机，这些计划的任务将不再运行，直到它们计划的下一次运行时间。如果这里有关键的 cron 作业，这可能导致出现问题。 幸运的是，在定期运行的作业上，还有一个其它的选择： `anacron`。

### anacron

[anacron][16] 程序执行和 cron 一样的功能，但是它增加了运行被跳过的作业的能力，比如，如果计算机已经关闭或者其它的原因导致无法在一个或多个周期中运行作业。它对笔记本电脑或其它被关闭或进行睡眠模式的电脑来说是非常有用的。

只要电脑一打开并引导成功，anacron 会检查过去是否有计划的作业被错过。如果有，这些作业将立即运行，但是，仅运行一次（而不管它错过了多少次循环运行）。例如，如果一个每周运行的作业在最近三周因为休假而系统关闭都没有运行，它将在你的电脑一启动就立即运行，但是，它仅运行一次，而不是三次。

anacron 程序提供了一些对周期性计划任务很好用的选项。它是安装在你的 `/etc/cron.[hourly|daily|weekly|monthly]` 目录下的脚本。 根据它们需要的频率去运行。

它是怎么工作的呢？接下来的这些要比前面的简单一些。

1、  crond 服务运行在 `/etc/cron.d/0hourly` 中指定的 cron 作业。

```
# Run the hourly jobs
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
01 * * * * root run-parts /etc/cron.hourly
```

*`/etc/cron.d/0hourly` 中的内容使位于 `/etc/cron.hourly` 中的 shell 脚本运行。*

2、  在 `/etc/cron.d/0hourly` 中指定的 cron 作业每小时运行一次 `run-parts` 程序。

3、  `run-parts` 程序运行所有的在 `/etc/cron.hourly` 目录中的脚本。

4、  `/etc/cron.hourly` 目录包含的 `0anacron` 脚本，它使用如下的 `/etdc/anacrontab` 配置文件去运行 anacron 程序。

```
# /etc/anacrontab: configuration file for anacron

# See anacron(8) and anacrontab(5) for details.

SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
# the maximal random delay added to the base delay of the jobs
RANDOM_DELAY=45
# the jobs will be started during the following hours only
START_HOURS_RANGE=3-22

#period in days   delay in minutes   job-identifier   command
1       5       cron.daily              nice run-parts /etc/cron.daily
7       25      cron.weekly             nice run-parts /etc/cron.weekly
@monthly 45     cron.monthly            nice run-parts /etc/cron.monthly
```

*`/etc/anacrontab` 文件中的内容在合适的时间运行在 `cron.[daily|weekly|monthly]` 目录中的可执行文件。*

5、  anacron 程序每日运行一次位于 `/etc/cron.daily` 中的作业。它每周运行一次位于 `/etc/cron.weekly` 中的作业。以及每月运行一次 `cron.monthly` 中的作业。注意，在每一行指定的延迟时间，它可以帮助避免这些作业与其它 cron 作业重叠。

我在 `/usr/local/bin` 目录中放置它们，而不是在 `cron.X` 目录中放置完整的 Bash 程序，这会使我从命令行中运行它们更容易。然后，我在 cron 目录中增加一个符号连接，比如，`/etc/cron.daily`。

anacron 程序不是设计用于在指定时间运行程序的。而是，用于在一个指定的时间开始，以一定的时间间隔去运行程序，比如，从每天的凌晨 3:00（看上面脚本中的 `START_HOURS_RANGE` 行）、从周日（每周第一天）和这个月的第一天。如果任何一个或多个循环错过，anacron 将立即运行这个错过的作业。

### 更多的关于设置限制

我在我的计算机上使用了很多运行计划任务的方法。所有的这些任务都需要一个 root 权限去运行。在我的经验中，很少有普通用户去需要运行 cron 任务，一种情况是开发人员需要一个 cron 作业去启动一个开发实验室的每日编译。

限制非 root 用户去访问 cron 功能是非常重要的。然而，在一些特殊情况下，用户需要去设置一个任务在预先指定时间运行，而 cron 可以允许他们去那样做。许多用户不理解如何正确地配置 cron 去完成任务，并且他们会出错。这些错误可能是无害的，但是，往往不是这样的，它们可能导致问题。通过设置功能策略，使用户与管理员互相配合，可以使个别的 cron 作业尽可能地不干扰其它的用户和系统功能。

可以给为单个用户或组分配的资源设置限制，但是，这是下一篇文章中的内容。

更多信息，在 [cron][17]、[crontab][18]、[anacron][19]、[anacrontab][20]、和 [run-parts][21] 的 man 页面上，所有的这些信息都描述了 cron 系统是如何工作的。

--------------------------------------------------------------------------------

作者简介：

David Both - 是一位 Linux 和开源软件的倡导者，居住在 Raleigh，North Carolina。他从事 IT 行业超过四十年，并且在 IBM 教授 OS/2 超过 20 年时间，他在 1981 年 IBM 期间，为最初的 IBM PC 写了第一部培训教程。他为 Red Hat 教授 RHCE 系列课程，并且他也为 MCI Worldcom、 Cisco、和 North Carolina 州工作。他使用 Linux 和开源软件工作差不多 20 年了。

---------------------------

via: https://opensource.com/article/17/11/how-use-cron-linux

作者：[David Both][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/11/how-use-cron-linux?rate=9R7lrdQXsne44wxIh0Wu91ytYaxxi86zT1-uHo1a1IU
[7]:https://sourceforge.net/projects/logwatch/files/
[8]:https://github.com/logrotate/logrotate
[9]:http://rkhunter.sourceforge.net/
[10]:https://opensource.com/user/14106/feed
[11]:https://www.flickr.com/photos/internetarchivebookimages/20570945848/in/photolist-xkMtw9-xA5zGL-tEQLWZ-wFwzFM-aNwxgn-aFdWBj-uyFKYv-7ZCCBU-obY1yX-UAPafA-otBzDF-ovdDo6-7doxUH-obYkeH-9XbHKV-8Zk4qi-apz7Ky-apz8Qu-8ZoaWG-orziEy-aNwxC6-od8NTv-apwpMr-8Zk4vn-UAP9Sb-otVa3R-apz6Cb-9EMPj6-eKfyEL-cv5mwu-otTtHk-7YjK1J-ovhxf6-otCg2K-8ZoaJf-UAPakL-8Zo8j7-8Zk74v-otp4Ls-8Zo8h7-i7xvpR-otSosT-9EMPja-8Zk6Zi-XHpSDB-hLkuF3-of24Gf-ouN1Gv-fJzkJS-icfbY9
[12]:https://creativecommons.org/licenses/by-sa/4.0/
[13]:https://en.wikipedia.org/wiki/Cron
[14]:http://spamassassin.apache.org/
[15]:https://github.com/sysstat/sysstat
[16]:https://en.wikipedia.org/wiki/Anacron
[17]:http://man7.org/linux/man-pages/man8/cron.8.html
[18]:http://man7.org/linux/man-pages/man5/crontab.5.html
[19]:http://man7.org/linux/man-pages/man8/anacron.8.html
[20]:http://man7.org/linux/man-pages/man5/anacrontab.5.html
[21]:http://manpages.ubuntu.com/manpages/zesty/man8/run-parts.8.html
[22]:https://opensource.com/users/dboth
[23]:https://opensource.com/users/dboth
[24]:https://opensource.com/article/17/11/how-use-cron-linux#comments
