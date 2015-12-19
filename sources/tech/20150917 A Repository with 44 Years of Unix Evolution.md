一个涵盖 Unix 44 年进化史的仓库
=============================================================================
### 摘要 ###

Unix 操作系统的进化历史，可以从一个版本控制的仓库中窥见，时间跨越从 1972 年以 5000 行内核代码的出现，到 2015 年成为一个含有 26,000,000 行代码的被广泛使用的系统。该仓库包含 659,000 条提交，和 2306 次合并。仓库部署被普遍采用的 Git 系统储存其代码，并且在时下流行的 GitHub 上建立了档案。它综合了系统定制软件的 24 个快照，都是开发自贝尔实验室，伯克利大学，386BSD 团队，两个传统的仓库 和 开源 FreeBSD 系统的仓库。总的来说，850 位个人贡献者已经确认，更早些时候的一批人主要做基础研究。这些数据可以用于一些经验性的研究，在软件工程，信息系统和软件考古学领域。

### 1 介绍 ###

Unix 操作系统作为一个主要的工程上的突破而脱颖而出，得益于其模范的设计，大量的技术贡献，它的开发模型和广泛的使用。Unix 编程环境的设计已经被标榜为一个能提供非常简洁，功能强大并且优雅的设计[[1][1]]。在技术方面，许多对 Unix 有直接贡献的，或者因 Unix 而流行的特性就包括[[2][2]]：用高级语言编写的可移植部署的内核；一个分层式设计的文件系统；兼容的文件，设备，网络和进程间 I/O；管道和过滤架构；虚拟文件系统；和用户可选的 shell。很早的时候，就有一个庞大的社区为 Unix 贡献软件[[3][3]]，[[4][4]],pp. 65-72]。随时间流走，这个社区不断壮大，并且以现在称为开源软件开发的方式在工作着[[5][5],pp. 440-442]。Unix 和其睿智的晚辈们也将 C 和 C++ 编程语言，分析程序和词法分析生成器（*yacc，lex*），发扬光大了，文档编制工具（*troff，eqn，tbl*），脚本语言（*awk，sed，Perl*），TCP/IP 网络，和配置管理系统（*SCSS，RCS，Subversion，Git*）发扬广大了，同时也形成了大部分的现代互联网基础设施和网络。

幸运的是，一些重要的具有历史意义的 Unix 材料已经保存下来了，现在保持对外开放。尽管 Unix 最初是由相对严格的协议发行，但在早期的开发中，很多重要的部分是通过 Unix 的某个版权拥有者以一个自由的协议发行。然后将这些部分再结合开发的软件或者以开源发行的软件，Berkeley，Californai 大学和 FreeBSD 项目组从 1972 年六月二十日开始到现在，提供了涵盖整个系统的开发。

Curating and processing available snapshots as well as old and modern configuration management repositories allows the reconstruction of a new synthetic Git repository that combines under a single roof most of the available data. This repository documents in a digital form the detailed evolution of an important digital artefact over a period of 44 years. The following sections describe the repository's structure and contents (Section [II][6]), the way it was created (Section [III][7]), and how it can be used (Section [IV][8]). 

### 2. 数据概览 ###

这 1GB 的 Unix 仓库可以从 [GitHub][9] 克隆。[1][10]如今[2][11]，这个仓库包含来自 850 个贡献者的 659,000 个提交和 2306 个合并。贡献者有来自 Bell 实验室的 23 个员工，Berkeley 计算机系统研究组（CSRG）的 158 个人，和 FreeBSD 项目的 660 个成员。

这个仓库的生命始于一个 *Epoch* 的标签，这里面只包含了证书信息和现在的 README 文件。其后各种各样的标签和分支记录了很多重要的时刻。

- *Research-VX* 标签对应来自 Bell 实验室六次的研究版本。从 *Research-V1* （PDP-11 4768 行汇编代码）开始，到以 *Research-V7* （大约 324,000 行代码，1820 个 C 文件）结束。
- *Bell-32V* 是 DEC/VAX 架构的 Unix 第七个版本的一部分。
- *BSD-X* 标签对应 Berkeley 释出的 15 个快照。
- *386BSD-X* 标签对应系统的两个开源版本，主要是 Lynne 和 William Jolitz 写的 适用于 Intel 386 架构的内核代码。
- *FreeBSD-release/X* 标签和分支标记了来自 FreeBSD 项目的 116 个发行版。

另外，以 *-Snapshot-Development* 为后缀的分支，表示一个被综合的以时间排序的快照文件序列的一些提交，而以一个 *-VCS-Development* 为后缀的标签，标记了有特别发行版出现的历史分支的时刻。

仓库的历史包含从系统开发早期的一些提交，比如下面这些。

    commit c9f643f59434f14f774d61ee3856972b8c3905b1
    Author: Dennis Ritchie <research!dmr>
    Date:   Mon Dec 2 18:18:02 1974 -0500
        Research V5 development
        Work on file usr/sys/dmr/kl.c

释出间隙的合并随着系统进化而发生，比如 从 BSD 2 到 BSD 3 的开发，Unix 32/V 也是正确地代表了 Git 仓库里带两个父节点的图形节点。（这太莫名其妙了）

更为重要的是，该仓库的构造方式允许 **git blame**，就是可以给源代码加上注释，如版本，日期和它们第一次出现相关联的作者，这样可以知道任何代码的起源。比如说 **BSD-4** 这个标签，在内核的 *pipe.c* 文件上运行一下 git blame，就会显示代码行由 Ken Thompson 写于 1974，1975 和 1979年，Bill Joy 写于 1980 年。这就可以自动（尽管计算上比较费事）检测出任何时刻出现的代码。

![](http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/provenance.png)

Figure 1: Code provenance across significant Unix releases.

如上图[12]所示，现代版本的 Unix（FreeBSD 9）依然有来自 BSD 4.3，BSD 4.3 Net/2 和 BSD 2.0 的代码块。有趣的是，这图片显示有部分代码好像没有保留下来，当时激进地要创造一个脱离于 Berkeyel（386BSD 和 FreeBSD 1.0）释出代码的开源操作系统，其所开发的代码。FreeBSD 9 中最古老的代码是一个 18 行的队列，在 C 库里面的 timezone.c 文件里，该文件也可以在第七版的 Unix 文件里找到，同样的名字，时间戳是 1979 年一月十日 - 36 年前。

### 数据收集和处理 ###

这个项目的目的是以某种方式巩固从数据方面说明 Unix 的进化，通过将其并入一个现代的修订仓库，帮助人们对系统进化的研究。项目工作包括收录数据，分类并综合到一个单独的 Git 仓库里。

![](http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/branches.png)

Figure 2: Imported Unix snapshots, repositories, and their mergers.

项目以三种数据类型为基础（见 Figure [2][13]）。首先，早些发布的版本快照，是从 [Unix Heritage Society archive][14] 中获得，[2][15] 在 [CD-ROM 镜像][16] 中包括 CSRG 全部的源包，[4][17] [Oldlinux site]，[5][19] 和 [FreeBSD 包][20]。[6][21] 其次，以前的，现在的仓库，也就是 CSRG SCCS [[6][22]] 仓库，FreeBSD 1 CVS 仓库，和[现代 FreeBSD 开发的 Git 镜像][23]。[7][24]前两个都是从相同的源获得而作为对应的快照。

最后，也是最费力的数据源是 **primary research**。释出的快照并没有提供关于它们的源头和每个文件贡献者的信息。因此，这些信息片段需要通过 primary research 验证。至于作者信息主要通过作者的自传，研究论文，内部备忘录和旧文档扫描；通过阅读并且自动处理源代码和帮助页面补充；通过与那个年代的人用电子邮件交流；在 *StackExchange* 网站上贴出疑问；查看文件的位置（在早期的内核源代码版本中，分为 `usr/sys/dmr` 和 `/usr/sys/ken`）；从研究论文和帮助手册到源代码，从一个发行版到另一个发行版地宣传中获取。（有趣的是，第一和第二的研究版帮助页面都有一个 “owner” 部分，列出了作者（比如，*Ken*）与对应的系统命令，文件，系统调用，或者功能库。在第四版中这个部分就没了，而在 BSD 发行版中又浮现了 “Author” 部分。）关于作者信息更为详细地写在了项目的文件中，这些文件被用于匹配源代码文件和它们的作者和对应的提交信息。最后，information regarding merges between source code bases was obtained from a [BSD family tree maintained by the NetBSD project][25].[8][26]（不好组织这个语言）

作为该项目的一部分而开发的软件和数据文件，现在可以[在线获取][27]，[9][28]，并且，如果有合适的网络环境，CPU 和磁盘资源，可以用来从头构建这样一个仓库。关于主要发行版的所有者信息，都存储在该项目 `author-path` 目录下的文件里。These contain lines with a regular expressions for a file path followed by the identifier of the corresponding author.（这句单词都认识，但是不理解具体意思）也可以制定多个作者。正则表达式是按线性处理的，所以一个文件末尾的匹配一切的表达式可以指定一个发行版的默认作者。为避免重复，一个以 `.au` 后缀的独立文件专门用于映射作者身份到他们的名字和 email。这样一个文件为每个社区建立了一个，以关联系统的进化：Bell 实验室，Berkeley，386BSD 和 FreeBSD。为了真实性的需要，早期 Bell 实验室发行版的 emails 都以 UUCP 注释列出了（e.g. `research!ken`)。FreeBSD 作者的鉴定人图谱，需要导入早期的 CVS 仓库，通过从如今项目的 Git 仓库里解压对应的数据构建。总的来说，注释作者信息的文件（828 rules）包含 1107 行，并且另外 640 映射作者鉴定人到名字。

现在项目的数据源被编码成了一个 168 行的 `Makefile`。它包括下面的步骤。

**Fetching**	从远程站点复制和克隆大约 11GB 的镜像，档案和仓库。

**Tooling**	从 2.9 BSD 中为旧的 PDP-11 档案获取一个归档器，并作出调整来在现代的 Unix 版本下编译；编译 4.3 BSD *compress* 程序来解压 386BSD 发行版，这个程序不再是现代 Unix 系统的组成部分了。

**Organizing**	用 tar 和 *cpio* 解压缩包；结合第六版的三个目录；用旧的 PDP-11 归档器解压所有的 1 BSD 档案；挂载 CD-ROM 镜像，这样可以作为文件系统处理；组合 8 和 62 386BSD 散乱的磁盘镜像为两个独立的文件。

**Cleaning**	重新存储第一版的内核源代码文件，这个可以通过合适的字符识别从打印输出用获取；给第七版的源代码文件打补丁；移除一个发行版后被添加进来的元数据和其他文件，为避免得到错误的时间戳信息；修复毁坏的 SCCS 文件；通过移除 CVS symbols assigned to multiple revisions with a custom Perl script，删除 CVS *Attr* 文件和用 *cvs2svn* 将 CVS 仓库转换为 Git 仓库，来处理早期的 FreeBSD CVS 仓库。

在仓库表述中有一个很有意思的部分就是，如何导入那些快照，并以一种方式联系起来，使得 *git blame* 可以发挥它的魔力。快照导入到仓库是作为一系列的提交实现的，根据每个文件的时间戳。当所有文件导入后，就被用对应发行版的名字给标记了。在这点上，一个人可以删除那些文件，并开始导入下一个快照。注意 *git blame* 命令是通过回溯一个仓库的历史来工作的，并使用启发法来检测文件之间或内部的代码移动和复制。因此，删除掉的快照间会产生中断，防止它们之间的代码被追踪。

相反，在下一个快照导入之前，之前快照的所有文件都被移动到了一个隐藏的后备目录里，叫做 `.ref`（引用）。它们保存在那，直到下个快照的所有文件都被导入了，这时候它们就会被删掉。因为 `.ref` 目录下的每个文件都完全配对一个原始文件，*git blame* 可以知道多少源代码通过 `.ref` 文件从一个版本移到了下一个，而不用显示出 `.ref` 文件。为了更进一步帮助检测代码起源，同时增加表述的真实性，每个发行版都被表述成了一个合并，介于有增加文件的分支（*-Development*）与之前发行版之间的合并。

上世纪 80 年代这个时期，只有 Berkeley 开发文件的一个子集是用 SCCS 版本控制的。整个时期内，我们统一的仓库里包含了来自 SCCS 的提交和快照增加的文件。在每个发行版的时间点上，可以发现 SCCS 最近的提交，被标记成一个发行版中增加的导入分支的合并。这些合并可以在 Figure [2][29] 中间看到。

将各种数据资源综合到一个仓库的工作，主要是用两个脚本来完成的。一个 780 行的 Perl 脚本（`import-dir.pl`）可以从一个单独的数据源（快照目录，SCCS 仓库，或者 Git 仓库）中，以 *Git fast export* 格式导出（真实的或者综合的）提交历史。输出是一个简单的文本格式，Git 工具用这个来导入和导出提交。其他方面，这个脚本以一些东西为参数，如文件到贡献者的映射，贡献者登录名和他们的全名间的映射，导入的提交会被合并，哪些文件要处理，哪些文件要忽略，和“引用”文件的处理。一个 450 行的 Shell 脚本创建 Git 仓库，并调用带适当参数的 Perl 脚本，导入 27 个可用的历史数据资源。Shell 脚本也会跑 30 遍测试，比较特定标签的仓库和对应的数据源，确认出现的和没出现的备用目录，并查看分支树和合并的数量，*git blame* 和 *git log* 的输出中的退化。最后，*git* 被调用来作垃圾收集和压缩仓库，从最初的 6GB 降到发行的 1GB。

### 4 数据使用 ###

数据可以用于软件工程，信息系统和软件考古学领域的经验性研究。鉴于它从不间断而独一无二的存在了超过了 40 年，可以供软件的进化和代代更迭参考。伴随那个时代以来在处理速度千倍地增长，存储容量百万倍的扩大，数据同样可以用于软件和硬件技术交叉进化的研究。软件开发从研究中心到大学，到开源社区的转移，可以用来研究组织文化对于软件开发的影响。仓库也可以用于学习开发者编程的影响力，比如 Turing 奖获得者（Dennis Ritchie 和 Ken Thompson）和 IT 产业的大佬（Bill Joy 和 Eric Schmidt）。另一个值得学习的现象是代码的长寿，无论是单行的水平，或是作为那个时代随 Unix 发行的完整的系统（Ingres, Lisp, Pascal, Ratfor, Snobol, TMP），和导致代码存活或消亡的因素。最后，因为数据使 Git 底层软件仓库存储技术感到压力，到了它的限度，这会加速修正管理系统领域的工程进度。

![](http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/metrics.png)

Figure 3: Code style evolution along Unix releases.

Figure [3][30] 描述了一些有趣的代码统计，根据 36 个主要 Unix 发行版，验证了代码风格和编程语言的使用在很长的时间尺度上的进化。这种进化是软硬件技术的需求和支持驱动的，软件构筑理论，甚至社会力量。图片中的数据已经计算了在一个所给发行版中出现的文件的平均时间。正如可以从中看到，在过去的 40 年中，验证器和文件名字的长度已经稳定从 4 到 6 个字符增长到 7 到 11 个字符。我们也可以看到在评论数量的少量稳定增加，和 *goto* 表达的使用量减少，同时 *register* 这个类型修改器的消失。

### 5 未来的工作 ###

可以做很多事情去提高仓库的正确性和有效性。创建进程作为源代码开源了，通过 GitHub 的拉取请求，可以很容易地贡献更多代码和修复。最有用的社区贡献会使得导入的快照文件的覆盖增长，这曾经是隶属于一个具体的作者。现在，大约 90,000 个文件（在 160,000 总量之外）被指定了作者，根据一个默认的规则。类似地，大约有 250 个作者（最初 FreeBSD 那些）是验证器确认的。两个都列在了 build 仓库无配对的目录里，也欢迎贡献数据。进一步，BSD SCCS 和 FreeBSD CVS 的提交，共享相同的作者和时间戳，这些可以结合成一个单独的 Git 提交。导入 SCCS 文件提交的支持会被添加进来，为了引入仓库对应的元数据。最后，最重要的，开源系统的更多分支会添加进来，比如 NetBSD OpenBSD， DragonFlyBSD 和 *illumos*。理想地，其他重要的历史上的 Unix 发行版，它们的版权拥有者，如 System III， System V， NeXTSTEP 和 SunOS，也会在一个协议下释出他们的系统，允许他们的合作伙伴使用仓库用于研究。

### 鸣谢 ###

本人感谢很多付出努力的人们。 Brian W. Kernighan, Doug McIlroy 和 Arnold D. Robbins 帮助 Bell 实验室开发了登录验证器。 Clem Cole， Era Erikson， Mary Ann Horton, Kirk McKusick, Jeremy C. Reed, Ingo Schwarze 和 Anatole Shaw 开发了 BSD 的登录验证器。BSD SCCS 导入了 H. Merijn Brand 和 Jonathan Gray 的开发工作的代码。

这次研究通过 National Strategic Reference Framework (NSRF) 的 Operational Program " Education and Lifelong Learning" - Research Funding Program: Thalis - Athens University of Economics and Business - Software Engineering Research Platform，由 European Union ( European Social Fund - ESF) 和 Greek national funds 出资赞助。

### 引用 ###

[[1]][31]
    M. D. McIlroy, E. N. Pinson, and B. A. Tague, "UNIX time-sharing system: Foreword," *The Bell System Technical Journal*, vol. 57, no. 6, pp. 1899-1904, July-August 1978.

[[2]][32]
    D. M. Ritchie and K. Thompson, "The UNIX time-sharing system," *Bell System Technical Journal*, vol. 57, no. 6, pp. 1905-1929, July-August 1978.

[[3]][33]
    D. M. Ritchie, "The evolution of the UNIX time-sharing system," *AT&T Bell Laboratories Technical Journal*, vol. 63, no. 8, pp. 1577-1593, Oct. 1984.

[[4]][34]
    P. H. Salus, *A Quarter Century of UNIX*.    Boston, MA: Addison-Wesley, 1994.

[[5]][35]
    E. S. Raymond, *The Art of Unix Programming*.    Addison-Wesley, 2003.

[[6]][36]
    M. J. Rochkind, "The source code control system," *IEEE Transactions on Software Engineering*, vol. SE-1, no. 4, pp. 255-265, 1975. 

----------

#### Footnotes: ####

[1][37] - [https://github.com/dspinellis/unix-history-repo][38]

[2][39] - Updates may add or modify material. To ensure replicability the repository's users are encouraged to fork it or archive it.

[3][40] - [http://www.tuhs.org/archive_sites.html][41]

[4][42] - [https://www.mckusick.com/csrg/][43]

[5][44] - [http://www.oldlinux.org/Linux.old/distributions/386BSD][45]

[6][46] - [http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/][47]

[7][48] - [https://github.com/freebsd/freebsd][49]

[8][50] - [http://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/share/misc/bsd-family-tree][51]

[9][52] - [https://github.com/dspinellis/unix-history-make][53]

--------------------------------------------------------------------------------

via: http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html

译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#MPT78
[2]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#RT78
[3]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#Rit84
[4]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#Sal94
[5]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#Ray03
[6]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#sec:data
[7]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#sec:dev
[8]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#sec:use
[9]:https://github.com/dspinellis/unix-history-repo
[10]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAB
[11]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAC
[12]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#fig:provenance
[13]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#fig:branches
[14]:http://www.tuhs.org/archive_sites.html
[15]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAD
[16]:https://www.mckusick.com/csrg/
[17]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAE
[18]:http://www.oldlinux.org/Linux.old/distributions/386BSD
[19]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAF
[20]:http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/
[21]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAG
[22]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#SCCS
[23]:https://github.com/freebsd/freebsd
[24]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAH
[25]:http://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/share/misc/bsd-family-tree
[26]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAI
[27]:https://github.com/dspinellis/unix-history-make
[28]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFtNtAAJ
[29]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#fig:branches
[30]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#fig:metrics
[31]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITEMPT78
[32]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITERT78
[33]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITERit84
[34]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITESal94
[35]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITERay03
[36]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#CITESCCS
[37]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAB
[38]:https://github.com/dspinellis/unix-history-repo
[39]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAC
[40]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAD
[41]:http://www.tuhs.org/archive_sites.html
[42]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAE
[43]:https://www.mckusick.com/csrg/
[44]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAF
[45]:http://www.oldlinux.org/Linux.old/distributions/386BSD
[46]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAG
[47]:http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/
[48]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAH
[49]:https://github.com/freebsd/freebsd
[50]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAI
[51]:http://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/share/misc/bsd-family-tree
[52]:http://www.dmst.aueb.gr/dds/pubs/conf/2015-MSR-Unix-History/html/Spi15c.html#tthFrefAAJ
[53]:https://github.com/dspinellis/unix-history-make
