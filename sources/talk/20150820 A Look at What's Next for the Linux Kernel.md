A Look at What's Next for the Linux Kernel
================================================================================
![](http://www.eweek.com/imagesvr_ce/485/290x195cilinux1.jpg)

**The upcoming Linux 4.2 kernel will have more contributors than any other Linux kernel in history, according to Linux kernel developer Jonathan Corbet.**

SEATTLE—The Linux kernel continues to grow—both in lines of code and the number of developers that contribute to it—yet some challenges need to be addressed. That was one of the key messages from Linux kernel developer Jonathan Corbet during his annual Kernel Report session at the LinuxCon conference here.

The Linux 4.2 kernel is still under development, with general availability expected on Aug. 23. Corbet noted that 1,569 developers have contributed code for the Linux 4.2 kernel. Of those, 277 developers made their first contribution ever, during the Linux 4.2 development cycle.

Even as more developers are coming to Linux, the pace of development and releases is very fast, Corbet said. He estimates that it now takes approximately 63 days for the community to build a new Linux kernel milestone.

Linux 4.2 will benefit from a number of improvements that have been evolving in Linux over the last several releases. One such improvement is the introduction of OverlayFS, a new type of read-only file system that is useful because it can enable many containers to be layered on top of each other, Corbet said.

Linux networking also is set to improve small packet performance, which is important for areas such as high-frequency financial trading. The improvements are aimed at reducing the amount of time and power needed to process each data packet, Corbet said.

New drivers are always being added to Linux. On average, there are 60 to 80 new or updated drivers added in every Linux kernel development cycle, Corbet said.

Another key area that continues to improve is that of Live Kernel patching, first introduced in the Linux 4.0 kernel. With live kernel patching, the promise is that a system administrator can patch a live running kernel without the need to reboot a running production system. While the basic elements of live kernel patching are in the kernel already, work is under way to make the technology all work with the right level of consistency and stability, Corbet explained.

**Linux Security, IoT and Other Concerns**

Security has been a hot topic in the open-source community in the past year due to high-profile issues, including Heartbleed and Shellshock.

"I don't doubt there are some unpleasant surprises in the neglected Linux code at this point," Corbet said.

He noted that there are more than 3 millions lines of code in the Linux kernel today that have been untouched in the last decade by developers and that the Shellshock vulnerability was a flaw in 20-year-old code that hadn't been looked at in some time.

Another issue that concerns Corbet is the Unix 2038 issue—the Linux equivalent of the Y2K bug, which could have caused global havoc in the year 2000 if it hadn't been fixed. With the 2038 issue, there is a bug that could shut down Linux and Unix machines in the year 2038. Corbet said that while 2038 is still 23 years away, there are systems being deployed now that will be in use in the 2038.

Some initial work took place to fix the 2038 flaw in Linux, but much more remains to be done, Corbet said. "The time to fix this is now, not 20 years from now in a panic when we're all trying to enjoy our retirement," Corbet said.

The Internet of things (IoT) is another area of Linux concern for Corbet. Today, Linux is a leading embedded operating system for IoT, but that might not always be the case. Corbet is concerned that the Linux kernel's growth is making it too big in terms of memory footprint to work in future IoT devices.

A Linux project is now under way to minimize the size of the Linux kernel, and it's important that it gets the support it needs, Corbet said.

"Either Linux is suitable for IoT, or something else will come along and that something else might not be as free and open as Linux," Corbet said. "We can't assume the continued dominance of Linux in IoT. We have to earn it. We have to pay attention to stuff that makes the kernel bigger."

--------------------------------------------------------------------------------

via: http://www.eweek.com/enterprise-apps/a-look-at-whats-next-for-the-linux-kernel.html

作者：[Sean Michael Kerner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.eweek.com/cp/bio/Sean-Michael-Kerner/