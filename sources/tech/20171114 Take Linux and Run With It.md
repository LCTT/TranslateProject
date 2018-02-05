Take Linux and Run With It
============================================================

![](https://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2016-linux-1.jpg)

![](https://www.linuxinsider.com/images/2015/image-credit-adobe-stock_130x15.gif)


"How do you run an operating system?" may seem like a simple question, since most of us are accustomed to turning on our computers and seeing our system spin up. However, this common model is only one way of running an operating system. As one of Linux's greatest strengths is versatility, Linux offers the most methods and environments for running it.

To unleash the full power of Linux, and maybe even find a use for it you hadn't thought of, consider some less conventional ways of running it -- specifically, ones that don't even require installation on a computer's hard drive.

### We'll Do It Live!

Live-booting is a surprisingly useful and popular way to get the full Linux experience on the fly. While hard drives are where OSes reside most of the time, they actually can be installed to most major storage media, including CDs, DVDs and USB flash drives.

When an OS is installed to some device other than a computer's onboard hard drive and subsequently booted instead of that onboard drive, it's called "live-booting" or running a "live session."

At boot time, the user simply selects an external storage source for the hardware to look for boot information. If found, the computer follows the external device's boot instructions, essentially ignoring the onboard drive until the next time the user boots normally. Optical media are increasingly rare these days, so by far the most typical form that an external OS-carrying device takes is a USB stick.

Most mainstream Linux distributions offer a way to run a live session as a way of trying them out. The live session doesn't save any user activity, and the OS resets to the clean default state after every shutdown.

Live Linux sessions can be used for more than testing a distro, though. One application is for executing system repair for critically malfunctioning onboard (usually also Linux) systems. If an update or configuration made the onboard system unbootable, a full system backup is required, or the hard drive has sustained serious file corruption, the only recourse is to start up a live system and perform maintenance on the onboard drive.

In these and similar scenarios, the onboard drive cannot be manipulated or corrected while also keeping the system stored on it running, so a live system takes on those burdens instead, leaving all but the problematic files on the onboard drive at rest.

Live sessions also are perfectly suited for handling sensitive information. If you don't want a computer to retain any trace of the operations executed or information handled on it, especially if you are using hardware you can't vouch for -- like a public library or hotel business center computer -- a live session will provide you all the desktop computing functions to complete your task while retaining no trace of your session once you're finished. This is great for doing online banking or password input that you don't want a computer to remember.

### Linux Virtually Anywhere

Another approach for implementing Linux for more on-demand purposes is to run a virtual machine on another host OS. A virtual machine, or VM, is essentially a small computer running inside another computer and contained in a single large file.

To run a VM, users simply install a hypervisor program (a kind of launcher for the VM), select a downloaded Linux OS image file (usually ending with a ".iso" file extension), and walk through the setup process.

Most of the settings can be left at their defaults, but the key ones to configure are the amount of RAM and hard drive storage to lease to the VM. Fortunately, since Linux has a light footprint, you don't have to set these very high: 2 GB of RAM and 16 GB of storage should be plenty for the VM while still letting your host OS thrive.

So what does this offer that a live system doesn't? First, whereas live systems are ephemeral, VMs can retain the data stored on them. This is great if you want to set up your Linux VM for a special use case, like software development or even security.

When used for development, a Linux VM gives you the solid foundation of Linux's programming language suites and coding tools, and it lets you save your projects right in the VM to keep everything organized.

If security is your goal, Linux VMs allow you to impose an extra layer between a potential hazard and your system. If you do your browsing from the VM, a malicious program would have to compromise not only your virtual Linux system, but also the hypervisor -- and  _then_ your host OS, a technical feat beyond all but the most skilled and determined adversaries.

Second, you can start up your VM on demand from your host system, without having to power it down and start it up again as you would have to with a live session. When you need it, you can quickly bring up the VM, and when you're finished, you just shut it down and go back to what you were doing before.

Your host system continues running normally while the VM is on, so you can attend to tasks simultaneously in each system.

### Look Ma, No Installation!

Just as there is no one form that Linux takes, there's also no one way to run it. Hopefully, this brief primer on the kinds of systems you can run has given you some ideas to expand your use models.

The best part is that if you're not sure how these can help, live booting and virtual machines don't hurt to try! 
![](https://www.ectnews.com/images/end-enn.gif)

--------------------------------------------------------------------------------

via: https://www.linuxinsider.com/story/Take-Linux-and-Run-With-It-84951.html

作者：[ Jonathan Terrasi ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxinsider.com/story/Take-Linux-and-Run-With-It-84951.html#searchbyline
[1]:https://www.linuxinsider.com/story/Take-Linux-and-Run-With-It-84951.html#
[2]:https://www.linuxinsider.com/perl/mailit/?id=84951
[3]:https://www.linuxinsider.com/story/Take-Linux-and-Run-With-It-84951.html
[4]:https://www.linuxinsider.com/story/Take-Linux-and-Run-With-It-84951.html
