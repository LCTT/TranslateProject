[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Booting Linux faster)
[#]: via: (https://opensource.com/article/19/1/booting-linux-faster)
[#]: author: (Stewart Smith https://opensource.com/users/stewart-ibm)

Booting Linux faster
======
Doing Linux kernel and firmware development leads to lots of reboots and lots of wasted time.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY)
Of all the computers I've ever owned or used, the one that booted the quickest was from the 1980s; by the time your hand moved from the power switch to the keyboard, the BASIC interpreter was ready for your commands. Modern computers take anywhere from 15 seconds for a laptop to minutes for a small home server to boot. Why is there such a difference in boot times?

A microcomputer from the 1980s that booted straight to a BASIC prompt had a very simple CPU that started fetching and executing instructions from a memory address immediately upon getting power. Since these systems had BASIC in ROM, there was no loading time—you got to the BASIC prompt really quickly. More complex systems of that same era, such as the IBM PC or Macintosh, took a significant time to boot (~30 seconds), although this was mostly due to having to read the operating system (OS) off a floppy disk. Only a handful of seconds were spent in firmware before being able to load an OS.

Modern servers typically spend minutes, rather than seconds, in firmware before getting to the point of booting an OS from disk. This is largely due to modern systems' increased complexity. No longer can a CPU just come up and start executing instructions at full speed; we've become accustomed to CPU frequency scaling, idle states that save a lot of power, and multiple CPU cores. In fact, inside modern CPUs are a surprising number of simpler CPUs that help start the main CPU cores and provide runtime services such as throttling the frequency when it gets too hot. On most CPU architectures, the code running on these cores inside your CPU is provided as opaque binary blobs.

On OpenPOWER systems, every instruction executed on every core inside the CPU is open source software. On machines with [OpenBMC][1] (such as IBM's AC922 system and Raptor's TALOS II and Blackbird systems), this extends to the code running on the Baseboard Management Controller as well. This means we can get a tremendous amount of insight into what takes so long from the time you plug in a power cable to the time a familiar login prompt is displayed.

If you're part of a team that works on the Linux kernel, you probably boot a lot of kernels. If you're part of a team that works on firmware, you're probably going to boot a lot of different firmware images, followed by an OS to ensure your firmware still works. If we can reduce the hardware's boot time, these teams can become more productive, and end users may be grateful when they're setting up systems or rebooting to install firmware or OS updates.

Over the years, many improvements have been made to Linux distributions' boot time. Modern init systems deal well with doing things concurrently and on-demand. On a modern system, once the kernel starts executing, it can take very few seconds to get to a login prompt. This handful of seconds are not the place to optimize boot time; we have to go earlier: before we get to the OS.

On OpenPOWER systems, the firmware loads an OS by booting a Linux kernel stored in the firmware flash chip that runs a userspace program called [Petitboot][2] to find the disk that holds the OS the user wants to boot and [kexec][3][()][3] to it. This code reuse leverages the efforts that have gone into making Linux boot quicker. Even so, we found places in our kernel config and userspace where we could improve and easily shave seconds off boot time. With these optimizations, booting the Petitboot environment is a single-digit percentage of boot time, so we had to find more improvements elsewhere.

Before the Petitboot environment starts, there's a prior bit of firmware called [Skiboot][4], and before that there's [Hostboot][5]. Prior to Hostboot is the [Self-Boot Engine][6], a separate core on the die that gets a single CPU core up and executing instructions out of Level 3 cache. These components are where we can make the most headway in reducing boot time, as they take up the overwhelming majority of it. Perhaps some of these components aren't optimized enough or doing as much in parallel as they could be?

Another avenue of attack is reboot time rather than boot time. On a reboot, do we really need to reinitialize all the hardware?

Like any modern system, the solutions to improving boot (and reboot) time have been a mixture of doing more in parallel, dealing with legacy, and (arguably) cheating.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/booting-linux-faster

作者：[Stewart Smith][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stewart-ibm
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/OpenBMC
[2]: https://github.com/open-power/petitboot
[3]: https://en.wikipedia.org/wiki/Kexec
[4]: https://github.com/open-power/skiboot
[5]: https://github.com/open-power/hostboot
[6]: https://github.com/open-power/sbe
[7]: https://linux.conf.au/schedule/presentation/105/
[8]: https://linux.conf.au/
