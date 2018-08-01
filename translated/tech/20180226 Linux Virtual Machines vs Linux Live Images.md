## sober-wang 翻译中

Linux Virtual Machines vs Linux Live Images
Linxu 虚拟机 vs Linux 实体机
======
I'll be the first to admit（认可） that I tend（照顾） to try out new [Linux distros（发行版本）][1] on a far（远） too frequent（频繁） basis. Yet the method(方法) I use to test them, does vary depending（依赖） on my goals（目标） for each instance（每一个）. In this article（文章）, we're going to look at both（两个） running Linux virtual machines and running Linux live images. There are advantages（优势/促进/有利于） to each method（方法）, but there are some hurdles（障碍） with each method（方法/函数） as well（同样的）.

首先我得承认，我非常倾向于频繁尝试新的[ linux 发行版本 ][1]，我的目标是为了解决每一个 Linux 发行版的依赖，所以我用一些方法来测试它们。在一些文章中，我们将会看到两种运行 Linux 的模式，虚拟机或实体机。每一种方式都存在优势，但是有一些障碍会伴随着这两种方式。

### Testing out a new Linux distro for the first time
### 第一时间测试一个新的 Linux 发行版

When I test out a brand new Linux distro for the first time, the method I use depends heavily（沉重的） on the resources（资源） of the PC I'm currently（目前的） on. If I have access to my desktop PC, I'm going to run the distro to be tested in a virtual machine. The reason（理由） for this approach（靠近） is that I can download and test the distro in not only a live environment（环境）, but also（也） as an installed product with persistent（稳定的） storage abilities（能力）.

为了第一时间去做 Linux 发型版本的依赖测试，我把它们运行在我目前所拥有的所有类型的 PC 上。如果我用我的台式机，我将运行一个 Linux 虚拟机做测试。

On the other hand, if I am working with much less robust hardware on a PC, then testing out a distro with a virtual machine installation of Linux is counter-productive. I'd be pushing that PC to its limits and honestly would be better off using a live Linux image instead running from a flash drive.

### Touring software on a new Linux distro

If you're interested in checking out a distro's desktop environment or the available software, you can't go wrong with a live image of the distro. A live environment provides you with a birds eye view of what to expect in terms of overall layout, applications provided and how the user experience flows overall.

To be fair, you could do the same thing with a virtual machine installation, but it may be a bit overkill if you would rather avoid filling up hard drive space with yet more data. After all, this is a simple tour of the distro. Remember what I said in the first section – I like to run Linux in a virtual machine to test it. This means I'm going to see how it installs, what the partition options look like and other elements you wouldn't see from using a live image of any given distro.

Touring usually indicates that you're only looking to take a quick look at a distro, so in this case the method that can be done with the least amount of resistance and time investment is a good course of action.

### Taking a Linux distro with you

While it's not as common as it was a few years ago, the ability to take a Linux distro with you may be a consideration for some users. Obviously, virtual machine installations don't necessarily lend themselves favorably to portability. However a live image of a Linux distro is actually quite portable. A live image can be written to a DVD or copied onto a flash drive for easy traveling.

Expanding on this concept of Linux portability, it's also beneficial to have a live image on a flash drive when showing off how Linux works on a friend's computer. This empowers you to demonstrate how Linux can enrich their life while not relying on running a virtual machine on their PC. It's a bit of a win-win in favor of using a live image.

### Alternative to dual-booting Linux

This next item is a huge one. Consider this – perhaps you're a Windows user. You like playing with Linux, but would rather not take the plunge. Dual-booting is out of the question in case something goes wrong or perhaps you're not comfortable identifying individual partitions. Whatever the case may be, both using Linux in a virtual machine or from a live image might be a great option for you.

Now I'm going to take a rather odd stance on something. I think you'll get far more value in the long term running Linux on a flash drive using a live image than with a virtual machine. There are two reasons for this. First of all, you'll get used to truly running Linux vs running it inside of a virtual machine on top of Windows. Second, you can setup your flash drive to contain user data with persistent storage.

I'll grant you the same could be said with a virtual machine running Linux, however you will never have an update break anything using the live image approach. Why? Because you're not updating a host OS or the guest OS. Remember there are entire distros that are designed to be nothing more than persistent storage Linux distros. Puppy Linux is one great example. Not only can it run on PCs that would otherwise be recycled or thrown away, it allows you to never be bothered again with tedious system updates thanks to the way the distro handles security. It's not a normal Linux distro and it's walled off in such a way that the persistent live image is free from anything scary.

### When a Linux virtual machine is absolutely the best option

As I bring this article to a close, let me leave you with this. There is one instance where using a virtual machine such as Virtual Box is absolutely better than using a live image – recording the desktop environment of any Linux distro.

For example, I make videos that provide a tour and review of a variety of Linux distros. Doing this with live images would require me to capture the screen with a hardware device or install a software capture device from the live image's repositories. Clearly, a virtual machine is better suited for this job than a live image of a Linux distro.

Once you toss audio capture into the mix, there is no question that if you're going to use software to capture your review, you really want to have a host OS that has all the basic needs covered for a reasonably decent capture environment. Again, you could do all of this with a hardware device...but that might be cost prohibitive if you're only do video/audio capturing as a part time endeavor.

### A Linux virtual machine vs a Linux live image

What is your preferred method of trying out new distros? Perhaps you're someone who is fine with formatting their hard drive and throwing caution to the wind, thus, making the idea of any of this unneeded?

Most people I've interacted with online tend to follow much of the methodology I've touched on above, but I'd love to hear what approach works best for you. Hit the comments, let me know which method you prefer when checking out the greatest and latest from the Linux distro world.

--------------------------------------------------------------------------------

via: https://www.datamation.com/open-source/linux-virtual-machines-vs-linux-live-images.html

作者：[Matt Hartley][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.datamation.com/author/Matt-Hartley-3080.html
[1]:https://www.datamation.com/open-source/best-linux-distro.html
