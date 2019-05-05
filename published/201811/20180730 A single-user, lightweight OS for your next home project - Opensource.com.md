一个用于家庭项目的单用户、轻量级操作系统
======
> 业余爱好者应该了解一下 RISC OS 的五个原因。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/robot_arm_artificial_ai.png?itok=8CUU3U_7)

究竟什么是 RISC OS？嗯，它不是一种新的 Linux。它也不是有些人认为的 Windows。事实上，它发布于 1987 年，它比它们任何一个都要古老。但你看到它时不一定会意识到这一点。

其点击式图形用户界面在底部为活动的程序提供一个固定面板和一个图标栏。因此，它看起来像 Windows 95，并且比它早了 8 年。

这个操作系统最初是为 [Acorn Archimedes][1] 编写的。这台机器中的 Acorn RISC Machines CPU 是全新的硬件，因此需要在其上运行全新的软件。这是最早的 ARM 芯片上的系统，早于任何人想到的 Android 或 [Armbian][2] 之前。

虽然 Acorn 桌面最终消失了，但 ARM 芯片继续征服世界。在这里，RISC OS 一直有一个优点 —— 通常在嵌入式设备中，你从来没有真正地意识到它。RISC OS 过去长期以来一直是一个完全专有的操作系​​统。但近年来，该抄系统的所有者已经开始将源代码发布到一个名为 [RISC OS Open][3] 的项目中。

### 1、你可以将它安装在树莓派上

树莓派的官方操作系统 [Raspbian][4] 实际上非常棒（如果你对摆弄不同技术上新奇的东西不感兴趣，那么你可能最初也不会选择树莓派）。由于 RISC OS 是专门为 ARM 编写的，因此它可以在各种小型计算机上运行，​​包括树莓派的各个型号。

### 2、它超轻量级

我的树莓派上安装的 RISC 系统占用了几百兆 —— 这是在我加载了数十个程序和游戏之后。它们大多数时候不超过 1 兆。

如果你真的节俭，RISC OS Pico 可用在 16MB SD 卡上。如果你要在嵌入式系统或物联网项目中鼓捣某些东西，这是很完美的。当然，16MB 实际上比压缩到 512KB 的老 Archimedes 的 ROM 要多得多。但我想 30 年间内存技术的发展，我们可以稍微放宽一下了。

### 3、它非常适合复古游戏

当 Archimedes 处于鼎盛时期时，ARM CPU 的速度比 Apple Macintosh 和 Commodore Amiga 中的 Motorola 68000 要快几倍，它也完全吸了新的 386 技术。这使得它成为对游戏开发者有吸引力的一个平台，他们希望用这个星球上最强大的桌面计算机来支撑他们的东西。

那些游戏的许多拥有者都非常慷慨，允许业余爱好者免费下载他们的老作品。虽然 RISC OS 和硬件已经发展了，但只需要进行少量的调整就可以让它们运行起来。

如果你有兴趣探索这个，[这里有一个指南][5]让这些游戏在你的树莓派上运行。

### 4、它有 BBC BASIC

就像过去一样，按下 `F12` 进入命令行，输入 `*BASIC`，就可以看到一个完整的 BBC BASIC 解释器。

对于那些在 80 年代没有接触过它的人，请让我解释一下：BBC BASIC 是当时我们很多人的第一个编程语言，因为它专门教孩子如何编码。当时有大量的书籍和杂志文章教我们编写自己的简单但高度可玩的游戏。

几十年后，对于一个想要在学校假期做点什么的有技术头脑的孩子而言，在 BBC BASIC 上编写自己的游戏仍然是一个很棒的项目。但很少有孩子在家里有 BBC micro。那么他们应该怎么做呢？

当然，你可以在每台家用电脑上运行解释器，但是当别人需要使用它时就不能用了。那么为什么不使用装有 RISC OS 的树莓派呢？

### 5、它是一个简单的单用户操作系统

RISC OS 不像 Linux 一样有自己的用户和超级用户访问权限。它有一个用户并可以完全访问整个机器。因此，它可能不是跨企业部署的最佳日常驱动，甚至不适合给老人家做银行业务。但是，如果你正在寻找可以用来修改和鼓捣的东西，那绝对是太棒了。你和机器之间没有那么多障碍，所以你可以直接闯进去。

### 扩展阅读

如果你想了解有关此操作系统的更多信息，请查看 [RISC OS Open][3]，或者将镜像烧到闪存到卡上并开始使用它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/gentle-intro-risc-os

作者：[James Mawson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dxmjames
[1]:https://en.wikipedia.org/wiki/Acorn_Archimedes
[2]:https://www.armbian.com/
[3]:https://www.riscosopen.org/content/
[4]:https://www.raspbian.org/
[5]:https://www.riscosopen.org/wiki/documentation/show/Introduction%20to%20RISC%20OS
