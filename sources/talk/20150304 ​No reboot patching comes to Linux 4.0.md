​No reboot patching comes to Linux 4.0
================================================================================
>  **Summary**:With the new Linux 4.0 kernel, you'll need to reboot Linux less often than ever.

With [Linux 4.0][1], you may never need to reboot your operating system again.

![Using Linux means never having to reboot. -- SUSE ](http://zdnet4.cbsistatic.com/hub/i/r/2015/03/02/5e766833-454b-45b5-a8f7-a55d21e9d26a/resize/270x270/4d0774552c342a1507784ef802619b71/livepatching.jpg)
Using Linux means never having to reboot. -- SUSE 

One reason to love Linux on your servers or in your data-center is that you so seldom needed to reboot it. True, critical patches require a reboot, but you could go months without rebooting. Now, with the latest changes to the Linux kernel you may be able to go years between reboots.

This is actually a feature that was available in Linux in 2009 thanks to a program called [Ksplice][2]. This program compares the original and patched kernels and then uses a customized kernel module to patch the new code into the running kernel. Each Ksplice-enabled kernel comes with a special set of flags for each function that will be patched. The [Ksplice process][3] then watches for a moment when the code for the function being patched isn't in use, and ta-da, the patch is made and your server runs on. 

[Oracle acquired Ksplice][4] in 2011, and kept it just for its own [Oracle Linux][5], a [Red Hat Enterprise Linux (RHEL)][6] clone, and as a RHEL subscription service. That left all the other enterprise and server Linux back where they started.

Then [KernelCare released a service that could provide bootless patches][7] for most enterprise Linux distros. This program use proprietary software and is only available as a service with a monthly fee. That was a long way from satisfying many Linux system administrators.

So, [Red Hat][8] and [SUSE][9] both started working on their own purely open-source means of giving Linux the ability to keep running even while critical patches were being installed. Red Hat's program was named [kpatch][10], while SUSE' is named [kGraft][11]. 

The two companies took different approaches. Kpatch issues a stop_machine() command. After that it looks at the stack of existing processes using [ftrace][12] and, if the patch can be made safely, it redirects the running code to the patched functions and then removes the now outdated code.

Kgraft also uses ftrace, but it works on the thread level. When an old function is called it makes sure the thread reaches a point that it can switch to the new function.

While the end result is the same, the operating system keeps running while patches are made, there are significant differences in performance. Kpatch takes from one to forty milliseconds, while kGraft might take several minutes but there's never even a millisecond of down time. 

At the Linux Plumbers Conference in October 2014, the two groups got together and started work on a way to [patch Linux without rebooting that combines the best of both programs][13]. Essentially, what they ended up doing was putting both kpatch and kGraft in the 4.0 Linux kernel.

Jiri Kosina, a SUSE software engineer and Linux kernel developer, explained, that live-patching in the Linux kernel will "provides a basic infrastructure for function "live patching" (i.e. code redirection), including API [application programming interface] for kernel modules containing the actual patches, and API/ABI [application binary interface] for userspace to be able to operate on the patches. This is "relatively simple and minimalistic, as it's making use of existing kernel infrastructure (namely ftrace) as much as possible. It's also self-contained, in a sense that it doesn't hook itself in any other kernel subsystem (it doesn't even touch any other code)."

The release candidate for Linux 4.0 is now out. Kosina stated that "It's now implemented for x86 only as a reference architecture, but support for powerpc, s390 and arm is already in the works." And, indeed, the source code for these architectures is already in the [Live Patching Git code][14].

Simply having the code in there is just the start. Your Linux distribution will have to support it with patches that can make use of it. With both Red Hat and SUSE behind it, live patching will soon be the default in all serious business Linux distributions. 

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/no-reboot-patching-comes-to-linux-4-0/#ftag=RSSbaffb68

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/sjvn/
[1]:http://www.zdnet.com/article/linux-kernel-turns-over-release-odometer-to-4-0/
[2]:http://www.computerworld.com/article/2466389/open-source-tools/never-reboot-again-with-linux-and-ksplice.html
[3]:http://www.ksplice.com/
[4]:http://www.zdnet.com/article/oracle-acquires-zero-downtime-linux-upgrade-software/
[5]:http://www.oracle.com/us/technologies/linux/overview/index.html
[6]:http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[7]:http://www.zdnet.com/article/kernelcare-new-no-reboot-linux-patching-system/
[8]:http://www.redhat.com/
[9]:http://www.suse.com/
[10]:http://rhelblog.redhat.com/2014/02/26/kpatch/
[11]:http://www.zdnet.com/article/suse-gets-live-patching/
[12]:http://elinux.org/Ftrace
[13]:http://linuxplumbersconf.org/2014/wp-content/uploads/2014/10/LPC2014_LivePatching.txt
[14]:https://kernel.googlesource.com/pub/scm/linux/kernel/git/jikos/livepatching/+/9ec0de0ee0c9f0ffe4f72da9158194121cc22807