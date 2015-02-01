Linux 和类 Unix 系统上5个最佳开源备份工具
================================================================================
一个好的备份最基本的目的就是为了能够从一些错误中恢复：

- 人为的失误
- 磁盘阵列或是硬盘故障
- 文件系统崩溃
- 数据中心被破坏等等。

所以，我为大家罗列了一些开源的软件备份工具。

### 当为一个企业选择备份工具的时候，你都考虑什么呢？ ###

确定你正在部署的软件具有下面的特性

1. **开源软件** - 你务必要选择那些源码可以免费获得，并且可以修改的软件。确信可以恢复你的数据，即使是软件供应商/项目停止继续维护这个软件，或者是拒绝继续为这个软件提供补丁。

2. **跨平台支持** -  确定备份软件可以很好的运行各种需要部署的桌面操作系统和服务器系统。 

3. **数据格式** - 一种开放的数据格式可以让你能够恢复数据，即使是供应商或是项目停止对软件的支持。

4. **自动转换** - 自动转换本来是没什么，除了对于各种备份设备，包括图书馆，近线存储和自动加载，自动转换可以自动完成一些任务，包括加载，挂载和标签备份像磁带这些媒体设备。
 
5. **备份介质** - 确定你可以备份到磁带，硬盘，DVD 和像 AWS 这样的云存储。

6. **加密数据流** - 确定所有客户端到服务器的传输都被加密，保证在 LAN/WAN/Internet 中传输的安全性。

7. **数据库支持** - 确定备份软件可以备份到数据库，像MySQL 或是 Oracle。

8. **备份可以跨越多个卷** - 备份软件(转储文件时)可以把每个备份文件分成几个部分，允许将每个部分存在于不同的卷。这样可以保证一些数据量很大的备份(像100TB的文件)可以被存储在一些单个容量较小的设备中，比如说像硬盘和磁盘卷。

9. **VSS (卷影复制)** - 这是[微软的卷影复制服务（VSS）][1]，通过创建数据的快照来备份。确定备份软件支持VSS的MS-Windows 客户端/服务器。

10. **重复数据删除** - 这是一种数据压缩技术，用来消除重复数据的副本（比如，图片）。

11. **许可证和成本** - 确定你对备份软件所用的[许可证了解和明白其使用方式][3]。

12. **商业支持** - 开源软件可以提供社区支持（像邮件列表和论坛）和专业的支持（如发行版提供额外的付费支持）。你可以使用付费的专业支持为你提供培训和咨询。 

13. **报告和警告** - 最后，你必须能够看到备份的报告，当前的工作状态，也能够在备份出错的时候提供警告。

### Bacula - 一个应用于多元化异构网络的客户端服务器备份工具 ###

我个人应用这个软件来管理备份和通过网络来恢复系统，包括Linux， OSX， 和Windows。你可以通过CLI， GUI， 或者Web界面来配置Bacula。

![](http://s0.cyberciti.org/uploads/cms/2014/11/bacula-network-backup.jpg)

- 操作系统：支持跨平台运行。
- 备份级别：完全，差异，增量，合并。
- 数据格式：支持自定义且完全开放。
- 自动转换：支持。
- 备份介质：支持磁带，磁盘和DVD。
- 加密数据流：支持。
- 数据库：支持MSSQL、PostgreSQL、Oracle 。
- 跨卷备份：支持
- VSS（卷影复制）：支持。
- 许可：Affero General Public License v3.0。
- 下载链接：[bacula.org][4]

### Amanda - 又一个客户端服务器备份工具 ###

AMANDA 是 Advanced Maryland Automatic Network Disk Archiver 的缩写。它允许系统管理员创建一个单独的备份服务器来将网络上的其他主机的数据备份到磁带驱动器、硬盘或者是自动换盘器。

- 操作系统：支持跨平台运行。
- 备份级别：完全，差异，增量，合并。
- 数据格式：开放（可以通过tar等工具恢复）。
- 自动转换：支持。
- 备份介质：支持磁带，磁盘和DVD。
- 加密数据流：支持。
- 数据库：支持MSSQL, Oracle。
- 跨卷备份：支持。
- VSS（卷影复制）：支持。
- 许可：GPL, LGPL, Apache, Amanda License。
- 下载链接：[amanda.org][5]

### Backupninja - 轻量级备份系统 ###

Backupninja 是一个简单易用的备份系统。你可以简单的拖放一个配置文件到 /etc/backup.d/ 目录来备份到多个主机。

![](http://s0.cyberciti.org/uploads/cms/2014/11/ninjabackup-helper-script.jpg)

- 操作系统：支持Linux，Unix。
- 备份级别：支持完全，差异备份（rsync + hard 链接）
- 数据格式：开放
- 自动转换：N/A。(注：N/A = Not Applicable)。
- 备份介质：磁盘，DVD，CD，ISO 镜像。
- 加密数据流：支持（ssh）和[通过duplicity远程加密备份][6]。
- 数据库：支持MySQL，PostgreSQL，OpenLDAP 和subversion 或trac。
- 跨卷备份：？？
- VSS（卷影复制）:？？
- 许可：GPL
- 下载链接：[riseup.net][7]

### Backuppc - 高效的客户端服务器备份工具###

Backuppc 可以用来备份基于Linux 和Windows 系统的主服务器硬盘。它配备了一个巧妙的池计划来最大限度的减少磁盘储存、磁盘 I/O 和网络I/O。

![](http://s0.cyberciti.org/uploads/cms/2014/11/BackupPCServerStatus.jpg)

- 操作系统：支持Linux，Unix 和Windows。
- 备份级别：支持完全和增量备份（rsync +hard 链接和pooling 计划）
- 数据格式：开放。
- 自动转换：N/A。
- 备份介质：磁盘和磁盘阵列。
- 加密数据流：支持。
- 数据库：支持（通过Shell 脚本）
- 跨卷备份：？？
- VSS（卷影复制）:？？
- 许可：GPL。
- 下载链接：[backuppc.sourceforge.net][8]

### UrBackup - 最容易配置的客户端服务器系统 ###

UrBackup 是一个非常容易配置的开源客户端服务器备份系统，通过镜像 方式和文件备份的组合完成了数据安全性和快速的恢复。磁盘卷备份可以使用可引导 CD 或U盘，通过Web界面或Windows资源管理器来恢复你的文件（硬恢复）。一个 Web 界面使得配置你自己的备份服务变得非常简单。

![](http://s0.cyberciti.org/uploads/cms/2014/11/urbackup.jpg)

- 操作系统：支持Linux，FreeBSD，Unix，Windows 和少数基于NAS 的Linux操作系统，客户端只支持Linux 和Windows 操作系统。
- 备份级别：支持完全和增量备份。
- 数据格式：开放。
- 自动转换：N/A。
- 备份介质：磁盘，磁盘阵列和DVD。
- 加密数据流：支持。
- 数据库：？？
- 跨卷备份：？？
- VSS（卷影复制）：？？
- 许可：GPL v3+
- 下载链接：[urbackup.org][9]

### 其他供你考虑的一些极好用的开源备份软件 ###

Amanda，Bacula 和上面所提到的这些软件功能都很丰富，但是对于一些小的网络或者是单独的服务器来说配置比较复杂。我建议你学习和使用一下的下面这些备份软件：

1. [Rsnapshot][10] - 我建议用这个作为对本地和远程的文件系统快照工具。看看[在Debian 和Ubuntu linux][11]和[基于CentOS，RHEL 的操作系统][12]怎么设置和使用这个工具。
2. [rdiff-backup][13] - 另一个好用的类Unix 远程增量备份工具。
3. [Burp][14] - Burp 是一个网络备份和恢复程序。它使用了librsync来节省网络流量和节省每个备份占用的空间。它也使用了VSS（卷影复制服务），在备份Windows计算机时进行快照。
4. [Duplicity][15] - 伟大的加密和高效的备份类Unix操作系统。查看如何[安装Duplicity来加密云备份][16]来获取更多的信息。
5. [SafeKeep][17] - SafeKeep是一个中心化的、易于使用的备份应用程序，结合了镜像和增量备份最佳功能的备份应用程序。
6. [DREBS][18] - DREBS 是EBS定期快照的工具。它被设计成在EBS快照所连接的EC2主机上运行。
7. 古老的unix 程序，像rsync， tar， cpio， mt 和dump。

###结论###

我希望你会发现这篇有用的文章来备份你的数据。不要忘了验证你的备份和创建多个数据备份。注意，磁盘阵列并不是一个备份解决方案！使用任何一个上面提到的程序来备份你的服务器、桌面和笔记本电脑和私人的移动设备。如果你知道其他任何开源的备份软件我没有提到的，请分享在评论里。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/awesome-backup-software-for-linux-unix-osx-windows-systems/

作者：[nixCraft][a]
译者：[barney-ro](https://github.com/barney-ro)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:http://technet.microsoft.com/en-us/library/cc785914(v=ws.10).aspx
[2]:http://en.wikipedia.org/wiki/Data_deduplication
[3]:http://opensource.org/licenses
[4]:http://www.bacula.org/
[5]:http://www.amanda.org/
[6]:http://www.cyberciti.biz/faq/duplicity-installation-configuration-on-debian-ubuntu-linux/
[7]:https://labs.riseup.net/code/projects/backupninja
[8]:http://backuppc.sourceforge.net/
[9]:http://www.urbackup.org/
[10]:http://www.rsnapshot.org/
[11]:http://www.cyberciti.biz/faq/linux-rsnapshot-backup-howto/
[12]:http://www.cyberciti.biz/faq/redhat-cetos-linux-remote-backup-snapshot-server/
[13]:http://www.nongnu.org/rdiff-backup/
[14]:http://burp.grke.org/
[15]:http://www.cyberciti.biz/open-source/awesome-backup-software-for-linux-unix-osx-windows-systems/
[16]:http://www.cyberciti.biz/faq/duplicity-installation-configuration-on-debian-ubuntu-linux/
[17]:http://safekeep.sourceforge.net/
[18]:https://github.com/dojo4/drebs
