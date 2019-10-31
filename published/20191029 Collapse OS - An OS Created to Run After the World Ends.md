[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11525-1.html)
[#]: subject: (Collapse OS – An OS Created to Run After the World Ends)
[#]: via: (https://itsfoss.com/collapse-os/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Collapse OS：为世界末日创建的操作系统
======

当大多数人考虑为末日后的世界做准备时，想到的第一件事就是准备食物和其他生活必需品。最近，有一个程序员觉得，在社会崩溃之后，创建一个多功能的、且可生存的操作系统同样重要。我们今天将尽我们所能地来了解一下它。

### Collapse OS：当文明被掩埋在垃圾中

![][1]

这里说的操作系统称为 [Collapse OS（崩溃操作系统）][2]。根据该官方网站的说法，Collapse OS 是 “z80 内核以及一系列程序、工具和文档的集合”。 它可以让你：

* 可在最小的和临时拼凑的机器上运行。
* 通过临时拼凑的方式（串行、键盘、显示）进行接口。
* 可编辑文本文件。
* 编译适用于各种 MCU 和 CPU 的汇编源代码文件。
* 从各种存储设备读取和写入。
* 自我复制。

其创造者 [Virgil Dupras][3] 之所以开始这个项目，是因为[他认为][4]“我们的全球供应链在我们到达 2030 年之前就会崩溃”。他是根据<ruby>巴勃罗·塞维尼<rt>Pablo Servigne</rt></ruby>的作品得出了这一结论的。他似乎也觉得并非所有人都会认可[他的观点][4]，“话虽如此，我认为不相信到 2030 年可能会发生崩溃也是可以理解的，所以请不要为我的信念而感到受到了冲击。”

该项目的总体目标是迅速让瓦解崩溃后的文明重新回到计算机时代。电子产品的生产取决于非常复杂的供应链。一旦供应链崩溃，人类将回到一个技术水平较低的时代。要恢复我们以前的技术水平，将需要数十年的时间。Dupras 希望通过创建一个生态系统来跨越几个步骤，该生态系统将与从各种来源搜寻到的更简单的芯片一起工作。

### z80 是什么？

最初的 Collapse OS 内核是为 [z80 芯片][5]编写的。作为复古计算机历史的爱好者，我对 [Zilog][6] 和 z80 芯片很熟悉。在 1970 年代后期，Zilog 公司推出了 z80，以和 [Intel 的 8080][7] CPU 竞争。z80 被用于许多早期的个人计算机中，例如 [Sinclair ZX Spectrum][8] 和 [Tandy TRS-80][9]。这些系统中的大多数使用了 [CP/M 操作系统] [10]，这是当时最流行的操作系统。（有趣的是，Dupras 最初希望使用[一个开源版本的 CP/M][11]，但最终决定[从头开始][12]。）

在 1981 年 [IBM PC][13] 发布之后，z80 和 CP/M 的普及率开始下降。Zilog 确实发布了其它几种微处理器（Z8000 和 Z80000），但并没有获得成功。该公司将重点转移到了微控制器上。今天，更新后的 z80 后代产品可以在图形计算器、嵌入式设备和消费电子产品中找到。

Dupras 在 [Reddit][14] 上说，他为 z80 编写了 Collapse OS，因为“它已经投入生产很长时间了，并且因为它被用于许多机器上，所以拾荒者有很大的机会拿到它。”

### 该项目的当前状态和未来发展

Collapse OS 的起步相当不错。有足够的内存和存储空间它就可以进行自我复制。它可以在 [RC2014 家用计算机][15]或世嘉 Master System / MegaDrive（Genesis）上运行。它可以读取 SD 卡。它有一个简单的文本编辑器。其内核由用粘合代码连接起来的模块组成。这是为了使系统具有灵活性和适应性。

还有一个详细的[路线图][16]列出了该项目的方向。列出的目标包括：

* 支持其他 CPU，例如 8080 和 [6502][17]。
* 支持临时拼凑的外围设备，例如 LCD 屏幕、电子墨水显示器和 [ACIA 设备][18]。
* 支持更多的存储方式，例如软盘、CD、SPI RAM/ROM 和 AVR MCU。
* 使它可以在其他 z80 机器上工作，例如 [TI-83+][19] 和 [TI-84+][20] 图形计算器和 TRS-80s。

如果你有兴趣帮助或只是想窥视一下这个项目，请访问其 [GitHub 页面][21]。

### 最后的思考

坦率地说，我认为 Collapse OS 与其说是一个有用的项目，倒不如说更像是一个有趣的爱好项目（对于那些喜欢构建操作系统的人来说）。当崩溃真的到来时，我认为 GitHub 也会宕机，那么 Collapse OS 将如何分发？我无法想像，得具有多少技能的人才能够从捡来的零件中创建出一个系统。到时候会有新一代的创客们，但大多数创客们会习惯于选择 Arduino 或树莓派来构建项目，而不是从头开始。

与 Dupras 相反，我最担心的是[电磁脉冲炸弹（EMP）][22] 的使用。这些东西会炸毁所有的电气系统，这意味着将没有任何构建系统的可能。如果没有发生这种事情，我想我们将能够找到过去 30 年制造的那么多的 x86 组件，以保持它们运行下去。

话虽如此，对于那些喜欢为奇奇怪怪的应用编写低级代码的人来说，Collapse OS 听起来是一个有趣且具有高度挑战性的项目。如果你是这样的人，去检出 [Collapse OS][2] 代码吧。

让我提个假设的问题：你选择的世界末日操作系统是什么？请在下面的评论中告诉我们。

如果你觉得这篇文章有趣，请花一点时间在社交媒体、Hacker News 或 [Reddit][23] 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/collapse-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/Collapse_OS.jpg?ssl=1
[2]: https://collapseos.org/
[3]: https://github.com/hsoft
[4]: https://collapseos.org/why.html
[5]: https://en.m.wikipedia.org/wiki/Z80
[6]: https://en.wikipedia.org/wiki/Zilog
[7]: https://en.wikipedia.org/wiki/Intel_8080
[8]: https://en.wikipedia.org/wiki/ZX_Spectrum
[9]: https://en.wikipedia.org/wiki/TRS-80
[10]: https://en.wikipedia.org/wiki/CP/M
[11]: https://github.com/davidgiven/cpmish
[12]: https://github.com/hsoft/collapseos/issues/52
[13]: https://en.wikipedia.org/wiki/IBM_Personal_Computer
[14]: https://old.reddit.com/r/collapse/comments/dejmvz/collapse_os_bootstrap_postcollapse_technology/f2w3sid/?st=k1gujoau&sh=1b344da9
[15]: https://rc2014.co.uk/
[16]: https://collapseos.org/roadmap.html
[17]: https://en.wikipedia.org/wiki/MOS_Technology_6502
[18]: https://en.wikipedia.org/wiki/MOS_Technology_6551
[19]: https://en.wikipedia.org/wiki/TI-83_series#TI-83_Plus
[20]: https://en.wikipedia.org/wiki/TI-84_Plus_series
[21]: https://github.com/hsoft/collapseos
[22]: https://en.wikipedia.org/wiki/Electromagnetic_pulse
[23]: https://reddit.com/r/linuxusersgroup
