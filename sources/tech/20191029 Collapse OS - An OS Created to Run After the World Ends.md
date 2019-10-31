[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Collapse OS – An OS Created to Run After the World Ends)
[#]: via: (https://itsfoss.com/collapse-os/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Collapse OS – An OS Created to Run After the World Ends
======

When most people think about preparing for a post-apocalyptic world, the first time that comes to mind is food and other living essentials. Recently, a programmer has decided that it would be just as important to create a versatile and survivable operating system after the collapse of society. We will be taking a look at it today, as best we can.

### Collapse OS – For when the fecal matter hits the rotating device

![][1]

The operating system in question is called [Collapse OS][2]. According to the website, Collapse OS is a “z80 kernel and a collection of programs, tools and documentation”. It would allow you to:

  * Run on minimal and improvised machines.
  * Interface through improvised means (serial, keyboard, display).
  * Edit text files.
  * Compile assembler source files for a wide range of MCUs and CPUs.
  * Read and write from a wide range of storage devices.
  * Replicate itself.



The creator, [Virgil Dupras][3], started the project because [he sees][4] “our global supply chain to collapse before we reach 2030”. He bases this conclusion on the works of Pablo Servigne. He seems to understand that not everyone shares [his views][4]. “That being said, I don’t consider it unreasonable to not believe that collapse is likely to happen by 2030, so please, don’t feel attacked by my beliefs.”

The overall goal of the project is to jumpstart a post-collapse civilization’s return to the computer age. The production of electronics depends on a very complex supply chain. Once that supply chain crumbles, man will go back to a less technical age. It would take decades to regain our previous technical position. Dupras hopes to jump several steps by creating an ecosystem that will work with simpler chips that can be scavenged from a wide variety of sources.

### What is the z80?

The initial CollapseOS kernel is written for the [z80 chip][5]. As a retro computing history buff, I am familiar with [Zilog][6] and it’s z80 chip. In the late 1970s, Zilog introduced the z80 to compete with [Intel’s 8080][7] CPU. The z80 was used in a whole bunch of early personal computers, such as the [Sinclair ZX Spectrum][8] and the [Tandy TRS-80][9]. The majority of these systems used the [CP/M operating system][10], which was the top operating system of the time. (Interestingly, Dupras was originally looking to use an [open-source implementation o][11][f][11] [CP/M][11], but ultimately decided to [start from scratch][12].)

Both the z80 and CP/M started to decline in popularity after the [IBM PC][13] was released in 1981. Zilog did release several other microprocessors (Z8000 and Z80000), but these did not take off. The company switched its focus to microcontrollers. Today, an updated descendant of the z80 can be found in graphic calculators, embedded devices and consumer electronics.

Dupras said on [Reddit][14] that he wrote Collapse OS for the z80 because “it’s been in production for so long and because it’s been used in so many machines, scavenger have good chances of getting their hands on it.”

### Current status and future of the project

Collapse OS has a pretty decent start. It can self replicate with enough RAM and storage. It is capable of running on an [RC2014 homebrew computer][15] or a Sega Master System/MegaDrive (Genesis). It can read SD cards. It has a simple text editor. The kernel is made up of modules that are connected with glue code. This is designed to make the system flexible and adaptable.

There is also a detailed [roadmap][16] laying out the direction of the project. Listed goals include:

  * Support for other CPUs, such as 8080 and [6502][17]
  * Support for improvised peripherals, such as LCD screens, E-ink displays, and [ACIA devices][18].
  * Support for more storage options, such as floppys, CDs, SPI RAM/ROMs, and AVR MCUs
  * Get it to work on other z80 machines, such as [TI-83+][19] and [TI-84+][20] graphing calculators and TRS-80s



If you are interested in helping out or just taking a peek at the project, be sure to visit their [GitHub page][21].

### Final Thoughts

To put it bluntly, I see Collapse OS as more of a fun hobby project (for those who like building operating systems), than something useful. When a collapse does come, how will Collapse OS get distributed, since I imagine that GitHub will be down? I can’t imagine more than a handful of skill people being able to create a system from scavenged parts. There is a whole new generation of makers out there, but most of them are used to picking up an Arduino or a Raspberry Pi and building their project than starting from scratch.

Contrary to Dupras, my biggest concern is the use of [EMPs][22]. These things fry all electrical systems, meaning there would be nothing left to scavenge to build system. If that doesn’t happen, I imagine that we would be able to find enough x86 components made over the past 30 years to keep things going.

That being said, Collapse OS sounds like a fun and challenging project to people who like to program in low-level code for strange applications. If you are such a person, check out [Collapse OS][2].

Hypothetical question: what is your post-apocalyptic operating system of choice? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][23].

--------------------------------------------------------------------------------

via: https://itsfoss.com/collapse-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/Collapse_OS.jpg?ssl=1
[2]: https://collapseos.org/
[3]: https://github.com/hsoft
[4]: https://collapseos.org/why.html
[5]: https://en.m.wikipedia.org/wiki/Z80
[6]: https://en.wikipedia.org/wiki/Zilog
[7]: https://en.wikipedia.org/wiki/Intel_8080
[8]: https://en.wikipedia.org/wiki/ZX_Spectrum
[9]: https://en.wikipedia.org/wiki/TRS-80
[10]: https://en.wikipedia.org/wiki/CP/M
[11]: https://github.com/davidgiven/cpmish
[12]: https://github.com/hsoft/collapseos/issues/52
[13]: https://en.wikipedia.org/wiki/IBM_Personal_Computer
[14]: https://old.reddit.com/r/collapse/comments/dejmvz/collapse_os_bootstrap_postcollapse_technology/f2w3sid/?st=k1gujoau&sh=1b344da9
[15]: https://rc2014.co.uk/
[16]: https://collapseos.org/roadmap.html
[17]: https://en.wikipedia.org/wiki/MOS_Technology_6502
[18]: https://en.wikipedia.org/wiki/MOS_Technology_6551
[19]: https://en.wikipedia.org/wiki/TI-83_series#TI-83_Plus
[20]: https://en.wikipedia.org/wiki/TI-84_Plus_series
[21]: https://github.com/hsoft/collapseos
[22]: https://en.wikipedia.org/wiki/Electromagnetic_pulse
[23]: https://reddit.com/r/linuxusersgroup
