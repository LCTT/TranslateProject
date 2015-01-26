How to Add a New Hard Disk Without Rebooting on CentOS 7/ RHEL 7
================================================================================
Normally when you have added new storage to a running Virtual machine, you probably won’t see the new storage automatically. This is because the SCSI bus to which the storage devices are connected needs to be rescanned to make the new hardware visible. The is one simple command to rescan the SCSI Bus and add SCSI Devices. The following steps has been tested on CentOS 7 and RHEL 7.

1. Add the new 20GB from the ESXi or vCenter :

![](http://www.ehowstuff.com/wp-content/uploads/2015/01/Create-new-LVM-CentOS7-1.png)

2. Show current disk and partition :

    [root@centos7 ~]# fdisk -l

----------

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

3. Identify host bus number :

    [root@centos7 ~]# ls /sys/class/scsi_host/
    host0  host1  host2

4. Rescan the SCSI Bus to Add a SCSI Devices :

    [root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host0/scan
    [root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host1/scan
    [root@centos7 ~]# echo "- - -" > /sys/class/scsi_host/host2/scan

5. Verify the disk and partiton and make sure 20GB has been added. In this case, the following line appeared “Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors” and confirmed that 20GB has been added without reboot the server :

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

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-add-a-new-hard-disk-without-rebooting-on-centos-7-rhel-7/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/