树莓派自建 NAS 云盘之——数据自动备份
======
> 把你的树莓派变成数据的安全之所。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)

在《树莓派自建 NAS 云盘》系列的 [第一篇][1] 文章中，我们讨论了建立 NAS 的一些基本步骤，添加了两块 1TB 的存储硬盘驱动（一个用于数据存储，一个用于数据备份），并且通过网络文件系统（NFS）将数据存储盘挂载到远程终端上。本文是此系列的第二篇文章，我们将探讨数据自动备份。数据自动备份保证了数据的安全，为硬件损坏后的数据恢复提供便利以及减少了文件误操作带来的不必要的麻烦。

![](https://opensource.com/sites/default/files/uploads/nas_part2.png)

### 备份策略

我们就从为小型 NAS 构想一个备份策略着手开始吧。我建议每天有时间节点、有计划的去备份数据，以防止干扰到我们正常的访问 NAS，比如备份时间点避开正在访问 NAS 并写入文件的时间点。举个例子，你可以每天凌晨 2 点去进行数据备份。

另外，你还得决定每天的备份需要被保留的时间长短，因为如果没有时间限制，存储空间很快就会被用完。一般每天的备份保留一周便可以，如果数据出了问题，你便可以很方便的从备份中恢复出来原数据。但是如果需要恢复数据到更久之前怎么办？可以将每周一的备份文件保留一个月、每个月的备份保留更长时间。让我们把每月的备份保留一年时间，每一年的备份保留更长时间、例如五年。

这样，五年内在备份盘上产生大量备份：

* 每周 7 个日备份
* 每月 4 个周备份
* 每年 12 个月备份
* 每五年 5 个年备份

你应该还记得，我们搭建的备份盘和数据盘大小相同（每个 1 TB）。如何将不止 10 个 1TB 数据的备份从数据盘存放到只有 1TB 大小的备份盘呢？如果你创建的是完整备份，这显然不可能。因此，你需要创建增量备份，它是每一份备份都基于上一份备份数据而创建的。增量备份方式不会每隔一天就成倍的去占用存储空间，它每天只会增加一点占用空间。

以下是我的情况：我的 NAS 自 2016 年 8 月开始运行，备份盘上有 20 个备份。目前，我在数据盘上存储了 406GB 的文件。我的备份盘用了 726GB。当然，备份盘空间使用率在很大程度上取决于数据的更改频率，但正如你所看到的，增量备份不会占用 20 个完整备份所需的空间。然而，随着时间的推移，1TB 空间也可能不足以进行备份。一旦数据增长接近 1TB 限制（或任何备份盘容量），应该选择更大的备份盘空间并将数据移动转移过去。

### 利用 rsync 进行数据备份

利用 `rsync` 命令行工具可以生成完整备份。

```
pi@raspberrypi:~ $ rsync -a /nas/data/ /nas/backup/2018-08-01
```

这段命令将挂载在 `/nas/data/` 目录下的数据盘中的数据进行了完整的复制备份。备份文件保存在 `/nas/backup/2018-08-01` 目录下。`-a` 参数是以归档模式进行备份，这将会备份所有的元数据，例如文件的修改日期、权限、拥有者以及软连接文件。

现在，你已经在 8 月 1 日创建了完整的初始备份，你将在 8 月 2 日创建第一个增量备份。

```
pi@raspberrypi:~ $ rsync -a --link-dest /nas/backup/2018-08-01/ /nas/data/ /nas/backup/2018-08-02
```

上面这行代码又创建了一个关于 `/nas/data` 目录中数据的备份。备份路径是 `/nas/backup/2018-08-02`。这里的参数 `--link-dest` 指定了一个备份文件所在的路径。这样，这次备份会与 `/nas/backup/2018-08-01` 的备份进行比对，只备份已经修改过的文件，未做修改的文件将不会被复制，而是创建一个到上一个备份文件中它们的硬链接。

使用备份文件中的硬链接文件时，你一般不会注意到硬链接和初始拷贝之间的差别。它们表现的完全一样，如果删除其中一个硬链接或者文件，其他的依旧存在。你可以把它们看做是同一个文件的两个不同入口。下面就是一个例子：

![](https://opensource.com/sites/default/files/uploads/backup_flow.png)

左侧框是在进行了第二次备份后的原数据状态。中间的方块是昨天的备份。昨天的备份中只有图片 `file1.jpg` 并没有 `file2.txt` 。右侧的框反映了今天的增量备份。增量备份命令创建昨天不存在的 `file2.txt`。由于 `file1.jpg` 自昨天以来没有被修改，所以今天创建了一个硬链接，它不会额外占用磁盘上的空间。

### 自动化备份

你肯定也不想每天凌晨去输入命令进行数据备份吧。你可以创建一个任务定时去调用下面的脚本让它自动化备份。

```
#!/bin/bash

TODAY=$(date +%Y-%m-%d)
DATADIR=/nas/data/
BACKUPDIR=/nas/backup/
SCRIPTDIR=/nas/data/backup_scripts
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
        mkdir -p ${TODAYPATH}
fi

rsync -a --link-dest ${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@

${SCRIPTDIR}/deleteOldBackups.sh
```

第一段代码指定了数据路径、备份路径、脚本路径以及昨天和今天的备份路径。第二段代码调用 `rsync` 命令。最后一段代码执行 `deleteOldBackups.sh` 脚本，它会清除一些过期的没有必要的备份数据。如果不想频繁的调用 `deleteOldBackups.sh`，你也可以手动去执行它。

下面是今天讨论的备份策略的一个简单完整的示例脚本。

```
#!/bin/bash
BACKUPDIR=/nas/backup/

function listYearlyBackups() {
        for i in 0 1 2 3 4 5
                do ls ${BACKUPDIR} | egrep "$(date +%Y -d "${i} year ago")-[0-9]{2}-[0-9]{2}" | sort -u | head -n 1
        done
}

function listMonthlyBackups() {
        for i in 0 1 2 3 4 5 6 7 8 9 10 11 12
                do ls ${BACKUPDIR} | egrep "$(date +%Y-%m -d "${i} month ago")-[0-9]{2}" | sort -u | head -n 1
        done
}

function listWeeklyBackups() {
        for i in 0 1 2 3 4
                do ls ${BACKUPDIR} | grep "$(date +%Y-%m-%d -d "last monday -${i} weeks")"
        done
}

function listDailyBackups() {
        for i in 0 1 2 3 4 5 6
                do ls ${BACKUPDIR} | grep "$(date +%Y-%m-%d -d "-${i} day")"
        done
}

function getAllBackups() {
        listYearlyBackups
        listMonthlyBackups
        listWeeklyBackups
        listDailyBackups
}

function listUniqueBackups() {
        getAllBackups | sort -u
}

function listBackupsToDelete() {
        ls ${BACKUPDIR} | grep -v -e "$(echo -n $(listUniqueBackups) |sed "s/ /\\\|/g")"
}

cd ${BACKUPDIR}
listBackupsToDelete | while read file_to_delete; do
        rm -rf ${file_to_delete}
done
```

这段脚本会首先根据你的备份策略列出所有需要保存的备份文件，然后它会删除那些再也不需要了的备份目录。

下面创建一个定时任务去执行上面这段代码。以 root 用户权限打开 `crontab -e`，输入以下这段命令，它将会创建一个每天凌晨 2 点去执行 `/nas/data/backup_scripts/daily.sh` 的定时任务。

```
0 2 * * * /nas/data/backup_scripts/daily.sh
```

有关创建定时任务请参考 [cron 创建定时任务][2]。

* 当没有备份任务时，卸载你的备份盘或者将它挂载为只读盘；
* 利用远程服务器作为你的备份盘，这样就可以通过互联网同步数据

你也可用下面的方法来加强你的备份策略，以防止备份数据的误删除或者被破坏：

本文中备份策略示例是备份一些我觉得有价值的数据，你也可以根据个人需求去修改这些策略。

我将会在 《树莓派自建 NAS 云盘》 系列的第三篇文章中讨论 [Nextcloud][3]。Nextcloud 提供了更方便的方式去访问 NAS 云盘上的数据并且它还提供了离线操作，你还可以在客户端中同步你的数据。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/automate-backups-raspberry-pi

作者：[Manuel Dewald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[1]: https://linux.cn/article-10104-1.html
[2]: https://opensource.com/article/17/11/how-use-cron-linux
[3]: https://nextcloud.com/

