性能优化：使用ramlog将日志文件转移到内存中
================================================================================
Ramlog 以系统守护进程的形式运行。在系统启动时它创建虚拟磁盘（ramdisk），将 /var/log 下的文件复制到虚拟磁盘中，同时把虚拟磁盘挂载为/var/log。然后所有的日志就会更新到虚拟磁盘上。而当 ramlog 重启或停止时，需要记录到硬盘上的日志就会保留在目录/var/log.hdd中。而关机的时候，（ramdisk上的）日志文件会重新保存到硬盘上，以确保日志一致性。Ramlog 2.x默认使用tmpfs文件系统，同时也可以支持ramfs和内核ramdisk。使用rsync（译注：Linux数据镜像备份工具）这个工具来同步日志。

注意：如果突然断电或者内核崩溃（kernel panic）时，没有保存进硬盘的日志将会丢失。

如果你拥有够多的可用内存，而又想把日志放进虚拟磁盘，就安装ramlog吧。它是笔记本用户、带有UPS的系统或是直接在flash中运行的系统的优良选择，可以节省日志的写入时间。

Ramlog的运行机制以及步骤如下：

1. Ramlog 由第一个守护进程（这取决于你所安装过的其它守护进程）启动。

2. 然后创建目录/var/log.hdd并将其硬链至/var/log。

3. 如果使用的是tmpfs（默认）或者ramfs 文件系统，将其挂载到/var/log上。

4. 而如果使用的是内核ramdisk，ramdisk会在/dev/ram9中创建，并将其挂载至/var/log。默认情况下ramlog会占用所有ramdisk的内存，其大小由内核参数"ramdisk_size"指定。

5. 接着其它的守护进程被启动，并在ramdisk中更新日志。Logrotate（译注：Linux日志轮替工具）和 ramdisk 配合的也很好。

6. 重启（默认一天一次）ramlog时，目录/var/log.hdd将借助rsync与/var/log保持同步。日志自动保存的频率可以通过cron（译注：Linux例行性工作调度）来控制。默认情况下，ramlog 的调度任务放置在目录/etc/cron.daily下。

7. 系统关机时，ramlog在最后一个守护进程关闭之前关闭。

8. 在ramlog关闭期间，/var/log.hdd中的文件将被同步至/var/log，接着/var/log和/var/log.hdd都被卸载，然后删除空目录/var/log.hdd。

**注意:- 此文仅面向高级用户**

### 在Ubuntu中安装Ramlog ###

首先需要用以下命令，从[这里][1]下载.deb安装包：

    wget http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb

下载ramlog\_2.0.0\_all.deb安装包完毕，使用以下命令进行安装：

    sudo dpkg -i ramlog_2.0.0_all.deb

这一步会完成整个安装，现在你需要运行以下命令：

    sudo update-rc.d ramlog start 2 2 3 4 5 . stop 99 0 1 6 .

现在，在更新sysklogd的初始化顺序，使之能在ramlog停止运行前正确关闭：

    sudo update-rc.d -f sysklogd remove

    sudo update-rc.d sysklogd start 10 2 3 4 5 . stop 90 0 1 6 .

然后重启系统：

    sudo reboot

系统重启完毕，运行'ramlog getlogsize'来获取你当前的/var/log的空间大小。在此基础之上多分配40%的空间，确保ramdisk有足够的空间（这整个都将作为ramdisk的空间大小）。

编辑引导配置文件，如/etc/grub.conf,、/boot/grub/menu.lst 或/etc/lilo.conf（译注：具体哪个配置文件视不同引导加载程序而定），给你的当前内核的新增选项 'ramdisk_size=xxx' ，其中xxx是ramdisk的空间大小。

### 配置Ramlog ###

基于deb的系统中，Ramlog的配置文件位于/etc/default/ramlog，你可以在该配置文件中设置以下变量：

    RAMDISKTYPE=0
    # 取值:
    # 0 -- tmpfs （可被交换到交换分区） -- 默认
    # 1 -- ramfs （旧内核不能设置最大空间大小， 
    # 不能被交换到交换分区，和 SELinux 不兼容）
    # 2 -- 老式的内核 ramdisk
    TMPFS_RAMFS_SIZE=
    # 可以用于 tmpfs 或 ramfs 的最大内存大小
    # 这个值可以是百分比或数值（单位是 Mb），例如：
    # TMPFS_RAMFS_SIZE=40%
    # TMPFS_RAMFS_SIZE=100m
    # 该值为空表示 tmpfs/ramfs 的大小是全部内存的 50%
    # 更多选项可以参考 ‘man mount' 中的‘Mount options for tmpfs' 一节
    # （补充，在较新的内核中，ramfs  支持大小限制，
    # 虽然 man 中说没有这个挂载选项）
    # 该选项仅用于 RAMDISKTYPE=0 或 1 时
    KERNEL_RAMDISK_SIZE=MAX
    #以 kb 为单位指定的内核 ramdisk 大小，或者使用 MAX 来使用整个 ramdisk。
    #该选项仅用于 RAMDISKTYPE=2 时
    LOGGING=1
    # 0=关闭, 1=打开 。记录自身的日志到 /var/log/ramdisk
    LOGNAME=ramlog
    # 自身的日志文件名 （用于 LOGGING=1时）
    VERBOSE=1
    # 0=关闭, 1=打开 （设置为 1时，启动或停止失败时会调用 teststartstop 将细节
    # 写到日志中） 

### 在Ubuntu中卸载ramlog ###

打开终端运行以下命令：

    sudo dpkg -P ramlog

注意：如果ramlog卸载之前仍在运行，需要重启系统完成整个卸载工作。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/improve-system-performance-by-moving-your-log-files-to-ram-using-ramlog.html

作者：[ruchi][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb
