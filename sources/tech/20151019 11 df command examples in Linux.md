translation by strugglingyouth
11 df command examples in Linux
================================================================================
df (disk free) command is used to display disk usage of the file system. By default df command shows the file system usage in 1K blocks for all the current mounted file system, if you want to display the output of df command in human readable format , use -h option like “df -h”.

In this post we will discuss 11 different examples of ‘**df**‘ command in Linux

Basic Format of df command in Linux

    # df {options} {mount_point_of_filesystem}

Options used in df command :

![](http://www.linuxtechi.com/wp-content/uploads/2015/10/df-command-options.jpg)

Sample Output of df :

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

### Example:1 List disk usage of all the file system using ‘-a’ ###

when we use ‘-a’ option in df command , it will display disk usage of all the file systems.

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

### Example:2 Display the output of df command in human readable format. ###

Using ‘-h’ option in df command , output can be displayed in human readable format ( e.g 5K , 500M & 5G )

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

### Example:3 Display Space usage of particular file system ###

Suppose we want to print space usage of /sap file system,

    [root@linux-world ~]# df -h /sap/
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/mapper/vg00-sap   15G   37M   14G   1% /sap
    [root@linux-world ~]#

### Example:4 Print file system type of all mounted file systems ###

‘**-T**’ is used in df command to display the file system type in the output.

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

### Example:5 Print disk usage of file systems in block-size. ###

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

### Example:6 Display inodes information of file system. ###

‘**-i**’ option in df command is used to display inode information of the file system

inodes info of all the file system :

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

inodes info of particular file system :

    [root@linux-world ~]# df -i /sap/
    Filesystem           Inodes IUsed  IFree IUse% Mounted on
    /dev/mapper/vg00-sap 960992    11 960981    1% /sap
    [root@linux-world ~]#

### Example:7 Print grant total space usage of all file system. ###

‘–total‘ option in df command is used to display the grant total of disk usage of all the file system.

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

### Example:8 Print only Local file system space usage info. ###

Suppose network file system also mounted on linux box and but we want to display local file system information only, this can be achieved by using ‘-l‘ option in df command.

![](http://www.linuxtechi.com/wp-content/uploads/2015/10/nfs4-fs-mount.jpg)

Limiting to local file system :

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

### Example:9 Print Disk Space information of particular file system type. ###

‘**-t**’ option in df command is used to print information of particular file system type, after ‘-t’ specify the file system type, example is shown below :

for ext4 :

    [root@linux-world ~]# df -t ext4
    Filesystem            1K-blocks   Used Available Use% Mounted on
    /dev/mapper/vg00-root  17003304 809492  15307028   6% /
    /dev/mapper/vg00-home  14987616  41000  14162232   1% /home
    [root@linux-world ~]#

for nfs4 :

    [root@linux-world ~]# df -t nfs4
    Filesystem            1K-blocks      Used Available Use% Mounted on
    192.168.1.5:/opensuse 301545472 266833920  19371008  94% /data
    [root@linux-world ~]#

### Example:10 Exclude Particular file system type using ‘-x’ option ###

“**-x** or **–exclude-type**” is used to exclude the certain file system type in the output of df command.

Let suppose we want to print all the file systems excluding ext3 file system.

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

### Example:11 Print only certain fields in output of df command. ###

‘**–output={field_name1,field_name2….}**‘ option is used to display the certain fields in df command output.

Valid field names are: ‘source’, ‘fstype’, ‘itotal’, ‘iused’, ‘iavail’, ‘ipcent’, ‘size’, ‘used’, ‘avail’, ‘pcent’ and ‘target’

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
