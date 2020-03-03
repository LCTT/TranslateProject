[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11619-1.html)
[#]: subject: (How to Use TimeShift to Backup and Restore Ubuntu Linux)
[#]: via: (https://www.linuxtechi.com/timeshift-backup-restore-ubuntu-linux/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

如何使用 TimeShift 备份和还原 Ubuntu Linux
======

你是否曾经想过如何备份和还原 Ubuntu 或 Debian 系统？Timeshift 是一款自由开源工具，可让你创建文件系统的增量快照。你可以使用 RSYNC 或 BTRFS 两种方式创建快照。

![](https://img.linux.net.cn/data/attachment/album/201911/27/235959fejmb080e7z0jnu0.jpg)

让我们深入研究并安装 Timeshift。在本教程，我们将安装在 Ubuntu 18.04 LTS 系统上。

### 在 Ubuntu / Debian Linux 上安装 TimeShift

TimeShift 尚未正式托管在 Ubuntu 和 Debian 仓库中。考虑到这一点，我们将运行以下命令来添加 PPA：

```
# add-apt-repository -y ppa:teejee2008/ppa
```

![Add timeshift repository][3]

接下来，使用以下命令更新系统软件包：

```
# apt update
```

成功更新系统后，使用以下 `apt` 命令安装 Timeshift：

```
# apt install timeshift
```

![apt install timeshift][4]

### 准备备份存储设备

最佳实践要求我们将系统快照保存在系统硬盘之外的单独的存储卷上。对于本指南，我们将使用 16GB 闪存作为第二个驱动器，并在该驱动器上保存快照。

```
# lsblk | grep sdb
```

![lsblk sdb ubuntu][5]

为了将闪存用作快照的备份位置，我们需要在设备上创建一个分区表。运行以下命令：

```
# parted /dev/sdb  mklabel gpt
# parted /dev/sdb  mkpart primary 0% 100%
# mkfs.ext4  /dev/sdb1
```

![create partition table on drive ubuntu][6]

在 USB 闪存上创建分区表后，我们可以开始创建文件系统的快照！

### 使用 Timeshift 创建快照

要启动 Timeshift，使用应用程序菜单搜索 “Timeshift”。

![Access timeshift][7]

单击 Timeshift 图标，系统将提示你输入管理员密码。提供密码，然后单击验证。

![Authentication required][8]

接下来，选择你喜欢的快照类型。

![Select rsync option][9]

点击 “Next”。选择快照的目标驱动器。在这里，我的位置是标记为 `/dev/sdb` 的外部 USB 驱动器。

![Select snapshot location][10]

接下来，定义快照级别。级别是指创建快照的时间间隔。你可以选择每月、每周、每天或每小时的快照级别。

![Select snapshot levels][11]

点击 “Finish”。

在下一个窗口中，单击 “Create” 按钮开始创建快照。此后，系统将开始创建快照。

![Create snapshot][12]

最后，你的快照将显示如下：

![Snapshot created][13]

### 从快照还原 Ubuntu / Debian

创建系统快照后，现在让我们看看如何从同一快照还原系统。在同一个 Timeshift 中，单击快照，然后单击 “Restore” 按钮，如图所示。

![Restore snapshot][14]

接下来，将提示你选择目标设备。保留默认选择，然后点击 “Next”。

![Select target device][15]

恢复过程开始之前，Timeshift 将会试运行。

![Comparing files dry run][16]

在下一个窗口中，点击 “Next” 按钮确认显示的操作。

![Confirm actions][17]

如图所示，你会看到警告和免责声明。点击 “Next” 初始化恢复过程。

此后，将开始还原过程，最后，系统之后将重新启动到快照定义的早期版本。

![Restoring snapshot][18]

### 总结

如你所见，使用 TimeShift 从快照还原系统非常容易。在备份系统文件时，它非常方便，并允许你在系统故障时进行恢复。因此，不要害怕修改系统或弄乱系统。TimeShift 使你能够返回到一切运行平稳的时间点。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/timeshift-backup-restore-ubuntu-linux/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/11/TimeShift-Backup-Restore-Tool-Ubuntu.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Add-timeshift-repository.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/apt-install-timeshift.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/lsblk-sdb-ubuntu.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/create-partition-table-on-drive-ubuntu.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Access-Timeshift-Ubuntu.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Authentication-required-ubuntu.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Select-Rsync-option-timeshift.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Select-snapshot-location.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Select-snapshot-levels-Timeshift.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Create-snapshot-timeshift.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Snapshot-created-TimeShift.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Restore-snapshot-timeshift.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Select-target-device-timeshift.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Comparing-files-Dry-Run-timeshift.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Confirm-actions-timeshift.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Restoring-snapshot-timeshift.png
