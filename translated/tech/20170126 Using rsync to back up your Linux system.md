
使用 rsync 来备份 Linux 系统
============================================================

### 探索 rsync 在备份方案中的作用.

 ![Using rsync to back up your Linux system](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hard_drives.png?itok=yZWyaSO6 "Using rsync to back up your Linux system") 
Image credits : [WIlliam][2][ Warby][3]. Modified by [Jason Baker][4]. Creative Commons [BY-SA 2.0][5].

在系统管理员的工作中备份无疑是一个重要的部分。当没有备份完整或者良好地策划实施备份，就可能不可挽回地丢失重要的数据。

所有公司都经营着数据。考虑到丢失业务数据造成的经济和业务损失。从小企业到跨国公司的业务都不可能在丢失大部分数据以后幸存。你的办公室可以通过保险赔偿重建，但是你的数据就不可能再恢复了。

这里提到的丢失是指数据的完全损坏。而不是指数据被偷走，那是另一种灾难。

即使你只是个人用户，备份你自己的数据也是非常重要的，我有二十年来的个人财务数据和现在已经关闭的业务的数据，以及大量的电子发票。也包括近年来我创作的大量不同类型的文档，报告和数据报表。我不想失去任何这些数据。

所以备份是我数据长期安全的必要保障。

### 备份软件选择

有许多软件可以执行备份。大多数linux发行版提供至少一种开源的备份软件。同时也有许多商业备份软件，但是这些都不符合我的需求，所以我决定使用基础linux工具来进行备份。

在我为 Open Source Yearbook 写的文章， [2015年的最佳搭档：tar和ssh ][6]中，我说明了昂贵的商业备份软件在设计实施可行的备份计划中并不是必要的。

从去年开始我尝试了另一种选择， [**rsync **][7] 命令，它有许多我已经从中得益的有趣特性。我的主要需求是从指定的地方创建备份，并且不需要解压备份压缩包就能恢复文件，以便节约创建备份的时间。

这篇文章的目的只是为了说明 rsync 在我的备份方案中的作用。并不是rsync的全部能力或者它的各种适用场景的概览。

### rsync 命令

Andrew Tridgell 和 Paul Mackerras 编写了 rsync ，在1996年第一次发布。它的目标是向另一台电脑同步文件。你注意到了他们为什么取这个名字了吗（remotely synchronize）？它是大多数发行版都提供的开源软件。

rsync不仅仅能够把一个目录同步到本地或者远程的另一个目录。它创建或者更新的目录与源目录完全一样。新的目录不是以tar，zip等打包存储，而是普通的目录和文件，常见的linux工具都能轻松访问。而这正是我所需要的。

rsync的最重要的特性之一是它处理远程目录与源目录中都存在的文件的方法。它使用分块校验来比较源文件和远程文件而不是把整个源文件复制过去。如果两个文件所有块的校验和相同，那么就不用传输数据。否则只有被改变的块被传输。这样节约了远程同步消耗的大量时间和带宽。比如，我第一次使用 rsync 脚本来把我所有的主机备份到一个外接usb硬盘上需要三个小时，因为所有的数据都需要传输过去。而接下来的备份需要的时间就只是3到8分钟，取决于上次备份以来创建和改变了多少文件。我使用time命令来记录实际花费的时间。昨天晚上，我只花了三分钟来从六个远程系统和本地工作站备份大概 750 Gb 数据。实际上只有在白天改变的几百Mb数据需要备份。

下面的命令可以用来同步两个目录和它们的任意子目录的内容。也就是说，在新目录的内容和源目录同步完之后，它们的内容完全一样。

`rsync -aH sourcedir targetdir`

**-a** 选项表示归档模式，保留权限，所有者和软链接。-H选项用来保留硬链接。注意源目录和目标目录都可以在远程主机上。

假设昨天我们使用rsync同步了两个目录。今天我们想再同步一次，但是我们从源目录删除了一些文件。rsync默认只复制新的和改变过的文件到新目录里而不去改变新目录里被我们删除的文件，但是如果你想让那些在源目录里被删除的文件在新目录里也被删除，那么你可以加上 **--delete** 选项来删除。

另一个有趣的选项，也是我个人最喜欢的选项是**--link-dest**，因为它极大地增加了rsync的能力和灵活性。**--link-dest** 使每日备份只花费很少的额外空间和很短的时间。

用这个选项指定前一天的备份目录~~和今天的备份目录~~（！），然后 rsync 会创建今天的新备份目录，并为昨天备份目录里的每一个**未改变的**文件在今天的备份目录中创建硬链接（！）。现在我们在今天的备份目录中有一些指向昨天备份的硬链接。文件没有被重复创建，而是用硬链接代替。对于 [hard links ][8] 在Wikipedia中有非常详细的描述。而在用昨天的备份目录文件的硬链接创建了今天的备份之后，rsync 和平常一样进行备份，如果文件产生了变化，那么就从昨天的备份目录里复制变化前的文件，再把源文件中变化的部分复制过去。（原文有误（see:generator.c的try_dests_reg函数 先根据match_level选择copy或者hard link，而不是创建hard link后再判断match_level））

现在我们的命令类似于下面这样。

`rsync -aH --delete --link-dest=yesterdaystargetdir sourcedir todaystargetdir`

你也可能想要排除一些不想要备份的目录或者文件。那么就可以使用 **--exclude** 选项。用这个选项加上你想排除文件或目录的模式。你可以用下面的新命令来排除浏览器的缓存。

`rsync -aH --delete --exclude Cache --link-dest=yesterdaystargetdir sourcedir todaystargetdir`

注意：你想排除的每一个文件的模式前面都分别需要加上 exclude 选项。

rsync 可以同步远程主机无论作为同步源头还是目标。再举一个例子，我们假设想要把名为 remote1 的远程主机的目录同步到本地。因为 ssh 作为与远程主机交换数据的默认协议，我一直使用 ssh 选项。现在命令类似于下面这样。

`rsync -aH -e ssh --delete --exclude Cache --link-dest=yesterdaystargetdir remote1:sourcedir todaystargetdir`

这就是我的 rsync 备份命令的最终版本。

你可以依靠 rsync 的大量选项来定制你的同步过程。大多数情况而言，我刚刚描述的简单命令就足以胜任我的个人需要。你可以阅读 rsync 的额外文档来了解它的其他能力。

### Performing backups 部署备份

我的备份自动运行因为—“万物皆可自动化”。我写了一个 BASH 脚本使用 rsync 创建每天的备份。包括确保备份介质被挂载，生成每天的备份目录的名字，以及在备份介质中创建合适的目录结构，最后执行真正的备份再卸载备份介质。

我用 cron 每天早晨执行脚本确保我永远不会忘记备份。

我的脚本 rsbu 和配置文件 rsbu.conf 可以在 https://github.com/opensourceway/rsync-backup-script上获取。

### 恢复测试

所以没有经过测试的备份计划都不是完整的。你可以通过测试某个文件或者整个目录，以确保备份在照常工作并且可以通过它来在数据全部丢失后恢复。我见过太多备份由于种种理由失败，以及由于缺乏测试忽略的问题导致宝贵的数据被丢失。

选择一个文件恢复到比如 /tmp 的测试目录，你就不会覆盖任何源文件。验证文件的内容是否是你预期的。恢复用 rsync 备份的文件仅仅只是找到你的备份文件然后把它复制到你想恢复的地方去那样简单。

我有几次不得不恢复我的个人文件，偶尔是整个目录。大多数是自己意外删除了文件或者目录。有几次是因为硬盘崩溃。这些备份迟早会派上用场。

### 最后一步

但仅仅创建备份并不能保证你的业务数据，你需要定期的地创建备份，使最近的一次备份储存在另一台异地机器上。这样可以确保大规模的灾难不会让你丢失所有备份。

对于小业务的一个合理选则是在可移动介质上做每日备份。在晚上把最新的备份复制到家里，第二天早上把更早的备份复制到办公室。你就会有几个轮流的拷贝。还可以把最新的备份存到银行或者保险柜里，然后带走之前的备份。（没怎么看懂

--------------------------------------------------------------------------------

作者简介：

David Both - David Both 是居住在 Raleigh, North Carolina 的 Linux 和开源提倡者。他已经从事IT行业40多年。在IBM教授 OS/2 20多年。在IBM的时候，他在1981年为最初的IBM个人电脑编写了第一门训练课程。他为红帽教授RHCE课程，并曾在世通公司，思科，北卡罗来纳州政府工作。他使用Linux和开源软件已经有20年左右了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/rsync-backup-linux

作者：[David Both][a]
译者：[trnhoe](https://github.com/trnhoe)
校对：[校对者ID](https://github.com/校对者ID) Thank you~

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
