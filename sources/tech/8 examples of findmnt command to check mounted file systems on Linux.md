Translating
8 examples of findmnt command to check mounted file systems on Linux
================================================================================
### Mounted file systems and devices ###

The more common command to check mounted file systems on linux is the mount command which is used to not only list mounted devices, but also mount and unmount them as and when needed. Here is another nifty command called findmnt, that can be used to take a quick look at what is mounted where and with what options. 

### Install findmnt ###

The findmnt command comes from the packages util-linux which is installed by default on most distros like Ubuntu, Fedora, Debian

    $ aptitude search util-linux
    i   util-linux                     - Miscellaneous system utilities

    $ yum info util-linux

### Using findmnt ###

#### 1. List the file systems ####

Running findmnt without any options would simply list out all the mounted file systems in a tree style layout.

    $ findmnt

![](http://www.binarytides.com/blog/wp-content/uploads/2014/03/findmnt.png)

#### 2. Output in list format ####

The output can be formatted as a plain list, instead of the default tree style, using the l option making it convenient to read.

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

#### 3. df style output ####

Findmnt can produce a df style output reporting free and used disk space with the "-D" or "--df" option.

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

Note that the above option is not available till util-linux version 2.20, which happened to be the latest version on Ubuntu 13.10

#### 4. Read file systems from fstab ####

With the '-s' or '--fstab' option, findmnt shall read file systems only from the /etc/fstab file and /etc/fstab.d directory.

    $ findmnt -s
    TARGET SOURCE                                    FSTYPE OPTIONS
    /      /dev/mapper/fedora-root                   ext4   defaults
    /boot  UUID=18cde604-1c65-4ec8-8a8d-385df50ada3b ext4   defaults
    swap   /dev/mapper/fedora-swap                   swap   defaults

#### 5. Filter filesystems by type ####

Findmnt can print out only specific file systems based on the type, for example ext4.
Multiple system types can be specified separated by a comma.

    $ findmnt -t ext4
    TARGET  SOURCE                  FSTYPE OPTIONS
    /       /dev/mapper/fedora-root ext4   rw,relatime,seclabel,data=ordered
    └─/boot /dev/sda1               ext4   rw,relatime,seclabel,data=ordered

#### 6. Raw output ####

If you prefer a raw style ugly looking output then use the '-r' or '--raw' option.

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

#### 7. Search by source device ####

To find the file system by the source device, specify the device path with or without the '-S' option

    $ findmnt -S /dev/sda1
    TARGET SOURCE    FSTYPE OPTIONS
    /boot  /dev/sda1 ext4   rw,relatime,seclabel,data=ordered

#### 8. Search by mount point ####

To search file system by the mount directory , specify the directory with or without the '-T'/'--target' option.

    $ findmnt -T /
    TARGET SOURCE                  FSTYPE OPTIONS
    /      /dev/mapper/fedora-root ext4   rw,relatime,seclabel,data=ordered

    $ findmnt -T /media/4668484A68483B47
    TARGET                  SOURCE    FSTYPE  OPTIONS
    /media/4668484A68483B47 /dev/sda5 fuseblk rw,nosuid,nodev,relatime,user_id=0

### Summary ###

That was a little introduction to the findmnt command. There are few more options supported by findmnt which can be found in the man page.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-findmnt-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
