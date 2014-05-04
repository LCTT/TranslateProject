检查Linux中已挂载的文件系统的findmnt命令的8个例子
================================================================================
### 已挂载的文件系统和设备 ###

linux中更常用的检查已挂载的文件系统的是mount命令，不仅用于列出已挂载的设备，而且可以在需要的时候挂载和卸载。这有一个叫做findmnt的俏皮的命令，它可以用于快速查看挂载位置和选项。

### 安装findmnt ###

findmnt命令来自util-linux软件包，默认安装在大多数像Ubuntu，Fedora，Debian发行版 

    $ aptitude search util-linux
    i   util-linux                     - Miscellaneous system utilities

    $ yum info util-linux

### 使用findmnt ###

#### 1. 列出文件系统 ####

执行没有任何选项的findmnt将简单的在树形结构中列出所有已挂载的文件系统。

    $ findmnt

![](http://www.binarytides.com/blog/wp-content/uploads/2014/03/findmnt.png)

#### 2. 以列表形式输出 ####

输出可以格式化为一个简单的列表，而不是默认的树形结构，使用l（键盘u和o中间那个，不是数字1）选项使它方便阅读。

    $ findmnt -l
    TARGET                   SOURCE                              FSTYPE  OPTIONS
    /sys                     sysfs                               sysfs   rw,nosu
    /proc                    proc                                proc    rw,nosu
    /dev                     udev                                devtmpf rw,rela
    /dev/pts                 devpts                              devpts  rw,nosu
    /run                     tmpfs                               tmpfs   rw,nosu
    /                        /dev/disk/by-uuid/6fa5a72a-ba26-4588-a103-74bb6b33a763
                                                                 ext4    rw,rela
    /sys/fs/cgroup                                               tmpfs   rw,rela
    /sys/fs/fuse/connections                                     fusectl rw,rela
    /sys/kernel/debug                                            debugfs rw,rela
    /sys/kernel/security                                         securit rw,rela
    /run/lock                                                    tmpfs   rw,nosu
    /run/shm                                                     tmpfs   rw,nosu
    /run/user                                                    tmpfs   rw,nosu
    /sys/fs/pstore                                               pstore  rw,rela
    /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
                             /dev/sda8                           ext4    rw,nosu
    /media/4668484A68483B47  /dev/sda5                           fuseblk rw,nosu
    /proc/sys/fs/binfmt_misc binfmt_misc                         binfmt_ rw,nosu
    /sys/fs/cgroup/systemd   systemd                             cgroup  rw,nosu
    /run/user/1000/gvfs      gvfsd-fuse                          fuse.gv rw,nosu

#### 3. df格式输出 ####

Findmnt可以用“-D”或“-df”选项创造一个df格式的输出报告空闲和已用磁盘空间。

    $ findmnt -D
    SOURCE                  FSTYPE       SIZE   USED   AVAIL USE% TARGET
    devtmpfs                devtmpfs   994.2M      0  994.2M   0% /dev
    selinuxfs               selinuxfs       0      0       0    - /sys/fs/selinux
    tmpfs                   tmpfs     1001.5M    68K 1001.4M   0% /dev/shm
    tmpfs                   tmpfs     1001.5M   724K 1000.8M   0% /run
    tmpfs                   tmpfs     1001.5M      0 1001.5M   0% /sys/fs/cgroup
    /dev/mapper/fedora-root ext4         6.5G   5.3G  811.6M  82% /
    tmpfs                   tmpfs     1001.5M    60K 1001.5M   0% /tmp
    /dev/sda1               ext4       476.2M 107.7M  339.6M  23% /boot

注意以上选项直到util-linux2.20版本都不可用，碰巧的是最新版在Ubuntu13.10

#### 4. 从fstab读取文件系统 ####

使用“-s”或“-fstab”选项，findmnt将只从/etc/fstab文件和/etc/fstab.d目录读取文件系统。

    $ findmnt -s
    TARGET SOURCE                                    FSTYPE OPTIONS
    /      /dev/mapper/fedora-root                   ext4   defaults
    /boot  UUID=18cde604-1c65-4ec8-8a8d-385df50ada3b ext4   defaults
    swap   /dev/mapper/fedora-swap                   swap   defaults

#### 5. 通过类型过滤文件系统 ####

Findmnt可以打印出只基于类型的特定的文件系统，例如ext4，多个系统类型可以指定一个逗号分隔。

    $ findmnt -t ext4
    TARGET  SOURCE                  FSTYPE OPTIONS
    /       /dev/mapper/fedora-root ext4   rw,relatime,seclabel,data=ordered
    └─/boot /dev/sda1               ext4   rw,relatime,seclabel,data=ordered

#### 6. 原始输出 ####

如果你喜欢原始风格难看的输出，那么使用“-r”或“--raw”选项。

    $ findmnt --raw
    TARGET SOURCE FSTYPE OPTIONS
    /sys sysfs sysfs rw,nosuid,nodev,noexec,relatime
    /proc proc proc rw,nosuid,nodev,noexec,relatime
    /dev udev devtmpfs rw,relatime,size=4069060k,nr_inodes=1017265,mode=755
    /dev/pts devpts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000
    /run tmpfs tmpfs rw,nosuid,noexec,relatime,size=816716k,mode=755
    / /dev/disk/by-uuid/6fa5a72a-ba26-4588-a103-74bb6b33a763 ext4 rw,relatime,errors=remount-ro,data=ordered
    /sys/fs/cgroup  tmpfs rw,relatime,size=4k,mode=755
    /sys/fs/fuse/connections  fusectl rw,relatime
    /sys/kernel/debug  debugfs rw,relatime
    /sys/kernel/security  securityfs rw,relatime
    /run/lock  tmpfs rw,nosuid,nodev,noexec,relatime,size=5120k
    /run/shm  tmpfs rw,nosuid,nodev,relatime
    /run/user  tmpfs rw,nosuid,nodev,noexec,relatime,size=102400k,mode=755
    /sys/fs/pstore  pstore rw,relatime
    /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1 /dev/sda8 ext4 rw,nosuid,nodev,relatime,errors=remount-ro,data=ordered
    /media/4668484A68483B47 /dev/sda5 fuseblk rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other,blksize=4096
    /proc/sys/fs/binfmt_misc binfmt_misc binfmt_misc rw,nosuid,nodev,noexec,relatime
    /sys/fs/cgroup/systemd systemd cgroup rw,nosuid,nodev,noexec,relatime,name=systemd
    /run/user/1000/gvfs gvfsd-fuse fuse.gvfsd-fuse rw,nosuid,nodev,relatime,user_id=1000,group_id=1000

That looks very neat

#### 7. 通过源设备查找 ####

通过源设备查找文件系统，指定设备路径包括/不包括“-S”选项。

    $ findmnt -S /dev/sda1
    TARGET SOURCE    FSTYPE OPTIONS
    /boot  /dev/sda1 ext4   rw,relatime,seclabel,data=ordered

#### 8. 通过挂载点查找 ####

通过挂载目录查找文件系统，指定目录包括/不包括“-T /--target”选项。

    $ findmnt -T /
    TARGET SOURCE                  FSTYPE OPTIONS
    /      /dev/mapper/fedora-root ext4   rw,relatime,seclabel,data=ordered

    $ findmnt -T /media/4668484A68483B47
    TARGET                  SOURCE    FSTYPE  OPTIONS
    /media/4668484A68483B47 /dev/sda5 fuseblk rw,nosuid,nodev,relatime,user_id=0

### 总结 ###

这是一个findmnt命令的简要介绍。findmnt更多的选项可以在man手册页中找到。

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-findmnt-command/

译者：[Vito](https://github.com/vito-L) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
