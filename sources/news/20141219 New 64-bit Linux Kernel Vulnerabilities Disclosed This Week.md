New 64-bit Linux Kernel Vulnerabilities Disclosed This Week
================================================================================
![](http://www.phoronix.com/assets/categories/linuxkernel.jpg)

For those that didn't hear the news yet, multiple Linux x86_64 vulnerabilities were made public this week.

With CVE-2014-9322 that's now public, there's a local privilege escalation issue affecting all kernel versions prior to Linux 3.17.5. CVE-2014-9322 is described as "privilege escalation due to incorrect handling of a #SS fault caused
by an IRET instruction. In particular, if IRET executes on a writeable kernel stack (this was always the case before 3.16 and is sometimes the case on 3.16 and newer), the assembly function general_protection will execute with the user's gsbase and the kernel's gsbase swapped. This is likely to be easy to exploit for privilege escalation, except on systems with SMAP or UDEREF. On those systems, assuming that the mitigation works correctly, the impact of this bug may be limited to massive memory corruption and an eventual crash or reboot."

Fortunately, it's fixed [in Linux kernel Git since late November][1]. CVE-2014-9322 is linked to CVE-2014-9090, which is also corrected by the fixes in Git. 

There's also two x86_64 kernel bugs related to espfix. "The next two bugs are related to espfix. The IRET instruction has IMO a blatant design flaw: IRET to a 16-bit user stack segment will leak bits 31:16 of the kernel stack pointer. This flaw exists on 32-bit and 64-bit systems. 32-bit Linux kernels have mitigated this leak for a long time, and 64-bit Linux kernels have mitigated this leak since 3.16. The mitigation is called espfix."

Fixes for CVE-2014-8133 and CVE-2014-8134 are in KVM and Linux kernel Git as of a few days ago. More details on these x86_64 vulnerabilities via [this oss-sec posting][2]. These issues were uncovered by Andy Lutomirski at AMA Capital Management.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTg2NzY

作者：[Michael Larabel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.michaellarabel.com/
[1]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/x86/kernel/entry_64.S?id=6f442be2fb22be02cafa606f1769fa1e6f894441
[2]:http://seclists.org/oss-sec/2014/q4/1052