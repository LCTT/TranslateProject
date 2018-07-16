检查linux中硬盘损坏的扇区和区块
================================================================================
**badblocks**是linux及其类似的操作系统中，扫描检查硬盘和外部设备损坏扇区的命令工具。损坏的扇区或者损坏的区块是硬盘中因为永久损坏或者是操作系统不能读取的空间。

Badblocks命令可以探测硬盘中所有损坏的扇区或者区块并将结果保存在一个文本文档中，这样，我们就可以使用**e2fsck**命令来配置操作系统不在这些损坏的扇区中存储数据。

### 步骤:1 使用fdisk命令识别硬盘信息 ### 

    # sudo fdisk -l 

### 步骤:2  扫描硬盘的损坏扇区或区块 ###

    # sudo badblocks -v /dev/sdb > /tmp/bad-blocks.txt

只需将“/dev/sdb”替换为自己机器的硬盘/分区。执行完成上述命令后，一个名为“bad-blocks”文本文档将会在/tmp下创建，它将包含所有的损坏区块。

例如：

![](http://www.linuxtechi.com/wp-content/uploads/2014/08/badblocks.png)

### 步骤:3 提示 操作系统不要使用损坏区块存储 ###

扫描完成后，如果损坏区块被发现了，然后通过e2fsck命令使用“bad-blocks.txt”，强迫操作系统不使用这些损坏的区块存储数据。

    # sudo e2fsck -l /tmp/bad-blocks.txt  /dev/sdb

注意：在运行e2fsck命令前，请保证设备没有被挂载。

关于badblocks和e2fsck命令的更多帮助，请参考下列man页面

    # man badblocks
    # man e2fsck  

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/check-hard-drive-for-bad-sector-linux/

作者：[Pradeep Kumar][a]
译者：[Vic___](http://www.vicyu.net)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
