[#]: subject: "5 reasons virtual machines still matter"
[#]: via: "https://opensource.com/article/23/4/5-reasons-virtual-machines-still-matter"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "bestony"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 reasons virtual machines still matter
======
Containers are a vital technology for modern infrastructure, but virtual machines still have their place.

![Computer laptop in space][1]

Image by:

Opensource.com

[Virtualization][2] used to be a big deal. For a while, it was the primary way to run services in a "sandbox" environment. IT departments used virtual machines by the hundreds. And then containers happened, doing much of what a virtual machine could do with a fraction of the resources required. While container technology made virtual machines seem cumbersome, it didn't make them entirely redundant. In fact, virtualization is as useful today as ever, and here are five reasons why.

### 1. Distro hopping

"Distro hopping" is the term often used to describe the inability (willfully or otherwise) to choose a single distribution. Some people just love to trying a different [Linux distribution][3] every time one is released. And why not? Linux distributions are little works of art, a labor of love created by teams of passionate people from all over the world. It's fun to see what people put together.

Part of the experience of a fresh distro is the graphical install process, the very first login, and the big desktop reveal. How fast is the install? What desktop does it use? What's the wallpaper look like? How easy was it to understand and navigate? Most importantly, could *this* be the one even your friends still using Windows or [macOS][4] could install and love?

You can't replicate that in a container. A container is, by design, a partial image of an operating system that assumes it's already been installed. That's a big advantage of containers for the busy sysadmin, but if you're after the desktop user experience, then a virtual machine is what you want.

### 2. Development

Programming is hard to get right, and it's even harder to get right when you develop an application for more than just one platform. Aside from [Java][5], few programming languages are able to target all the platforms out there. An application that launches and runs fine on Linux might render an error on Windows, and may not launch at all on macOS.

A tool like Vagrant and libvirt ensure that you can run a specific version of a specific operating system on demand. You get a quick environment that's easy to replicate across several developers. This is great for testing code, confirming compatibility, and for testing out new versions of a library or toolkit.

### 3. Support and documentation

Bug reports can be very specific, and sometimes all it takes is a [look at GDB][6] to determine the cause of a problem. Other times, however, a bug report comes in that's not about the code but the process itself. For instance, a user might complain about the layout of an application, or the way an application interacts with some element on the desktop, or how to accomplish a complex configuration. In cases like those, you might need to try to replicate the user's workflow, and sometimes that requires running exactly what the user is running.

I've done this several times in the past when I've needed to describe to a user the exact steps to take, on their distribution, to achieve a goal. General statements weren't enough. I installed a fresh copy of the distribution my users were running, and documented the steps, complete with screenshots. If they couldn't get it to work, then I was confident that the problem wasn't their setup.

### 4. Architecture

[Containers][7] use your operating system's CPU. A virtual machine uses an emulated CPU. If there's software you need to run that wasn't compiled on the CPU you have on your machine, then you have to run a virtual CPU.

### 5. Some other OS

Containers are Linux. When you run a container, you're running Linux in a container, regardless of whether you're running that container on Windows or Mac.

To run Windows, whether it's for support, legacy services, or development, you have to virtualize it. Apple continues to enforce, to put it politely, a "complex" legal requirement around virtualizing macOS, but when it is permitted it happens in a virtual machine. Or maybe you're on Windows or macOS but want to run a Linux distribution with a desktop as a way to get comfortable with a new OS. Virtual machines are a pragmatic and easy way to have a spare computer without actually having a spare computer.

### Linux virtualization eBook

Virtual machines are an easy way to gain access to a software-defined computer for everyday tasks. And there are a lot of options for how to interact with your virtual machines, including GNOME Boxes, Vagrant, VirtualBox, or even Qemu directly. Whether you're new to virtualization or you've used it in the past, [download our complimentary eBook][8] for a tour of all the latest options, specialized configurations, and ideas on you might use a fleet of virtual machines!

--------------------------------------------------------------------------------

via: https://opensource.com/article/23/4/5-reasons-virtual-machines-still-matter

作者：[Alan Smithee][a]
选题：[bestony][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/bestony
[1]: https://opensource.com/sites/default/files/lead-images/computer_space_graphic_cosmic.png
[2]: https://www.redhat.com/en/topics/virtualization?intcmp=7013a000002qLH8AAM
[3]: https://opensource.com/article/20/1/favorite-linux-distribution
[4]: https://opensource.com/article/20/6/mac-to-linux
[5]: https://opensource.com/article/20/12/learn-java
[6]: https://opensource.com/article/21/3/debug-code-gdb
[7]: https://www.redhat.com/architect/containers-virtual-machines?intcmp=7013a000002qLH8AAM
[8]: https://opensource.com/downloads/everyday-virtualization-linux
