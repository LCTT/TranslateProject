Mhddfs：将多个小分区合并成一个大的虚拟存储
================================================================================

让我们假定你有30GB的电影，并且你有3个驱动器，每个的大小为20GB。那么，你会怎么来存放东西呢？

很明显，你可以将你的视频分割成2个或者3个不同的卷，并将它们手工存储到驱动器上。这当然不是一个好主意，它成了一项费力的工作，它需要你手工干预，而且花费你大量时间。

另外一个解决方案是创建一个 [RAID磁盘阵列][1]。然而，RAID在存储可靠性，磁盘空间可用性差等方面声名狼藉。另外一个解决方案，就是mhddfs。

![Combine Multiple Partitions in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Combine-Multiple-Partitions-in-Linux.png)

*Mhddfs——在Linux中合并多个分区*

mhddfs是一个用于Linux的设备驱动，它可以将多个挂载点合并到一个虚拟磁盘中。它是一个基于FUSE的驱动，提供了一个用于大数据存储的简单解决方案。它可以将所有小文件系统合并，创建一个单一的大虚拟文件系统，该文件系统包含其成员文件系统的所有内容，包括文件和空闲空间。

#### 你为什么需要Mhddfs？ ####

你的所有存储设备会创建为一个单一的虚拟池，它可以在启动时被挂载。这个小工具可以智能地照看并处理哪个存储满了，哪个存储空着，以及将数据写到哪个存储中。当你成功创建虚拟驱动器后，你可以使用[SAMBA][2]来共享你的虚拟文件系统。你的客户端将在任何时候都看到一个巨大的驱动器和大量的空闲空间。

#### Mhddfs特性 ####

- 获取文件系统属性和系统信息。
- 设置文件系统属性。
- 创建、读取、移除和写入目录和文件。
- 在单一设备上支持文件锁和硬链接。

|mhddfs的优点|mhddfs的缺点|
|-----------|-----------|
|适合家庭用户|mhddfs驱动没有内建在Linux内核中 |
|运行简单|运行时需要大量处理能力|
|没有明显的数据丢失|没有冗余解决方案|
|不需要分割文件|不支持移动硬链接|
|可以添加新文件到组成的虚拟文件系统||
|可以管理文件保存的位置||
|支持扩展文件属性||

### Linux中安装Mhddfs ###

在Debian及其类似的移植系统中，你可以使用下面的命令来安装mhddfs包。

    # apt-get update && apt-get install mhddfs

![Install Mhddfs on Debian based Systems](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Mhddfs-on-Ubuntu.png)

*安装Mhddfs到基于Debian的系统中*

在RHEL/CentOS Linux系统中，你需要开启[epel仓库][3]，然后执行下面的命令来安装mhddfs包。

    # yum install mhddfs

在Fedora 22及以上系统中，你可以通过dnf包管理来获得它，就像下面这样。

    # dnf install mhddfs

![Install Mhddfs on Fedora](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Mhddfs-on-Fedora.png)

*安装Mhddfs到Fedora*

如果万一mhddfs包不能从epel仓库获取到，那么你需要解决下面的依赖，然后像下面这样来编译源码并安装。

- FUSE头文件
- GCC
- libc6头文件
- uthash头文件
- libattr1头文件（可选）

接下来，只需从下面建议的地址下载最新的源码包，然后编译。

    # wget http://mhddfs.uvw.ru/downloads/mhddfs_0.1.39.tar.gz
    # tar -zxvf mhddfs*.tar.gz
    # cd mhddfs-0.1.39/
    # make

你应该可以在当前目录中看到mhddfs的二进制文件，以root身份将它移动到/usr/bin/和/usr/local/bin/中。

    # cp mhddfs /usr/bin/ 
    # cp mhddfs /usr/local/bin/

一切搞定，mhddfs已经可以用了。

### 我怎么使用Mhddfs？ ###

1、 让我们看看当前所有挂载到我们系统中的硬盘。
    
    $ df -h

![Check Mounted Devices](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Mounted-Devices.gif)

**样例输出**

    Filesystem      Size  Used Avail Use% Mounted on
    
    /dev/sda1       511M  132K  511M   1% /boot/efi
    /dev/sda2       451G   92G  336G  22% /
    /dev/sdb1       1.9T  161G  1.7T   9% /media/avi/BD9B-5FCE
    /dev/sdc1       555M  555M     0 100% /media/avi/Debian 8.1.0 M-A 1

注意这里的‘挂载点’名称，我们后面会使用到它们。

2、 创建目录‘/mnt/virtual_hdd’，所有这些文件系统将会在这里组织到一起。
    
    # mkdir /mnt/virtual_hdd

3、 然后，挂载所有文件系统。你可以通过root或者FUSE组中的某个用户来完成。

    # mhddfs /boot/efi, /, /media/avi/BD9B-5FCE/, /media/avi/Debian\ 8.1.0\ M-A\ 1/ /mnt/virtual_hdd  -o allow_other

![Mount All File System in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Mount-All-File-System-in-Linux.png)

*在Linux中挂载所有文件系统*

**注意**：这里我们使用了所有硬盘的挂载点名称，很明显，你的挂载点名称会有所不同。也请注意“-o allow_other”选项可以让这个虚拟文件系统让其它所有人可见，而不仅仅是创建它的人。

4、 现在，运行“df -h”来看看所有文件系统。它应该包含了你刚才创建的那个。

        $ df -h

![Verify Virtual File System Mount](http://www.tecmint.com/wp-content/uploads/2015/08/Verify-Virtual-File-System.png)

*验证虚拟文件系统挂载*

你可以像对已挂在的驱动器那样给虚拟文件系统应用所有的选项。

5、 要在每次系统启动创建这个虚拟文件系统，你应该以root身份添加下面的这行代码（在你那里会有点不同，取决于你的挂载点）到/etc/fstab文件的末尾。

    mhddfs# /boot/efi, /, /media/avi/BD9B-5FCE/, /media/avi/Debian\ 8.1.0\ M-A\ 1/ /mnt/virtual_hdd fuse defaults,allow_other 0 0

6、 如果在任何时候你想要添加/移除一个新的驱动器到/从虚拟硬盘，你可以挂载一个新的驱动器，拷贝/mnt/vritual_hdd的内容，卸载卷，弹出你要移除的的驱动器并/或挂载你要包含的新驱动器。使用mhddfs命令挂载全部文件系统到Virtual_hdd下，这样就全部搞定了。

#### 我怎么卸载Virtual_hdd？ ####

卸载virtual_hdd相当简单，就像下面这样

    # umount /mnt/virtual_hdd

![Unmount Virtual Filesystem](http://www.tecmint.com/wp-content/uploads/2015/08/Unmount-Virtual-Filesystem.png)

*卸载虚拟文件系统*

注意，是umount，而不是unmount，很多用户都输错了。

到现在为止全部结束了。我正在写另外一篇文章，你们一定喜欢读的。到那时，请保持连线。请在下面的评论中给我们提供有用的反馈吧。请为我们点赞并分享，帮助我们扩散。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/combine-partitions-into-one-in-linux-using-mhddfs/

作者：[Avishek Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/understanding-raid-setup-in-linux/
[2]:http://www.tecmint.com/mount-filesystem-in-linux/
[3]:https://linux.cn/article-2324-1.html
