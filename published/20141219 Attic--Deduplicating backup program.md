Attic——删除重复数据的备份程序
================================================================================
Attic是一个Python写的删除重复数据的备份程序，其主要目标是提供一种高效安全的数据备份方式。重复数据消除技术的使用使得Attic适用于日常备份，因为它可以只存储那些修改过的数据。

### Attic特性 ###

#### 空间高效存储 ####

可变块大小重复数据消除技术用于减少检测到的冗余数据存储字节数量。每个文件被分割成若干可变长度组块，只有那些从没见过的组合块会被压缩并添加到仓库中。

#### 可选数据加密 ####

所有数据可以使用256位AES加密进行保护，并使用HMAC-SHA256验证数据完整性和真实性。

#### 离场备份 ####

Attic可以通过SSH将数据存储到安装有Attic的远程主机上。

#### 备份可作为文件系统挂载 ####

备份归档可作为用户空间文件系统挂载，用于便捷地验证和恢复备份。

#### 安装attic到ubuntu 14.10 ####

打开终端并运行以下命令

    sudo apt-get install attic

### 使用Attic ###

#### 手把手实例教学 ####

在进行备份之前，首先要对仓库进行初始化：

    $ attic init /somewhere/my-repository.attic

将~/src和~/Documents目录备份到名为Monday的归档：

    $ attic create /somwhere/my-repository.attic::Monday ~/src ~/Documents

第二天创建一个新的名为Tuesday的归档：

    $ attic create --stats /somwhere/my-repository.attic::Tuesday ~/src ~/Documents

该备份将更快些，也更小些，因为只有之前从没见过的新数据会被存储。--stats选项会让Attic输出关于新创建的归档的统计数据，比如唯一数据（不和其它归档共享）的数量：

	归档名：Tuesday
	归档指纹：387a5e3f9b0e792e91ce87134b0f4bfe17677d9248cb5337f3fbf3a8e157942a
	开始时间： Tue Mar 25 12:00:10 2014
	结束时间： Tue Mar 25 12:00:10 2014
	持续时间： 0.08 seconds
	文件数量： 358
            最初大小    压缩后大小  重复数据删除后大小
	本归档： 57.16 MB    46.78 MB    151.67 kB
	所有归档：114.02 MB  93.46 MB    44.81 MB

列出仓库中所有归档：

    $ attic list /somewhere/my-repository.attic

	Monday Mon Mar 24 11:59:35 2014
	Tuesday Tue Mar 25 12:00:10 2014

列出Monday归档的内容：

    $ attic list /somewhere/my-repository.attic::Monday

	drwxr-xr-x user group 0 Jan 06 15:22 home/user/Documents
	-rw-r--r-- user group 7961 Nov 17 2012 home/user/Documents/Important.doc

恢复Monday归档：

    $ attic extract /somwhere/my-repository.attic::Monday

通过手动删除Monday归档恢复磁盘空间：

    $ attic delete /somwhere/my-backup.attic::Monday

详情请查阅[Attic文档][1]。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/attic-deduplicating-backup-program.html

作者：[ruchi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:https://attic-backup.org/index.html
