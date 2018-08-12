## sober-wang 翻译中

Linux Virtual Machines vs Linux Live Images
Linxu 虚拟机 vs Linux 实体机
======
I'll be the first to admit（认可） that I tend（照顾） to try out new [Linux distros（发行版本）][1] on a far（远） too frequent（频繁） basis. Yet the method(方法) I use to test them, does vary depending（依赖） on my goals（目标） for each instance（每一个）. In this article（文章）, we're going to look at both（两个） running Linux virtual machines and running Linux live images. There are advantages（优势/促进/有利于） to each method（方法）, but there are some hurdles（障碍） with each method（方法/函数） as well（同样的）.

首先我得承认，我非常倾向于频繁尝试新的[ linux 发行版本 ][1]，我的目标是为了解决每一个 Linux 发行版的依赖，所以我用一些方法来测试它们。在一些文章中，我们将会看到两种运行 Linux 的模式，虚拟机或实体机。每一种方式都存在优势，但是有一些障碍会伴随着这两种方式。

### Testing out a new Linux distro for the first time
### 第一时间测试一个新的 Linux 发行版

When I test out a brand new Linux distro for the first time, the method I use depends heavily（沉重的） on the resources（资源） of the PC I'm currently（目前的） on. If I have access to my desktop PC, I'm going to run the distro to be tested in a virtual machine. The reason（理由） for this approach（靠近） is that I can download and test the distro in not only a live environment（环境）, but also（也） as an installed product with persistent（稳定的） storage abilities（能力）.

为了第一时间去做 Linux 发型版本的依赖测试，我把它们运行在我目前所拥有的所有类型的 PC 上。如果我用我的台式机，我将运行一个 Linux 虚拟机做测试。使用这种方法的原因是，不仅仅是生活环境下我可以下载测并测试发行版，但也会用稳定的生产环境安装。

On the other hand, if I am working with much less robust（强力的） hardware on a PC, then testing out a distro with a virtual machine installation of Linux is counter-productive. I'd be pushing that PC to its limits（范围） and honestly（真诚的） would be better off（富裕的） using a live Linux image instead running from a flash drive.

在另一方面，如果我在工作中我的PC不具备强力的硬件条件的，在一个虚拟机上测试 Linux 发型版本的时候将会产生相反的效果。老实的讲，我会将电脑性能压榨到极限，如果在经济条件服务的情况下我会使用实体机运行 Linux 镜像替代虚拟机

### Touring software on a new Linux distro
### 在一个新的 Linux 发行版本上运行旅游软件

If you're interested in checking out a distro's desktop environment（环境） or the available software（购买软件）, you can't go wrong with a live image of the distro. A live environment provides（提供） you with a birds eye view of what to expect（期望） in terms of overall layout（总体布局）, applications provided and how the user experience（体验） flows overall.

如果你有兴趣查看发行版本的桌面环境或购买软件，你不能因为发行版本的一个实时图片而诽谤它。一个生活环境提供给你希望的鸟瞰全局的视角，如何使用户体验更好是由应用程序提供的。

To be fair, you could do the same thing with a virtual machine installation, but it may be a bit overkill if you would rather（宁可） avoid（消除） filling（填充） up hard drive space with yet more data. After all（毕竟）, this is a simple tour of the distro. Remember what I said in the first section – I like to run Linux in a virtual machine to test it. This means I'm going to see how it installs, what the partition（区分） options look like and other elements（原理） you wouldn't see from using a live image of any given distro.

公平的说，一个虚拟化安装你也可以做同样的事，但是它有点不好，如果这么做你将要消除硬件上的许多数据。毕竟这是一个简单的发行版。记得我说过在第一部分-我做测试喜欢在虚拟机上运行 Linux 。这个方式我就能看见如何去安装它，使用镜像安装时你讲看不见有区别的操作和其他工作原理。

Touring usually indicates（表明） that you're only looking to take a quick look at a distro, so in this case（情况） the method（方法） that can be done with the least amount（最少的数量） of resistance（阻力） and time investment（时间的投入） is a good course（过程） of action.

通常你仅能看见一个关于发行版本的简短介绍，关于功能用最少的阻力和时间投入，是解决这个问题的好办法。

### Taking a Linux distro with you
### 随身携带一个发行版本

While it's not as common（共同的） as it was a few（很少数） years ago, the ability（有……能力） to take a Linux distro with you may be a consideration（担心） for some users. Obviously, virtual machine installations don't necessarily（必要的） lend（提供） themselves favorably（适合他们自己的） to portability（可携带）. However a live image of a Linux distro is actually quite portable. A live image can be written to a DVD or copied onto a flash drive for easy traveling.

这个话题虽然不像几年前那样普遍，使用 Linux 发行版的能力可能是许多用户所顾虑的。明显，适合他们自己携带的系统，虚拟机是无法提供的。无论如何，一个 Linux 发行版本的镜像是具有可移植性的。一个镜像能够轻松的写入到 DVD 或者 Flash 存储设备中。

Expanding（花费） on this concept（概念） of Linux portability（轻便/便携）, it's also beneficial（有益处） to have a live image on a flash drive when showing off how Linux works on a friend's computer. This empowers（授权） you to demonstrate（证明） how Linux can enrich（充实/使丰富） their life while not relying on running a virtual machine on their PC. It's a bit of a win-win in favor（喜爱） of using a live image.

在 Linux 可移植性的概念上花费时间，这有益于在一个朋友的电脑上使用 Flash 存储设备安装镜像版 Linux 。这个授权使你能证明 Linux 能充实他们的生活，虽然在他们的 PC 上运行一个虚拟机是不可靠的。在喜爱使用镜像的用户哪里，它是双赢的。

### Alternative to dual-booting Linux
### 选择做双系统 Linux

This next item is a huge one. Consider this – perhaps you're a Windows user. You like playing with Linux, but would rather not take the plunge. Dual-booting is out of the question in case（情况） something goes wrong or perhaps you're not comfortable identifying individual partitions. Whatever the case may be, both using Linux in a virtual machine or from a live image might be a great option for you.

这是一个巨大的项目。考虑一些事，例如你在使用 Windows .你喜欢玩 Linux ，但是宁可不获取插件。在一些出状况或考虑你不是拥有单独分区，双系统将是一个问题。不管什么样的情况，同时使用 Linux 虚拟机和镜像系统都对于你是一个很好的选择。

Now I'm going to take a rather odd（奇怪的） stance（立场） on something. I think you'll get far（能走多远） more value in the long term running Linux on a flash drive using a live image than with a virtual machine. There are two reasons（原因） for this. First of all, you'll get used to truly （真正的）running Linux vs running it inside of a virtual machine on top of Windows. Second, you can setup your flash drive to contain（包含） user data with persistent storage.



现在，我在一些事物上采取奇怪的立场。长期运行 Linux 镜像在 Flash 存储或虚拟机，我知道你将为了更多的价值走更远。对于这个说法有两个原因。第一个，在 Windows 中安装一个虚拟机 VS 真正的运行的 Linux 。第二，用一个持续的存储设备你的 Flash 存储，安装 Linux 和你的数据。



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
