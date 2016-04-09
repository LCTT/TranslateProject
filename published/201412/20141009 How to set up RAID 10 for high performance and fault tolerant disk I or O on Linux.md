如何在Linux上构建 RAID 10阵列
================================================================================

RAID 10阵列（又名RAID 1+0 或先镜像后分区）通过结合RAID 0 （读写操作在多个磁盘上同时并行执行）和RAID 1（数据被完全相同地写入到两个或更多的磁盘）两者的特点实现高性能和高容错性的磁盘I/O。

这篇文章会指导你如何使用五块相同的8GB磁盘来组成一个软件RAID 10阵列。因为组成一个RAID 10阵列至少需要4块磁盘（比如，两个镜像各有一对分区组合），而且需要添加一块额外的备用磁盘以防某块主要的磁盘出错。本文也会分享一些工具，在稍后用来分析RAID阵列的性能。

注意RAID 10的优缺点和其它分区方法（在不同大小的磁盘和文件系统上）的内容不在本文讨论范围内。

### Raid 10 阵列如何工作？ ###

如果你需要实现一种支持I/O密集操作（比如数据库、电子邮件或web服务器）的存储解决方案，RAID 10就是你需要的。来看看为什么这么说，请看下图。

![](https://farm4.staticflickr.com/3844/15179003008_e48806b3ef_o.png)

上图中的文件由A、B、C、D、E和F六种块组成，每一个RAID 1镜像对（如镜像1和2）在两个磁盘上复制相同的块。在这样的配置下，写操作性能会因为每个块需要写入两次而下降，每个磁盘各一次；而读操作与从单块磁盘中读取相比并未发生改变。不过这种配置的好处是除非一个镜像中有超过一块的磁盘故障，否则都能保持冗余以维持正常的磁盘I/O操作。

RAID 0的分区通过将数据划分到不同的块，然后执行同时将块A写入镜像1、将块B写入镜像2（以此类推）的并行操作以提高整体的读写性能。在另一方面，没有任何一个镜像包含构成主存的数据片的全部信息。这就意味着如果其中一个镜像故障，那么整个RAID 0组件将无法正常工作，数据将遭受不可恢复的损失。

### 建立RAID 10阵列 ###

有两种建立RAID 10阵列的可行方案：复杂法（一步完成）和嵌套法（先创建两个或更多的RAID 1阵列，然后使用它们组成RAID 0）。本文会讲述复杂法创建RAID 10阵列的过程，因为这种方法能够使用偶数或奇数个磁盘去创建阵列，而且能以单个RAID设备的形式被管理，而嵌套法则恰恰相反（只允许偶数个磁盘，必须以嵌套设备的形式被管理，即分开管理RAID 1和RAID 0）。

假设你的机器已经安装mdadm，并运行着相应的守护进程，细节参见[这篇文章][1]。也假设每个磁盘上已经划分出一个主分区sd[bcdef]1 （LCTT 译注：共计五块磁盘，这里是从sdb - sdf）。使用命令：

    ls -l /dev | grep sd[bcdef]

查看到的输出应该如下所示：

![](https://farm3.staticflickr.com/2944/15365276992_db79cac82a.jpg)

然后使用下面的命令创建一个RAID 10阵列（LCTT 译注：使用了四块磁盘 bcde 创建）：

     # mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd[bcde]1 --spare-devices=1 /dev/sdf1 

![](https://farm3.staticflickr.com/2946/15365277042_28a100baa2_z.jpg)

当阵列创建完毕后（最多花费几分钟），执行命令

    # mdadm --detail /dev/md0

的输出应如下所示：

![](https://farm3.staticflickr.com/2946/15362417891_7984c6a05f_o.png)

在更进一步之前需要注意以下事项。

1. **Used Dev Space**表示阵列所使用的每一块磁盘的容量。

2. **Array Size**表示阵列的整体大小。RAID 10阵列的大小通过(N\*C)/M计算，其中N是活跃磁盘的数目，C是每个活跃磁盘的容量，M是每一个镜像中磁盘的数目。在本文的情形下，这个值等于（4*8GiB）/2 = 16GiB。

3. **Layout**是整个数据布局的详细信息。可能的布局数值如下所示。

----------

- **n**(默认选项)：代表就近（near）拷贝。一个数据块的多个拷贝在不同磁盘里有相同的偏移量。这种布局提供和RAID 0阵列相似的读写性能。

![](https://farm3.staticflickr.com/2941/15365413092_0aa41505c2_o.png)

- **o**代表偏移量（offset）拷贝。块并不是在条带里面复制的，而是整个条带一起复制，但是循环会打乱，所以同一个分区中复制的块会出现在不同的磁盘。因此，一个块的后续拷贝会出现在下一个磁盘中，一个块接着一个块。为了在RAID 10阵列中使用这种布局，在创建阵列的命令中添加--layout=o2选项。

![](https://farm3.staticflickr.com/2944/15178897580_6ef923a1cb_o.png)

- **f**代表远端（far）拷贝（多个拷贝在不同的磁盘中具有不同的偏移量）。这种布局提供更好的读性能但带来更差的写性能。因此，对于读远远多于写的系统来说是最好的选择。为了在RAID 10阵列中使用这种布局，在创建阵列的命令中添加--layout=f2。

![](https://farm3.staticflickr.com/2948/15179140458_4a803bb194_o.png)

跟在布局选项**n**、**f**和**o**后面的数字代表所需的每一个数据块的副本数目。默认值是2，但可以是2到阵列中磁盘数目之间的某个值。提供足够的副本数目可以最小化单个磁盘上的I/O影响。

4. **Chunk Size**，参考[Linux RAID wiki][2]的说明，是写入磁盘的最小数据单元。最佳的chunk大小取决于I/O操作的速率和相关的文件大小。对于大量的写操作，通过设置相对较大的chunk可以得到更低的开销，但对于主要存储小文件的阵列来说更小的chunk性能更好。为了给RAID 10指定一个chunk大小，在创建阵列的命令中添加**--chunk=desired_chunk_size**。

不幸的是，并没有设置一个大小就能适合全局的策略来提高性能，但可以参考下面的一些方案。

- 文件系统：就整体而言，[XFS][3]据说是最好的，当然EXT4也是不错的选择。
- 最佳布局：远端布局能提高读性能，但会降低写性能。
- 副本数目：更多的副本能最小化I/O影响，但更多的磁盘需要更大的花费。
- 硬件：在相同的环境下，SSD比传统（机械旋转）磁盘更能带来出性能提升

### 使用DD进行RAID性能测试 ###

下面的基准测试用于检测RAID 10阵列（/dev/md0）的性能。

#### 1. 写操作 ####

往磁盘中写入大小为256MB的单个文件：

    # dd if=/dev/zero of=/dev/md0 bs=256M count=1 oflag=dsync 

写入1000次512字节：

    # dd if=/dev/zero of=/dev/md0 bs=512 count=1000 oflag=dsync 

使用dsync标记，dd可以绕过文件系统缓存，在RAID阵列上执行同步写。这个选项用于减少RAID性能测试中缓存的影响。

#### 2. 读操作 ####

从阵列中拷贝256KiB*15000（3.9 GB）大小内容到/dev/null:

     # dd if=/dev/md0 of=/dev/null bs=256K count=15000 

### 使用Iozone进行RAID性能测试 ###

[Iozone][4]是一款文件系统基准测试工具，用来测试各种磁盘I/O操作，包括随机读写、顺序读写和重读重写。它支持将结果导出为微软的Excel或LibreOffice的Calc文件。

#### 在CentOS/RHEL 7上安装Iozone ####

先保证[Repoforge][5]可用，然后输入：

    # yum install iozone 

#### 在Debian 7上安装Iozone ####

    # aptitude install iozone3 

下面的iozone命令会在RAID-10阵列中执行所有测试：

    # iozone -Ra /dev/md0 -b /tmp/md0.xls 
 
- **-R**：往标准输出生成兼容Excel的报告
- **-a**：以全自动模式运行所有的测试，并测试各种记录/文件大小。记录大小范围：4K-16M，文件大小范围：64K-512M。
- **-b /tmp/md0.xls**: 把测试结果存储到一个指定的文件中

希望这篇文章对你有所帮助，如果想到任何想法或建议可能会提升RAID 10的性能，请讲出来。

--------------------------------------------------------------------------------

via: http://xmodulo.com/setup-raid10-linux.html

作者：[Gabriel Cánepa][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/create-software-raid1-array-mdadm-linux.html
[2]:https://raid.wiki.kernel.org/
[3]:http://ask.xmodulo.com/create-mount-xfs-file-system-linux.html
[4]:http://www.iozone.org/
[5]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html