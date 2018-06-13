Stratis 从 ZFS, Btrfs 和 LVM 学到哪些
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-windows-building-containers.png?itok=0XvZLZ8k)

在本系列[第一部分][1]中提到，Stratis 是一个<ruby>卷管理文件系统<rt>volume-managing filesystem, VMF</rt></ruby>，功能特性类似于 [ZFS][2] 和 [Btrfs][3]。在设计 Stratis 过程中，我们研究了已有解决方案开发者做出的取舍。

### 为何不使用已有解决方案

理由千差万别。先说说 [ZFS][2]，它最初由 Sun Microsystems 为 Solaris （目前为 Oracle 所有）开发，后移植到 Linux。但 [CDDL][4] 协议授权的代码无法合并到 [GPL][5] 协议授权的 Linux 源码树中。CDDL 与 GPLv2 是否真的不兼容有待讨论，但这种不确定性足以打消企业级 Linux 供应商采用并支持 ZFS 的积极性。

[Btrfs][3] 发展也很好，没有授权问题。它已经多年被很多用户列为“最佳文件系统”，但在稳定性和功能特性方面仍有待提高。

我们希望打破现状，解决已有方案的种种问题，这种渴望促成了 Stratis。

### Stratis 如何与众不同

ZFS 和 Btrfs 让我们知道一件事情，即编写一个内核支持的 VMF 文件系统需要花费极大的时间和精力，以便消除漏洞、增强稳定性。涉及核心数据时，提供正确性保证是必要的。如果 Stratis 也采用这种方案并从零开始的话，开发工作也需要十数年，这是无法接受的。

相反地，Stratis 采用 Linux 内核的其它一些已有特性：[device mapper][6] 子系统以及久经考验的高性能文件系统 [XFS][7]，其中前者被 LVM 用于提供 RAID、精简配置和其它块设备特性而广为人知。Stratis 将已有技术作为（技术架构中的）层来创建存储池，目标是通过集成为用户提供一个看似无缝的整体。

### Stratis 从 ZFS 学到哪些

对很多用户而言，ZFS 影响了他们对下一代文件系统的预期。通过查看人们在互联网上关于 ZFS 的讨论，我们设定了 Stratis 的最初开发目标。ZFS 的设计思路也潜在地为我们指明应该避免哪些东西。例如，当挂载一个在其它主机上创建的存储池时，ZFS 需要一个“<ruby>导入<rt>import</rt></ruby>”步骤。这样做出于某些原因，但每一种原因都似乎是 Stratis 需要解决的问题，无论是否采用同样的实现方式。

对于增加新硬盘或将已有硬盘替换为更大容量的硬盘，ZFS 有一些限制，尤其是存储池做了冗余配置的时候，这一点让我们不太满意。当然，这么设计也是有其原因的，但我们更愿意将其视为可以改进的空间。

最后，一旦掌握了 ZFS 的命令行工具，用户体验很好。我们希望让 Stratis 的命令行工具能够保持这种体验；同时，我们也很喜欢 ZFS 命令行工具的发展趋势，包括使用<ruby>必选参数<rt>positional parameters</rt></ruby>和控制每个命令需要的键盘输入量。

（LCTT 译注：位置参数来自脚本，$n 代表第 n 个参数）

### Stratis 从 Btrfs 学到哪些

Btrfs 让我们满意的一点是，有单一的包含必选子命令的命令行工具。Btrfs 也将冗余（选择对应的 Btrfs profiles）视为存储池的特性之一。而且和 ZFS 相比实现方式更好理解，也允许增加甚至移除硬盘。

（LCTT 译注：Btrfs profiles 包括 single/DUP 和 各种 RAID 等类型）

最后，通过了解 ZFS 和 Btrfs 共有的特性，例如快照的实现、对发送/接收的支持，让我们更好的抉择 Stratis 应该包括的特性。

### Stratis 从 LVM 学到哪些

在 Stratis 设计阶段早期，我们仔细研究了 LVM。LVM 目前是 Linux device mapper (DM) 最主要的使用者；事实上，DM 就是由 LVM 的核心开发团队维护的。我们研究了将 LVM 真的作为 Stratis 其中一层的可能性，也使用 DM 做了实验，其中 Stratis 可以作为<ruby>对等角色<rt>peer</rt></ruby>直接与 LVM 打交道。我们参考了 LVM 的<ruby>磁盘元数据格式<rt>on-disk metadata format</rt></ruby>（也结合 ZFS 和 XFS 的相应格式），获取灵感并定义了 Stratis 的磁盘元数据格式。

在提到的项目中，LVM 与 Stratis 内在地有最多的共性，毕竟它们都使用 DM。不过从使用的角度来看，LVM 内在工作更加透明，为专业用户提供相当多的控制和选项，使其可以精确配置<ruby>卷组<rt>volume group</rt></ruby>（存储池）的<ruby>布局<rt>layout</rt></ruby>；但 Stratis 不采用这种方式。

### 多种多样的解决方案

基于自由和开源软件工作的明显好处在于，没有什么组件是不可替代的。包括内核在内的每个组成部分都是开源的，可以查看修改源代码，如果当前的软件不能满足用户需求可以用其它软件替换。新项目产生不一定意味着旧项目的终结，只要都有足够的（社区）支持，两者可以并行存在。

对于寻找一个不存在争议、简单易用、强大的本地存储管理解决方案的人而言，Stratis 是更好满足其需求的一种尝试。这意味着一种设计思路所做的抉择不一定对所有用户适用。考虑到用户的其它需求，另一种设计思路可能需要艰难的做出抉择。所有用户可以选择最适合其的工作的工具并从这种自由选择中受益。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/stratis-lessons-learned

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux
[2]:https://en.wikipedia.org/wiki/ZFS
[3]:https://en.wikipedia.org/wiki/Btrfs
[4]:https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License
[5]:https://en.wikipedia.org/wiki/GNU_General_Public_License
[6]:https://en.wikipedia.org/wiki/Device_mapper
[7]:https://en.wikipedia.org/wiki/XFS
