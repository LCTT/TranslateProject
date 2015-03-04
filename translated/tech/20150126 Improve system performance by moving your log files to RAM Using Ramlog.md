系统性能优化支招：使用Ramlog将日志文件转移到RAM
================================================================================
Ramlog以系统守护进程的形式存在。它系统启动的时候创建了虚拟磁盘（ramdisk），将文件从目录/var/log复制到虚拟磁盘中，同时把虚拟磁盘挂载为/var/log。接着更新虚拟磁盘上所有的日志。硬盘上的日志会保留在目录/var/log中，直到ramlog重启或停止时被更新。而关机的时候，（ramdisk上的）日志文件会重新保存到硬盘上，以确保日志一致性。Ramlog 2.x默认使用tmpfs文件系统，同时也可以支持ramfs和内核ramdisk。使用rsync（译注：Linux数据镜像备份工具）这个工具来同步日志。

注意：没有保存进硬盘的日志将在断电或者内核混乱（kernel panic）的情况下丢失。

如果你拥有空间足够的可用内存，而又想把日志放进虚拟磁盘，就安装ramlog吧。它是笔记本用户、UPS系统或是直接在flash中运行的系统节省写周期的优良选择。

Ramlog的运行机制以及步骤：

1.Ramlog在第一个守护进程（这取决于你所安装过的其它守护进程）的基础上启动。

2.然后创建目录/var/log.hdd并将其硬链至/var/log。

3.如果使用的是tmpfs（默认）或者ramfs之一的文件系统，将其挂载到/var/log上。

而如果使用的是内核ramdisk，ramdisk将在/dev/ram9中创建，并将挂载至/var/log。默认情况下ramlog会占用所有ramdisk的内存，其大小由内核参数"ramdisk_size"指定。

5.接着其它的守护进程被启动，并在ramdisk中更新日志。Logrotate（译注：Linux日志轮替工具）也是在ramdiks之上运行。

6.重启（默认一天一次）ramlog时，目录/var/log.hdd将借助rsync与/var/log保持同步。日志自动保存的频率可以通过cron（译注：Linux例行性工作调度）来控制。默认情况下，ramlog文件放置在目录/etc/cron.daily下。

7.系统关机时，ramlog在最后一个守护进程关闭之前关闭。

在ramlog关闭期间，/var/log.hdd中的文件将被同步至/var/log，接着/var/log和/var/log.hdd都被卸载，然后删除空目录/var/log.hdd。

**注意:- 此文仅面向高级用户**

### 在Ubuntu中安装Ramlog ###

首先需要用以下命令，从[这里][1]下载.deb安装包：

    wget http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb

下载ramlog_2.0.0_all.deb安装包完毕，使用以下命令进行安装：

    sudo dpkg -i ramlog_2.0.0_all.deb

这一步会完成整个安装，现在你需要运行以下命令：

    sudo update-rc.d ramlog start 2 2 3 4 5 . stop 99 0 1 6 .

#现在，在初始状态下升级sysklogd，使之能在ramlog停止运行前正确关闭：

    sudo update-rc.d -f sysklogd remove

    sudo update-rc.d sysklogd start 10 2 3 4 5 . stop 90 0 1 6 .

然后重启系统：

    sudo reboot

系统重启完毕，运行'ramlog getlogsize'获取/var/log的空间大小。在此基础之上多分配40%的空间，确保ramdisk有足够的空间（这整个都将作为ramdisk的空间大小）。

编辑引导配置文件，如/etc/grub.conf,、/boot/grub/menu.lst 或/etc/lilo.conf（译注：具体哪个配置文件视不同引导加载程序而定），kernel参数新增项'ramdisk_size=xxx'以更新当前内核，其中xxx是ramdisk的空间大小。

### 配置Ramlog ###

基于deb的系统中，Ramlog的配置文件位于/etc/default/ramlog，你可以在该目录下设置以下变量：

Variable (with default value):

Description: 

    RAMDISKTYPE=0
    # Values:
    # 0 -- tmpfs (can be swapped) -- default
    # 1 -- ramfs (no max size in older kernels,
    # cannot be swapped, not SELinux friendly)
    # 2 -- old kernel ramdisk
    TMPFS_RAMFS_SIZE=
    #Maximum size of memory to be used by tmpfs or ramfs.
    # The value can be percentage of total RAM or size in megabytes -- for example:
    # TMPFS_RAMFS_SIZE=40%
    # TMPFS_RAMFS_SIZE=100m
    # Empty value means default tmpfs/ramfs size which is 50% of total RAM.
    # For more options please check ‘man mount', section ‘Mount options for tmpfs'
    # (btw -- ramfs supports size limit in newer kernels
    # as well despite man says there are no mount options)
    # It has only effect if RAMDISKTYPE=0 or 1
    KERNEL_RAMDISK_SIZE=MAX
    #Kernel ramdisk size in kilobytes or MAX to use entire ramdisk.
    #It has only effect if RAMDISKTYPE=2
    LOGGING=1
    # 0=off, 1=on Logs can be found in /var/log/ramdisk
    LOGNAME=ramlog
    # name of the ramlog log file (makes sense if LOGGING=1)
    VERBOSE=1
    # 0=off, 1=on (if 1, teststartstop puts detials
    # to the logs and it is called after start or stop fails) 

### 在Ubuntu中卸载ramlog ###

打开终端运行以下命令：

    sudo dpkg -P ramlog

注意：如果ramlog卸载之前仍在运行，需要重启系统完成整个卸载工作。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/improve-system-performance-by-moving-your-log-files-to-ram-using-ramlog.html

作者：[ruchi][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb
