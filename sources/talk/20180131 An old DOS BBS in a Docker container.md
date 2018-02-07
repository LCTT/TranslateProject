An old DOS BBS in a Docker container
======
Awhile back, I wrote about [my Debian Docker base images][1]. I decided to extend this concept a bit further: to running DOS applications in Docker.

But first, a screenshot:

![][2]

It turns out this is possible, but difficult. I went through all three major DOS emulators available (dosbox, qemu, and dosemu). I got them all running inside the Docker container, but had a number of, er, fun issues to resolve.

The general thing one has to do here is present a fake modem to the DOS environment. This needs to be exposed outside the container as a TCP port. That much is possible in various ways -- I wound up using tcpser. dosbox had a TCP modem interface, but it turned out to be too buggy for this purpose.

The challenge comes in where you want to be able to accept more than one incoming telnet (or TCP) connection at a time. DOS was not a multitasking operating system, so there were any number of hackish solutions back then. One might have had multiple physical computers, one for each incoming phone line. Or they might have run multiple pseudo-DOS instances under a multitasking layer like [DESQview][3], OS/2, or even Windows 3.1.

(Side note: I just learned of [DESQview/X][4], which integrated DESQview with X11R5 and [replaced the Windows 3 drivers][5] to allow running Windows as an X application).

For various reasons, I didn't want to try running one of those systems inside Docker. That left me with emulating the original multiple physical node setup. In theory, pretty easy -- spin up a bunch of DOS boxes, each using at most 1MB of emulated RAM, and go to town. But here came the challenge.

In a multiple-physical-node setup, you need some sort of file sharing, because your nodes have to access the shared message and file store. There were a myriad of clunky ways to do this in the old DOS days - [Netware][6], [LAN manager][7], even some PC NFS clients. I didn't have access to Netware. I tried the Microsoft LM client in DOS, talking to a Samba server running inside the Docker container. This I got working, but the LM client used so much RAM that, even with various high memory tricks, BBS software wasn't going to run. I couldn't just mount an underlying filesystem in multiple dosbox instances either, because dosbox did caching that wasn't going to be compatible.

This is why I wound up using dosemu. Besides being a more complete emulator than dosbox, it had a way of sharing the host's filesystems that was going to work.

So, all of this wound up with this: [jgoerzen/docker-bbs-renegade][8].

I also prepared building blocks for others that want to do something similar: [docker-dos-bbs][9] and the lower-level [docker-dosemu][10].

As a side bonus, I also attempted running this under Joyent's Triton (SmartOS, Solaris-based). I was pleasantly impressed that I got it all almost working there. So yes, a Renegade DOS BBS running under a Linux-based DOS emulator in a container on a Solaris machine.



--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9836-an-old-dos-bbs-in-a-docker-container

作者：[John Goerzen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://changelog.complete.org/archives/9794-fixing-the-problems-with-docker-images
[2]:https://raw.githubusercontent.com/jgoerzen/docker-bbs-renegade/master/renegade-login.png
[3]:https://en.wikipedia.org/wiki/DESQview
[4]:http://toastytech.com/guis/dvx.html
[5]:http://toastytech.com/guis/dvx3.html
[6]:https://en.wikipedia.org/wiki/NetWare
[7]:https://en.wikipedia.org/wiki/LAN_Manager
[8]:https://github.com/jgoerzen/docker-bbs-renegade
[9]:https://github.com/jgoerzen/docker-dos-bbs
[10]:https://github.com/jgoerzen/docker-dosemu
