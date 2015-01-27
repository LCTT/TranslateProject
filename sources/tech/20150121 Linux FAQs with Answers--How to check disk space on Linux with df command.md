translating by mtunique
Linux FAQs with Answers--How to check disk space on Linux with df command
================================================================================
> **Question**: I know I can use df command to check a file system's disk space usage on Linux. Can you show me practical examples of the df command so that I can make the most out of it?

As far as disk storage is concerned, there are many command-line or GUI-based tools that can tell you about current disk space usage. These tools report on detailed disk utilization in various human-readable formats, such as easy-to-understand summary, detailed statistics, or [intuitive visualization][1]. If you simply want to know how much free disk space is available for different file systems, then df command is probably all you need.

![](https://farm9.staticflickr.com/8632/15505309473_51bffec3f1_b.jpg)

The df command can report on disk utilization of any "mounted" file system. There are different ways this command can be invoked. Here are some **useful** df **command examples**.

### Display in Human-Readable Format ###

By default, the df command reports disk space in 1K blocks, which is not easily interpretable. The "-h" parameter will make df print disk space in a more human-readable format (e.g., 100K, 200M, 3G).

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

### Display Inode Usage ###

When you monitor disk usage, you must watch out for not only disk space, but also "inode" usage. In Linux, inode is a data structure used to store metadata of a particular file, and when a file system is created, a pre-defined number of inodes are allocated. This means that a file system can run out of space not only because big files use up all available space, but also because many small files use up all available inodes. To display inode usage, use "-i" option.

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

### Display Disk Usage Grant Total ###

By default, the df command shows disk utilization of individual file systems. If you want to know the total disk usage over all existing file systems, add "--total" option.

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

### Display File System Types ###

By default, the df command does not show file system type information. Use "-T" option to add file system types to the output.

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

### Include or Exclude a Specific File System Type ###

If you want to know free space of a specific file system type, use "-t <type>" option. You can use this option multiple times to include more than one file system types.

    $ df -t ext2 -t ext4

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583380 312882756  66% /
    /dev/sda1                  233191    100025    120725  46% /boot

To exclude a specific file system type, use "-x <type>" option. You can use this option multiple times as well.

    $ df -x tmpfs

### Display Disk Usage of a Specific Mount Point ###

If you specify a mount point with df, it will report disk usage of the file system mounted at that location. If you specify a regular file (or a directory) instead of a mount point, df will display disk utilization of the file system which contains the file (or the directory).

    $ df /

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583528 312882608  66% /

----------

    $ df /home/dev

----------

    Filesystem              1K-blocks      Used Available Use% Mounted on
    /dev/mapper/ubuntu-root 952893348 591583528 312882608  66% /

### Display Information about Dummy File Systems ###

If you want to display disk space information for all existing file systems including dummy file systems, use "-a" option. Here, dummy file systems refer to pseudo file systems which do not have corresponding physical devices, e.g., tmpfs, cgroup virtual file system or FUSE file systems. These dummy filesystems have size of 0, and are not reported by df without "-a" option.

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

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/visualize-disk-usage-linux.html
