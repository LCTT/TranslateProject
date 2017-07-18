在物联网中使用脚本语言面临的挑战与对策
============================================================


![Scripting IoT](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/scripting-languages-iot.jpg?itok=d6uog0Ss "Scripting IoT") 

> 在即将到来的嵌入式 Linux 会议 + OpenIoT 峰会中，Paul Sokolovsky 将会讨论在嵌入式开发中使用脚本语言的一些挑战。

脚本语言（又称作<ruby>超高级语言<rt>Very High-Level Languages</rt></ruby>或 VHLLs ），例如 Python、 PHP 以及 JavaScript 常用在桌面、服务器和网页开发中。它们强大的内置功能能够让你花费少量的时间和精力来开发小型却有用的应用，Paul Sokolovsky，Linaro 公司物联网工程师如是说。然而，目前在物联网中使用超高级语言深度开发嵌入式应用相对来说有些别扭。

在即将到来的[嵌入式 Linux 会议][6] + [OpenIoT 峰会][7]中，Sokolovsky 会讨论在嵌入式开发中使用 VHLLs 的挑战并且基于 MicroPython 的例子与 JerryScript + Zephyr.js 项目比较不同的对策。 我们与Sokolovsky 进行了一番交谈来获得更多信息。

**Linux.com：您可以给我们的读者一些 VHLLs 的背景知识吗？**

Paul Sokolovsky: 超高级语言成为计算机科学和信息技术风景中的一部分已经几十年了。也许第一个流行的脚本语言是 Unix shell（sh），尽管由于较小的特征集，它很少被认为是一种超高级语言，而是一种特定领域语言。所以第一个真正破纪录的 VHLLs 是 Perl（1987）和 Tcl（1988），很快紧跟着出现了 Python（1991），Ruby（1995），PHP（1995），JavaScript（1995）以及许多其它语言。

不同 VHLLs 之间的区别特性包括：它们的解析本能（从使用者的角度来看，也许是因为其中复杂的编译器作祟），内置可用的强大的数据类型如任意大小的列表和映射，可观的标准库，以及允许用户访问甚至更大的第三方库的外部模块系统。所有的这些特性都与相对容易使用的感觉（更少的输入，不需要构建等）和简单的学习曲线相耦合。

**Linux.com: 使用这些语言做开发有哪些优势？**

Sokolovsky: 优势的根源来自于以上描述的这些特性。一个新手可以非常轻松的开始使用脚本语言并且快速的学习它。很多 VHLLs 提供了一个强大的交互模式，所以你不需要去读那些厚厚的使用手册来开始使用脚本语言，而是直接去探索和体验它们。强大的内置功能允许你去开发小而有用的应用（脚本），而仅仅使用很少的时间和精力（这就是“脚本语言”名字的来源）。如果要转向开发大型应用，广泛的第三方库和可以轻而易举使用的模块系统使得开发变得流畅和高产。

**Linux.com: 在嵌入式平台上使用脚本开发和在其他平台开发有什么区别？**

Sokolovsky: 鉴于之前我们讨论过的 VHLLs 振奋人心的能力，有一个创意——为什么我们不能享受使用 VHLLs 为嵌入式设备做开发而具有所有（或者至少一部分）优势呢？这里我提到的“嵌入式设备”不仅仅是拥有 8-32 MB RAM 的小型 Linux 系统，还有运行在微控制器（MCU）上有几千字节内存的深度嵌入式系统。少量（有些时候几乎没有）的相关资源肯定使这个创意的实现变得更加复杂。 另一个问题是设备访问和交互。嵌入式设备通常没有显示屏和键盘，但是幸运的是解决这个问题的答案已经存在几十年了，这里要感谢 Unix，它提供了使用串口（UART）来搭建一个终端连接的方法。当然，在主机端，有些用户喜欢使用图形集成开发环境（IDE）来隐藏串口通信细节。

所以，由于嵌入式设备所有的这些不同特性，这个创意就是提供一个尽可能熟悉的工作环境。但熟悉只是其中一方面，另一方面，为了适应甚至最小的设备，工作环境需要尽可能的缩小。要想解决这些矛盾需要嵌入式 VHLLs 的操作可以高度配置，来适应不同的项目和硬件的需求。

**Linux.com：只有在物联网中使用这些语言才会遇到的挑战有哪些？比如说你如何处理内存限制？**

Sokolovsky: 当然，解释程序本身几乎不怎么消耗硬件资源。但是在当今世界，最珍贵的资源是人类的时间。不管你是一个研发工程师、一个仅仅有几个小时的周末创客、一个被 bug 和安全问题淹没的支持工程师，或者一个计划开发新产品的产品经理——你手头上大概都没有什么多余时间。因此需要将 VHLLs 的生产力提供到嵌入式工程师手上。

当前的工艺水平使得这些需求变得可行。公正的来讲，甚至于微处理器单元（MCU）平均 都有 16-32 KB RAM ， 128-256 KB ROM。这仅仅足够搭载一个核心解释程序，一个标准库类型的规范子集，一些硬件驱动，以及一个很小但是依旧有用的应用程序。假如你的硬件配置稍微越过了中间线，其能力得到了快速的增长——这实际上是由于一个从 1970 年代就闻名的技巧：使用自定义的字节码和精码（pcode）相比原始机器代码能够让你获得更大的代码/特性密度。

在这条道路上有很多挑战，RAM 不够用是主要的一个。我是在一个 16 GB RAM 的笔记本上写下的这些话（但不断切换的话依然会很卡），而刚才提到的 16KB 比它小一百万倍！不过，通过小心的选择算法和编程技巧，在这样小的 RAM 下仍有可能通过脚本语言来执行简单程序，而相当复杂的程序可能需要 128-256K。

有很多的技术挑战需要解决（它们已经被成功的解决了），这里没有足够的篇幅来涵盖它们。不过，我在 OpenIoT 峰会上的演讲会涵盖使用两种嵌入式脚本语言的经验和成就：MicroPython（Python3 的子集）和 Zephyr.js（JavaScript/Node.js 的子集），都运行在 Linux 基金会的 Zephyr 实时操作系统上，它被寄希望于在 IoT 工业界取得和 Linux 在移动互联网和服务器方面一样的成就。（相关 PPT 会为无法参加 OpenIoT 会议的朋友在会议后放出。）

**Linux.com: 你能给我们一些 VHLLs 最适用的应用的例子吗？以及一些它们不适用的例子？**

Sokolovsky：以上是很多关于 VHLLs 的光明前景，公正的来说：在嵌入式开发中，这里有很多一厢情愿的幻想（或者说希望其是能够自我实现的预言）。在嵌入式开发中 VHLLs 现在可以提供的是：快速成型，以及教育/创客市场上所必须的易学性和易用性。有一些先行者在其它领域使用 VHLLs，但是就目前来看，它需要在基础构造和工具开发上投入更多。重要的是，这样的投入应遵循开源原则并分享，否则会逐渐损害到 VHLLs 能够节省使用者时间和精力的优势。 

谨记这些，嵌入式 VHLLs 是发育完全（“逐渐变的完整”）的语言，能够适应各种类型的应用，但是要受制于硬件。例如，假如一个微处理器的规格低于之前提到的阈值，如一个老旧的 8-bit 微处理器，那么只有同样古老而优秀的 C 语言能够为你所用。另外一个限制是当你真的想要充分利用硬件时—— C 语言或者汇编程序才是正确的选择。但是，这里有一个惊喜——嵌入式 VHLLs 的开发者也想到了这一点，例如 MicroPython 允许你将 Python 和汇编程序在同一个应用中结合起来。

嵌入式 VHLLs 的优势是其可配置性和可（重复）编程性，外加灵活的连接性支持。这恰恰是 IoT 和智能设备最需要的，很多 IoT 应用使用起来也不需要太复杂。考虑一下，例如，一个可以贴在任何地方用来完成各种任务的智能按钮。但是，如果你需要调整双击的时间时怎么办？使用脚本语言，你可以做到。也许你完全不会考虑三连击，但是现在在某些情况下四连击都可能是有用的。使用脚本语言，你可以轻易修改它。

(题图：来自 Pixabay，基于 CC0 协议)

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/elcna/2017/2/using-scripting-languages-iot-challenges-and-approaches

作者：[AMBER ANKERHOLZ][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/paul-sokolovsky-2014-09-21jpg
[4]:https://www.linux.com/files/images/scripting-languages-iotjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference/program/schedule?utm_source=linux&amp;utm_campaign=elc17&amp;utm_medium=blog&amp;utm_content=video-blog
[6]:http://events.linuxfoundation.org/events/embedded-linux-conference
[7]:https://events.linuxfoundation.org/events/openiot-summit/program/schedule
