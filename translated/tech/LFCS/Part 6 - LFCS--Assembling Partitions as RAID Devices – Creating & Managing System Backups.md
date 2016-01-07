[未完成，不要合并-Translating By cposture 2016-01-07]
LFCS 系列第六讲：//创建和管理系统备份
====

Linux 基金会已经发起了一个全新的 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，旨在让来自世界各地的人有机会参加到 LFCS 测试，获得关于有能力在 Linux 系统中执行中间系统管理任务的认证。该认证包括：维护正在运行的系统和服务的能力、全面监控和分析的能力以及何时上游团队请求支持的决策能力。

//图片

LFCS 系列第五讲

以下视频介绍了 Linux 基金会认证程序。

本讲是《十套教程》系列中的第六讲，在这一讲里，我们将会解释如何组装分区作为RAID设备——创建和管理系统备份。这些都是 LFCS 认证中的必备知识。

# 了解RAID

被称为独立磁盘冗余阵列(RAID)的技术是一种将多个硬盘组合成一个单独逻辑单元的存储解决方案，它提供了数据冗余功能并且改善硬盘的读写性能。

然而，实际的容错和磁盘I/O性能硬盘取决于如何将多个硬盘组装成磁盘阵列。根据可用的设备和容错/性能的需求，RAID被分为不同的级别，你可以在Tecmint.com上参考RAID系列文章以获得每个RAID级别更详细的解释。

* //网址

我们选择用于创建、组装、管理、监视软件RAID的工具，叫做mdadm(multiple disk admin的简写)。

```
---------------- Debian and Derivatives ----------------
# aptitude update && aptitude install mdadm
```

```
---------------- Red Hat and CentOS based Systems ----------------
# yum update && yum install mdadm
```

```
---------------- On openSUSE ----------------
# zypper refresh && zypper install mdadm #
```

## 组装分区作为RAID设备

组装已有分区作为RAID设备的过程由以下步骤组成。

1. 使用mdadm创建阵列

如果先前其中一个分区被格式化，或者作为了另一个RAID阵列的一部分，你会被提示以确认创建一个新的阵列。假设你已经采取了必要的预防措施以避免丢失重要数据，那么可以安全地输入Y并且按下回车。

```
# mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1
```

//图片

创建RAID阵列

2. 检查阵列的创建状态

在创建了RAID阵列之后，你可以检查使用以下命令检查阵列的状态

```
# cat /proc/mdstat
or
# mdadm --detail /dev/md0    [More detailed summary]
```

//图片

检查RAID阵列的状态

3. 格式化RAID设备

如本系列4部分所介绍的，按照你的需求/要求采用某种文件系统格式化你的设备

4. 监控RAID阵列服务

指示监控服务时刻监视你的RAID阵列。把```# mdadm --detail --scan```命令输出结果添加到/etc/mdadm/mdadm.conf(Debian和derivatives)或者/etc/mdadm.conf(Cent0S/openSUSE)，如下。
```
# mdadm --detail --scan
```
//图片

监控RAID阵列

```
# mdadm --assemble --scan     [Assemble the array]
```
为了确保服务能够开机启动，需要以root权限运行以下命令。

## Debian 和 Derivatives

Debian 和 Derivatives能够通过下面步骤使服务默认开机启动
```
# update-rc.d mdadm defaults
```
在/etc/default/mdadm文件中添加下面这一行
```
AUTOSTART=true
```

## CentOS 和 openSUSE(systemd-based)

```
# systemctl start mdmonitor
# systemctl enable mdmonitor
```

## CentOS 和 openSUSEi(SysVinit-based)

```
# service mdmonitor start
# chkconfig mdmonitor on
```

5. 检查RAID磁盘故障

在支持冗余的的RAID级别中，在需要时会替换故障的驱动器。当磁盘阵列中的设备出现故障时，仅当存在我们第一次创建阵列时预留的备用设备时，磁盘阵列会将自动启动重建。

//图片

检查RAID故障磁盘

否则，我们需要手动连接一个额外的物理驱动器到我们的系统，并且运行。

```
# mdadm /dev/md0 --add /dev/sdX1
```

/dev/md0是出现了问题的阵列，而/dev/sdx1是新添加的设备。

6. 分解一个工作阵列

如果你需要使用工作阵列的设备创建一个新的阵列，你可能不得不去分解已有工作阵列——(可选步骤)

```
# mdadm --stop /dev/md0                 #  Stop the array
# mdadm --remove /dev/md0             # Remove the RAID device
# mdadm --zero-superblock /dev/sdX1     # Overwrite the existing md superblock with zeroes
```

7. 设置邮件通知

你可以配置一个用于发送通知的有效邮件地址或者系统账号(确保在mdadm.conf文件中有下面这一行)。——(可选步骤)
```
MAILADDR root
```

在这种情况下，来自RAID后台监控程序所有的通知将会发送到你的本地root账号的邮件箱中。其中一个类似的通知如下。

说明：此次通知事件和第5步中的例子相关。一个设备被标志为错误并且一个空闲的设备自动地被mdadm加入到阵列。我们用完了所有"健康的"空闲设备，因此我们得到了通知。

//图片

RAID监控通知


