[#]: subject: "Learn everything about computers with this Raspberry Pi kit"
[#]: via: "https://opensource.com/article/21/9/raspberry-pi-crowpi2"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Learn everything about computers with this Raspberry Pi kit 用树莓派了解关于计算机的一切
======
CrowPi 是一个超棒的树莓派项目系统，安装在一个笔记本电脑般的外壳里。
![老师还是学习者？][1]

我喜欢历史，也喜欢计算机，因此相比于计算机如何变成个人配件，我更喜欢听它在成为日常家用电器前的有关电脑运算的故事。 [我经常听到的一个故事][2] 是关于很久以前（反正在计算机时代算久远了）的计算机是如何的基础却又让人感到很舒服。事实上，它们基础到对于一个好奇的用户来说，弄清楚如何编程是相对简单的事情。看看现代计算机，它具有面向对象的编程语言、复杂的 GUI 框架、网络 API、容器等，但愈发令人担忧的是，对于那些没有接受过任何专门培训的人，计算行业的工具正变得越来越难懂，无法为任何未经专门培训的人所用。

从 Raspberry Pi 在 2012 年发布之日起，它就一直被定位为一个教育平台。 一些第三方供应商通过附加组件和培训套件支持 Pi，以帮助所有年龄段的学习者探索编程、物理计算和开源。 然而，直到最近，很大程度上还是要由用户来弄清楚市场上的所有部件如何组合在一起，直到我最近买了 CrowPi。

![CrowPi ——不只是一个笔记本电脑][3]

CrowPi 不是一个笔记本电脑。
(Seth Kenlon, [CC BY-SA 4.0][4])

### 隆重介绍 CrowPi2

乌鸦是非常聪明的鸟。 他们识别并记住面孔，模仿听到的声音，解决复杂的谜题，甚至使用工具来完成任务。 CrowPi 使用乌鸦作为其徽标和同名词是恰当的，因为这个设备提供了无限探索、实验、教育还有最重要的，乐趣的机会。

设计本身很巧妙：它看起来像笔记本电脑，但远不止于此。 当你从外壳中取出蓝牙键盘时，它会显示一个隐藏的电子设备工坊，配有 LCD 屏幕、16 个按钮、刻度盘、RFID 传感器、接近传感器、线路板、扬声器、GPIO 连接、LED 阵列等等。 _而且都是可编程的。_

顾名思义，该装置本身完全由 Raspberry Pi 供电，牢固地固定在外壳底部。

![crowpi pi板[5]

CrowPi 的 Pi板
(Seth Kenlon, [CC BY-SA 4.0][4])

默认情况下，你应该用电源适配器为设备充电，包装附带一个壁式适配器，你可以将其插入外壳，而不是直接为 Pi 供电。 您还可以使用插入外部微型 USB 端口的电池电源。 电脑外壳内甚至还有一个抽屉，方便你存放电池。 存放电池时有一根 USB 线从电池抽屉中弹出并插入机箱电源端口，因此你不会产生这是一台“普通”笔记本电脑的错觉。 然而，这样一台设备能够有如此美观的设计已经很理想了！

### 首次启动系统

CrowPi2 提供一张安装了 Raspbian 系统，卡上贴有 **System** 的标签，不过它同时还提供一张装载了 [RetroPie][6] 的 microSD 卡。 作为一个负责任的成年人（咳咳），我自然是先启动了 RetroPie。

RetroPie 总是很有趣，CrowPi2 附带两个 SNES 风格的游戏控制器，确保你能获得最佳的复古游戏体验。

令人赞叹不已的是，实际启动系统的过程同样有趣，甚至可以说更有趣。 它的登录管理器是一个自定义项目中心，快速链接到一些编程体验项目、Python 和 Arduino IDE、Scratch、 Python 体验游戏、Minecraft 等。 你也可以选择退出项目中心，只使用桌面。

![CrowPi 中心][7]

The CrowPi 中心.
(Seth Kenlon, [CC BY-SA 4.0][4])
对于习惯使用 Raspberry Pi 或 Linux 的人来说，CrowPi 桌面很熟悉，不过它也足够基础，所以很容易上手。 左上角有应用程序菜单，桌面上有快捷图标，右上角有网络选择和音量控制的系统托盘等等。

![CrowPi 桌面][8]

CrowPi 桌面.
(Seth Kenlon, [CC BY-SA 4.0][4])

CrowPi 上提供了很多东西选择，所以你可能很难决定从哪里开始。 对我来说，主要分为四大类：编程、物理电子学、Linux 和游戏。

盒子里有一本使用说明，所以你才知道你需要怎样进行连接（例如，键盘是电池供电的，所以它有时确实需要充电，它和鼠标总是需要一个 USB 适配器）。 虽然说明书很快就能读完，但这一例子也充分体现了 CrowPi 团队是如何认真对待说明书的。

![CrowPi 文档][9]

CrowPi 文档.
(Seth Kenlon, [CC BY-SA 4.0][4]


### 编程

如果你热衷于学习如何编码，在 CrowPi 上有很多途径助你成功。你应该从中选择你觉得最满意的路径。

#### 1\. Scratch

[Scratch][10] 是一个简单的视觉编码应用程序，可让你像拼 [Lego pieces 乐高拼块][11] 一样将代码块组合在一起，制作出游戏和互动故事。 这是开启编程之旅最简单的方法，我曾见过年仅 8 岁的孩子会花数小时思考自己设计的游戏的最佳算法。 当然，它不仅适合孩子们！成年人也可以从中获得很多乐趣。 不知道从哪里开始？ 包装盒中有一本 99 页的小册子（打印在纸张上），其中包含 Scratch 课程和项目供你尝试。

#### 2\. Java 和 Minecraft

Minecraft 不是开源的（虽然有 [几个开源项目][12] 复刻了它），但它有足够的可用资源，因此也经常被用来教授编程。 Minecraft 是用 Java 编写的，CrowPi 同时装载有 [Minecraft Pi Edition][13] 和 [BlueJ Java IDE][14] ，如此可使学习 Java 变得比以往更容易、更有趣。

#### 3\. Python 和 PyGame

CrowPi 上有几个非常有趣的游戏，它们是用 Python 和 [PyGame game engine （ PyGame 游戏引擎）][15] 编写的。 你可以玩游戏，然后查看源代码以了解游戏的运行方式。 CrowPi 中包含 Geany、Thonny 和 [Mu][16] 编辑器，因此您可以立即开始使用 Python 进行编程。 与 Scratch 一样，包装盒中有一本包含课程的小册子，因此你可以学习 Python 基础知识。

### 电子器件

隐藏在键盘下的物理电子工坊本质上是一系列 Pi Hats（附着在上的硬件）。 为了让你可以认识所有的组件，CrowPi 绘制了一张中英双语的折叠图进行详细的说明。 除此之外还有很多示例项目可以帮助你入门。 以下是一张小清单：


  * **你好** 当你与 CrowPi 说话时，LCD 屏幕上打印输出“你好”。
  * **入侵警报**使用接近传感器发出警报。
  * **远程控制器** 让你能够使用远程控制（是的，这个也包含在盒子里）来触发 CrowPi 上的事件。
  * **RGB 俄罗斯方块** 让你可以在 LED 显示屏上玩俄罗斯方块游戏。
  * **语音识别**演示自然语言处理。
  * **超声波音乐** 利用距离传感器和扬声器创建简易版的特雷蒙琴（世上唯一不需要身体接触的电子乐器）。



这些项目仅仅是入门级别而已，因为你还可以在现有的基础上搭建更多东西。 当然，还有更多内容值得探索。 包装盒里还有网络跳线、电阻器、LED 和各种组件，这样你闲暇时也可以了解 Pi 的 GPIO （通用输入输出端口）功能的所有信息。

不过我也发现了一个问题：示例项目的位置有点难找。 找到演示很容易（它们就在 CrowPi 中心上），但源代码的位置并不是很容易被找到。 我后来发现大多数示例项目都在 `/usr/share/code` 中，你可以通过文件管理器或终端进行访问。

![CrowPi 外围设备][17]

CrowPi 外围设备
(Seth Kenlon, [CC BY-SA 4.0][4])

### Linux

Raspberry Pi 上运行 Linux 系统。 如果你一直想更深入了解 Linux，那么 CrowPi 同样会是一个很好的平台。 你可以探索 Linux 桌面、终端以及几乎所有 Linux 或开源应用程序。 如果你多年来一直在阅读有关开源的文章，并准备深入研究开源操作系统，那么 CrowPi 会是你想要的平台（当然还有很多其他平台也可以）。

### 游戏

包装盒中包含的 **RetroPie** SD 卡意味着你可以重新启动，切换为复古游戏机并任意玩各种老式街机游戏。 它跟 Steam Deck 并不完全相同，但也是一个有趣且令人振奋的小游戏平台。 因为它配备的不是一个而是两个游戏控制器，所以它非常适合多人合作的沙发游戏。 最重要的是，你不仅可以在 CrowPi 上玩游戏，还可以制作自己的游戏。

### 配备螺丝刀

自我坐下开始使用 CrowPi2 以来已经大约两周，但我还没有通关所有项目。 有很多个晚上，我不得不强迫自己停下摆弄它，因为即使我厌倦了一个项目，我也会不可避免地发现还有其他东西可以探索。 文章的最后做个总结，我在盒子里找到了一个特别的组件，这个组件让我马上知道 CrowPi 和我就是天造地设：它是一把不起眼的小螺丝刀。 盒子上的保修标签不存在作废。 CrowPi 希望你去修补、拆解、探索和学习。 它不是笔记本电脑，甚至也不是 Pi； 而是一个便携、低功耗、多样化和开源的学习者工具包。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/raspberry-pi-crowpi2

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-teacher-learner.png?itok=rMJqBN5G (Teacher or learner?)
[2]: https://opensource.com/article/21/8/my-first-programming-language
[3]: https://opensource.com/sites/default/files/crowpi-not-laptop.jpeg (CrowPi more than a laptop)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/crowpi-pi.jpeg (crowpi pi board)
[6]: https://opensource.com/article/19/1/retropie
[7]: https://opensource.com/sites/default/files/crowpi-hub.png (CrowPi hub)
[8]: https://opensource.com/sites/default/files/crowpi-desktop.png (CrowPi desktop)
[9]: https://opensource.com/sites/default/files/crowpi-docs.jpeg (CrowPi docs)
[10]: https://opensource.com/article/20/9/scratch
[11]: https://opensource.com/article/20/6/open-source-virtual-lego
[12]: https://opensource.com/alternatives/minecraft
[13]: https://www.minecraft.net/en-us/edition/pi
[14]: https://opensource.com/article/20/7/ide-java#bluej
[15]: https://opensource.com/downloads/python-gaming-ebook
[16]: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners
[17]: https://opensource.com/sites/default/files/crowpi-peripherals.jpeg (CrowPi peripherals)
