LFCS 系列第六讲：组装分区为RAID设备——创建和管理系统备份
=========================================================
Linux 基金会已经发起了一个全新的 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，旨在让来自世界各地的人有机会参加到 LFCS 测试，获得关于有能力在 Linux 系统中执行中级系统管理任务的认证。该认证包括：维护正在运行的系统和服务的能力、全面监控和分析的能力以及何时向上游团队请求支持的决策能力。

![Linux Foundation Certified Sysadmin – Part 6](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-6.png)

*LFCS 系列第六讲*

以下视频介绍了 Linux 基金会认证程序。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程中的第六讲，在这一讲里，我们将会解释如何将分区组装为 RAID 设备——创建和管理系统备份。这些都是 LFCS 认证中的必备知识。

### 了解RAID ###

这种被称为独立磁盘冗余阵列（Redundant Array of Independent Disks）(RAID)的技术是将多个硬盘组合成一个单独逻辑单元的存储解决方案，它提供了数据冗余功能并且改善硬盘的读写操作性能。

然而，实际的容错和磁盘 I/O 性能硬盘取决于如何将多个硬盘组装成磁盘阵列。根据可用的设备和容错/性能的需求，RAID 被分为不同的级别，你可以参考 RAID 系列文章以获得每个 RAID 级别更详细的解释。

- [在 Linux 下使用 RAID（一）：介绍 RAID 的级别和概念][1]

我们选择用于创建、组装、管理、监视软件 RAID 的工具，叫做 mdadm (multiple disk admin 的简写）。

```
---------------- Debian 及衍生版 ----------------
# aptitude update && aptitude install mdadm
```

```
---------------- Red Hat 和基于 CentOS 的系统 ----------------
# yum update && yum install mdadm
```

```
---------------- openSUSE 上 ----------------
# zypper refresh && zypper install mdadm #
```

#### 将分区组装成 RAID 设备 ####

组装已有分区作为 RAID 设备的过程由以下步骤组成。

**1. 使用 mdadm 创建阵列**

如果先前其中一个分区已经格式化，或者作为了另一个 RAID 阵列的一部分，你会被提示以确认创建一个新的阵列。假设你已经采取了必要的预防措施以避免丢失重要数据，那么可以安全地输入 Y 并且按下回车。

```
# mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1
```

![Creating RAID Array](http://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array.png)

*创建 RAID 阵列*

**2. 检查阵列的创建状态**

在创建了 RAID 阵列之后，你可以检查使用以下命令检查阵列的状态。


	# cat /proc/mdstat
	or
	# mdadm --detail /dev/md0    [More detailed summary]

![Check RAID Array Status](http://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status.png)

*检查 RAID 阵列的状态*

**3. 格式化 RAID 设备**

如本系列[第四讲][2]所介绍的，按照你的需求/要求采用某种文件系统格式化你的设备。

**4. 监控 RAID 阵列服务**

让监控服务时刻监视你的 RAID 阵列。把`# mdadm --detail --scan`命令输出结果添加到 `/etc/mdadm/mdadm.conf`(Debian及其衍生版)或者`/etc/mdadm.conf`(Cent0S/openSUSE)，如下。

	# mdadm --detail --scan


![Monitor RAID Array](http://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array.png)

*监控 RAID 阵列*

	# mdadm --assemble --scan     [Assemble the array]

为了确保服务能够开机启动，需要以 root 权限运行以下命令。

**Debian 及其衍生版**

Debian 及其衍生版能够通过下面步骤使服务默认开机启动：

	# update-rc.d mdadm defaults

在 `/etc/default/mdadm` 文件中添加下面这一行

	AUTOSTART=true


**CentOS 和 openSUSE(systemd-based)**

	# systemctl start mdmonitor
	# systemctl enable mdmonitor

**CentOS 和 openSUSE(SysVinit-based)**

	# service mdmonitor start
	# chkconfig mdmonitor on

**5. 检查RAID磁盘故障**

在支持冗余的的 RAID 级别中，在需要时会替换故障的驱动器。当磁盘阵列中的设备出现故障时，仅当存在我们第一次创建阵列时预留的备用设备时，磁盘阵列会将自动启动重建。

![Check RAID Faulty Disk](http://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Faulty-Disk.png)

*检查 RAID 故障磁盘*

否则，我们需要手动将一个额外的物理驱动器插入到我们的系统，并且运行。

	# mdadm /dev/md0 --add /dev/sdX1

/dev/md0 是出现了问题的阵列，而 /dev/sdx1 是新添加的设备。

**6. 拆解一个工作阵列**

如果你需要使用工作阵列的设备创建一个新的阵列，你可能不得不去拆解已有工作阵列——(可选步骤)

	# mdadm --stop /dev/md0                 #  Stop the array
	# mdadm --remove /dev/md0             # Remove the RAID device
	# mdadm --zero-superblock /dev/sdX1     # Overwrite the existing md superblock with zeroes

**7. 设置邮件通知**

你可以配置一个用于发送通知的有效邮件地址或者系统账号(确保在 mdadm.conf 文件中有下面这一行)。——(可选步骤)

	MAILADDR root

在这种情况下，来自 RAID 后台监控程序所有的通知将会发送到你的本地 root 账号的邮件箱中。其中一个类似的通知如下。

说明：此次通知事件和第5步中的例子相关。此处一个设备被标志为错误，并且一个空闲的设备自动地被 mdadm 加入到阵列。我们用完了所有“健康的”空闲设备，因此我们得到了通知。

![RAID Monitoring Alerts](http://www.tecmint.com/wp-content/uploads/2014/10/RAID-Monitoring-Alerts.png)

*RAID 监控通知*

#### 了解 RAID 级别 ####

**RAID 0**

阵列总大小是最小分区大小的 n 倍，n 是阵列中独立磁盘的个数(你至少需要两个驱动器/磁盘)。运行下面命令，使用 /dev/sdb1 和 /dev/sdc1 分区组装一个 RAID 0 阵列。

    # mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1

常见用途：用于支持性能比容错更重要的实时应用程序的设置

**RAID 1 (又名镜像)**

阵列总大小等于最小分区大小(你至少需要两个驱动器/磁盘)。运行下面命令，使用 /dev/sdb1 和 /dev/sdc1 分区组装一个 RAID 1 阵列。

	# mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1

常见用途：操作系统的安装或者重要的子文件夹，例如 /home

**RAID 5 (又名奇偶校验码盘)**

阵列总大小将是最小分区大小的 (n-1) 倍。所减少的大小用于奇偶校验(冗余)计算(你至少需要3个驱动器/磁盘)。

说明：你可以指定一个空闲设备 (/dev/sde1) 替换问题出现时的故障部分(分区)。运行下面命令，使用 /dev/sdb1, /dev/sdc1, /dev/sdd1，/dev/sde1 组装一个 RAID 5 阵列，其中 /dev/sde1 作为空闲分区。

    # mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1 --spare-devices=1 /dev/sde1

常见用途：Web 和文件服务

**RAID 6 (又名双重奇偶校验码盘)**

阵列总大小为(n*s)-2*s，其中n为阵列中独立磁盘的个数，s为最小磁盘大小。

说明：你可以指定一个空闲分区(在这个例子为 /dev/sdf1)替换问题出现时的故障部分(分区)。

运行下面命令，使用 /dev/sdb1, /dev/sdc1, /dev/sdd1, /dev/sde1 和 /dev/sdf1 组装 RAID 6 阵列，其中 /dev/sdf1 作为空闲分区。

    # mdadm --create --verbose /dev/md0 --level=6 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde --spare-devices=1 /dev/sdf1

常见用途：大容量、高可用性要求的文件服务器和备份服务器。

**RAID 1+0 (又名镜像条带)**

因为 RAID 1+0 是 RAID 0 和 RAID 1 的组合，所以阵列总大小是基于两者的公式计算的。首先，计算每一个镜像的大小，然后再计算条带的大小。

    # mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd[b-e]1 --spare-devices=1 /dev/sdf1

常见用途：需要快速 IO 操作的数据库和应用服务器

#### 创建和管理系统备份 ####

记住， RAID 其所有的价值不是在于备份的替换者！在黑板上写上1000次，如果你需要的话，但无论何时一定要记住它。在我们开始前，我们必须注意的是，没有一个放之四海皆准的针对所有系统备份的解决方案，但这里有一些东西，是你在规划一个备份策略时需要考虑的。

- 你的系统将用于什么？(桌面或者服务器？如果系统是应用于后者，那么最重要的服务是什么？哪个配置是痛点？)
- 你每隔多久备份你的系统？
- 你需要备份的数据是什么(比如文件/文件夹/数据库转储)？你还可以考虑是否需要备份大型文件(比如音频和视频文件)。
- 这些备份将会存储在哪里(物理位置和媒体)？

**备份你的数据**

方法1：使用 dd 命令备份整个磁盘。你可以在任意时间点通过创建一个准确的镜像来备份一整个硬盘或者是分区。注意当设备是离线时，这种方法效果最好，也就是说它没有被挂载并且没有任何进程的 I/O 操作访问它。

这种备份方法的缺点是镜像将具有和磁盘或分区一样的大小，即使实际数据占用的是一个很小的比例。比如，如果你想要为只使用了10%的20GB的分区创建镜像，那么镜像文件将仍旧是20GB。换句话来讲，它不仅包含了备份的实际数据，而且也包含了整个分区。如果你想完整备份你的设备，那么你可以考虑使用这个方法。

**从现有的设备创建一个镜像文件**

    # dd if=/dev/sda of=/system_images/sda.img
    或者
	--------------------- 可选地，你可以压缩镜像文件 -------------------
	# dd if=/dev/sda | gzip -c > /system_images/sda.img.gz

**从镜像文件恢复备份**

    # dd if=/system_images/sda.img of=/dev/sda
    或者
	--------------------- 根据你创建镜像文件时的选择(译者注:比如压缩) ----------------
	# gzip -dc /system_images/sda.img.gz | dd of=/dev/sda

方法2：使用 tar 命令备份确定的文件/文件夹——已经在本系列[第三讲][3]中讲了。如果你想要备份指定的文件/文件夹(配置文件，用户主目录等等)，你可以使用这种方法。

方法3：使用 rsync 命令同步文件。rsync 是一种多功能远程（和本地）文件复制工具。如果你想要从网络设备备份或同步文件，rsync 是一种选择。


无论是你是正在同步两个本地文件夹还是本地 < — > 挂载在本地文件系统的远程文件夹，其基本语法是一样的。

    # rsync -av source_directory destination_directory

在这里，-a 递归遍历子目录(如果它们存在的话)，维持符号链接、时间戳、权限以及原本的属主/属组，-v 显示详细过程。

![rsync Synchronizing Files](http://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronizing-Files.png)

*rsync 同步文件*

除此之外，如果你想增加在网络上传输数据的安全性，你可以通过 ssh 协议使用 rsync。

**通过 ssh 同步本地到远程文件夹**

    # rsync -avzhe ssh backups root@remote_host:/remote_directory/

这个示例，本地主机上的 backups 文件夹将与远程主机上的 /root/remote_directory 的内容同步。

在这里，-h 选项以易读的格式显示文件的大小，-e 标志用于表示一个 ssh 连接。

![rsync Synchronize Remote Files](http://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files.png)

*rsync 同步远程文件*

**通过ssh同步远程到本地文件夹**

在这种情况下，交换前面示例中的 source 和 destination 文件夹。

    # rsync -avzhe ssh root@remote_host:/remote_directory/ backups

请注意这些只是 rsync 用法的三个示例而已(你可能遇到的最常见的情形)。对于更多有关 rsync 命令的示例和用法 ，你可以查看下面的文章。

- [在 Linux 下同步文件的10个 rsync命令][4]

### 总结 ###

作为一个系统管理员，你需要确保你的系统表现得尽可能好。如果你做好了充分准备，并且如果你的数据完整性能被诸如 RAID 和系统日常备份的存储技术支持，那你将是安全的。

如果你有有关完善这篇文章的问题、评论或者进一步的想法，可以在下面畅所欲言。除此之外，请考虑通过你的社交网络简介分享这系列文章。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/creating-and-managing-raid-backups-in-linux/

作者：[Gabriel Cánepa][a]
译者：[cpsoture](https://github.com/cposture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://linux.cn/article-6085-1.html
[2]:https://linux.cn/article-7187-1.html
[3]:https://linux.cn/article-7171-1.html
[4]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

