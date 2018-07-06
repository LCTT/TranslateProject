translating---geekpi

TrueOS Doesn’t Want to Be ‘BSD for Desktop’ Anymore
============================================================


There are some really big changes on the horizon for [TrueOS][9]. Today, we will take a look at what is going on in the world of desktop BSD.

### The Announcement

![TrueOS: Core Operating System BSD](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/true-os-bsd-desktop.jpeg)

The team behind [TrueOS][10] [announced][11] that they would be changing the focus of the project. Up until this point, TrueOS has made it easy to install BSD with a graphical user interface out of the box. However, it will now become “a cutting-edge operating system that keeps all of the stability that you know and love from ZFS ([OpenZFS][12]) and [FreeBSD][13], and adds additional features to create a fresh, innovative operating system. Our goal is to create a core-centric operating system that is modular, functional, and perfect for do-it-yourselfers and advanced users alike.”

Essentially, TrueOs will become a downstream fork of FreeBSD. They will integrate newer software into the system, such as [OpenRC][14] and [LibreSSL][15]. They hope to stick to a 6-month release cycle.

The goal is to make TrueOS so it can be used as the base for other projects to build on. The graphical part will be missing to make it more distro-agnostic.

[Suggested readInterview with MidnightBSD Founder and Lead Dev Lucas Holt][16]

### What about Desktop Users?

If you read my [review of TrueOS][17] and are interested in trying a desktop BSD or already use TrueOS, never fear (which is good advice for life too). All of the desktop elements of TrueOS will be spun off into [Project Trident][18]. Currently, the Project Trident website is very light on details. It seems as though they are still figuring out the logistics of the spin-off.

If you currently have TrueOS, you don’t have to worry about moving. The TrueOS team said that “there will be migration paths available for those that would like to move to other FreeBSD-based distributions like Project Trident or [GhostBSD][19].”

[Suggested readInterview with FreeDOS Founder and Lead Dev Jim Hall][20]

### Thoughts

When I first read the announcement, I was frankly a little worried. Changing names can be a bad idea. Customers will be used to one name, but if the product name changes they could lose track of the project very easily. TrueOS already went through a name change. When the project was started in 2006 it was named PC-BSD, but in 2016 the name was changed to TrueOS. It kinds of reminds me of the [ArchMerge and Arcolinux saga][21].

That being said, I think this will be a good thing for desktop users of BSD. One of the common criticisms that I heard about PC-BSD and TrueOS is that it wasn’t very polished. Separating the two parts of the project will help sharpen the focus of the respective developers. The TrueOS team will be able to add newer features to the slow-moving FreeBSD base and the Project Trident team will be able to improve user’s desktop experience.

I wish both teams well. Remember, people, when someone works on open source, we all benefit even if the work is done on something we don’t use.

What are your thoughts about the future of TrueOS and Project Trident? Please let us know in the comments below.


------------------------------

关于作者：

My name is John Paul Wohlscheid. I'm an aspiring mystery writer who loves to play with technology, especially Linux. You can catch up with me at [my personal website][23]

--------------------------------------------------------------------------------

via: https://itsfoss.com/trueos-plan-change/

作者：[John Paul Wohlscheid ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/john/
[1]:https://itsfoss.com/author/john/
[2]:https://itsfoss.com/trueos-plan-change/#comments
[3]:https://itsfoss.com/category/bsd/
[4]:https://itsfoss.com/category/news/
[5]:https://itsfoss.com/tag/bsd/
[6]:https://itsfoss.com/tag/freebsd/
[7]:https://itsfoss.com/tag/project-trident/
[8]:https://itsfoss.com/tag/trueos/
[9]:https://www.trueos.org/
[10]:https://www.trueos.org/
[11]:https://www.trueos.org/blog/trueosdownstream/
[12]:http://open-zfs.org/wiki/Main_Page
[13]:https://www.freebsd.org/
[14]:https://en.wikipedia.org/wiki/OpenRC
[15]:http://www.libressl.org/
[16]:https://itsfoss.com/midnightbsd-founder-lucas-holt/
[17]:https://itsfoss.com/trueos-bsd-review/
[18]:http://www.project-trident.org/
[19]:https://www.ghostbsd.org/
[20]:https://itsfoss.com/interview-freedos-jim-hall/
[21]:https://itsfoss.com/archlabs-vs-archmerge/
[22]:http://reddit.com/r/linuxusersgroup
[23]:http://johnpaulwohlscheid.work/
