[#]: subject: (Overview of Embedded Linux Development Training)
[#]: via: (https://www.linux.com/news/overview-of-embedded-linux-development-training/)
[#]: author: (behanw https://training.linuxfoundation.org/announcements/overview-of-embedded-linux-development-training/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Overview of Embedded Linux Development Training
======

_Instructor-led course now includes hands-on labs with a RISC-V based emulated development target_

_By Behan Webster_

We are surrounded by electronic devices that make the modern world work. Almost all of these devices and the systems they run are “Embedded Systems”, which are small purpose-built computers designed to solve specific problems. These computers don’t look like what most people think of as a computer; they don’t have a keyboard, mouse nor monitor. They might even be hidden in normal, everyday objects that you use around the house. The reality is that many of the more powerful embedded systems are running Linux and any “smart devices” around your home or work are almost certainly running embedded Linux.

Embedded systems tend to be smaller, resource-constrained, power-limited, and have a very defined and narrow purpose. Among things, they are your TV, internet modem, wifi access point, smart thermostat, car infotainment system, or home automation system. Everything from smart parking meters to security systems, to the drink dispensers in the cafeteria, and so much of the industrial automation that manufacture and deliver all the things that drive our modern lives, are embedded systems; the vast majority of which run Embedded Linux.

However, all of those things, despite doing different things, work roughly the same way. They tend to have an embedded CPU (often an ARM, MIPS, or increasingly RISC-V), RAM and flash storage, a power budget and a limited number of things that they have to do flawlessly. They all have to power up in a similar way, from boot-loader to configuring the kernel, which brings up the software which makes up the operating system, which in turn runs the application software that makes the device do what it was designed to do.

In the Linux Foundation Training course “[Embedded Linux Development][1]“, we cover all the base technologies that are used to build an embedded system and use hands on labs using a RISC-V embedded target to exercise those skills. We start with building an appropriate cross-compiler for the platform, then move on to building, configuring, and extending the boot loader. Building and customizing the Linux kernel, choosing drivers, and making decisions as to what should be included in order to make the system do what it needs to do is next. And then a lot of time is used to discuss how the main operating system should be configured, built, and assembled such that it will meet the needs of your eventual application.

By taking participants through the paces of building up an embedded Linux target from scratch, we ensure they leave with an understanding of the makeup of an embedded system, and how to go down the path of replicating that work in order to build their own device.

Check out [Embedded Linux Development][1], and learn more about all our other embedded Linux training offerings [here][2].

The post [Overview of Embedded Linux Development Training][3] appeared first on [Linux Foundation – Training][4].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/overview-of-embedded-linux-development-training/

作者：[behanw][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/overview-of-embedded-linux-development-training/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/training/embedded-linux-development/
[2]: https://training.linuxfoundation.org/embedded-development/
[3]: https://training.linuxfoundation.org/announcements/overview-of-embedded-linux-development-training/
[4]: https://training.linuxfoundation.org/
