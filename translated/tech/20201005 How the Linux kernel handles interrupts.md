[#]: collector: (lujun9972)
[#]: translator: ()
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Linux kernel handles interrupts)
[#]: via: (https://opensource.com/article/20/10/linux-kernel-interrupts)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

Linux 内核如何处理中断
======

中断是计算机处理数据的关键部分。

![企鹅驾驶着黄色背景的汽车][1]

中断是现代CPU工作中必不可少的一部分。例如：当你每次在键盘上按下一个按键后，CPU会被中断以使得PC读取用户键盘的输入。这个过程发生得相当快以致于在使用体验上你不会感到任何变化或损害。

此外，键盘并不是导致中断的唯一元素。一般来说，有三种类型的事件会导致CPU发生中断：硬件中断、软件中断和异常。再具体介绍不同类型的中断前，我需要先定义一些术语。

### 定义

一个中断请求（**IRQ**）是被可编程的中断控制器（**PIC**）发起，其目的是为了中断CPU和执行中断服务程序（**ISR**）。中断服务程序（ISR）是一个小的程序来处理具体的数据，其具体的处理方式依赖于造成中断请求（IRQ）的原因。之前正在运行的进程在中断服务程序（ISR）运行结束前都会被中断。

在过去，中断请求由单独的芯片处理（中断控制器芯片），I/O 设备与中断控制器（PIC）直接相连。中断控制器（PIC）管理着多种硬件的中断请求并且可以直接与CPU通信。当一个中断请求（IRQ）产生后，中断控制器向CPU写入数据并且触发中断请求（**INTR**）引脚。

现如今，中断请求（IRQ）由CPU中的高级可编程中断控制器（APIC）部分来处理。每个核中都拥有属于自己的高级可编程中断控制器。

### 中断的类型

正如我前文中提到的，中断可以根据其来源分为三种类型。

#### 硬件中断

当一个硬件设备想要告诉CPU某一需要处理的数据已经准备好后（例如：当键盘被按下或者一个数据包到了网络接口处），它将会发送一个中断请求（IRQ）来告诉CPU数据是可用的。接下来会调用在内核启动时设备驱动注册的对应的中断服务程序（ISR）。

#### 软件中断

当你在播放一个视频时，音频和视频是同步播放是相当重要的，因此音频的播放速度不应该发生变化。这是由软件中断实现的，由精确的计时器系统（称为 [jiffies][2]）重复发起的。这个计时器会使得你的音乐播放器同步。软件中断也可以被特殊的指令所调用来读取或写入数据到硬件设备。

当系统需要实时性时（例如在工业应用中），软件中断会变得重要。你可以在Linux基金会的文章中找到更多相关信息：[面向嵌入式开发者的实时Linux介绍][3]。

#### 异常

异常是你可能之前知道的中断类型。当CPU执行一些将会导致除以0或缺页错误的指令时，任何其他运行中的程序都会被中断。在这种情况下，你会被一个弹窗提醒，或在控制台输出中看到**段错误（核心已转存）**。但并不是所有异常都是由指令错误引起的。

异常可以进一步分为 _错误_、_陷阱_ 和 _中止_ ？

Exceptions can be further divided into _Faults_, _Traps_, and _Aborts_.

  * **错误：** 错误是系统可以纠正的异常。例如当一个进程尝试访问某个已经被换出到硬盘的页时。当请求的地址在进程的地址空间中，并且满足访问权限时，如果页不在内存（RAM）中，将会产生一个中断请求（IRQ），并开始启用**缺页异常处理程序**把所需的页加载到内存中。如果操作成功执行，程序将继续运行。

  * **陷阱：** 陷阱主要用在调试中。如果你在某个程序中设置了一个断点，你就插入了一条可以触发陷阱执行的指令。一个陷阱可以触发上下文切换来允许你的调试器读取和展示局部变量的值。之后程序可以继续运行。陷阱同样也是运行系统调用的方式（如杀死一个进程）

  * **中止：** 中止是由系统表中的硬件错误或值不一致而导致的。一个中止不会报告造成异常的指令的所在位置。这是最严重的中断，一个中止将会调用系统的**中止异常处理程序**来结束造成异常的进程。

### 动手实践

中断请求按照高级可编程中断控制器（APIC）中的优先级高低排序（0是最高优先级）。前32个中断（0~31）是由CPU指定的固定序列。你可以在 [OsDev 异常][4] 页面找到关于它们的概述。接下来的中断请求可以不同的分配。中断描述表（**IDT**）中记录了中断请求（IRQ）和中断服务程序（ISR）的对应关系。Linux 中定义了从 0 到 256 的 IRQ 向量。

为了打印出在你的系统中已注册的中断，打开一个终端并输入：

```
`cat /proc/interrupts`
```

你应该会看到类似如下图的结果：

![注册的中断列表][5]

内核版本为5.6.6中注册的中断 (Stephan Avenwedde, [CC BY-SA 4.0][6])

从左到右各列的含义依次为：中断向量号、每个CPU（0~n）中断发生次数、硬件来源、硬件源通道信息、以及造成中断请求的设备名。

在表的末尾，有一些非数字的中断。它们是特定于体系结构的中断，如本地计时器中断（**LOC**）的中断请求（IRQ）号为236。其中一些在 Linux 内核源树中的[Linux IRQ 向量布局][7]中指定。

![特定于体系结构的中断][8]

特定于体系结构的中断 (Stephan Avenwedde, [CC BY-SA 4.0][6])


如果要实时获取该表，请运行如下命令：

```
`watch -n1 "cat /proc/interrupts"`
```

### 总结

正确的中断请求（IRQ）处理对于硬件、驱动和软件的正常交互是必要的。幸运地是，Linux 内核很好地完成了它，一个PC的普通用户很难注意到内核整个中断处理的过程。

中断相当复杂，本文仅仅是一个关于中断的概述。如果想要深入了解该主题可以阅读 [Linux 内部电子书][9]（CC BY-NC-SA 4.0）和 [Linux 内核教程][10] 仓库。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/linux-kernel-interrupts

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://elinux.org/Kernel_Timer_Systems
[3]: https://www.linuxfoundation.org/blog/2013/03/intro-to-real-time-linux-for-embedded-developers/
[4]: https://wiki.osdev.org/Exceptions
[5]: https://opensource.com/sites/default/files/uploads/proc_interrupts_1.png (Registered interrupts list)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://github.com/torvalds/linux/blob/master/arch/x86/include/asm/irq_vectors.h
[8]: https://opensource.com/sites/default/files/uploads/proc_interrupts_2.png (Architecture-specific interrupts)
[9]: https://0xax.gitbooks.io/linux-insides/content/Interrupts/
[10]: https://linux-kernel-labs.github.io/refs/heads/master/lectures/interrupts.html#
