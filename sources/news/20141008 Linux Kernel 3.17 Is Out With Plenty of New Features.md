Linux Kernel 3.17 Is Out With Plenty of New Features
================================================================================
Linus Torvalds has announced the latest stable release of the Linux kernel, version 3.17.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

Announced in his typical [laissez-faire style][1] in a post on the Linux Kernel Mailing List Torvalds explained:

> “So the past week was fairly calm, and so I have no qualms about releasing 3.17 on the normal schedule (as opposed to the optimistic “maybe I can release it one week early” schedule that was not to be).”

Due to travel Linus says he won’t start merging changes for Linux 3.18 just yet:

> “I now have travel coming up – something I hoped to avoid when I was hoping for releasing early. Which means that while 3.17 is out, I’m not going to be merging stuff very actively next week, and the week after that is LinuxCon EU…”

### What’s New In Linux 3.17? ###

As with every new release, Linux 3.17 sees the kernel loaded up on the latest improvements, hardware support, fixes and so on. These range from the bamboozling – e.g., [memfd and file sealing patches][2] – to the sort of things most of us appreciate, such as support for new hardware.

Below is a short list compiling some notable highlights of this release. It’s by no means exhaustive.

- Microsoft Xbox One controller support (without vibration)
- Additional improvements to Sony SIXAXIS support
- Toshiba “Active Protection Sensor” support 
- New ARM support includes Rockchip RK3288 and AllWinner A23 SoCs
- “Cross-thread filter setting” for secure computing facility
- Broadcom BCM7XXX-based board support (used in various set-top boxes)
- Enhanced AMD Radeon R9 290 support
- Misc. Nouveau driver improvements, including Kepler GPU fixes
- Audio support includes Wildcatpoint Audio DSP on Intel Broadwell Ultrabooks.

### Installing Linux 3.17 on Ubuntu ###

Although classed as stable there is, at present, little need for most of us to “have it now”.

But if you’re impatient and — **more importantly** — skilled enough to handle issues resulting from it, you can install Linux 3.17 in Ubuntu 14.10 by installing the appropriate set of packages for your system from the mainline kernel archive maintained by Canonical.

**Do not attempt to install anything from this link unless you know what you’re doing.**

- [Visit the Ubuntu Kernel Mainline Archive][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/10/linux-kernel-3-17-whats-new-improved

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://lkml.iu.edu/hypermail/linux/kernel/1410.0/02818.html
[2]:http://lwn.net/Articles/607627/
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D