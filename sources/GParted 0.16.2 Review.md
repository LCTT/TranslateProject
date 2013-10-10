GParted 0.16.2 Review
回顾GParted 0.16.2
================================================================================
**GParted is probably one of the most important applications on the Linux platform and it's also one of the most useful and recognizable pieces of software.**
**GParted可能是Linux平台上最重要的应用程序之一了，并且它也是最有用最易识别的软件之一。**

It would be incorrect to talk about GParted as a standalone application. To be fair, this is the GTK+ frontend to GNU Parted, but the developers have done a lot more than just provide a simple interface for an otherwise cumbersome and difficult software.
不能够把GParted作为一个独立的应用程序来讨论。公平的说，它本是采用GTK+开发的GNU Parted的前端程序。但是由于开发人员做了许多工作，使得它的功能已经不仅仅只是给这个复杂而难用的软件提供一个简单的图形界面了。

GParted was launched back in 2004 and the developers have been working on it ever since. The process is slow and the latest version released (and reviewed by us) is 0.16.2. Keep in mind that almost 10 years of active development have passed.
GParted项目启动于2004年，自从那时起开发人员一直在不断的完善它。这个过程是缓慢的，最新发布的版本号是0.16.2（该版本已经被我们审核过）。难以想象这个开发工作一下就持续了几乎10年。

Users will find that GParted is not the only tool in the shed. A live operating system is also available, by the name of GParted Live. This is capable of running on virtually anything that comes with an optical drive or USB port, including Mac systems.
用户会发现GParted不仅仅是唯一的工具。同样可以使用一个名叫GParted Live的操作系统，它无需安装即可直接使用。它可以在任何带有光盘或者USB接口的系统上直接运行，包括Mac操作系统。

It would be hard to imagine the Linux world without this tool, but we also have to say that it's not the only application able to do this work.
很难想像在Linux世界中没有这个工具会怎样，但是我们也不得不说，它并不是完成这方面工作唯一工具。

**Installation**
**安装**

This is a tricky one. The GParted developers only provide the latest version of their application as source, which means that if you really want the best version, you will have to do some compiling. This is the bad news.

We installed GParted on Ubuntu 13.10 (Saucy Salamander) and everything worked without a hitch. The last version in the official repositories is 0.16.1 and this should be enough for most users. The differences between this one and the latest 0.16.2 are not quite major and only cover a particular set of changes.

Let's assume that you really want the latest version. Download the archive and extract its contents. This is not a big piece of software and the compilation won't take too long. Usually, users just have to enter the following commands:

    ./configure
    make
    sudo make install

The problem is that normal people, like you and me, don't usually have all the necessary dependencies installed. This means that you will have to go install them, one by one, when the ./configure command errors out.

The good news is that, Ubuntu users have a very handy command that works for all the applications in their repositories. Before giving the ./configure command, enter the following first:

    sudo apt-get build-dep gparted

This will get all the necessary dependencies from the repositories and will free users from the task of installing one library after another.

**Usage**

As I said before, this is a partition editor. This means that you will be able to move, resize, repartition, and do virtually anything you can think of, within the comforts of a GUI.

Users can also delete partitions and fix USB drives that have been corrupted by other operating systems. You must be careful though. If you have a multiboot system, like I do, you will find it very easy to damage the Windows installation.

GParted is able to manipulate the following file system formats: btrfs, crypt / LUKS, ext2, ext3, ext4, fat16, fat32, hfs, hfs+, linux-swap, lvm2 pv, nilfs2, ntfs, reiserfs, reiser4, ufs, and xfs. GParted can also be used to clone entire partitions.

Moreover, the application has also received UEFI secure boot support and can run without any problems on PCs featuring this particular nuisance.

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-2.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-3.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-5.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-6.jpg)

**The Good**

Users of other operating systems, such as Windows or Mac OS, are paying top dollars for this type of applications. The Linux users get it for free and the developers are always looking to expand and improve it.

The interface is clean and simple to understand, even for someone who has just installed Linux for the first time.

**The Bad**

It's so easy to be bad with this application. It has the potential to do a lot of harm, especially because it needs the root password to run.

It would be nice if more comprehensive advice were provided, or if a beginner version could be activated at start. More and more users are flocking towards the Linux platform and some of them might want to use GParted.

**Conclusion**

Who knew that partitioning could be fun? GParted turns a dreary and potentially dangerous activity into something that is not scary and that provides very good feedback for users, unlike a command line application.

Long gone are the days when users had to move partitions inside terminals. GParted acts and looks like a professional solution, and it's a tool that we can't really do without.

DOWNLOAD for GParted 0.16.2:

- [gparted-0.16.2.tar.bz2][1][sources] [1.80 MB]

--------------------------------------------------------------------------------

via: http://www.softpedia.com/reviews/linux/GParted-Review-387094.shtml

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://sourceforge.net/projects/gparted/files/gparted/gparted-0.16.2/gparted-0.16.2.tar.bz2/download
