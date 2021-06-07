初学者指南：ZFS 是什么，为什么要使用 ZFS？
======

![ZFS filesystem][9]

今天，我们来谈论一下 ZFS，一个先进的文件系统。我们将讨论 ZFS 从何而来，它是什么，以及为什么它在科技界和企业界如此受欢迎。

虽然我是一个美国人，但我更喜欢读成 ZedFS 而不是 ZeeFS，因为前者听起来更酷一些。你可以根据你的个人喜好来发音。

> 注意：在这篇文章中，你将会看到 ZFS 被提到很多次。当我在谈论特性和安装的时候，我所指的是 OpenZFS 。自从<ruby>甲骨文<rt>Oracle</rt></ruby>公司放弃 OpenSolaris 项目之后，ZFS（由甲骨文公司开发）和 OpenZFS 已经走向了不同的发展道路。（后面详述）

### ZFS 的历史

<ruby>Z 文件系统<rt>Z File System</rt></ruby>（ZFS）是由 [Matthew Ahrens 和 Jeff Bonwick][1] 在 2001 年开发的。ZFS 是作为[<ruby>太阳微系统<rt>Sun MicroSystem</rt></ruby>][2] 公司的 [OpenSolaris][3] 的下一代文件系统而设计的。在 2008 年，ZFS 被移植到了 FreeBSD 。同一年，一个移植 [ZFS 到 Linux][4] 的项目也启动了。然而，由于 ZFS 是<ruby>[通用开发和发布许可证][5]<rt>Common Development and Distribution License</rt></ruby>（CDDL）许可的，它和 [GNU 通用公共许可证][6] 不兼容，因此不能将它迁移到 Linux 内核中。为了解决这个问题，绝大多数 Linux 发行版提供了一些方法来安装 ZFS　。

在甲骨文公司收购太阳微系统公司之后不久，OpenSolaris 就闭源了，这使得 ZFS 的之后的开发也变成闭源的了。许多 ZFS 开发者对这件事情非常不满。[三分之二的 ZFS 核心开发者][1]，包括 Ahrens 和 Bonwick，因为这个决定而离开了甲骨文公司。他们加入了其它公司，并于 2013 年 9 月创立了 [OpenZFS][7] 这一项目。该项目引领着 ZFS 的开源开发。

让我们回到上面提到的许可证问题上。既然 OpenZFS 项目已经和 Oracle 公司分离开了，有人可能好奇他们为什么不使用和 GPL 兼容的许可证，这样就可以把它加入到 Linux 内核中了。根据 [OpenZFS 官网][8] 的介绍，更改许可证需要联系所有为当前 OpenZFS 实现贡献过代码的人（包括初始的公共 ZFS 代码以及 OpenSolaris 代码），并得到他们的许可才行。这几乎是不可能的（因为一些贡献者可能已经去世了或者很难找到），因此他们决定保留原来的许可证。

### ZFS 是什么，它有什么特性？

正如前面所说过的，ZFS 是一个先进的文件系统。因此，它有一些有趣的[特性][10]。比如：

  * 存储池
  * 写时拷贝
  * 快照
  * 数据完整性验证和自动修复
  * RAID-Z
  * 最大单个文件大小为 16 EB（1 EB = 1024 PB）
  * 最大 256 千万亿（256*10^15 ）的 ZB（1 ZB = 1024 EB）的存储

让我们来深入了解一下其中一些特性。

#### 存储池

与大多数文件系统不同，ZFS 结合了文件系统和卷管理器的特性。这意味着，它与其他文件系统不同，ZFS 可以创建跨越一系列硬盘或池的文件系统。不仅如此，你还可以通过添加硬盘来增大池的存储容量。ZFS 可以进行[分区和格式化][11]。

![Pooled storage in ZFS][12]

*ZFS 存储池*

#### 写时拷贝

<ruby>[写时拷贝][13]<rt>Copy-on-write</rt></ruby>是另一个有趣并且很酷的特性。在大多数文件系统上，当数据被重写时，它将永久丢失。而在 ZFS 中，新数据会写到不同的块。写完成之后，更新文件系统元数据信息，使之指向新的数据块（LCTT 译注：更新之后，原数据块成为磁盘上的垃圾，需要有对应的垃圾回收机制）。这确保了如果在写新数据的时候系统崩溃（或者发生其它事，比如突然断电），那么原数据将会保存下来。这也意味着，在系统发生崩溃之后，不需要运行 [fsck][14] 来检查和修复文件系统。

#### 快照

写时拷贝使得 ZFS 有了另一个特性：<ruby>快照<rt>snapshots</rt></ruby>。ZFS 使用快照来跟踪文件系统中的更改。[快照][13]包含文件系统的原始版本（文件系统的一个只读版本），实时文件系统则包含了自从快照创建之后的任何更改。没有使用额外的空间。因为新数据将会写到实时文件系统新分配的块上。如果一个文件被删除了，那么它在快照中的索引也会被删除。所以，快照主要是用来跟踪文件的更改，而不是文件的增加和创建。

快照可以挂载成只读的，以用来恢复一个文件的过去版本。实时文件系统也可以回滚到之前的快照。回滚之后，自从快照创建之后的所有更改将会丢失。

#### 数据完整性验证和自动修复

当向 ZFS 写入新数据时，会创建该数据的校验和。在读取数据的时候，使用校验和进行验证。如果前后校验和不匹配，那么就说明检测到了错误，然后，ZFS 会尝试自动修正错误。

#### RAID-Z

ZFS 不需要任何额外软件或硬件就可以处理 RAID（磁盘阵列）。毫不奇怪，因为 ZFS 有自己的 RAID 实现：RAID-Z 。RAID-Z 是 RAID-5 的一个变种，不过它克服了 RAID-5 的写漏洞：意外重启之后，数据和校验信息会变得不同步（LCTT 译注：RAID-5 的条带在正写入数据时，如果这时候电源中断，那么奇偶校验数据将跟该部分数据不同步，因此前边的写无效；RAID-Z 用了 “可变宽的 RAID 条带” 技术，因此所有的写都是全条带写入）。为了使用[基本级别的 RAID-Z][15]（RAID-Z1），你需要至少三块磁盘，其中两块用来存储数据，另外一块用来存储[奇偶校验信息][16]。而 RAID-Z2 需要至少两块磁盘存储数据以及两块磁盘存储校验信息。RAID-Z3 需要至少两块磁盘存储数据以及三块磁盘存储校验信息。另外，只能向 RAID-Z 池中加入偶数倍的磁盘，而不能是奇数倍的。

#### 巨大的存储潜力

创建 ZFS 的时候，它是作为[最后一个文件系统][17]而设计的 。那时候，大多数文件系统都是 64 位的，ZFS 的创建者决定直接跳到 128 位，等到将来再来证明这是对的。这意味着 ZFS 的容量大小是 32 位或 64 位文件系统的 1600 亿亿倍。事实上，Jeff Bonwick（其中一个创建者）说：“完全填满一个 128 位的存储池所需要的[能量][18]，从字面上讲，比煮沸海洋需要的还多。”

### 如何安装 ZFS？

如果你想立刻使用 ZFS（开箱即用），那么你需要安装 [FreeBSD][19] 或一个[使用 illumos 内核的操作系统][20]。[illumos][21] 是 OpenSolaris 内核的一个克隆版本。

事实上，支持 [ZFS 是一些有经验的 Linux 用户选择 BSD 的主要原因][22]。

如果你想在 Linux 上尝试 ZFS，那么只能在存储文件系统上使用。据我所知，没有任何 Linux 发行版可以在根目录上安装 ZFS，实现开箱即用。如果你对在 Linux 上尝试 ZFS 感兴趣，那么 [ZFS on Linux 项目][4] 上有大量的教程可以指导你怎么做。

### 附加说明

这篇文章论述了 ZFS 的优点。现在，让我来告诉你一个关于 ZFS 很现实的问题。使用 RAID-Z [会很贵][23]，因为你需要购买大量的磁盘来增大存储空间。

你已经使用过 ZFS 了吗？你的使用经验是什么样的？请在下面的评论中告诉我们。

如果你觉得这篇文章有趣，请花一分钟的时间把它分享到社交媒体、极客新闻或 [Reddit][24] 。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-zfs/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]: https://wiki.gentoo.org/wiki/ZFS
[2]: http://en.wikipedia.org/wiki/Sun_Microsystems
[3]: http://en.wikipedia.org/wiki/Opensolaris
[4]: https://zfsonlinux.org/
[5]: https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License
[6]: https://en.wikipedia.org/wiki/GNU_General_Public_License
[7]: http://www.open-zfs.org/wiki/Main_Page
[8]: http://www.open-zfs.org/wiki/FAQ#Do_you_plan_to_release_OpenZFS_under_a_license_other_than_the_CDDL.3F
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/what-is-zfs.png
[10]: https://wiki.archlinux.org/index.php/ZFS
[11]: https://www.howtogeek.com/175159/an-introduction-to-the-z-file-system-zfs-for-linux/
[12]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/zfs-overview.png
[13]: https://www.freebsd.org/doc/handbook/zfs-term.html
[14]: https://en.wikipedia.org/wiki/Fsck
[15]: https://wiki.archlinux.org/index.php/ZFS/Virtual_disks#Creating_and_Destroying_Zpools
[16]: https://www.pcmag.com/encyclopedia/term/60364/raid-parity
[17]: https://web.archive.org/web/20060428092023/http://www.sun.com/2004-0914/feature/
[18]: https://blogs.oracle.com/bonwick/128-bit-storage:-are-you-high
[19]: https://www.freebsd.org/
[20]: https://wiki.illumos.org/display/illumos/Distributions
[21]: https://wiki.illumos.org/display/illumos/illumos+Home
[22]: https://itsfoss.com/why-use-bsd/
[23]: http://louwrentius.com/the-hidden-cost-of-using-zfs-for-your-home-nas.html
[24]: http://reddit.com/r/linuxusersgroup
