在 Linux 中使用 Stratis 配置本地存储
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)

对桌面 Linux 用户而言，极少或仅在安装系统时配置本地存储。Linux 存储技术进展比较慢，以至于 20 年前的很多存储工具仍在今天广泛使用。但从那之后，存储技术已经提升了不少，我们为何不享受新特性带来的好处呢？

本文介绍 Startis，这是一个新项目，试图让所有 Linux 用户从存储技术进步中受益，适用场景可以是仅有一块 SSD 的单台笔记本，也可以是包含上百块硬盘的存储阵列。Linux 支持新特性，但由于缺乏易于使用的解决方案，使其没有被广泛采用。Stratis 的目标就是让 Linux 的高级存储特性更加可用。

### 简单可靠地使用高级存储特性

Stratis 希望让如下三件事变得更加容易：存储初始化配置；做后续变更；使用高级存储特性，包括<ruby>快照<rt>snapshots</rt></ruby>、<ruby>精简配置<rt>thin provisioning</rt></ruby>，甚至<ruby>分层<rt>tiering</rt></ruby>。

### Stratis：一个卷管理文件系统

Stratis 是一个<ruby>卷管理文件系统<rt>volume-managing filesystem, VMF</rt></ruby>，类似于 [ZFS][1] 和 [Btrfs][2]。它使用了存储“池”的核心思想，该思想被各种 VMFs 和 形如 [LVM][3] 的独立卷管理器采用。使用一个或多个硬盘（或分区）创建存储池，然后在存储池中创建<ruby>卷<rt>volumes</rt></ruby>。与使用 [fdisk][4] 或 [GParted][5] 执行的传统硬盘分区不同，存储池中的卷分布无需用户指定。

VMF 更进一步与文件系统层结合起来。用户无需在卷上部署选取的文件系统，因为文件系统和卷已经被合并在一起，成为一个概念上的文件树（ZFS 称之为<ruby>数据集<rt>dataset</rt></ruby>，Brtfs 称之为<ruby>子卷<rt>subvolume</rt></ruby>，Stratis 称之为文件系统），文件数据位于存储池中，但文件大小仅受存储池整体容量限制。

换一个角度来看：正如文件系统对其中单个文件的真实存储块的实际位置做了一层<ruby>抽象<rt>abstract</rt></ruby>，VMF 对存储池中单个文件系统的真实存储块的实际位置做了一层抽象。

基于存储池，我们可以启用其它有用的特性。特性中的一部分理所当然地来自典型的 VMF <ruby>实现<rt>implementation</rt></ruby>，例如文件系统快照，毕竟存储池中的多个文件系统可以共享<ruby>物理数据块<rt>physical data blocks</rt></ruby>；<ruby>冗余<rt>redundancy</rt></ruby>，分层，<ruby>完整性<rt>integrity</rt></ruby>等其它特性也很符合逻辑，因为存储池是操作系统中管理所有文件系统上述特性的重要场所。

上述结果表明，相比独立的卷管理器和文件系统层，VMF 的搭建和管理更简单，启用高级存储特性也更容易。

### Stratis 与 ZFS 和 Btrfs 有哪些不同？

作为新项目，Stratis 可以从已有项目中吸取经验，我们将在[第二部分][6]深入介绍 Stratis 采用了 ZFS，Brtfs 和 LVM 的哪些设计。总结一下，Stratis 与其不同之处来自于对功能特性支持的观察，来自于个人使用及计算机自动化运行方式的改变，以及来自于底层硬件的改变。

首先，Stratis 强调易用性和安全性。对个人用户而言，这很重要，毕竟他们与 Stratis 交互的时间间隔可能很长。如果交互不那么友好，尤其是有丢数据的可能性，大部分人宁愿放弃使用新特性，继续使用功能比较基础的文件系统。

第二，当前 API 和 <ruby>DevOps 式<rt>Devops-style</rt></ruby>自动化的重要性远高于早些年。通过提供<ruby>极好的<rt>first-class</rt></ruby> API，Stratis 支持自动化，这样人们可以直接通过自动化工具使用 Stratis。

第三，SSD 的容量和市场份额都已经显著提升。早期的文件系统中很多代码用于优化机械<ruby>介质<rt>media</rt></ruby>访问速度慢的问题，但对于基于闪存的介质，这些优化变得不那么重要。即使当存储池过大不适合使用 SSD 的情况，仍可以考虑使用 SSD 充当<ruby>缓存层<rt>caching tier</rt></ruby>，可以提供不错的性能提升。考虑到 SSD 的优良性能，Stratis 主要聚焦存储池设计方面的<ruby>灵活性<rt>flexibility</rt></ruby>和<ruby>可靠性<rt>reliability</rt></ruby>。

最后，与 ZFS 和 Btrfs 相比，Stratis 具有明显不一样的<ruby>实现模型<rt>implementation model</rt></ruby>（我会在[第二部分][6]进一步分析）。这意味着对 Stratis 而言，虽然一些功能较难实现，但一些功能较容易实现。这也加快了 Stratis 的开发进度。

### 了解更多

如果希望更多了解 Stratis，可以查看本系列的[第二部分][6]。你还可以在 [Stratis 官网][8] 找到详细的[设计文档][7]。

### 如何参与

如果希望参与开发、测试 Stratis 或给出反馈，请订阅我们的[邮件列表][9]。

[GitHub][10] 上的开发项目包括 [守护进程][11] （使用 [Rust][12] 开发）和 [命令行工具][13] （使用 [Python][14] 开发）两部分。

可以在 [Freenode][15] IRC 网络的 #stratis-storage 频道加入我们。

Andy Grover 将在今年的 LinuxFest Northwest 会议上演讲。查看[会议安排][16] 或 [注册参会][17]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://en.wikipedia.org/wiki/ZFS
[2]:https://en.wikipedia.org/wiki/Btrfs
[3]:https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[4]:https://en.wikipedia.org/wiki/Fdisk
[5]:https://gparted.org/
[6]:https://opensource.com/article/18/4/stratis-lessons-learned
[7]:https://stratis-storage.github.io/StratisSoftwareDesign.pdf
[8]:https://stratis-storage.github.io/
[9]:https://lists.fedoraproject.org/admin/lists/stratis-devel.lists.fedorahosted.org/
[10]:https://github.com/stratis-storage/
[11]:https://github.com/stratis-storage/stratisd
[12]:https://www.rust-lang.org/
[13]:https://github.com/stratis-storage/stratis-cli
[14]:https://www.python.org/
[15]:https://freenode.net/
[16]:https://www.linuxfestnorthwest.org/conferences/lfnw18
[17]:https://www.linuxfestnorthwest.org/conferences/lfnw18/register/new
