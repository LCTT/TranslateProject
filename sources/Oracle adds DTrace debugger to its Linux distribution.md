Oracle adds DTrace debugger to its Linux distribution
================================================================================
> Oracle Linux administrators can finally take advantage of the powerful DTrace debugging tool that was first designed for Solaris

IDG News Service - Oracle has fully integrated the long-awaited Linux DTrace debugging tool into the latest release of its Linux distribution, potentially allowing administrators and developers to pinpoint the cause of thorny performance issues with more accuracy.

[Oracle Linux][1] 6.5 also includes an updated kernel and support for Linux Containers, allowing a single kernel to power multiple Linux virtual machines on a server.

Much like the CentOS distribution, Oracle Linux is largely a copy of Red Hat Enterprise Linux (RHEL), version 6.5 of which Red Hat released last month. Oracle does include in the package its own kernel -- the core of an OS -- customized for security enhancements, as well as some additional administrative tools. Both the Oracle and Red Hat editions are targeted to enterprise use. (The volunteer-driven CentOS 6.5 distribution [was also recently released][2].)

For the first time, Oracle's customized kernel, Unbreakable Enterprise Kernel Release 3, is installed as the default kernel for the distribution -- the stock RHEL kernel is also included in the package as an alternative. As a result, Oracle Linux now supports the DTrace dynamic tracing framework out of the box, though it still needs to be downloaded separately. Oracle Linux 6.4 [offered][3] users a way to download and install DTrace, though it required changes to the kernel.

Originally developed by Sun Microsystems, which was acquired by Oracle in 2010, DTrace can help developers debug, or trace, problems that occur on a system. Known for its thoroughness in documenting system behavior, the software was originally designed for Sun's Solaris Unix distribution, and administrators have long agitated for a version [to run][4] on Linux as well.

DTrace allows administrators and developers "to get insight into the operating system and understand what is consuming resources," said Markus Flierl, Oracle's Solaris vice president of engineering. The software can not only investigate problems with the OS, but also identify potential problems with applications and the networking stack as well.

"If your customer is complaining that something is running slow, you can go in and see if there is a problem that is happening in your operating system, or if it is in your I/O stack. You will get a full top-to-bottom view, a single pane of glass to see what is happening," Flierl said. Having DTrace on board a server will also allow other Oracle debugging tools, such as those found in the Oracle 12c database, to use the DTrace instrumentations as well, he said.

With the introduction of Linux Containers in Linux Oracle 6.5, users now have another option for virtualizing workloads. In this approach, the server's kernel can drive any number of virtual Linux machines, with each one completely isolated from the others. The Linux Control Groups management software assures that each container is allotted a select amount of memory, CPU and disk I/O resources. Oracle also provides templates for quickly setting up containers.

Other updates in the Oracle Linux package support the latest technologies in InfiniBand networking, file systems, processors and solid state disks.

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9244564/Oracle_adds_DTrace_debugger_to_its_Linux_distribution?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.oracle.com/us/technologies/linux/overview/index.html
[2]:http://lists.centos.org/pipermail/centos-announce/2013-December/020032.html
[3]:http://www.infoworld.com/d/application-development/oracle-ports-dtrace-oracle-linux-213759
[4]:http://stackoverflow.com/questions/2059311/whats-an-alternative-for-dtrace-on-linux