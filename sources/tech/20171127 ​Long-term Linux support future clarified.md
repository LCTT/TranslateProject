Long-term Linux support future clarified
============================================================

Long-term support Linux version 4.4 will get six years of life, but that doesn't mean other LTS editions will last so long.

[video](http://www.zdnet.com/video/video-torvalds-surprised-by-resilience-of-2-6-kernel-1/)

 _Video: Torvalds surprised by resilience of 2.6 kernel_ 

In October 2017, the [Linux kernel team agreed to extend the next version of Linux's Long Term Support (LTS) from two years to six years][5], [Linux 4.14][6]. This helps [Android][7], embedded Linux, and Linux Internet of Things (IoT) developers. But this move did not mean all future Linux LTS versions will have a six-year lifespan.

As Konstantin Ryabitsev, [The Linux Foundation][8]'s director of IT infrastructure security, explained in a Google+ post, "Despite what various news sites out there may have told you, [kernel 4.14 LTS is not planned to be supported for 6 years][9]. Just because Greg Kroah-Hartman is doing it for 4.4 does not mean that all LTS kernels from now on are going to be maintained for that long."

So, in short, 4.14 will be supported until January 2020, while the 4.4 Linux kernel, which arrived on Jan. 20, 2016, will be supported until 2022\. Therefore, if you're working on a Linux distribution that's meant for the longest possible run, you want to base it on [Linux 4.4][10].

[Linux LTS versions][11] incorporate back-ported bug fixes for older kernel trees. Not all bug fixes are imported; only important bug fixes are applied to such kernels. They, especially for older trees, don't usually see very frequent releases.

The other Linux versions are Prepatch or release candidates (RC), Mainline, Stable, and LTS.

RC must be compiled from source and usually contains bug fixes and new features. These are maintained and released by Linus Torvalds. He also maintains the Mainline tree (this is where all new features are introduced). New mainline kernels are released every few months. When the mainline kernel is released for general use, it is considered "stable." Bug fixes for a stable kernel are back-ported from the mainline tree and applied by a designated stable kernel maintainer. There are usually only a few bug-fix kernel releases until the next mainline kernel becomes available.

As for the latest LTS, Linux 4.14, Ryabitsev said, "It is possible that someone may pick up maintainership of 4.14 after Greg is done with it (it's happened in the past on multiple occasions), but you should emphatically not plan on that."

Kroah-Hartman simply added to Ryabitsev's post: ["What he said."][12]

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/long-term-linux-support-future-clarified/

作者：[Steven J. Vaughan-Nichols ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:http://www.zdnet.com/article/long-term-linux-support-future-clarified/#comments-eb4f0633-955f-4fec-9e56-734c34ee2bf2
[2]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[3]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[4]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[5]:http://www.zdnet.com/article/long-term-support-linux-gets-a-longer-lease-on-life/
[6]:http://www.zdnet.com/article/the-new-long-term-linux-kernel-linux-4-14-has-arrived/
[7]:https://www.android.com/
[8]:https://www.linuxfoundation.org/
[9]:https://plus.google.com/u/0/+KonstantinRyabitsev/posts/Lq97ZtL8Xw9
[10]:http://www.zdnet.com/article/whats-new-and-nifty-in-linux-4-4/
[11]:https://www.kernel.org/releases.html
[12]:https://plus.google.com/u/0/+gregkroahhartman/posts/ZUcSz3Sn1Hc
[13]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[14]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[15]:http://www.zdnet.com/blog/open-source/
[16]:http://www.zdnet.com/topic/enterprise-software/
