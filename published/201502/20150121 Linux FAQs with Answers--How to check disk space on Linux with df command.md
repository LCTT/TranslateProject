在 Linux 下你所不知道的 df 命令的那些功能
================================================================================
> **问题**: 我知道在Linux上我可以用df命令来查看磁盘使用空间。你能告诉我df命令的实际例子使我可以最大限度得利用它吗？

对于磁盘存储方面，有很多命令行或基于GUI的工具，它可以告诉你关于当前磁盘空间的使用情况。这些工具用各种人们可读的格式展示磁盘利用率的详细信息，比如易于理解的总结，详细的统计信息或直观的[可视化报告][1]。如果你只想知道不同文件系统有多少空闲的磁盘空间，那么df命令可能是你所需要的。

![](https://farm9.staticflickr.com/8632/15505309473_51bffec3f1_b.jpg)

df命令可以展示任何“mounted”文件系统的磁盘利用率。该命令可以用不同的方式调用。这里有一些**有用的** df **命令例子**.

### 用人们可读的方式展示 ###

默认情况下，df命令用1K为块来展示磁盘空间，这看起来不是很直观。“-h”参数使df用更可读的方式打印磁盘空间（例如 100K，200M，3G）。

    $ df -h

----------

    Filesystem               Size  Used Avail Use% Mounted on
    /dev/mapper/ubuntu-root  909G  565G  299G  66% /
    none                     4.0K     0  4.0K   0% /sys/fs/cgroup
    udev                     3.9G  4.0K  3.9G   1% /dev
    tmpfs                    785M  1.2M  784M   1% /run
    none                     5.0M     0  5.0M   0% /run/lock
    none                     3.9G   63M  3.8G   2% /run/shm
    none                     100M   48K  100M   1% /run/user
    /dev/sda1                228M   98M  118M  46% /boot

### 展示Inode使用情况 ###

当你监视磁盘使用情况时，你必须注意的不仅仅是磁盘空间还有“inode”的使用情况。在Linux中，inode是用来存储特定文件的元数据的一种数据结构，在创建一个文件系统时，inode的预先定义数量将被分配。这意味着，**一个文件系统可能耗尽空间不只是因为大文件用完了所有可用空间，也可能是因为很多小文件用完了所有可能的inode**。用“-i”选项展示inode使用情况。

    $ df -i

----------

    Filesystem                Inodes   IUsed    IFree IUse% Mounted on
    /dev/mapper/ubuntu-root 60514304 1217535 59296769    3% /
    none                     1004417      13  1004404    1% /sys/fs/cgroup
    udev                     1000623     552  1000071    1% /dev
    tmpfs                    1004417     608  1003809    1% /run
    none                     1004417      11  1004406    1% /run/lock
    none                     1004417     288  1004129    1% /run/shm
    none                     1004417      28  1004389    1% /run/user
    /dev/sda1                 124496     346   124150    1% /boot

### 展示磁盘总利用率 ###

默认情况下， df命令显示磁盘的单个文件系统的利用率。如果你想知道的所有文件系统的总磁盘使用量，增加“ --total ”选项（见最下面的汇总行）。

    $ df -h --total

----------

    Filesystem               Size  Used Avail Use% Mounted on
    /dev/mapper/ubuntu-root  909G  565G  299G  66% /
    none                     4.0K     0  4.0K   0% /sys/fs/cgroup
    udev                     3.9G  4.0K  3.9G   1% /dev
    tmpfs                    785M  1.2M  784M   1% /run
    none                     5.0M     0  5.0M   0% /run/lock
    none                     3.9G   62M  3.8G   2% /run/shm
    none                     100M   48K  100M   1% /run/user
    /dev/sda1                228M   98M  118M  46% /boot
    total                    918G  565G  307G  65% -

### 展示文件系统类型 ###

默认情况下，df命令不显示文件系统类型信息。用“-T”选项来添加文件系统信息到输出中。

    $ df -T

----------

    Filesystem              Type     1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root ext4     952893348 591583292 312882844  66% /
    none                    tmpfs            4         0         4   0% /sys/fs/cgroup
    udev                    devtmpfs   4002492         4   4002488   1% /dev
    tmpfs                   tmpfs       803536      1196    802340   1% /run
    none                    tmpfs         5120         0      5120   0% /run/lock
    none                    tmpfs      4017668     60176   3957492   2% /run/shm
    none                    tmpfs       102400        48    102352   1% /run/user
    /dev/sda1               ext2        233191    100025    120725  46% /boot

### 包含或排除特定的文件系统类型 ###

如果你想知道特定文件系统类型的剩余空间，用“-t <type>”选项。你可以多次使用这个选项来包含更多的文件系统类型。

    $ df -t ext2 -t ext4

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583380 312882756  66% /
    /dev/sda1                  233191    100025    120725  46% /boot

排除特定的文件系统类型，用“-x <type>”选项。同样，你可以用这个选项多次来排除多种文件系统类型。

    $ df -x tmpfs

### 显示一个具体的挂载点磁盘使用情况 ###

如果你用df指定一个挂载点，它将报告挂载在那个地方的文件系统的磁盘使用情况。如果你指定一个普通文件（或一个目录）而不是一个挂载点，df将显示包含这个文件（或目录）的文件系统的磁盘利用率。

    $ df /

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583528 312882608  66% /

----------

    $ df /home/dev

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583528 312882608  66% /

### 显示虚拟文件系统的信息 ###

如果你想显示所有已经存在的文件系统（包括虚拟文件系统）的磁盘空间信息，用“-a”选项。这里，虚拟文件系统是指没有相对应的物理设备的假文件系统，例如，tmpfs，cgroup虚拟文件系统或FUSE文件安系统。这些虚拟文件系统大小为0，不用“-a”选项将不会被报告出来。

    $ df -a

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591578716 312887420  66% /
    proc                            0         0         0    - /proc
    sysfs                           0         0         0    - /sys
    none                            4         0         4   0% /sys/fs/cgroup
    none                            0         0         0    - /sys/fs/fuse/connections
    none                            0         0         0    - /sys/kernel/debug
    none                            0         0         0    - /sys/kernel/security
    udev                      4002492         4   4002488   1% /dev
    devpts                          0         0         0    - /dev/pts
    tmpfs                      803536      1196    802340   1% /run
    none                         5120         0      5120   0% /run/lock
    none                      4017668     58144   3959524   2% /run/shm
    none                       102400        48    102352   1% /run/user
    none                            0         0         0    - /sys/fs/pstore
    cgroup                          0         0         0    - /sys/fs/cgroup/cpuset
    cgroup                          0         0         0    - /sys/fs/cgroup/hugetlb
    /dev/sda1                  233191    100025    120725  46% /boot
    vmware-vmblock                  0         0         0    - /run/vmblock-fuse

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-disk-space-linux-df-command.html

译者：[mtunique](https://github.com/mtunique)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/visualize-disk-usage-linux.html
