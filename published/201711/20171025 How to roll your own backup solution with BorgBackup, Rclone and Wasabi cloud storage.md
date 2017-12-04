如何使用 BorgBackup、Rclone 和 Wasabi 云存储推出自己的备份解决方案
============================================================

> 使用基于开源软件和廉价云存储的自动备份解决方案来保护你的数据。

![Build your own backup solution with Borg](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/biz_cinderblock_cloud_yellowhat_0.jpg?itok=pvMW5Cyq "Build your own backup solution with Borg")

图片提供： opensource.com

几年来，我用 CrashPlan 来备份我家的电脑，包括属于我妻子和兄弟姐妹的电脑。CrashPlan 本质上是“永远在线”，不需要为它操心就可以做的规律性的备份，这真是太棒了。此外，能使用时间点恢复的能力多次派上用场。因为我通常是家庭的 IT 人员，所以我对其用户界面非常容易使用感到高兴，家人可以在没有我帮助的情况下恢复他们的数据。

最近 [CrashPlan 宣布][5]，它正在放弃其消费者订阅，专注于其企业客户。我想，这是有道理的，因为它不能从像我这样的人赚到很多钱，而我们的家庭计划在其系统上使用了大量的存储空间。

我决定，我需要一个合适的替代功能，包括：

*   跨平台支持 Linux 和 Mac
*   自动化（所以没有必要记得点击“备份”）
*   时间点恢复（可以关闭），所以如果你不小心删除了一个文件，但直到后来才注意到，它仍然可以恢复
*   低成本
*   备份有多份存储，这样数据存在于多个地方（即，不仅仅是备份到本地 USB 驱动器上）
*   加密以防备份文件落入坏人手中

我四处搜寻，问我的朋友有关类似于 CrashPlan 的服务。我对其中一个 [Arq][6] 非常满意，但没有 Linux 支持意味着对我没用。[Carbonite][7] 与 CrashPlan 类似，但会很昂贵，因为我有多台机器需要备份。[Backblaze][8] 以优惠的价格（每月 5 美金）提供无限备份，但其备份客户端不支持 Linux。[BackupPC][9] 是一个强有力的竞争者，但在我想起它之前，我已经开始测试我的解决方案了。我看到的其它选项都不符合我要的一切。这意味着我必须找出一种方法来复制 CrashPlan 为我和我的家人提供的服务。

我知道在 Linux 系统上备份文件有很多好的选择。事实上，我一直在使用 [rdiff-backup][10] 至少 10 年了，通常用于本地保存远程文件系统的快照。我希望能够找到可以去除备份数据中重复部分的工具，因为我知道有些（如音乐库和照片）会存储在多台计算机上。

我认为我所做的工作非常接近实现我的目标。

### 我的备份解决方案

![backup solution diagram](https://opensource.com/sites/default/files/u128651/backup-diagram.png "backup solution diagram")

最终，我的目标落在 [BorgBackup][11]、[Rclone][12] 和 [Wasabi 云存储][13]的组合上，我的决定让我感到无比快乐。Borg 符合我所有的标准，并有一个非常健康的[用户和贡献者社区][14]。它提供重复数据删除和压缩功能，并且在 PC、Mac 和 Linux 上运行良好。我使用 Rclone 将来自 Borg 主机的备份仓库同步到 Wasabi 上的 S3 兼容存储。任何与 S3 兼容的存储都可以工作，但是我选择了 Wasabi，因为它的价格好，而且它的性能超过了亚马逊的 S3。使用此设置，我可以从本地 Borg 主机或从 Wasabi 恢复文件。

在我的机器上安装 Borg 只要 `sudo apt install borgbackup`。我的备份主机是一台连接有 1.5TB USB 驱动器的 Linux 机器。如果你没有可用的机器，那么备份主机可以像 Raspberry Pi 一样轻巧。只要确保所有的客户端机器都可以通过 SSH 访问这个服务器，那么你就能用了。

在备份主机上，使用以下命令初始化新的备份仓库：

```
$ borg init /mnt/backup/repo1
```

根据你要备份的内容，你可能会选择在每台计算机上创建多个仓库，或者为所有计算机创建一个大型仓库。由于 Borg 有重复数据删除功能，如果在多台计算机上有相同的数据，那么从所有这些计算机向同一个仓库发送备份可能是有意义的。

在 Linux 上安装 Borg 非常简单。在 Mac OS X 上，我需要首先安装 XCode 和 Homebrew。我遵循 [how-to][15] 来安装命令行工具，然后使用 `pip3 install borgbackup`。

### 备份

每台机器都有一个 `backup.sh` 脚本（见下文），由 cron 任务定期启动。它每天只做一个备份集，但在同一天尝试几次也没有什么不好的。笔记本电脑每隔两个小时就会尝试备份一次，因为不能保证它们在某个特定的时间开启，但很可能在其中一个时间开启。这可以通过编写一个始终运行的守护进程来改进，并在笔记本电脑唤醒时触发备份尝试。但现在，我对它的运作方式感到满意。

我可以跳过 cron 任务，并为每个用户提供一个相对简单的方法来使用 [BorgWeb][16] 来触发备份，但是我真的不希望任何人必须记得备份。我倾向于忘记点击那个备份按钮，直到我急需修复（这时太迟了！）。

我使用的备份脚本来自 Borg 的[快速入门][17]文档，另外我在顶部添加了一些检查，看 Borg 是否已经在运行，如果之前的备份运行仍在进行这个脚本就会退出。这个脚本会创建一个新的备份集，并用主机名和当前日期来标记它。然后用简单的保留计划来整理旧的备份集。

这是我的 `backup.sh` 脚本：

```
#!/bin/sh

REPOSITORY=borg@borgserver:/mnt/backup/repo1

#Bail if borg is already running, maybe previous run didn't finish
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit
fi

# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='thisisnotreallymypassphrase'
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND='pass show backup'

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats                          \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d}'    \
    /home/doc                                   \
    --exclude '/home/doc/.cache'                \
    --exclude '/home/doc/.minikube'             \
    --exclude '/home/doc/Downloads'             \
    --exclude '/home/doc/Videos'                \
    --exclude '/home/doc/Music'                 \

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
```

备份的输出如下所示：

```
------------------------------------------------------------------------------
Archive name: x250-2017-10-05
Archive fingerprint: xxxxxxxxxxxxxxxxxxx
Time (start): Thu, 2017-10-05 03:09:03
Time (end):   Thu, 2017-10-05 03:12:11
Duration: 3 minutes 8.12 seconds
Number of files: 171150
------------------------------------------------------------------------------
                       Original size      Compressed size Deduplicated size
This archive:               27.75 GB             27.76 GB 323.76 MB
All archives:                3.08 TB              3.08 TB 262.76 GB

                       Unique chunks         Total chunks
Chunk index:                 1682989             24007828
------------------------------------------------------------------------------
[...]
Keeping archive: x250-2017-09-17                      Sun, 2017-09-17 03:09:02
Pruning archive: x250-2017-09-28                      Thu, 2017-09-28 03:09:02
```

我在将所有的机器备份到主机上后，我遵循[安装预编译的 Rclone 二进制文件指导][18]，并将其设置为访问我的 Wasabi 帐户。

此脚本每天晚上运行以将任何更改同步到备份集：

```
#!/bin/bash
set -e

repos=( repo1 repo2 repo3 )

#Bail if rclone is already running, maybe previous run didn't finish
if pidof -x rclone >/dev/null; then
    echo "Process already running"
    exit
fi

for i in "${repos[@]}"
do
    #Lets see how much space is used by directory to back up
    #if directory is gone, or has gotten small, we will exit
    space=`du -s /mnt/backup/$i|awk '{print $1}'`

    if (( $space < 34500000 )); then
       echo "EXITING - not enough space used in $i"
       exit
    fi

    /usr/bin/rclone -v sync /mnt/backup/$i wasabi:$i >> /home/borg/wasabi-sync.log 2>&1
done
```

第一次用 Rclone 同步备份集到 Wasabi 花了好几天，但是我大约有 400GB 的新数据，而且我的出站连接速度不是很快。但是每日的增量是非常小的，能在几分钟内完成。

### 恢复文件

恢复文件并不像 CrashPlan 那样容易，但是相对简单。最快的方法是从存储在 Borg 备份服务器上的备份中恢复。以下是一些用于恢复的示例命令：

```
#List which backup sets are in the repo
$ borg list borg@borgserver:/mnt/backup/repo1
Remote: Authenticated with partial success.
Enter passphrase for key ssh://borg@borgserver/mnt/backup/repo1: 
x250-2017-09-17                      Sun, 2017-09-17 03:09:02
#List contents of a backup set
$ borg list borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 | less
#Restore one file from the repo
$ borg extract borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 home/doc/somefile.jpg
#Restore a whole directory
$ borg extract borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 home/doc
```

如果本地的 Borg 服务器或拥有所有备份仓库的 USB 驱动器发生问题，我也可以直接从 Wasabi 直接恢复。如果机器安装了 Rclone，使用 [rclone mount][3]，我可以将远程存储仓库挂载到本地文件系统：

```
#Mount the S3 store and run in the background
$ rclone mount wasabi:repo1 /mnt/repo1 &
#List archive contents
$ borg list /mnt/repo1
#Extract a file
$ borg extract /mnt/repo1::x250-2017-09-17 home/doc/somefile.jpg
```

### 它工作得怎样

现在我已经使用了这个备份方法几个星期了，我可以说我真的很高兴。设置所有这些并使其运行当然比安装 CrashPlan 要复杂得多，但这就是使用你自己的解决方案和使用服务之间的区别。我将不得不密切关注以确保备份继续运行，数据与 Wasabi 正确同步。

但是，总的来说，以一个非常合理的价格替换 CrashPlan 以提供相似的备份覆盖率，结果比我预期的要容易一些。如果你看到有待改进的空间，请告诉我。

_这最初发表在 [Local Conspiracy][19]，并被许可转载。_

--------------------------------------------------------------------------------

作者简介：

Christopher Aedo - Christopher Aedo 自从大学时开始就一直在用开源软件工作并为之作出贡献。最近他在领导一支非常棒的 IBM 上游开发团队，他们也是开发支持者。当他不在工作或在会议上发言时，他可能在俄勒冈州波特兰市使用 RaspberryPi 酿造和发酵美味的自制啤酒。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/backing-your-machines-borg

作者：[Christopher Aedo][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/docaedo
[1]:https://opensource.com/file/375066
[2]:https://opensource.com/article/17/10/backing-your-machines-borg?rate=Aa1IjkXuXy95tnvPGLWcPQJCKBih4Wo9hNPxhDs-mbQ
[3]:https://rclone.org/commands/rclone_mount/
[4]:https://opensource.com/user/145976/feed
[5]:https://www.crashplan.com/en-us/consumer/nextsteps/
[6]:https://www.arqbackup.com/
[7]:https://www.carbonite.com/
[8]:https://www.backblaze.com/
[9]:http://backuppc.sourceforge.net/BackupPCServerStatus.html
[10]:http://www.nongnu.org/rdiff-backup/
[11]:https://www.borgbackup.org/
[12]:https://rclone.org/
[13]:https://wasabi.com/
[14]:https://github.com/borgbackup/borg/
[15]:http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/
[16]:https://github.com/borgbackup/borgweb
[17]:https://borgbackup.readthedocs.io/en/stable/quickstart.html
[18]:https://rclone.org/install/
[19]:http://localconspiracy.com/2017/10/backup-everything.html
[20]:https://opensource.com/users/docaedo
[21]:https://opensource.com/users/docaedo
[22]:https://opensource.com/article/17/10/backing-your-machines-borg#comments
