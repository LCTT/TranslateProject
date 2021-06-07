[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11167-1.html)
[#]: subject: (Is This the End of Floppy Disk in Linux? Linus Torvalds Marks Floppy Disks ‘Orphaned’)
[#]: via: (https://itsfoss.com/end-of-floppy-disk-in-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 中的软盘走向终结了吗？Torvalds 将软盘的驱动标记为“孤儿”
======

> 在 Linux 内核最近的提交当中，Linus Torvalds 将软盘的驱动程序标记为孤儿。这标志着软盘在 Linux 中步入结束了吗？

有可能你很多年没见过真正的软盘了。如果你正在寻找带软盘驱动器的计算机，可能需要去博物馆里看看。

在二十多年前，软盘是用于存储数据和运行操作系统的流行介质。[早期的 Linux 发行版][1]使用软盘进行“分发”。软盘也广泛用于保存和传输数据。

你有没有想过为什么许多应用程序中的保存图标看起来像软盘？因为它就是软盘啊！软盘常用于保存数据，因此许多应用程序将其用作保存图标，并且这个传统一直延续至今。

![][2]

今天我为什么要说起软盘？因为 Linus Torvalds 在一个 Linux 内核代码的提交里标记软盘的驱动程序为“孤儿”。

### 在 Linux 内核中被标记为“孤儿”的软盘驱动程序

正如你可以在 [GitHub 镜像上的提交][3]中看到的那样，开发人员 Jiri 不再使用带有软驱的工作计算机了。而如果没有正确的硬件，Jiri 将无法继续开发。这就是 Torvalds 将其标记为孤儿的原因。

> 越来越难以找到可以实际工作的软盘的物理硬件，虽然 Willy 能够对此进行测试，但我认为从实际的硬件角度来看，这个驱动程序几乎已经死了。目前仍然销售的硬件似乎主要是基于 USB 的，根本不使用这种传统的驱动器。

![][4]

### “孤儿”在 Linux 内核中意味着什么？

“孤儿”意味着没有开发人员能够或愿意支持这部分代码。如果没有其他人出现继续维护和开发它，孤儿模块可能会被弃用并最终删除。

### 它没有被立即删除

Torvalds 指出，各种虚拟环境模拟器仍在使用软盘驱动器。所以软盘的驱动程序不会被立即丢弃。

> 各种 VM 环境中仍然在仿真旧的软盘控制器，因此该驱动程序不会消失，但让我们看看是否有人有兴趣进一步维护它。

为什么不永远保持内核中的软盘驱动器支持呢？因为这将构成安全威胁。即使没有真正的计算机使用软盘驱动程序，虚拟机仍然拥有它，这将使虚拟机容易受到攻击。

### 一个时代的终结？

这将是一个时代的结束还是会有其他人出现并承担起在 Linux 中继续维护软盘驱动程序的责任？只有时间会给出答案。

在 Linux 内核中，软盘驱动器成为孤儿我不觉得有什么可惜的。

在过去的十五年里我没有使用过软盘，我怀疑很多人也是如此。那么你呢？你有没有用过软盘？如果是的话，你最后一次使用它的时间是什么时候？

--------------------------------------------------------------------------------

via: https://itsfoss.com/end-of-floppy-disk-in-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/earliest-linux-distros/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/floppy-disk-icon-of-saving.png?resize=800%2C300&ssl=1
[3]: https://github.com/torvalds/linux/commit/47d6a7607443ea43dbc4d0f371bf773540a8f8f4
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/End-of-Floppy-in-Linux.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/valve-annouces-linux-based-gaming-operating-system-steamos/
