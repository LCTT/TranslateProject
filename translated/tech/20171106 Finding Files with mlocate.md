使用 mlocate 查找文件
============================================================

![mlocate](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/question-mark.jpg?itok=dIQlOWz7 "mlocate")
在这一系列的文章中，我们将来看下 mlocate，并检验如何快速、轻松地调整到你自己的规格。[Creative Commons Zero][1]Pixabay

对于一个系统管理员来说, 要找到埋在干草深处的针头并不少见。在一台繁忙的机器上，文件系统中可能存在数十万个文件。当你需要确定一个特定的配置文件是最新的，但是你不记得它在哪里时怎么办？

如果你已经使用了一些类 Unix 机器，那么你几乎肯定会遇到 _find_ 命令。毫无疑问，它是非常复杂和功能强大的。以下是一个只搜索目录中的链接，忽略文件的例子：

```
# find . -lname "*"
```

你可以用 find 命令做似乎所有的事情。这是不容否认的。find 命令在想要的时候是很好且简洁的，但是它也可以很快地变得复杂。这不一定是因为 find 命令本身，而是与 “xargs” 结合，你可以传递各种选项来调整你的输出，并删除你找到的那些文件。

### 位置、位置、沮丧

然而，通常情况下简单是最好的选择，特别是当一个脾气暴躁的老板靠在你的肩膀上时，闲聊着时间的重要。而且，试想模糊地猜测你从来没有见过的文件的路径，但是你的老板肯定在繁忙的 /var 分区的某处。

来看 _mlocate_。你可能会注意到它的一个近亲：_slocate_，它安全地（注意前面的字母 s 代表安全）记录了相关的文件权限，以防止非特权用户看到特权文件）。此外，还有一个更老的，原始的定位命令，它们来了。

mlocate 与其家族的其他成员（至少根据 mlocate）的不同之处在于，在扫描文件系统时，mlocate 不需要持续重新扫描所有的文件系统。相反，它将其发现（注意前面的 m 代表合并）与任何现有的文件列表合并在一起，使其在系统缓存中性能更高、更轻量级。

在本系列文章中，我们将更仔细地看 mlocate （因为 “locate” 的流行，简单地将其称为 “locate”），并研究如何快速轻松地将其调整到你理想的状态。

### 小巧和宝石

如果你像我一样，除非你经常重复使用复杂的命令，那么最终你会忘记它们，并且需要查看它们。locate 命令的优点是可以快速查询整个文件系统，而不用担心顶层、根、路径，只需要使用简单的 locate 命令。

过去，你可能已经发现 _find_ 命令可能非常固执，并让你经常抓耳挠腮。你知道，在这里丢失了一个分号或一个特殊的字符不能在那里正确地转义。现在让我们离开这个复杂的 find 命令，放松一下，看一下这个聪明的小命令。

你可能会首先通过运行以下命令来检查它是否在你的系统上：

对于 Red Hat 的衍生产品：

```
# yum install mlocate
```

对于 Debian 的衍生产品：

```
# apt-get install mlocate
```

发行版之间不应该有任何区别，但版本之间几乎肯定有细微差别。小心。

接下来，我们将介绍 locate 命令的一个关键组件，名为 _updatedb_。正如你可能猜到的那样，这是_更新_ locate 命令的_数据库_的命令。非常符合直觉。

数据库是我之前提到的 locate 命令的文件列表。该列表被保存在一个相对简单而高效的数据库中。updatedb 定期运行，通过 cron 计划，通常在一天的安静时间运行。在清单 1 中，我们可以看到文件 /etc/cron.daily/mlocate.cron 的内部（文件的路径及其内容可能都是依赖发行版的）。

```
#!/bin/sh

nodevs=$(< /proc/filesystems awk '$1 == "nodev" { print $2 }')

renice +19 -p $$ >/dev/null 2>&1

ionice -c2 -n7 -p $$ >/dev/null 2>&1

/usr/bin/updatedb -f "$nodevs"
```

**清单 1：** 每天如何触发 “updatedb” 命令。

如你所见，_mlocate.cron_ 脚本使用了优秀的 _nice_ 命令来尽可能少地影响系统性能。我还没有明确表示这个命令每天都在设定的时间运行（但如果我没有记错的话，原始的 locate 命令与你在午夜时的计算机减速有关）。这是因为, 在一些 “cron” 版本上, 延迟现在被引入到隔夜开始时间。。

这可能是因为所谓的 “Thundering Herd of Hippos” （河马的雷鸣）问题。想象许多计算机（或饥饿的动物）同时醒来从单一或有限的来源要求食物（或资源）。当所有的河马都使用 NTP 设置他们的手表时，这可能会发生（好吧，这个寓言扯多了，但忍受着我）。想象一下，正好每五分钟（就像一个 “cron 任务”），他们都要求获得食物或其他东西。

如果你不相信我，请看下配置文件 - 清单 2 中名为 _anacron_ 的 cron 版本，这是文件 _/etc/anacrontab_ 的内容。


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

#period in days   delay in minutes   job-identifier   command

1       5       cron.daily              nice run-parts /etc/cron.daily

7       25      cron.weekly             nice run-parts /etc/cron.weekly

@monthly 45     cron.monthly            nice run-parts /etc/cron.monthly 
```

**清单 2：** 运行 “cron” 任务时如何引入延迟。

从清单 2 可以看到 “RANDOM_DELAY” 和 “delay in minutes” 列。如果 cron 的这个方面对你来说是新的，那么你可以在这找到更多的东西：

```
# man anacrontab
```

否则，如果你愿意，你可以自己推迟一下。一个[很棒的网页][3]（现在已有十多年的历史）以非常合理的方式讨论了这个问题。本网站讨论如何使用 sleep 来引入一个随机性，如清单 3 所示。

```
#!/bin/sh

# Grab a random value between 0-240.
value=$RANDOM
while [ $value -gt 240 ] ; do
 value=$RANDOM
done

# Sleep for that time.
sleep $value

# Syncronize.
/usr/bin/rsync -aqzC --delete --delete-after masterhost::master /some/dir/
```

**清单 3：**在触发事件之前引入随机延迟的 shell 脚本，以避免[河马的雷鸣][4]。

在提到这些 (可能令人惊讶的) 延迟时，是指 _/etc/crontab_ 或 root 用户自己的 crontab 文件。如果你想改变 locate 命令运行的时间，特别是由于磁盘访问速度减慢，那么它不是太棘手。实现它可能会有更优雅的方式，但是你也可以把文件 _/etc/cron.daily/mlocate.cron_ 移到别的地方（我使用_/usr/local/etc 目录），使用 root 用户添加一条记录到 root 用户的 crontab，粘贴以下内容：

```
# crontab -e

33 3 * * * /usr/local/etc/mlocate.cron
```

不是通过 _/var/log/cron_ 以及它的旧的、轮转的版本，使用 anacron，你可以快速地告诉它上次 cron.daily 任务被触发的时间：

```
# ls -hal /var/spool/anacron
```

下一次，我们会看更多的使用 locate、updatedb 和其他工具来查找文件的方法。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/11/finding-files-mlocate

作者：[CHRIS BINNIE][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/chrisbinnie
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/question-markjpg
[3]:http://www.moundalexis.com/archives/000076.php
[4]:http://www.moundalexis.com/archives/000076.php
