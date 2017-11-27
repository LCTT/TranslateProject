使用 mlocate 查找文件
============================================================

![mlocate](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/question-mark.jpg?itok=dIQlOWz7 "mlocate")

在这一系列的文章中，我们将来看下 `mlocate`，来看看如何快速、轻松地满足你的需求。

[Creative Commons Zero][1]Pixabay

对于一个系统管理员来说，草中寻针一样的查找文件的事情并不少见。在一台拥挤的机器上，文件系统中可能存在数十万个文件。当你需要确定一个特定的配置文件是最新的，但是你不记得它在哪里时怎么办？

如果你使用过一些类 Unix 机器，那么你肯定用过 `find` 命令。毫无疑问，它是非常复杂和功能强大的。以下是一个只搜索目录中的符号链接，而忽略文件的例子：

```
# find . -lname "*"
```

你可以用 `find` 命令做几乎无尽的事情，这是不容否认的。`find` 命令好用的时候是很好且简洁的，但是它也可以很复杂。这不一定是因为 `find` 命令本身的原因，而是它与 `xargs` 结合，你可以传递各种选项来调整你的输出，并删除你找到的那些文件。

### 位置、位置，让人沮丧

然而，通常情况下简单是最好的选择，特别是当一个脾气暴躁的老板搭着你的肩膀，闲聊着时间的重要性时。你还在模糊地猜测这个你从来没有见过的文件的路径，而你的老板却肯定它在拥挤的 /var 分区的某处。

进一步看下 `mlocate`。你也许注意过它的一个近亲：`slocate`，它安全地（注意前缀字母 s 代表安全）记录了相关的文件权限，以防止非特权用户看到特权文件。此外，还有它们所起源的一个更老的，原始 `locate` 命令。

`mlocate` 与其家族的其他成员（至少包括 `slocate`）的不同之处在于，在扫描文件系统时，`mlocate` 不需要持续重新扫描所有的文件系统。相反，它将其发现的文件（注意前面的 m 代表合并）与现有的文件列表合并在一起，使其可以借助系统缓存从而性能更高、更轻量级。

在本系列文章中，我们将更仔细地了解 `mlocate` （由于其流行，所以也简称其为 `locate`），并研究如何快速轻松地将其调整到你心中所想的方式。

### 小巧和	紧凑

除非你经常重复使用复杂的命令，否则就会像我一样，最终会忘记它们而需要在用的时候寻找它们。`locate` 命令的优点是可以快速查询整个文件系统，而不用担心你处于顶层目录、根目录和所在路径，只需要简单地使用 `locate` 命令。

以前你可能已经发现 `find` 命令非常不听话，让你经常抓耳挠腮。你知道，丢失了一个分号或一个没有正确转义的特殊的字符就会这样。现在让我们离开这个复杂的 `find` 命令，放松一下，看一下这个聪明的小命令。

你可能需要首先通过运行以下命令来检查它是否在你的系统上：

对于 Red Hat 家族：

```
# yum install mlocate
```

对于 Debian 家族：

```
# apt-get install mlocate
```

发行版之间不应该有任何区别，但版本之间几乎肯定有细微差别。小心。

接下来，我们将介绍 `locate` 命令的一个关键组件，名为 `updatedb`。正如你可能猜到的那样，这是**更新** `locate` 命令的**数据库**的命令。这名字非常符合直觉。

这个数据库是我之前提到的 `locate` 命令的文件列表。该列表被保存在一个相对简单而高效的数据库中。`updatedb` 通过 cron 任务定期运行，通常在一天中的安静时间运行。在下面的清单 1 中，我们可以看到文件 `/etc/cron.daily/mlocate.cron` 的内部（该文件的路径及其内容可能因发行版不同）。

```
#!/bin/sh

nodevs=$(< /proc/filesystems awk '$1 == "nodev" { print $2 }')

renice +19 -p $$ >/dev/null 2>&1

ionice -c2 -n7 -p $$ >/dev/null 2>&1

/usr/bin/updatedb -f "$nodevs"
```

**清单 1：** 每天如何触发 “updatedb” 命令。

如你所见，`mlocate.cron` 脚本使用了优秀的 `nice` 命令来尽可能少地影响系统性能。我还没有明确指出这个命令每天都在设定的时间运行（但如果我没有记错的话，原始的 `locate` 命令与你在午夜时的计算机减速有关）。这是因为，在一些 “cron” 版本上，延迟现在被引入到隔夜开始时间。

这可能是因为所谓的 “<ruby>河马之惊群<rt>Thundering Herd of Hippos</rt></ruby>”问题。想象许多计算机（或饥饿的动物）同时醒来从单一或有限的来源要求资源（或食物）。当所有的“河马”都使用 NTP 设置它们的手表时，这可能会发生（好吧，这个寓言扯多了，但请忍受一下）。想象一下，正好每五分钟（就像一个 “cron 任务”），它们都要求获得食物或其他东西。

如果你不相信我，请看下配置文件 - 清单 2 中名为 `anacron` 的 cron 版本，这是文件 `/etc/anacrontab` 的内容。

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

**清单 2：** 运行 “cron” 任务时延迟是怎样被带入的。

从清单 2 可以看到 `RANDOM_DELAY` 和 “delay in minutes” 列。如果你不熟悉 cron 这个方面，那么你可以在这找到更多的东西：

```
# man anacrontab
```

否则，如果你愿意，你可以自己延迟一下。有个[很棒的网页][3]（现在已有十多年的历史）以非常合理的方式讨论了这个问题。本网站讨论如何使用 `sleep` 来引入一个随机性，如清单 3 所示。

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

**清单 3：**在触发事件之前引入随机延迟的 shell 脚本，以避免[河马之惊群][4]。

在提到这些（可能令人惊讶的）延迟时，是指 `/etc/crontab` 或 root 用户自己的 crontab 文件。如果你想改变 `locate` 命令运行的时间，特别是由于磁盘访问速度减慢时，那么它不是太棘手。实现它可能会有更优雅的方式，但是你也可以把文件 `/etc/cron.daily/mlocate.cron` 移到别的地方（我使用 `/usr/local/etc` 目录），使用 root 用户添加一条记录到 root 用户的 crontab，粘贴以下内容：

```
# crontab -e

33 3 * * * /usr/local/etc/mlocate.cron
```

使用 anacron，而不是通过 `/var/log/cron` 以及它的旧的、轮转的版本，你可以快速地告诉它上次 cron.daily 任务被触发的时间：

```
# ls -hal /var/spool/anacron
```

下一次，我们会看更多的使用 `locate`、`updatedb` 和其他工具来查找文件的方法。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/11/finding-files-mlocate

作者：[CHRIS BINNIE][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/chrisbinnie
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/question-markjpg
[3]:http://www.moundalexis.com/archives/000076.php
[4]:http://www.moundalexis.com/archives/000076.php
