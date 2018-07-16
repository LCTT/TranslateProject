小评磁盘分区软件GParted 0.16.2
=========================

**GParted可能是Linux平台上最重要的应用程序之一了，并且它也是最有用最易识别的软件之一。**

![img](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-2.jpg)

不能把GParted作为一个单独的应用程序来讨论。公平的说，它本是采用GTK+开发的GNU Parted的前端程序。但是由于开发人员做了许多工作，使得它的功能已经不仅仅只是给这个复杂而难用的软件提供一个简单的图形界面了。

GParted项目启动于2004年，自从那时起开发人员一直在不断的完善它。这个过程是缓慢的，最新发布的版本号是0.16.2（该版本已经被我们点评过）。难以想象这个开发工作一下就持续了近十年。

用户会发现GParted不仅仅是一个工具，还有一个名叫GParted Live的Live操作系统，它无需安装即可直接使用，它可以在任何带有光驱或者USB接口的系统上直接运行，包括Mac操作系统。

很难想像在Linux世界中没有这个工具会怎样，但是我们也不得不说，它并不是完成这方面工作唯一工具。

###安装

这是一项困难的工作。GParted的开发者们只提供最新版软件的源代码，这就意味着如果你想获取最好的版本就不得不做一些编译的工作。这真是个坏消息。

我们在Ubuntu 13.10（代号俏皮的蝾螈）上安装了GParted，一切都很顺利。官方库所提供的最新版是0.16.1，这个版本应该可以满足大多数用户的需求了。该版本与最新0.16.2版之间的区别并不明显，只是在一些设置上有所改动。

我们假设你真的如饥似渴般想要最新的版本。首先，下载软件包然后解压它。


下载GParted 0.16.2：

- [gparted-0.16.2.tar.bz2][1][sources] [1.80 MB]

这并不是一个很大的软件，编译时间也不会太长。通常，用户只需要输入下面的命令：

    ./configure
    make
    sudo make install

问题是正如你和我这样的普通人，并没有安装该软件所依赖的所有软件包。这意味着，当 ./configure命令显示错误的时候，你不得不一个一个的去安装这些软件。

好消息是，Ubuntu用户有一个非常方便的命令，适用于所有在他们仓库中的应用。在使用./configure之前，首先输入如下命令：

    sudo apt-get build-dep gparted

这条命令会从仓库中获得所有必须的依赖软件包，并将用户从复杂的一个一个安装依赖库的工作中解救出来。

###使用

像我以前说的，这是一个磁盘分区编辑器。这意味着你可以通过它的用户界面进行移动、重新分配分区大小、重新分区以及做任何你想要做的事。

用户也可以删除分区，修复那些被其他系统损坏了的USB盘。你必须足够的小心。如果你像我一样安装了多系统，你会发现它会很容易损坏已经安装了的Windows系统。

GParted能够修改以下文件系统：btrfs, crypt / LUKS, ext2, ext3, ext4, fat16, fat32, hfs, hfs+, linux-swap, lvm2 pv, nilfs2, ntfs, reiserfs, reiser4, ufs, 以及 xfs。GParted也可以被用于克隆整个分区。

此外，GParted也得到了UEFI安全启动的支持，能够在任何具有此功能的PC电脑上流畅运行。


![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-2.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-3.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-5.jpg)

![](http://i1-news.softpedia-static.com/images/news2/GParted-Review-387094-6.jpg)

###总结

谁会知道修改分区是件有趣的事呢？GParted把这项枯燥又具有潜在危险的活动变得并不那样可怕，为用户提供了一个很棒的用户体验，而不像命令行的应用程序那样。

那些用户不得不在终端中调整分区的日子已经远去了。GParted看起来像一个专业的解决方案，它是我们不能没有的工具。

**优点**

使用其它操作系统的用户，比如windows或者Mac，需要支付高额的费用来使用这一类软件。而Linux用户则可以免费获得，而且开发者在不断的维护这个程序。

它的用户界面非常整洁，简单易懂，甚至Linux新手都能看的明白。

**不足**

使用这个程序会很容易的把事情搞坏。尤其是一但具有了root用户的权限，它会具有潜在的破坏性。

对于这种情况，如果GParted能够提供更多综合性的建议，或者在开始的时候仅提供一个初级版本的话，或许会更合适。


---

via: http://www.softpedia.com/reviews/linux/GParted-Review-387094.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[woodboow](https://github.com/woodboow) 校对：[Caroline](https://github.com/carolinewuyan)



[1]:http://sourceforge.net/projects/gparted/files/gparted/gparted-0.16.2/gparted-0.16.2.tar.bz2/download
