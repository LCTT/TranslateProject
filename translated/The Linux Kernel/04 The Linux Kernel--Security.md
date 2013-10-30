04 Linux 内核: 安全
================================================================================
![](http://www.linux.org/attachments/slide-jpg.278/)

Linux内核是所有Linux系统的核心。如果有任何恶意代码控制或损害了内核的任何一部分,那么系统会严重受损,文件可以被删除或损坏,私人信息可能被盗等等。很明显,保持内核安全涉及到用户的最大利益。值得庆幸的是,由于内核及其安全，Linux是一个非常安全的系统。在用户比例上，Linux病毒比Windows病毒更少，并且Linux用户比Windows用户个人更少感染病毒。(这就是为什么许多公司使用Linux来管理他们的服务器的一个原因。) 然而,我们仍然没有借口去忽视内核的安全。Linux可能有些安全特性和程序,但只有Linux安全模块(LSM)和其他内核安全将会在本文中讨论。

AppArmor是最初是由Immunix写的安全模块。自从2009年以来,Canonical维护着代码(Novell在Immunix之后Cononical以前处理过代码)。这个安全模块已经从2 6.36版本进入Linux主流分支。AppArmor限制了程序的能力。AppArmor使用文件路径来跟踪程序限制。许多Linux管理员称AppArmor是最容易配置的安全模块。然而,而许多Linux用户觉得这个模块提供了最糟糕的安全替代品。

安全增强Linux(SELinux)是AppArmor的替代品，它最初由美国国家安全局开发(NSA).SELinux自从2.6版本就进入主线内核。SELinux是限制修改内核和用户空间的工具。SELinux给可执行文件(主要是守护进程和服务端程序)最小特权去完成它们的任务。SELinux也可以用来控制用户权限。SELinux不像AppArmor那样使用文件路径,而SELinux在追踪权限时使用文件系统去标记可执行文件。因为SElinux本身使用文件系统管理可执行文件,所以SELinux不能像AppArmor那样对整个文件系统提供保护。

注意：守护进程是在后台运行的程序

注意：虽然在内核中有AppArmor、SELinux等，但只能有一个安全模块被激活。

Smack是安全模块的另一种选择。Smack从2.6.25起进入主线内核。Smack应该比AppArmor更安全但比SElinux更容易配置。

TOMOYO，是另外一种安全模块，在2.6.30进入主线内核。TOMOYO可以提供安全,但是它的主要用途是分析系统安全缺陷。

AppArmor、SELinux、Smack和TOMYO组成了四个标准Linux安全模块。这些都通过使用强制访问控制(MAC)工作，这是通过限制程序或者用户执行一些任务的访问控制。安全模块还有某些形式的列表规定了它们可以做什么不可以做什么。

Yama在Linux内核中新的安全模块。Yama还没有作为标准的安全模块，但是在将来他会成为第5个标准安全模块。Yams和其他安全模块一样使用相同的原理。

“grsecurity”是一系列Linux内核安全补丁的集合。多数补丁应用于远程网络连接和缓冲溢出(以后讨论)。grsecurity一个有趣的组件是PaX。PaX补丁允许内存上的代码最少地使用到特权。例如，含有程序的内存被标为不可写。想想看，为什一个可执行的程序需要在内存中是可写的？现在恶意代码不能修改目前正在执行的程序。缓冲溢是一种当程序由于bug或者恶意代码在内存上写入数据并让它的内存边界超出到其他程序的内存页上的事件。当Pax被激活时，它会帮助阻止这些缓冲溢出因为程序没有写到其他内存页上的权限。

Linux入侵检测系统(LIDS)是一个内核安全补丁，提供了强制访问控制(MAC)的特性。这个补丁就像扮演LSM模块的角色。

Systrace是一个减少和控制应用程序访问系统文件和系统调用的工具。系统调用是对内核的服务请求。比如，当一个文本编辑器写入一个文件到硬盘上时，程序将会发送一个系统请求让内核写入文件到硬盘中

These are very important components in the Linux security system. These security modules and patches keep malicious code from attacking the kernel. Without these features, Linux systems would be unsecure computer operating systems.
这些是在Linux安全系统中非常重要的组件。这些安全模块和补丁使内核免于受到恶意代码的攻击。没有这些特性，Linux系统将会变成一个不安全的操作系统。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-security.4223/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
