LuuMing translating
6 Reasons Why Linux Users Switch to BSD
======
Thus far I have written several articles about [BSD][1] for It’s FOSS. There is always at least one person in the comments asking “Why bother with BSD?” I figure that the best way to respond was to write an article on the topic.

### Why use BSD over Linux?

In preparation for this article, I chatted with several BSD users, some of whom moved to BSD after using Linux for years. The points in this article are based on the opinions of real BSD users. This article hopes to offer a different viewpoint.

![why use bsd over linux][2]

#### 1\. BSD is More than Just a Kernel

Several people pointed out that BSD offers an operating system that is one big cohesive package to the end-user. They point out that the named “Linux” refers to just the kernel. A Linux distro consists of the aforementioned kernel and a number of different applications and packages selected by the creator of that distro. Sometimes installing new packages can cause incompatibility, which will lead to system crashes.

A typical BSD consists of a kernel and all of the packages that it needs to get things done. The majority of these packages are actively developed by the project. This leads to tighter integration and improved responsiveness.

#### 2\. Packages are More Trustworthy

Speaking of packages, another point that the BSD users raised was the trustworthiness of packages. In Linux, packages are available from a bunch of different sources, some provided by distro developers and others by third parties. [Ubuntu][3] and [other distros][4] have encountered issues with malware hidden in third-party apps.

In BSD, all packages are provided by “a centralized package/ports system with every package getting built as part of a single repository with security systems in place each step of the way”. This ensures that a hacker can’t sneak malicious software into a seemingly-safe application and lends to the long-term stability of BSD.

#### 3\. Slow Change = Better Long-Term Stability

If development was a race, Linux would be the rabbit and BSD the turtle. Even the slowest Linux distro releases a new version at least once a year (except Debian, of course). In the BSD world, major releases take longer. This means that there is more of a focus on getting things right then getting them pushed out to the user.

This also means that changes to the operating system happen over time. The Linux world has experienced several rapid and major changes that we still feel to this day (cough, [systemD][5], cough). Like with Debian, long development cycles help BSD to test new ideas to make sure they work properly before making them permanent. It also helps to produce code less likely to have issues.

#### 4\. Linux is Too Cluttered

None of the BSD users made this point outright, but it was suggested by many of their experiences. Many of them bounced from Linux distro to Linux distro in the quest to find one that worked for them. In many instances, they could not get all of their hardware or software to work correctly. Then, they decided to give BSD a try and everything just worked.

When it came to choosing which BSD they were going to use, the choice was fairly easy. There are only half a dozen BSDs that are being actively developed. Of those BSDs, each one has a specific purpose. “[OpenBSD][6] security, [FreeBSD][7] more desktop/server, [NetBSD][8] “run on anything and everything”, [DragonFlyBSD][9] scaling and performance.” Meanwhile, the Linux world is full of distros that just add a theme or icon pack to an existing distro. The smaller number of BSD projects means that there is less duplication of effort and more overall focus.

#### 5\. ZFS Support

One BSD user noted that one of the main reasons that he switched to BSD was [ZFS][10]. In fact almost all of the people I talked to mentioned ZFS support on BSD as the reason they did not return to Linux.

This is an area where Linux will lose out on for the time being. While [OpenZFS][11] is available on some Linux distros, ZFS is built into the BSD kernels. This alone means that ZFS will have better performance on BSD. While there have been several attempts to get ZFS into the Linux kernel, licensing issues will be solved first.

#### 6\. License

There was also a difference of opinion on licenses. The general idea held by many is the GPL is not truly free because it put limits on how you can make use of the software. Some also think that the GPL is “too large and difficult to interpret which can lead to legal problems down the road if a person is not careful when developing a product with this license”.

On the other hand, the BSD license only has three clauses and allows anyone to “take the software, make changes, and do whatever you want with it, but it also offers protection to the developer”.

#### Conclusion

These are just a few of the reason why people use BSD over Linux. If you want, you can read some of the other comments [here][12]. If you are a BSD user and feel I missed something important, please comment below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][13].

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-use-bsd/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://itsfoss.com/category/bsd/
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/why-BSD.png
[3]:https://itsfoss.com/snapstore-cryptocurrency-saga/
[4]:https://www.bleepingcomputer.com/news/security/malware-found-in-arch-linux-aur-package-repository/
[5]:https://www.freedesktop.org/wiki/Software/systemd/
[6]:https://www.openbsd.org/
[7]:https://www.freebsd.org/
[8]:http://netbsd.org/
[9]:http://www.dragonflybsd.org/
[10]:https://en.wikipedia.org/wiki/ZFS
[11]:http://open-zfs.org/wiki/Main_Page
[12]:https://discourse.trueos.org/t/why-do-you-guys-use-bsd/2601
[13]:http://reddit.com/r/linuxusersgroup
