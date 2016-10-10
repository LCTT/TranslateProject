Why Linux pioneer Linus Torvalds prefers x86 chips over ARM processors
=============

**Torvalds has an affinity for x86 because of the infrastructure and ecosystem**

![linus torvalds](http://core2.staticworld.net/images/article/2015/08/linus_torvalds-100600260-large.jpg)

*Linus Torvalds addressed a packed auditorium of Linux enthusiasts during his speech at the LinuxWorld show in San Jose, California, on August 10, 1999. Credit: James Niccolai
*

Linux pioneer Linus Torvalds is a stand-up guy—he says what he feels. There’s no sugarcoating, and he’ll admit to faults, like [recent issues][1] with the Linux 4.8 kernel.

He was [full of surprises][2] at last week’s Linaro Connect conference, when he was asked about his favorite chip architecture. He didn’t blink before saying it was x86, not ARM.

It may have been the long history of x86 with PCs that influenced his answer. There’s little fragmentation of software and hardware with x86, and things just work.

People are too fixated with the instruction set and the CPU core, Torvalds said, but it ultimately is the ecosystem around the architecture that matters more.

“What matters is all the infrastructure around the instruction set, and x86 has all that infrastructure... at a lot of different levels,” Torvalds said. “It’s opening a way that no other architecture is.”

A lot of application development happens on PCs with x86 chips from Intel or AMD. Compatibility matters for x86 chips and PCs, which have a unified model around hardware, development, and other infrastructure.

The same can’t be said about ARM. From hardware vendor perspective, that leads to a fragmented market, Torvalds said.

“Being compatible just wasn’t as big of a deal for the ARM ecosystem as it has been traditionally for the x86 ecosystem,” Torvalds said during a fireside chat with ARM developers listening on.


ARM dominates the mobile-device market, and a majority of devices use Android, which is based on the Linux kernel. But there are a lot of fragmentation in the ARM ecosystem, and that’s caused support and device issues.

One problem: It’s not possible to make one build of Android that can be deployed across all mobile devices because of different hardware configurations. Hardware makers tune Android to be compatible with chipsets in their devices. One Android update can’t be delivered to all mobile devices, unlike Windows updates to PCs.

Intel tried to put its x86 chips in smartphones but has now stopped the effort. One of Intel’s goals was to [deliver Android updates][3] that could be downloaded and installed on all x86 handsets.

There are also ARM server software development issues. Architectural, networking, and I/O characteristics are different on each chipset, and software has to be written to exploit those features. That has significantly slowed down the adoption of ARM in servers. There isn’t a matching problem with x86, which continues to dominate the server market.

“I’ve been personally pretty disappointed with ARM as a hardware platform, not as an instruction set, though I’ve had my issues there, too,” Torvalds said. “As a hardware platform, it is still not very pleasant to deal with.”

When he was growing up, Torvalds programmed on an 8-bit 6502 microprocessor in machine code and loved the architecture because the instructions were pipelined, something no other hardware did at the time. That architecture delivered more on-chip performance.

“What I wanted to upgrade to was Acorn Archimedes ... the thing that gave ARM its name,” Torvalds said. “That was my dream machine for a while.”

The [Archimedes][4] was a personal computer based on the first ARM RISC chips from Acorn Computer Group. ARM was formed as an offshoot of Acorn.

Torvalds liked the Archimedes because it had the 6502-like feature of pipelining with RAM chips to get high-performance. Unfortunately, he couldn’t find the computer.

He went with an “odd British computer,” [Sinclair QL][5], which was an even bigger failure than Acorn Archimedes, Torvalds said.

“Finland wasn’t the center of the universe back then,” Torvalds said. “After that, I learned my lesson—never ever go buy into something that doesn’t have infrastructure.”


--------------------------------------------------------------------------------

via: http://www.pcworld.com/article/3129300/linux/why-linux-pioneer-linus-torvalds-prefers-x86-over-arm.html

作者：[Agam Shah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.pcworld.com/author/Agam-Shah/
[1]: http://www.theregister.co.uk/2016/10/05/linus_torvalds_admits_buggy_crap_made_it_into_linux_48/
[2]: https://www.youtube.com/watch?v=fuAebQvFnRI
[3]: http://www.infoworld.com/article/2908072/android/google-and-intel-vow-to-speed-up-delivery-of-android-updates-to-devices.html
[4]: http://www.pcworld.com/article/3097427/hardware/how-arm-set-itself-up-for-a-32-billion-acquisition.html
[5]: http://oldcomputers.net/ql.html