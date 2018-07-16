Linux 内核的测试和调试（6）
================================================================================
### Linux 内核补丁测试 ###

你试过自己写内核补丁吗？本节介绍在把你的补丁包提交到 Linux 邮箱列表之前，需要做哪些操作。另外我们还会介绍如何把它发送出去。

写好代码后，编译它。把 make 过程产生的输出保存到文档中，查看新代码有没有警告信息。找到所有的警告信息，处理掉。当你的代码编译过程没有任何不正常的输出，安装这个内核，然后启动测试。如果启动正常，查看 dmesg 里面有没于错误，与老内核生成的 dmesg 日志做个比较。运行一些压力测试，请参考我们以前讲过的测试内容。如果这个补丁用于修复某个 bug，请确保真的已经修复了。如果真的修复了，请确保能通过系统测试。找出打你补丁的模块下面的回归测试工具，运行一下。如果补丁涉及到其他架构，你需要交叉编译然后测试一下。请通过下面的目录查找测试工具：

- linux_git/Documentation
- linux_git/tools/testing
- 交叉编译参考：[在 x86_64 架构上交叉编译 Linux 内核：初学者教程][1]

如果你对你的补丁测试结果感到很满意，你就可以提交补丁了。请确保提交 commit 的信息要描述得非常清楚。要让内核维护者和其他开发者看懂补丁所修改的内容，这一点非常重要。生成补丁后，执行 scripts/checkpatch.pl 脚本，找到 checkpatch 是产生的错误或警告（如果有的话），修复它们。重新生成补丁，直到补丁通过这个脚本的测试。重新测试这个补丁。将本补丁用于其他的内核源码上，保证不会有冲突产生。

现在你做好提交补丁的准备了。先运行 `scriptst/get_maintainer.pl` 来确认你应该把补丁发给哪个内核维护者。注意不要以附件形式发送补丁，而是以纯文本形式粘贴在邮件里面。确保你的邮件客户端可以发送纯文本信息，你可以试试给自己发送一份补丁邮件来测试你的邮件客户端的功能。收到自己的邮件后，运行 checkpatch 命令并给自己的内核源码打上你的补丁。如果这两部都能通过，你就可以给 Linux 邮箱列表发送补丁了。使用 git send-email 命令是提交补丁最安全的方式，可以避免你的邮箱的兼容性问题。你的 .gitconfig 文件里面需要配置好有效的 smtp 服务器，详细操作参考 git 的帮助文档。

更多提交补丁的规矩，请参考下面的资料：

- linux_git/Documentation/applying-patches.txt
- linux_git/Documentation/SubmitChecklist
- linux_git/Documentation/SubmittingDrivers
- linux_git/Documentation/SubmittingPatches
- linux_git/Documentation/stable_kernel_rules.txt
- linux_git/Documentation/stable_api_nonsense.txt

下面是一些内核测试教程的资料：

- [USB Testing on Linux][2]
- [Linux Kernel Tester's Guide Chapter2][3]
- [Linux Kernel Tester's Guide][4]
- [Testing resources at eLinux.org][5]
- [eLinux Debugging Portal][6]

### 内核测试套件和项目 ###

除我们讨论过的测试资源之外，这里还有很多测试项目值得介绍，包括开源的和厂家自己提供的。这些项目每一个都是针对特定领域的，比如嵌入式或者企业自己使用。我们简单过一下。

[Linux 测试项目][7]（LTP）测试套件是一系列工具的集合，用于测试内核的可靠性、健壮性和稳定性。你可以为这个项目添加自己的测试代码，并且 LTP 项目欢迎你贡献自己的代码。runltp 脚本默认情况下会测试下面的子系统：

- 文件系统压力测试
- 磁盘 IO 测试
- 内存管理压力测试
- IPC（进程间通信）测试
- 调度器测试
- 命令的功能性验证测试
- 系统调用功能验证测试

[**LTP-DDT**][8] 是一个基于 LTP 的测试应用（LCTT：就是 LTP 的阉割版么），专注于测试嵌入式设备驱动。

[**Linux Driver Verification**][9] 这个项目的目标是提高 Linux 设备驱动的质量，它为设备驱动验证开发了集成环境平台，并且利用与时俱进的研究来增强验证工具的质量。

### 一致性测试 ###

如果你有将某个 Unix 平台下的应用一直到另一个平台的经验，你就能理解 [Linux Standard Base (LSB)][10] 和 LSB 一致性测试套件的重要性了。LSB 是 Linux Foundation 工作组创建的用于降低支持不同 Linux 平台所需要的开销，方法就是通过降低不同 Linux 发行版之间的差别，保证应用在不同发行版之间的可移植性。前事不忘后事之师，Unix 世界的分歧在 Linux 世界一定要避免。这就是为什么你可以把一个 rpm 包转化成 deb 包后还能安装并正常运行的秘密。

### 静态分析工具 ###

静态分析之所以会被称为“静态分析”，是因为这些工具只分析代码，并不执行它们。分析 Linux 内核代码的静态分析工具有很多，Sparse 是 Linus Torvalds 写的专门用于检查内核静态类型的工具。它是一个语义检查器，会为 C 语言的语义建立语义检析树，执行惰性类型评估。内核编译系统支持 sparse，并且为编译内核的命令提供开启 sparse 的选项。

为内核所有需要重新编译的 C 文件执行 sparse 语义检查：

    make C=1 allmodconfig

为内核所有 C 文件（即使不需要重新编译）执行 sparse 语义检查：

    make C=2 allmodconfig

Sparse 的资源：

- [Sparse Archive][11]
- [Sparse How To][12]

Smatch 分析程序代码的逻辑错误。它可以检测到诸如“为一个没锁上的 spinlock 执行解锁”的逻辑错误。内核源码支持 smatch：

在 Linux 内核中运行 smatch：

    make CHECK="~/path/to/smatch/smatch -p=kernel" C=1 bzImage modules | tee warns.txt

请参考下面的资料来获取和编译 smatch。需要注意的是 smatch 是个正在发展的项目，架构会不断变化。

- [**Smatch**][12]

那么我们该怎么处理 Sparse 和 Smatch 所发现的语义和逻辑上的错误呢？一些错误可以被分离为日常问题或模块问题，可以轻易被解决。但是有些语义错误涉及到全局，因为剪切粘贴了一些代码。在一些环境中，当一些接口函数被废弃不再使用，或者仅仅做了写微小的修改，你就需要大规模更新源码。这时候你需要 Coccinelle 来帮忙。，Coccinelle 使用 SmPL 语言（语义包语言）来为 C 代码提供匹配和转换代码的功能。Coccinelle 的从一开始就作为 Linux 的附属产品持续发展的。

举个例子：foo(int) 函数突然变成 foo(int, char \*) 函数，多出了一个输入参数（可以把第二个参数置为 null）。所有调用 foo() 函数的代码都需要更新了，这可能是个悲摧的体力活。但是使用 Coccinelle 的话，这项工作瞬间变得轻松，脚本会帮你找到调用 foo(parameter1) 的代码，然后替换成 foo(parameter1, NULL)。做完这些后，所有调用这个函数的代码都可以运行一遍，验证下第二个参数为 NULL 是否能正常工作。关于 Coccinelle 的更多信息，以及在不同项目中（当然，也包括 Linux 内核这个项目）的使用方法，请参考项目主页：[**Cocinelle**][13]。

### 参考文献 ###

本文涵盖了很多方面，这里列出一些参考文档供读者做进一步研究。

- [KernelHacking][14]
- [kernel Documentation][15]
- [Linux Device Drivers, Third Edition][16]
- [Dynamic Event Tracing in Linux Kernel][17]
- [Kernel Testing: Tool and Techniques][18]

### 鸣谢 ###

感谢来自 Oracle 的 Khalid Aziz，审查校对并提供许多非常有价值的建议。感谢来自三星的 Mauro Chehab 和 Guy Martin，他们给了我多次反馈。感谢来自 Linux Foundation 的 Grey Kroah-Hartman 对本文的审阅。感谢来自三星的 Ibrahim Haddad，没有他的支持和鼓励，我可能还不会坐下来写出这篇文章。

----------

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/pictures/picture-1088573.jpg)

作者：[Shuah Khan][a]

Shuah Khan 是三星公司开源组的高级 Linux 内核开发工程师。
她为 Linux 内核中的 IOMMU、DMA、电源管理、PCIe 贡献代码，同时维护内核，为内核提供补丁包。Shuah 有多年 Unix 内核开发经验。她也为 OpenHPI 和 LLDP 项目作贡献。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,5

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://events.linuxfoundation.org/sites/events/files/slides/Shuah_Khan_cross_compile_linux.pdf
[2]:http://www.linux-usb.org/usbtest/
[3]:http://kernelnewbies.org/Linux_Kernel_Tester%27s_Guide_Chapter2
[4]:http://www.kerneltravel.net/downloads/tester_guide.pdf
[5]:http://elinux.org/Test_Systems
[6]:http://elinux.org/Debugging_Portal
[7]:http://ltp.sourceforge.net/documentation/how-to/ltp.php
[8]:http://processors.wiki.ti.com/index.php/LTP-DDT
[9]:http://linuxtesting.org/project/ldv
[10]:http://www.linuxfoundation.org/collaborate/workgroups/lsb
[11]:http://codemonkey.org.uk/projects/git-snapshots/sparse/
[12]:http://smatch.sourceforge.net/
[13]:http://coccinelle.lip6.fr/
[14]:http://kernelnewbies.org/KernelHacking
[15]:http://kernelnewbies.org/Documents
[16]:http://lwn.net/Kernel/LDD3/
[17]:http://events.linuxfoundation.org/slides/lfcs2010_hiramatsu.pdf
[18]:http://events.linuxfoundation.org/images/stories/slides/elc2013_porter.pdf
[a]:http://www.linuxjournal.com/users/shuah-khan
