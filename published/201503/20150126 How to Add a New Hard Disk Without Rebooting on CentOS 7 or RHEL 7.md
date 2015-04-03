如何不用重启在CentOS 7/ RHEL 7虚拟机中添加一块新硬盘
================================================================================
通常在你在虚拟机中添加一块新硬盘时，你可能会看到新硬盘没有自动加载。这是因为连接到硬盘的SCSI总线需要重新扫描来使得新硬盘可见。这里有一个简单的命令来重新扫描SCSI总线和SCSI设备。下面这几步在CentOS 7 和RHEL 7 中测试过。

1. 在ESXi或者vCenter中添加一块新的20G硬盘：

	![](http://www.ehowstuff.com/wp-content/uploads/2015/01/Create-new-LVM-CentOS7-1.png)

2. 显示当前磁盘分区：

    	[root@centos7 ~]# fdisk -l

	----------

    ```
    Disk /dev/sda: 32.2 GB, 32212254720 bytes, 62914560 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk label type: dos
    Disk identifier: 0x0006b96a
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sda1   *        2048     1026047      512000   83  Linux
    /dev/sda2         1026048    62914559    30944256   8e  Linux LVM
    
    Disk /dev/mapper/centos-swap: 2147 MB, 2147483648 bytes, 4194304 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/mapper/centos-root: 29.5 GB, 29536288768 bytes, 57688064 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
	```

3. 确定主机总线号

    	[root@centos7 ~]# ls /sys/class/scsi_host/
    	host0  host1  host2

4. 重新扫描SCSI总线来添加设备

    	[root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host0/scan
   	 	[root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host1/scan
    	[root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host2/scan

5. 验证磁盘和分区并确保20GB硬盘已经添加了。在本例中，出现了下面这行 “`Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors`” 并且可以确认没有重启服务器就添加了新盘：

	```
    [root@centos7 ~]# fdisk -l
    
    Disk /dev/sda: 32.2 GB, 32212254720 bytes, 62914560 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk label type: dos
    Disk identifier: 0x0006b96a
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sda1   *        2048     1026047      512000   83  Linux
    /dev/sda2         1026048    62914559    30944256   8e  Linux LVM
    
    Disk /dev/mapper/centos-swap: 2147 MB, 2147483648 bytes, 4194304 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/mapper/centos-root: 29.5 GB, 29536288768 bytes, 57688064 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    
    
    Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
	```
--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-add-a-new-hard-disk-without-rebooting-on-centos-7-rhel-7/

作者：[skytech][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/