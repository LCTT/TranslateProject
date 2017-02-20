为何 Linux 之父 Linus Torvalds 在 ARM 会议上说他喜欢 x86
=============

**Torvalds 因为 x86 的基础架构和生态系统而对其宠爱有加**

![linus torvalds](http://core2.staticworld.net/images/article/2015/08/linus_torvalds-100600260-large.jpg)

*Linus Torvalds 于 1999 年 8 月 10 日在加州圣何塞举行的 LinuxWorld 节目中给挤满礼堂的 Linux 发烧友们作演讲。 ——出自：James Niccolai*

Linux 领袖 Linus Torvalds 是一个直率的人——他总是心口如一。比方说最近在 Linux 内核 4.8 的 [事故][1] 中，他没有文过饰非，而是承认了自己的过失。

不过他在上周的 Linaro Connect 会议上倒是[让人瞠目结舌][2]。当他被问到最喜欢的芯片架构的时候，他不假思索地说 x86，而不是 ARM。

或许是 x86 电脑悠久的历史让他得出这个答案。x86 没有多少碎片化的软件和硬件，它几乎仅仅是用来工作的。

Torvalds 说，人们总是痴迷于指令集和 CPU 核心，但事实是围绕架构的生态系统更为重要。

“重要的是围绕指令集的所有基础设施，而 x86 拥有大量的不同级别的基础设施”，Torvalds 说。“它在走一条与众不同的路。”

许多应用都是在英特尔或者 AMD 的 x86 机器上开发的。兼容性对于 x86 芯片和电脑来说是重要的，x86 平台有统一的硬件、开发模式以及其它的基础设施。

而 ARM 则迥然不同。从硬件供应商的角度来看，它引领着一个碎片化的市场，Torvalds 说。

“x86 的生态系统一向都秉承着兼容为先的理念，而 ARM 则不以为然，”Torvalds 在与 ARM 开发者进行的一场炉边闲谈时如是说。

ARM 主导了移动设备的市场，有大量的设备都是使用基于 Linux 内核的安卓操作系统的。但是 ARM 的生态系统太过于碎片化了，这导致了很多支持和设备的问题。

问题之一：由于硬件的配置不同，在所有移动设备上部署同一个版本的 Android 是不可能的。硬件制造商会调整 Android 系统以兼容他们设备的芯片组。不像 Windows 更新到 PC，一个 Android 更新无法推送到所有的移动设备。

英特尔尝试过将 x86 芯片放在智能手机上，但是现在已经放弃了。英特尔的其中一个目标就是推送可以在所有 x86 手机上下载并安装成功的[安卓更新][3]。

还有 ARM 服务器软件的开发问题。每个芯片组的架构、网络和 I/O 特性不同，必须编写软件才能利用这些特性。这大大减慢了服务器中采用 ARM 的速度。x86 不存在适配的问题，它将继续主导服务器市场。

“我对于 ARM 作为一个硬件平台而不是一个指令集感到非常失望，虽然我也有我的问题，”Torvalds 说。“作为一个硬件平台，它始终不太好对付。”

Torvalds 小时候在一台装配有 8 位的 6502 处理器的微机上编程，他很喜欢这种架构，因为它的指令是流式的，当时还没有其它硬件可以与之媲美。这种架构为芯片提供了更高的性能。

“我那时想升级的是一台 Acorn Archimedes，呃，ARM 就是因该公司而命名的，“Torvalds说，“那曾经是我梦寐以求的机器。”

[Archimedes][4] 是第一台基于 Acorn 电脑公司的 ARM RISC 芯片的个人电脑。ARM 作为 Acorn 的一个分支而成立。（LCTT 译注：ARM 的缩写来自于 Acorn RISC Machine。——引自[维基百科](https://en.wikipedia.org/wiki/Acorn_Archimedes)。）

Torvalds 喜欢 Archimedes，因为它搭载了像 6502 一样的流式指令和 RAM 芯片以获得高性能。不尽人意的是，他找不到那台电脑。

他尝试过一台“古怪的英式电脑”，[Sinclair QL][5]，这是一台比 Acorn Archimedes 还要失败的机器，Torvalds 说。

“那时的芬兰不是宇宙的中心，”Torvalds 说。“在那之后我吸取教训了——再也没有去买没有基础设施（生态）的机器。”


--------------------------------------------------------------------------------

via: http://www.pcworld.com/article/3129300/linux/why-linux-pioneer-linus-torvalds-prefers-x86-over-arm.html

作者：[Agam Shah][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.pcworld.com/author/Agam-Shah/
[1]: http://www.theregister.co.uk/2016/10/05/linus_torvalds_admits_buggy_crap_made_it_into_linux_48/
[2]: https://www.youtube.com/watch?v=fuAebQvFnRI
[3]: http://www.infoworld.com/article/2908072/android/google-and-intel-vow-to-speed-up-delivery-of-android-updates-to-devices.html
[4]: http://www.pcworld.com/article/3097427/hardware/how-arm-set-itself-up-for-a-32-billion-acquisition.html
[5]: http://oldcomputers.net/ql.html
