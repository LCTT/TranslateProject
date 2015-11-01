 Linux 中 df 命令的11个例子
================================================================================

df 即“可用磁盘”（disk free），用于显示文件系统的磁盘使用情况。默认情况下 df 命令将以每块 1K 的单位进行显示所有当前已挂载的文件系统，如果你想以人类易读的格式显示 df 命令的输出，像这样“df -h”使用 -h 选项。

在这篇文章中，我们将讨论 `df` 命令在 Linux 下11种不同的实例。

在 Linux 下 df 命令的基本格式为：

    # df {options} {mount_point_of_filesystem}

在 df 命令中可用的选项有：

![](http://www.linuxtechi.com/wp-content/uploads/2015/10/df-command-options.jpg)

df 的样例输出 :

    [root@linux-world ~]# df
    Filesystem            1K-blocks   Used Available Use% Mounted on
    /dev/mapper/vg00-root  17003304 804668  15311852   5% /
    devtmpfs                 771876      0    771876   0% /dev
    tmpfs                    777928      0    777928   0% /dev/shm
    tmpfs                    777928   8532    769396   2% /run
    tmpfs                    777928      0    777928   0% /sys/fs/cgroup
    /dev/mapper/vg00-home  14987616  41000  14162232   1% /home
    /dev/sda1                487652  62593    395363  14% /boot
    /dev/mapper/vg00-var    9948012  48692   9370936   1% /var
    /dev/mapper/vg00-sap   14987656  37636  14165636   1% /sap
    [root@linux-world ~]#

### 例1：使用 -a 选项列出所有文件系统的磁盘使用量 ###

当我们在 df 命令中使用 `-a` 选项时，它会显示所有文件系统的磁盘使用情况。

    [root@linux-world ~]# df -a
    Filesystem            1K-blocks   Used Available Use% Mounted on
    rootfs                 17003304 804668  15311852   5% /
    proc                          0      0         0    - /proc
    sysfs                         0      0         0    - /sys
    devtmpfs                 771876      0    771876   0% /dev
    securityfs                    0      0         0    - /sys/kernel/security
    tmpfs                    777928      0    777928   0% /dev/shm
    devpts                        0      0         0    - /dev/pts
    tmpfs                    777928   8532    769396   2% /run
    tmpfs                    777928      0    777928   0% /sys/fs/cgroup
    cgroup                        0      0         0    - /sys/fs/cgroup/systemd
    pstore                        0      0         0    - /sys/fs/pstore
    cgroup                        0      0         0    - /sys/fs/cgroup/cpuset
    cgroup                        0      0         0    - /sys/fs/cgroup/cpu,cpuacct
    cgroup                        0      0         0    - /sys/fs/cgroup/memory
    cgroup                        0      0         0    - /sys/fs/cgroup/devices
    cgroup                        0      0         0    - /sys/fs/cgroup/freezer
    cgroup                        0      0         0    - /sys/fs/cgroup/net_cls
    cgroup                        0      0         0    - /sys/fs/cgroup/blkio
    cgroup                        0      0         0    - /sys/fs/cgroup/perf_event
    cgroup                        0      0         0    - /sys/fs/cgroup/hugetlb
    configfs                      0      0         0    - /sys/kernel/config
    /dev/mapper/vg00-root  17003304 804668  15311852   5% /
    selinuxfs                     0      0         0    - /sys/fs/selinux
    systemd-1                     0      0         0    - /proc/sys/fs/binfmt_misc
    debugfs                       0      0         0    - /sys/kernel/debug
    hugetlbfs                     0      0         0    - /dev/hugepages
    mqueue                        0      0         0    - /dev/mqueue
    /dev/mapper/vg00-home  14987616  41000  14162232   1% /home
    /dev/sda1                487652  62593    395363  14% /boot
    /dev/mapper/vg00-var    9948012  48692   9370936   1% /var
    /dev/mapper/vg00-sap   14987656  37636  14165636   1% /sap
    [root@linux-world ~]#

### 例2：以人类易读的格式显示 df 命令的输出 ###

在 df 命令中使用`-h`选项，以人类易读的格式输出（例如，5K，500M 及 5G）

    [root@linux-world ~]# df -h
    Filesystem             Size  Used Avail Use% Mounted on
    /dev/mapper/vg00-root   17G  786M   15G   5% /
    devtmpfs               754M     0  754M   0% /dev
    tmpfs                  760M     0  760M   0% /dev/shm
    tmpfs                  760M  8.4M  752M   2% /run
    tmpfs                  760M     0  760M   0% /sys/fs/cgroup
    /dev/mapper/vg00-home   15G   41M   14G   1% /home
    /dev/sda1              477M   62M  387M  14% /boot
    /dev/mapper/vg00-var   9.5G   48M  9.0G   1% /var
    /dev/mapper/vg00-sap    15G   37M   14G   1% /sap
    [root@linux-world ~]#

### 例3：显示特定文件系统已使用的空间 ###

假如我们想显示 /sap 文件系统空间的使用情况。

    [root@linux-world ~]# df -h /sap/
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/mapper/vg00-sap   15G   37M   14G   1% /sap
    [root@linux-world ~]#

### 例4：输出所有已挂载文件系统的类型 ###

`-T` 选项用在 df 命令中用来显示文件系统的类型。

    [root@linux-world ~]# df -T
    Filesystem            Type     1K-blocks   Used Available Use% Mounted on
    /dev/mapper/vg00-root ext4      17003304 804668  15311852   5% /
    devtmpfs              devtmpfs    771876      0    771876   0% /dev
    tmpfs                 tmpfs       777928      0    777928   0% /dev/shm
    tmpfs                 tmpfs       777928   8532    769396   2% /run
    tmpfs                 tmpfs       777928      0    777928   0% /sys/fs/cgroup
    /dev/mapper/vg00-home ext4      14987616  41000  14162232   1% /home
    /dev/sda1             ext3        487652  62593    395363  14% /boot
    /dev/mapper/vg00-var  ext3       9948012  48696   9370932   1% /var
    /dev/mapper/vg00-sap  ext3      14987656  37636  14165636   1% /sap
    [root@linux-world ~]#

### 例5：按块大小输出文件系统磁盘使用情况 ###

    [root@linux-world ~]# df -k
    Filesystem            1K-blocks   Used Available Use% Mounted on
    /dev/mapper/vg00-root  17003304 804668  15311852   5% /
    devtmpfs                 771876      0    771876   0% /dev
    tmpfs                    777928      0    777928   0% /dev/shm
    tmpfs                    777928   8532    769396   2% /run
    tmpfs                    777928      0    777928   0% /sys/fs/cgroup
    /dev/mapper/vg00-home  14987616  41000  14162232   1% /home
    /dev/sda1                487652  62593    395363  14% /boot
    /dev/mapper/vg00-var    9948012  48696   9370932   1% /var
    /dev/mapper/vg00-sap   14987656  37636  14165636   1% /sap
    [root@linux-world ~]#

### 例6：输出文件系统的 inode 信息 ###

`-i` 选项用在 df 命令用于显示文件系统的 inode 信息。

所有文件系统的 inode 信息：

    [root@linux-world ~]# df -i
    Filesystem             Inodes IUsed   IFree IUse% Mounted on
    /dev/mapper/vg00-root 1089536 22031 1067505    3% /
    devtmpfs               192969   357  192612    1% /dev
    tmpfs                  194482     1  194481    1% /dev/shm
    tmpfs                  194482   420  194062    1% /run
    tmpfs                  194482    13  194469    1% /sys/fs/cgroup
    /dev/mapper/vg00-home  960992    15  960977    1% /home
    /dev/sda1              128016   337  127679    1% /boot
    /dev/mapper/vg00-var   640848  1235  639613    1% /var
    /dev/mapper/vg00-sap   960992    11  960981    1% /sap
    [root@linux-world ~]#

特定文件系统的 inode 信息：

    [root@linux-world ~]# df -i /sap/
    Filesystem           Inodes IUsed  IFree IUse% Mounted on
    /dev/mapper/vg00-sap 960992    11 960981    1% /sap
    [root@linux-world ~]#

### 例7：输出所有文件系统使用情况汇总 ###

`-total` 选项在 df 命令中用于显示所有文件系统的磁盘使用情况汇总。

    [root@linux-world ~]# df -h --total
    Filesystem             Size  Used Avail Use% Mounted on
    /dev/mapper/vg00-root   17G  786M   15G   5% /
    devtmpfs               754M     0  754M   0% /dev
    tmpfs                  760M     0  760M   0% /dev/shm
    tmpfs                  760M  8.4M  752M   2% /run
    tmpfs                  760M     0  760M   0% /sys/fs/cgroup
    /dev/mapper/vg00-home   15G   41M   14G   1% /home
    /dev/sda1              477M   62M  387M  14% /boot
    /dev/mapper/vg00-var   9.5G   48M  9.0G   1% /var
    /dev/mapper/vg00-sap    15G   37M   14G   1% /sap
    total                   58G  980M   54G   2% -
    [root@linux-world ~]#

### 例8：只打印本地文件系统磁盘的使用情况 ###

假设网络文件系统也挂载在 Linux 上，但我们只想显示本地文件系统的信息，这可以通过使用 df 命令的 `-l` 选项来实现。

![](http://www.linuxtechi.com/wp-content/uploads/2015/10/nfs4-fs-mount.jpg)

只打印本地文件系统：

    [root@linux-world ~]# df -Thl
    Filesystem            Type      Size  Used Avail Use% Mounted on
    /dev/mapper/vg00-root ext4       17G  791M   15G   6% /
    devtmpfs              devtmpfs  754M     0  754M   0% /dev
    tmpfs                 tmpfs     760M     0  760M   0% /dev/shm
    tmpfs                 tmpfs     760M  8.4M  752M   2% /run
    tmpfs                 tmpfs     760M     0  760M   0% /sys/fs/cgroup
    /dev/mapper/vg00-home ext4       15G   41M   14G   1% /home
    /dev/sda1             ext3      477M   62M  387M  14% /boot
    /dev/mapper/vg00-var  ext3      9.5G  105M  8.9G   2% /var
    /dev/mapper/vg00-sap  ext3       15G   37M   14G   1% /sap
    [root@linux-world ~]#

### 例9：打印特定文件系统类型的磁盘使用情况 ###

`-t` 选项在 df 命令中用来打印特定文件系统类型的信息，用 `-t` 指定文件系统的类型，如下所示：

对于 ext4 :

    [root@linux-world ~]# df -t ext4
    Filesystem            1K-blocks   Used Available Use% Mounted on
    /dev/mapper/vg00-root  17003304 809492  15307028   6% /
    /dev/mapper/vg00-home  14987616  41000  14162232   1% /home
    [root@linux-world ~]#

对于 nfs4 :

    [root@linux-world ~]# df -t nfs4
    Filesystem            1K-blocks      Used Available Use% Mounted on
    192.168.1.5:/opensuse 301545472 266833920  19371008  94% /data
    [root@linux-world ~]#

### 例10：使用 -x 选项排除特定的文件系统类型 ###

`-x` 或 `–exclude-type` 在 df 命令中用来在输出中排出某些文件系统类型。

假设我们想打印除 ext3 外所有的文件系统。

    [root@linux-world ~]# df -x ext3
    Filesystem            1K-blocks      Used Available Use% Mounted on
    /dev/mapper/vg00-root  17003304    809492  15307028   6% /
    devtmpfs                 771876         0    771876   0% /dev
    tmpfs                    777928         0    777928   0% /dev/shm
    tmpfs                    777928      8540    769388   2% /run
    tmpfs                    777928         0    777928   0% /sys/fs/cgroup
    /dev/mapper/vg00-home  14987616     41000  14162232   1% /home
    192.168.1.5:/opensuse 301545472 266834944  19369984  94% /data
    [root@linux-world ~]#

### 例11：在 df 命令的输出中只打印特定的字段 ###

`-output={field_name1,field_name2...}` 选项用于显示 df 命令某些字段的输出。

可用的字段名有: `source`, `fstype`, `itotal`, `iused`, `iavail`, `ipcent`, `size`, `used`, `avail`, `pcent` 和 `target`

    [root@linux-world ~]# df --output=fstype,size,iused
    Type     1K-blocks  IUsed
    ext4      17003304  22275
    devtmpfs    771876    357
    tmpfs       777928      1
    tmpfs       777928    423
    tmpfs       777928     13
    ext4      14987616     15
    ext3        487652    337
    ext3       9948012   1373
    ext3      14987656     11
    nfs4     301545472 451099
    [root@linux-world ~]#

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/11-df-command-examples-in-linux/

作者：[Pradeep Kumar][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
