[#]: subject: "Linux kernel modules we can't live without"
[#]: via: "https://opensource.com/article/21/8/linux-kernel-module"
[#]: author: "Jen Wike Huger https://opensource.com/users/jen-wike"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13747-1.html"

我们离不开的 Linux 内核模块
======

> 开源爱好者们对他们所喜爱的 Linux 内核模块进行了评价。

![](https://img.linux.net.cn/data/attachment/album/202109/03/065649hik5hjiiy3htj589.jpg)

Linux 内核今年就要满 30 岁了! 如果你像我们一样对此特别重视，那么让我们本周用几个特别的文章来庆祝 Linux。

今天，我们先来看看来自社区对“**你不能没有哪个 Linux 内核模块？为什么？**”的回答，让我们听听这 10 位爱好者是怎么说的。

### #1

我猜一些内核开发者听到我的回答后会尖叫着跑开。不过，我还是在这里列出了两个最具争议性的模块：

  * 第一个是 NVIDIA，因为我的工作笔记本和个人台式机上都有 NVIDIA 显卡。
  * 另一个可能产生的仇恨较少。VMware 的 VMNET 和 VMMON 模块，以便能够运行 VMware Workstation。

— [Peter Czanik][2]

### #2

我最喜欢的是 [zram][3] 模块。它在内存中创建了一个压缩块设备，然后它可以作为交换分区使用。在内存有限的情况下（例如，在虚拟机上），还有如果你担心频繁的 I/O 操作会磨损你的 SSD 或者甚至更糟糕的基于闪存的存储，那么使用基于 zram 的交换分区是非常理想的。

— [Stephan Avenwedde][4]

### #3

最有用的内核模块无疑是 snd-hda-intel，因为它支持大多数集成声卡。我可以一边听音乐，一边在 Linux 桌面上编码一个音频编曲器。

— [Joël Krähemann][5]

### #4

如果没有我用 Broadcom 文件生成的 kmod-wl，我的笔记本就没有价值了。我有时会收到关于内核污染的信息，但没有无线网络的笔记本电脑有什么用呢？

— [Gregory Pittman][6]

### #5

我不能没有蓝牙。没有它，我的鼠标、键盘、扬声器和耳机除了用来挡住门板还有啥用？

— [Gary Smith][7]

### #6

我要冒昧地说 _全_ 都是。 说真的，我们已经到了随机拿一块硬件，插入它，它就可以工作的地步。

  * USB 串行适配器能正常工作
  * 显卡可以使用（尽管可能不是最好的）
  * 网卡正常工作
  * 声卡正常工作

所有这些模块整体带来大量可以工作的驱动程序，令人印象深刻。我记得在过去那些糟糕的日子里，我们曾经大喊 xrandr 魔法字符串才能来使投影仪工作。而现在，是的，当设备基本不能正常工作时，才真的罕见。

如果我不得不把它归结为一个，那就是 raid6。

— [John 'Warthog9' Hawley][8]

### #7

对于这个问题，我想回到 20 世纪 90 年代末。我是一家小公司的 Unix 系统管理员（兼任 IS 经理）。我们的磁带备份系统死了，由于“小公司”预算有限，我们没有急于更换或现场维修。所以我们必须得把它送去维修。

在那两个星期里，我们没有办法进行磁带备份。没有一个系统管理员愿意处于这种境地。

但后来我想起了读过的 [如何使用软盘磁带机][9]，我们刚好有一台刚换下来的塔式电脑，它有一个软盘磁带机。

于是我用 Linux 重新安装了它，设置了 ftape 内核驱动模块，进行了一些备份/恢复测试，然后将我们最重要的备份运行到 QIC 磁带上。在这两个星期里，我们依靠 ftape 备份重要数据。

所以，对于那些让软盘磁带机在 1990 年代的 Linux 上工作的无名英雄，你真是太厉害了！

— [Jim Hall][10]

### #8

嗯，这很简单。是 kvm 内核模块。就个人而言，我无法想象在没有虚拟机的情况下完成日常工作。我愿意相信我们大多数人都是这样。kvm 模块在使 Linux 成为云战略的核心方面也发挥了很大作用。

— [Gaurav Kamathe][11]

### #9

对我来说，是 dm-crypt，它是用于 LUKS 的。参见：

  * <https://www.redhat.com/sysadmin/disk-encryption-luks>
  * <https://manpages.debian.org/unstable/cryptsetup-bin/cryptsetup.8.en.html>

知道别人无法看到你的磁盘上的内容是非常棒的，例如，如果你的笔记本丢失或被盗时。

— [Maximilian Kolb][12]

### #10

对于密码学基础，很难超越 crypto 模块和它的 C API，它是如此简洁明了。

在日常生活中，还有什么比蓝牙提供的即插即用更有价值的吗？

— [Marty Kalin][13]

在评论中与我们分享。你的生活中不能没有什么 Linux 内核模块？

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-kernel-module

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/users/czanik
[3]: https://en.wikipedia.org/wiki/Zram
[4]: https://opensource.com/users/hansic99
[5]: https://opensource.com/users/joel2001k
[6]: https://opensource.com/users/greg-p
[7]: https://opensource.com/users/greptile
[8]: https://opensource.com/users/warthog9
[9]: https://tldp.org/HOWTO/Ftape-HOWTO.html
[10]: https://opensource.com/users/jim-hall
[11]: https://opensource.com/users/gkamathe
[12]: https://opensource.com/users/kolb
[13]: https://opensource.com/users/mkalindepauledu
