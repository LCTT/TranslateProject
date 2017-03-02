使用 rsync 来备份 Linux 系统
============================================================

> 探索 rsync 在备份方案中的作用。

![Using rsync to back up your Linux system](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hard_drives.png?itok=yZWyaSO6 "Using rsync to back up your Linux system") 

Image credits : [WIlliam][2][ Warby][3]. Modified by [Jason Baker][4]. Creative Commons [BY-SA 2.0][5].

在系统管理员的工作中备份无疑是一个重要的部分。当没有完整备份或者良好规划的备份和实施时，就可能或早或晚不可挽回地丢失重要的数据。

所有公司，无论大小，都运营在数据之上。考虑到丢失业务数据造成的经济和业务损失，从最小的个人公司到最大的跨国企业，没有一个公司能在丢失大部分数据以后得以幸存。你的办公室可以通过保险赔偿重建，但是你的数据就不可能再恢复了。

这里提到的丢失是指数据的完全损坏。而不是指数据被偷走，那是另一种灾难。我这里说的是数据被完全摧毁。

即使你只是个人用户而不是一个企业，备份你自己的数据也是非常重要的，我有二十年来的个人财务数据和我现在已经关闭的企业的数据，以及大量的电子发票。也包括近年来我创作的大量不同类型的文档、报告和数据报表。我不想失去任何这些数据。

所以备份是我数据长期安全的必要保障。

### 备份软件选择

有许多软件可以执行备份。大多数 Linux 发行版提供至少一种开源的备份软件。同时也有许多商业备份软件，但是这些都不符合我的需求，所以我决定使用基础的 Linux 工具来进行备份。

在我为 Open Source Yearbook 写的文章， [最佳搭档之 2015：tar 和 ssh][6] 中，我说明了昂贵的商业备份软件在设计实施可行的备份计划中并不是必要的。

从去年开始我尝试了另一种选择， [rsync][7] 命令，它有许多我已经从中受益的有趣特性。我的主要需求是所创建的备份，用户不需要解压备份压缩包就能定位和恢复文件，以便节约创建备份的时间。

这篇文章的目的只是为了说明 rsync 在我的备份方案中的作用。并不是 rsync 的全部能力或者它的各种适用场景的概览。

### rsync 命令

Andrew Tridgell 和 Paul Mackerras 编写了 rsync ，首次发布于 1996 年。它的目标是向另一台电脑同步文件。你注意到了他们为什么取这个名字了吗（remotely synchronize）？它是大多数发行版都提供的开源软件。

rsync 能够用于同步两个目录或目录树，无论它们是在同一个计算机上还是不同的计算机上，而且不仅如此，它还能做到更多。它创建或者更新的目录与源目录完全一样。新的目录不是以 tar 或 zip 等打包存储，而是普通的目录和文件，常见的 Linux 工具都能轻松访问，而这正是我所需要的。

rsync 的最重要的特性之一是它处理源目录被修改的已有文件的方式。它使用分块校验来比较源文件和目标文件，而不是从源把整个文件复制过去。如果两个文件所有块的校验和都相同，那么就不用传输数据。否则只有被改变的块被传输。这样节约了远程同步消耗的大量时间和带宽。比如，我第一次使用 rsync 脚本来把我所有的主机备份到一个外接的大型 usb 硬盘上需要三个小时，因为所有的数据都需要传输过去。而接下来的备份需要的时间就只是 3 到 8 分钟，这取决于上次备份以来创建和改变了多少文件。我使用 `time` 命令来记录实际花费的时间。昨天晚上，我只花了三分钟来从六个远程系统和本地工作站备份大概 750 Gb 数据。实际上只有在白天改变的几百 Mb 数据需要备份。

下面的命令可以用来同步两个目录及其任意子目录的内容。也就是说，在新目录的内容和源目录同步完之后，它们的内容完全一样。

```
rsync -aH sourcedir targetdir
```

`-a` 选项表示归档模式，它会保持权限、所有关系和符号（软）链接。`-H` 选项用来保持硬链接。注意源目录和目标目录都可以在远程主机上。

假设昨天我们使用 rsync 同步了两个目录。今天我们想再同步一次，但是我们从源目录删除了一些文件。rsync 默认只复制新的和改变过的文件到新目录里，而不去改变新目录里被我们删除的文件，但是如果你想让那些在源目录里被删除的文件在新目录里也被删除，那么你可以加上 `--delete` 选项来删除。

另一个有趣的选项，也是我个人最喜欢的选项是 `--link-dest`，因为它极大地增加了 rsync 的能力和灵活性。`--link-dest` 使每日备份只花费很少的额外空间和很短的时间。

用这个选项指定前一天的备份目录，以及今天的备份目录，然后 rsync 会创建今天的新备份目录，并将昨天备份目录里的每一个文件在今天的备份目录中创建硬链接。现在我们在今天的备份目录中有一大堆指向昨天备份的硬链接。文件没有被重复创建，而是创建了一些硬链接。对于[硬链接][8]，在 Wikipedia 中有非常详细的描述。而在用昨天的备份目录文件的硬链接创建了今天的备份之后，rsync 和平常一样进行备份，如果在文件中检测到了变化，就不会做硬链接，而是从昨天的备份目录里做一个文件的副本，再把源文件中变化的部分复制过去。（LCTT 译注：此处疑似原文表述不清，参见 `generator.c` 的 `try_dests_reg` 函数先根据 `match_level` 选择复制或者硬链接，而不是创建硬链接后再判断 `match_level`）

现在我们的命令类似于下面这样。

```
rsync -aH --delete --link-dest=yesterdaystargetdir sourcedir todaystargetdir
```

你也可能想要排除一些不想要备份的目录或者文件。那么就可以使用 `--exclude` 选项。用这个选项加上你想排除文件或目录的模式。你可以用下面的新命令来排除浏览器的缓存。

```
rsync -aH --delete --exclude Cache --link-dest=yesterdaystargetdir sourcedir todaystargetdir
```

注意：你想排除的每一个文件的模式前面都分别需要加上 `--exclude` 选项。

rsync 可以同步远程主机，无论是作为同步源头还是目标。再举一个例子，我们假设想要把名为 remote1 的远程主机的目录同步到本地。因为 ssh 作为与远程主机交换数据的默认协议，我一直使用 ssh 选项。现在命令类似于下面这样。

```
rsync -aH -e ssh --delete --exclude Cache --link-dest=yesterdaystargetdir remote1:sourcedir todaystargetdir
```

这就是我的 rsync 备份命令的最终版本。

你可以依靠 rsync 的大量选项来定制你的同步过程。大多数情况而言，我刚刚描述的简单命令就足以胜任我的个人需要。你可以阅读 rsync 丰富的文档来了解它的其他能力。

### 部署备份

我的备份自动运行因为—“万物皆可自动化”。我写了一个 BASH 脚本使用 rsync 创建每天的备份。包括确保备份介质被挂载，生成每天的备份目录的名字，以及在备份介质中创建合适的目录结构，最后执行真正的备份再卸载备份介质。

我用 cron 每天早晨执行脚本确保我永远不会忘记备份。

我的脚本 rsbu 和配置文件 rsbu.conf 可以在 https://github.com/opensourceway/rsync-backup-script 上获取。

### 恢复测试

所有没有经过测试的备份计划都不完整的。你可以通过测试恢复某个文件或者整个目录，以确保备份在照常工作并且可以通过它来在数据全部丢失后恢复。我见过太多备份由于种种理由失败，以及由于缺乏测试忽略的问题导致宝贵的数据被丢失。

选择一个文件恢复到比如 `/tmp` 的测试目录，这样你就不会覆盖任何备份后被更新的文件。验证文件的内容是否是你预期的。恢复用 rsync 备份的文件仅仅只是找到你的备份文件然后把它复制到你想恢复的地方去那样简单。

我有几次不得不恢复我的个人文件，偶尔是整个目录。大多数是自己意外删除了文件或者目录。有几次是因为硬盘崩溃。这些备份迟早会派上用场。

### 最后一步

但仅仅创建备份并不能拯救你的业务，你需要定期的地创建备份，使最近的一次备份储存在另一台远程机器上，如果有可能，放在另外一个建筑物中或几英里之外。这样可以确保大规模的灾难不会摧毁你的所有备份。

对于小型企业的一个合理选择是在可移动介质上做每日备份，晚上把最新的备份带回家里，第二天早上把更早的备份带到办公室。你就会有几个轮流的拷贝。甚至可以把最新的备份带到银行并放到你的保管箱里，然后带回之前的备份。

--------------------------------------------------------------------------------

作者简介：

David Both - 他居住在北卡罗来纳州的罗列，是 Linux 和开源提倡者。他已经从事 IT 行业 40 多年。在 IBM 教授了二十多年 OS/2。在 IBM 的时候，他在 1981 年为最初的 IBM 个人电脑编写了第一门培训课程。他为红帽教授 RHCE 课程，并曾在世通公司、思科、北卡罗来纳州政府工作。他使用 Linux 和开源软件已经有二十年左右了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/rsync-backup-linux

作者：[David Both][a]
译者：[trnhoe](https://github.com/trnhoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/article/17/1/rsync-backup-linux?rate=xmBjzZgqTu6p-Dw2gXy5cq43KHcSNs4-nisv_jnUgbw
[2]:https://www.flickr.com/photos/wwarby/11644168395
[3]:https://www.flickr.com/photos/wwarby/11644168395
[4]:https://opensource.com/users/jason-baker
[5]:https://creativecommons.org/licenses/by/2.0/
[6]:https://opensource.com/business/15/12/best-couple-2015-tar-and-ssh
[7]:https://en.wikipedia.org/wiki/Rsync
[8]:https://en.wikipedia.org/wiki/Hard_link
[9]:https://github.com/opensourceway/rsync-backup-script
[10]:https://opensource.com/user/14106/feed
[11]:https://opensource.com/article/17/1/rsync-backup-linux#comments
[12]:https://opensource.com/users/dboth
