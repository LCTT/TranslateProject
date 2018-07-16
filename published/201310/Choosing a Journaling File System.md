选择一个日志文件系统
================

通俗的说，计算机的文件系统就是一个像磁盘这样的存储设备如何存储、检索以及管理文件的方式。文件系统需要记录的不仅是文件本身每一个字节，及其在存储设备上的位置，还要存储文件相关的信息。比如，也要存储每个文件的名字、文件存放的层次结构（目录），还有文件的元数据，像文件的修改时间等。

虽然在linux上可以使用许多不同的文件系统，但是绝大多数用户很少去关注使用哪一个，它们通常都被忽视了。选择使用什么样的文件系统视情况而定，要考虑的相关因素包括兼容性、性能、还原能力、使用的介质、存储介质的大小和数量、特性，还有安全考虑等。


日志文件系统是一种特殊类型的文件系统，它记录一个被称为日志的追踪文件。日志可以让系统能够修复在异常终止时出现的不一致情况。它通过追踪之前提交到主文件系统的更改。在计算机非正常关机的情况下，任何数据丢失都可被重建。因此,这种文件系统不太可能遭受破坏，并且可以使文件系统快速恢复工作。

为了深入了解日志文件系统的使用，我们整理出一个首选列表。

现在，让我们讨论一下手边的日志文件系统。

- [ext3][1] 	许多流行的Linux发行版默认的文件系统
- [XFS][2] 	  为高性能和大文件设计的文件系统
- [Btrfs][3] 	校检copy-on-write(写入时复制)文件系统
- [ext4][4] 	由ext3增加许多显著特性和扩展进化而来的文件系统


###ext3

ext3，或者叫第三扩展文件系统，它是一个通常被用于Linux内核的日志文件系统。日志功能意味着不用对fsck等待过久和担心损坏元数据。

它是包括Debian在内的许多流行的Linux发行版的默认文件系统。ext3 最初发布时间是1999年9月。

Ext3 默认保留了%5的可用空间，主要的原因是保证超级用户(root)甚至在文件系统已满的情况下能够登录。

> **ext3** 

> 0.9.18

>价格 : 免费下载

> 大小 : 13.8KB

> 协议 : GNU GPL

> 开发者 : Stephen Tweedie

> 网站 : ftp://ftp.kernel.org/

> 支持 : [FAQ][5], [邮件列表][6]


特性包括:

- 简单，健壮，可扩展
- 内核和用户空间的代码已广泛测试
- 在ext2上增加的特性
	- 日志 ：提高可靠性，并且异常关机后不需要检查文件系统
	- 各种日志模式：日志，有序，写回
	- 文件系统被重新挂载时自动恢复
	- 所有的VFS操作（包括配额）都会记录到日志
	- 添加数据的更新也被记录日志
	- 在线文件系统的扩容
	- 在大目录上使用Htree索引
- 扩展属性块和大量的inode
- 支持在线文件系统的大小调整
- 哈希索引的目录
- 文件/设备都支持日志
- 目录项中记录文件类型
- 日志恢复依赖
- 减少块组的备份
- 减少超级块的备份
- 文件可大于2GiB
- 易于自ext2迁移文件系统，而不需要备份，恢复和格式化分区
- UNIX权限， ACL和其它的安全属性

###XFS

XFS 是一个64位的、高性能的支持文件系统一致性的日志文件系统，由Silicon Graphics公司所开发。是IRIX5.3和以后版本的默认文件系统，后来又移植到Linux内核。

XFS结合先进的日志技术和完整的64位寻址还有可扩展的数据结构和算法。

XFS从Linux 2.4开始一直留在官方Linux内核内核树。所有现代的Linux发行版都支持XFS。

> **XFS**

> 价格 : 免费下载

> 协议 : GNU GPL v2

> 开发者 : Silicon Graphics Inc.

> 网站 : http://oss.sgi.com/projects/xfs/

> 支持 : http://XFS.org, [FAQ][7], [邮件列表][8]

特性包括:

- 快速恢复 - 意外中断后，重新启动非常快，不受管理文件的数量影响
- 快速事务 - 提供优越的日志同时尽量减少日志在读取和写入数据事务时对性能的影响
- 大规模的可扩展性 - 支持最大文件系统为8 EiB - 1（1024PiB - 1）
- 有效分配 - 实现极其复杂的空间管理技术
- 出色的带宽占用 - 能够提供非常接近底层的硬件本身I/O性能
- 提供日志文件系统元数据，在实际磁盘块更新前首先写入一个连续的日志来更新文件系统
- 支持文件系统的挂载卷增长，使文件系统的“冻结”和“解冻”操作支持卷级快照，并提供了一个在线的文件碎片整理工具
- 实现完整的日志扩展属性
- 支持ACL语义和在POSIX 1003.1e标准草案的接口描述
- 兼容NFS
- 使用开源的Samba服务导出XFS文件系统到Microsoft Windows系统
- 数据管理API（DMAPI/XDSM的）允许实施不修改内核的分层存储管理软件
- 支持“实时子卷”的概念 - 一个独立的区域只有文件数据存储的磁盘空间

###Btrfs

Btrfs(B-树文件系统)是一个Linux写入时复制(Copy on Write)文件系统。写入时复制(COW)是维护数据集合的副本和使用相同数据处理多个任务时管理资源的优化技术(译者注:用于保留某些数据的原始副本的一种技术。在写入操作修改数据时，会复制数据的原始副本)。

这个日志文件系统的目的是给Linux带来更高效的存储管理和更好的数据完整性功能。

Btrfs很好的实现了高级特性，同时保持了容错性、可扩展性和可靠性。这个文件系统自2007年以来一直在开发，它的基础代码现在已经到达了一个成熟的水平，其磁盘格式应该不会改变。基础代码还在密集的开发中。

Btrfs 首次亮相在Linux2.6.29发布时。Btrfs可以处理多达2^64个字节，少了几百特殊项。

> **Btrfs**

> 价格 : 免费下载

> 协议 : GNU GPL

> 开发者 : Oracle Corporation

> 网站 : http://btrfs.wiki.kernel.org

> 支持 : [Btrfs初学者指南][9], [我如何使用Btrfs先进的功能][10], [Btrfs文件系统入门][11]

> 选择评论: [Josef Bacik][12] 

特性包括:

- 可扩展，64位文件系统能够跨越卷提供文件，文件系统最大可达16EiB
- 集成了卷管理
- 在线文件系统的碎片整理 - 可用在卷挂载或在线时整理卷碎片
- 脱机文件系统检查
- 在线卷增长和收缩
- 在线块设备的添加和删除
- 在线平衡(移动对象在块设备之间来平衡负载)
- 使用B-树结构来存储数据类型和存储在磁盘上的信息点
- 在线数据擦除发现错误和自动修复文件冗余副本
- 延迟分配以便更好的磁盘分配
	- 空间高效的打包小文件
	- 空间高效的索引目录
- 子卷（单独的内部文件系统root）
- 透明压缩（zlib和LZO）
- 容易使用的可写快照，只读快照。在快照目录下，快照被看做一般的目录
- 发送/接收(以二进制流保存快照之间的差别)
- 数据一致性:
	- 内置RAID支持(RAID0，RAID1，RAID5，RAID6和RAID10) 。可用于数据擦除，特别是RAID 1
	- 故障隔离和校验和算法 - 从用户数据分开存储的元数据实现故障隔离
	- 校验数据和元数据（CRC- 32C） ，可以选择关闭数据校验和
	- 即使在一个单一的设备，元数据被冗余存储在两个位置
	- 重建次数
	- 加密
- 文件克隆（在单个文件写入时复制，或字节范围）
- 原地迁移ext3/4到BTRFS(支持回滚)
- 文件系统seeding
- SSD （闪存）识别（TRIM /丢弃报告重用的空闲块）和优化
- 文件条带化，文件镜像化，文件条带化+镜像化，单双奇偶校验实现条带化
- 每个子卷分层配额
- 基于扩展的文件存储
- 提供了用户最低限度的调整，以防范滥用


###ext4


ext4，也叫做第四扩展文件系统，是一个由ext3演变而来的Linux日志文件系统。它在Linux内核2.6.28很稳定。

ext4的增加了许多重要特性 ： 一个单一的连续块的描述符，而不是传统的ext2和ext3所使用的块映射体系。这是一个表示大文件的有效方式，更高效的CPU 利用和更少的元数据的输入输出(I/O)。这也使文件系统检查更快，更加有利的于文件系统规模的增长。

> **ext4**

> 价格 : 免费下载

> 协议 : GNU GPL

> 开发者 :Mingming Cao, Andreas Dilger, Alex Zhuravlev (Tomas), Dave Kleikamp, Theodore Ts'o, Eric Sandeen, others

> 网站 : http://ext4.wiki.kernel.org

> 支持 : [Wiki][13], [FAQ][14], [内核新手][15]

特性包括:

- 扩展属性块和大量的inode
- 基于扩展的磁盘格式
- 在线碎片整理
- 在线文件系统的大小预先调整
- 哈希索引目录
- 文件/设备都记录日志
- 目录项中记录文件类型
- 使用日志恢复
- 文件分配扩展格式
- 支持超过2^32个文件系统块
- 灵活的块组元数据的位置
- 减少块组的备份
- 减少超级块的备份
- 文件可大于2GiB
- 组描述符校验和稀疏inode表
- 超过32000个子目录
- inode特性
	- 更多的inode
	- inode的预订
	- 纳秒级时间戳和创建时间
- 文件可大于2TiB
- 日志校验 - 可以校验日志数据来判断日志块是否发生故障或损坏
- 可以选择关闭日志
- 持久预分配
- 向后兼容ext2和ext3
- 分配方案：
	- 持久预分配
	- 延迟分配
	- 多块分配
	- 条块化感知分配
- 扩展属性
- 配额日志
- 实现 discard/TRIM(译者注:任务相关教学法) 

---

via: http://www.linuxlinks.com/article/20130927180305497/JournalingFileSystems.html

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:ftp://ftp.kernel.org/pub/linux/kernel/people/sct/ext3/
[2]:http://oss.sgi.com/projects/xfs/
[3]:http://btrfs.wiki.kernel.org/
[4]:https://ext4.wiki.kernel.org/index.php/Main_Page
[5]:http://batleth.sapienti-sat.org/projects/FAQs/ext3-faq.html
[6]:https://listman.redhat.com/archives/ext3-users/
[7]:http://xfs.org/index.php/XFS_FAQ
[8]:http://xfs.org/index.php/XFS_email_list_and_archives
[9]:http://www.howtoforge.com/a-beginners-guide-to-btrfs
[10]:http://www.oracle.com/technetwork/articles/servers-storage-admin/advanced-btrfs-1734952.html
[11]:http://www.oracle.com/technetwork/articles/servers-storage-admin/gettingstarted-btrfs-1695246.html
[12]:http://static.usenix.org/publications/login/2012-02/openpdfs/Bacik.pdf
[13]:https://ext4.wiki.kernel.org/index.php/Main_Page
[14]:https://ext4.wiki.kernel.org/index.php/Frequently_Asked_Questions
[15]:http://kernelnewbies.org/Ext4

