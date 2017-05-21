Linux's Big Bang: One Kernel, Countless Distros
============================================================[Print][1][Email][2]By Jonathan Terrasi 
Apr 27, 2017 3:24 PM PT
![linus-torvalds](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2017-linus-torvalds-1.jpg)

Even if you're a newcomer to Linux, you've probably figured out that it is not a single, monolithic operating system, but a constellation of projects. The different "stars" in this constellation take the form of "distributions," or "distros." Each offers its own take on the Linux model.

To gain an appreciation of the plethora of options offered by the range of distributions, it helps to understand how Linux started out and subsequently proliferated. With that in mind, here's a brief introduction to Linux's history.

### Linus Torvalds, Kernel Builder

Most people with any familiarity with Linux have heard of its creator, Linus Torvalds (pictured above), but not many know why he created it in the first place. In 1991, Torvalds was a university student in Finland studying computers. As an independent personal project, he wanted to create a Unix-like kernel to build a system for his unique hardware.

The "kernel" is the part of an operating system that mediates between the hardware, via its firmware, and the OS. Essentially, it is the heart of the system. Developing a kernel is no small feat, but Torvalds was eager for the challenge and found he had a rare knack for it.

As he was new to kernels, he wanted input from others to ensure he was on the right track, so he solicited the experience of veteran tinkerers on Usenet, the foremost among early Internet forums, by publishing the code for his kernel. Contributions flooded in.

After establishing a process for reviewing forum-submitted patches and selectively integrating them, Torvalds realized he had amassed an informal development team. It quickly became a somewhat formal development team once the project took off.

### Richard Stallman's Role

Though Torvalds and his team created the Linux kernel, there would have been no subsequent spread of myriad Linux distributions without the work of Richard Stallman, who had launched the free software movement a decade earlier.

Frustrated with the lack of transparency in many core Unix programming and system utilities, Stallman had decided to write his own -- and to share the source code freely with anyone who wanted it and also was committed to openness. He created a considerable body of core programs, collectively dubbed the "GNU Project," which he launched in 1983.

Without them, a kernel would not have been of much use. Early designers of Linux-based OSes readily incorporated the GNU tools into their projects.

Different teams began to emerge -- each with its own philosophy regarding computing functions and architecture. They combined the Linux kernel, GNU utilities, and their own original software, and "distributed" variants of the Linux operating system.

### Server Distros

Each distro has its own design logic and purpose, but to appreciate their nuances it pays to understand the difference between upstream and downstream developers. An "upstream developer" is responsible for actually creating the program and releasing it for individual download, or for including it in other projects. By contrast, a "downstream developer," or "package maintainer," is one who takes each release of the upstream program and tweaks it to fit the use case of a downstream project.

While most Linux distributions include some original projects, the majority of distribution development is "downstream" work on the Linux kernel, GNU tools, and the vast ecosystem of user programs.

Many distros make their mark by optimizing for specific use cases. For instance, some projects are designed to run as servers. Distributions tailored for deployment as servers often will shy away from quickly pushing out the latest features from upstream projects in favor of releasing a thoroughly tested, stable base of essential software that system administrators can depend on to run smoothly.

Development teams for server-focused distros often are large and are staffed with veteran programmers who can provide years of support for each release.

### Desktop Distros

There is also a wide array of distributions meant to run as user desktops. In fact, some of the more well-known of these are designed to compete with major commercial OSes by offering a simple installation and intuitive interface. These distributions usually include enormous software repositories containing every user program imaginable, so that users can make their systems their own.

As usability is key, they are likely to devote a large segment of their staff to creating a signature, distro-specific desktop, or to tweaking existing desktops to fit their design philosophy. User-focused distributions tend to speed up the downstream development timetable a bit to offer their users new features in a timely fashion.

"Rolling release" projects -- a subset of desktop distributions -- are crafted to be on the bleeding edge. Instead of waiting until all the desired upstream programs reach a certain point of development and then integrating them into a single release, package maintainers for rolling release projects release a new version of each upstream program separately, once they finish tweaking it.

One advantage to this approach is security, as critical patches will be available faster than non-rolling release distros. Another upside is the immediate availability of new features that users otherwise would have to wait for. The drawback for rolling release distributions is that they require more manual intervention and careful maintenance, as certain upgrades can conflict with others, breaking a system.

### Embedded Systems

Yet another class of Linux distros is known as "embedded systems," which are extremely trimmed down (compared to server and desktop distros) to fit particular use cases.

We often forget that anything that connects to the Internet or is more complex than a simple calculator is a computer, and computers need operating systems. Because Linux is free and highly modular, it's usually the one that hardware manufacturers choose.

In the vast majority of cases, if you see a smart TV, an Internet-connected camera, or even a car, you're looking at a Linux device. Practically every smartphone that's not an iPhone runs a specialized variety of embedded Linux too.

### Linux Live

Finally, there are certain Linux distros that aren't meant to be installed permanently in a computer, but instead reside on a USB stick and allow other computers to boot them up without touching the computer's onboard hard drive.

These "live" systems can be optimized to perform a number of tasks, ranging from repairing damaged systems, to conducting security evaluations, to browsing the Internet with high security.

As these live Linux distros usually are meant for tackling very specific problems, they generally include specialized tools like hard drive analysis and recovery programs, network monitoring applications, and encryption tools. They also keep a light footprint so they can be booted up quickly.

### How Do You Choose?

This is by no means an exhaustive list of Linux distribution types, but it should give you an idea of the scope and variety of the Linux ecosystem.

Within each category, there are many choices, so how do you choose the one that might best suit your needs?

One way is to experiment. It is very common in the Linux community to go back and forth between distros to try them out, or for users to run different ones on different machines, according to their needs.

In a future post, I'll showcase a few examples of each type of distribution so you can try them for yourself and begin your journey to discovering the one you like best.

--------------------------------------------------------------------------------

作者简介：

Jonathan Terrasi has been an ECT News Network columnist since 2017. His main interests are computer security (particularly with the Linux desktop), encryption, and analysis of politics and current affairs. He is a full-time freelance writer and musician. His background includes providing technical commentaries and analyses in articles published by the Chicago Committee to Defend the Bill of Rights.

------

via: http://www.linuxinsider.com/story/84489.html?rss=1

作者：[ Jonathan Terrasi ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxinsider.com/story/84489.html?rss=1#searchbyline
[1]:http://www.linuxinsider.com/story/84489.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84489
