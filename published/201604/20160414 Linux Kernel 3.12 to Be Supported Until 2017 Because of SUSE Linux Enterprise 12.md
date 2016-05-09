因 SUSE Linux Enterprise 12，Linux Kernel 3.12 的支持延长至 2017 年
==================================================================================

>Linux 内核开发者 Jiri Slaby 已经宣布了 Linux 3.12 系列内核的第 58 个长期支持维护版本，以及关于生命周期状态的一些修改。

Linux Kernel 3.12.58 LTS（长期支持版）已经可用，那些运行该版本内核的 Linux 操作系统应尽快升级。有个好消息是 Linux 3.12 分支的支持将延长一年至 2017 年，因为 SUSE Linux Enterprise (SLE) 12 Service Pack 1 正是基于该分支。

“因为 SLE12-SP1 基于 3.12 之上，并且它的生命周期持续到 2017 年，所以将 3.12 的生命周期结束也修改到 2017 年，”Jiri Slaby 在发到 Linux 内核邮件列表的一个[补丁声明][1]中说道，同时他还公布了其它内核分支的生命周期结束时间（EOL，end of life），比如 Linux 3.14 为 2016 年 8 月，Linux 3.18 为 2017 年 1 月，Linux 4.1 是 2017 年 9 月。

###  Linux kernel 3.12.58 LTS 改动

如果你想知道 Linux kernel 3.12.58 LTS 中有哪些改动，我们能告诉你的是，通过[附加的短日志][2]可知，这是一个健康的更新，改动涉及 114 个文件，有 835 行插入和 298 行删除。在这些改动之中，我们注意到多数是声音和网络栈的改进，以及许多驱动的更新。

更新中还有多个对 x86 硬件架构的改进，以及一些对 Xtensa 和 s390 的小修复。文件系统，如 NFS，OCFS2，Btrfs，JBD2 还有 XFS 也都收到了不同的修复，在驱动的更新中可以提到的还有 USB，Xen，MD，MTD，媒体，SCSI，TTY，网络，ATA，蓝牙，hwmon，EDAC 以及 CPUFreq。

和往常一样，你现在就可以从我们网站（linux.com）或直接从 kernel.org [下载 Linux kernel 3.12.58 LTS 的源码][3]。如果您的 GNU/Linux 操作系统运行的是 Linux 3.12 系列内核，请尽快升级您的内核。

------------------------------------------------------------------------------

via: http://www.linux.com/news/featured-blogs/191-linux-training/834644-7-steps-to-start-your-linux-sysadmin-career

作者：[Marius Nestor][a]
译者：[alim0x](https://github.com/alim0x)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
[1]: http://lkml.iu.edu/hypermail/linux/kernel/1604.1/00792.html
[2]: http://www.spinics.net/lists/stable/msg128634.html
[3]: http://linux.softpedia.com/get/System/Operating-Systems/Kernels/Linux-Kernel-Stable-1960.shtml
