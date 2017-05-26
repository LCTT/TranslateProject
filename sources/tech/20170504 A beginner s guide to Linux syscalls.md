A beginner's guide to Linux syscalls
============================================================

![A beginner's guide to Linux syscalls](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003499_01_linux11x_cc.png?itok=ZivAkk-L "A beginner's guide to Linux syscalls")
>Image by : opensource.com

Over the last couple of years, I've been doing a lot of work with containers. Early on I saw a fascinating talk by [Julien Friedman][7] where he wrote a bare-bones container in a few lines of Go. It gave me that "a-ha" moment where I grasped that containers are nothing more than Linux processes with a restricted view of the machine they're running on.

Building this restricted view involved quite a few calls in [Golang's syscall package][8]. Initially, I just took that at face value, but after a while, I wanted to peel away the next layer of the onion to see what these syscalls are all about and how they work. I'll share what I learned in my talk at OSCON.


As the name suggests, [syscalls][9] are system calls, and they're the way that you can make requests from user space into the Linux kernel. The kernel does some work for you, like creating a process, then hands control back to user space.

There is a common mechanism for making all system calls transition into the kernel, which is handled by the **libc **library. Userspace code sets up some registers including an ID of the system call it wants to make and any parameters it needs to pass to the system call. It triggers a "trap" to transition control to the kernel.

That's how userspace code makes requests of the kernel, but Linux also has pseudo filesystems that allow the kernel to communicate information to user space. The contents look like ordinary directories and files.

The **/proc** directory is a great example. Look inside, and you'll find all sorts of interesting information about the processes running on a machine. In some cases, like **cgroups **(control groups), user space can configure parameters by writing into files under these pseudo filesystems.

It's particularly interesting when you're using containers because the host's **/proc** holds information about all the containerized processes. This includes environment variables, which are also stored in the **/proc**pseudo-filesystem, meaning that your host machine has access to the environment for all your running containers. This potentially has security consequences if you're passing secrets like certificates or database passwords into your containers through environment variables.

Many programmers working on normal applications may not feel that they're using syscalls very often. In practice, they are, because even everyday activities like making files or changing directories involve syscalls on Linux.

You don't have to be a systems programmer to have fun with syscalls!

 _If you’d like to learn more, Liz will be presenting _  [_A Beginner's Guide To Syscalls_][10]  _at OSCON 2017 in Austin, Texas. If you’re interested in attending the conference, use this discount code _ [when you register][11] _:_  **PCOS** _._

--------------------------------------------------------------------------------

作者简介：

Liz Rice - Liz Rice is the Technology Evangelist with container security specialists Aqua Security. Prior to that she co-founded Microscaling Systems and developed their real-time scaling engine, and the popular image metadata site MicroBadger.com. She has a wealth of software development, team, and product management experience from working on network protocols and distributed systems, and in digital technology sectors such as VOD, music, and VoIP. 

----------


via: https://opensource.com/article/17/5/beginners-guide-syscalls

作者：[Liz Rice ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lizrice
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/5/beginners-guide-syscalls?rate=BT-vq0qMILAvJVxPFqug17N1RfhoAb_vkwNqRZFAqLQ
[7]:https://twitter.com/doctor_julz
[8]:https://golang.org/pkg/syscall/
[9]:http://man7.org/linux/man-pages/man2/syscalls.2.html
[10]:https://conferences.oreilly.com/oscon/oscon-tx/public/schedule/detail/56840
[11]:http://www.oreilly.com/pub/cpc/44407?sc_cid=701600000012BzSAAU%20target=%22_blank%22
[12]:https://opensource.com/user/129431/feed
[13]:https://opensource.com/users/lizrice
