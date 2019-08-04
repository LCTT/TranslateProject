在树莓派上玩怀旧游戏的 5 种方法
======

> 使用这些用于树莓派的开源平台来重温游戏的黄金时代。

![](https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/jessica-chua/lifestyle/retro%20gaming%20comeback/retro-video-game-event.jpg)

他们使它们不像过去那样子了，对吧？我是说，电子游戏。

当然，现在的设备更强大了。<ruby>赛达尔公主<rt>Princess Zelda</rt></ruby>在过去每个边只有 16 个像素，而现在的图像处理能力足够处理她头上的每根头发。今天的处理器打败 1988 年的处理器简直不费吹灰之力。

但是你知道缺少什么吗？乐趣。

你有数之不尽的游戏，按下一个按钮就可以完成教程任务。可能有故事情节，当然杀死坏蛋也可以不需要故事情节，你需要的只是跳跃和射击。因此，毫不奇怪，树莓派最持久的流行用途之一就是重温上世纪八九十年代的 8 位和 16 位游戏的黄金时代。但从哪里开始呢？

在树莓派上有几种方法可以玩怀旧游戏。每一种都有自己的优点和缺点，我将在这里讨论这些。

### RetroPie

[RetroPie][1] 可能是树莓派上最受欢迎的复古游戏平台。它是一个可靠的万能选手，是模拟经典桌面和控制台游戏系统的绝佳选择。

![](https://retropie.org.uk/wp-content/uploads/2016/04/Amiga_Gameplay_2.png)

#### 介绍

RetroPie 构建在 [Raspbian][2] 上运行。如果你愿意，它也可以安装在现有的 Raspbian 镜像上。它使用 [EmulationStation][3] 作为开源仿真器库（包括 [Libretro][4] 仿真器）的图形前端。

不过，你要玩游戏其实并不需要理解上面的任何一个词。

#### 它有什么好处

入门很容易。你需要做的就是将镜像刻录到 SD 卡，配置你的控制器、复制游戏，然后开始杀死坏蛋。

它的庞大用户群意味着有大量的支持和信息，活跃的在线社区也可以求助问题。

除了随 RetroPie 镜像一起安装的仿真器之外，还有一个可以从包管理器安装的庞大的仿真器库，并且它一直在增长。RetroPie 还提供了用户友好的菜单系统来管理这些，可以节省你的时间。

从 RetroPie 菜单中可以轻松添加 Kodi 和配备了 Chromium 浏览器的 Raspbian 桌面。这意味着你的这套复古游戏装备也适于作为家庭影院、[YouTube][5]、[SoundCloud][6] 以及所有其它“休息室电脑”产品。

RetroPie 还有许多其它自定义选项：你可以更改菜单中的图形，为不同的模拟器设置不同的控制手柄配置，使你的树莓派文件系统的所有内容对你的本地 Windows 网络可见等等。

RetroPie 建立在 Raspbian 上，这意味着你可以探索这个树莓派最受欢迎的操作系统。你所发现的大多数树莓派项目和教程都是为 Raspbian 编写的，因此可以轻松地自定义和安装新内容。我已经使用我的 RetroPie 装备作为无线桥接器，在上面安装了 MIDI 合成器，自学了一些 Python，更重要的是，所有这些都没有影响它作为游戏机的用途。

#### 它有什么不太好的

RetroPie 的安装简单和易用性在某种程度上是一把双刃剑。你可以在 RetroPie 上玩了很长时间，而甚至没有学习过哪怕像 `sudo apt-get` 这样简单的东西，但这也意味着你错过了很多树莓派的体验。

但不一定必须如此；当你需要时，命令行仍然存在于底层，但是也许用户与 Bash shell 有点隔离，而使它最终并没有看上去那么可怕、另外，RetroPie 的主菜单只能通过控制手柄操作，当你没有接入手柄时，这可能很烦人，因为你一直将该系统用于游戏之外的事情。

#### 它适用于谁?

任何想直接玩一些游戏的人，任何想拥有最大、最好的模拟器库的人，以及任何想在不玩游戏的时候开始探索 Linux 的人。

### Recalbox

[Recalbox][7] 是一个较新的树莓派开源模拟器套件。它还支持其它基于 ARM 的小型计算机。

![](https://www.recalbox.com/images/features/4playermodo_hu5438825b9b6d1014226d20d231e650c2_230970_500x0_resize_q75_box.jpeg)

#### 介绍

与 Retropie 一样， Recalbox 基于 EmulationStation 和 Libretro。它的不同之处在于它不是基于 Raspbian 构建的，而是基于它自己的 Linux 发行版：RecalboxOS。

#### 它有什么好处

Recalbox 的设置比 RetroPie 更容易。你甚至不需要做 SD 卡镜像；只需复制一些文件即可。它还为一些游戏控制器提供开箱即用的支持，可以让你更快地开始游戏。它预装了 Kodi。这是一个现成的游戏和媒体平台。

#### 它有什么不太好的

Recalbox 比 RetroPie 拥有更少的仿真器、更少的自定义选项和更小的用户社区。

你的 Recalbox 装备可能一直用于模拟器和 Kodi，安装成什么样就是什么样。如果你想深入了解 Linux，你可能需要为 Raspbian 提供一个新的 SD 卡。

#### 它适用于谁?

如果你想要绝对简单的复古游戏体验，并且不想玩一些比较少见的游戏平台模拟器，或者你害怕一些技术性工作（也没有兴趣去做），那么 Recalbox 非常适合你。

对于大多数读者来说，Recalbox 可能最适合推荐给你那些不太懂技术的朋友或亲戚。它超级简单的设置和几乎没什么选项甚至可以让你免去帮助他们解决问题。

### 做个你自己的

好，你可能已经注意到 Retropie 和 Recalbox 都是由许多相同的开源组件构建的。那么为什么不自己把它们组合在一起呢？

#### 介绍

无论你想要的是什么，开源软件的本质意味着你可以使用现有的模拟器套件作为起点，或者随意使用它们。

#### 它有什么好处

如果你想有自己的自定义界面，我想除了亲自动手别无它法。这也是安装在 RetroPie 中没有的仿真器的方法，例如 [BeebEm][8]) 或 [ArcEm][9]。

#### 它有什么不太好的

嗯，工作量有点大。

#### 它适用于谁?

喜欢鼓捣的人，有动手能力的人，开发者，经验丰富的业余爱好者等。

### 原生 RISC OS 游戏体验

现在有一匹黑马：[RISC OS][10]，它是 ARM 设备的原始操作系统。

#### 介绍

在 ARM 成为世界上最受欢迎的 CPU 架构之前，它最初是作为 Acorn Archimedes 的处理器而开发的。现在看起来这像是一种被遗忘的野兽，但是那几年，它作为世界上最强大的台式计算机独领风骚了好几年，并且吸引了大量的游戏开发项目。

树莓派中的 ARM 处理器是 Archimedes 的曾孙辈的 CPU，所以我们仍然可以在其上安装 RISC OS，只要做一点工作，就可以让这些游戏运行起来。这与我们到上面所介绍的仿真器方式不同，我们是在玩为该操作系统和 CPU 架构开发的游戏。

#### 它有什么好处

这是 RISC OS 的完美展现，这绝对是操作系统的瑰宝，非常值得一试。

事实上，你使用的是和以前几乎相同的操作系统来加载和玩你的游戏，这使得你的复古游戏装备像是一个时间机器一样，这无疑为该项目增添了一些魅力和复古价值。

有一些精彩的游戏只在 Archimedes 上发布过。Archimedes 的巨大硬件优势也意味着它通常拥有许多多平台游戏大作的最佳图形和最流畅的游戏体验。这类游戏的版权持有者非常慷慨，可以合法地免费下载它们。

#### 它有什么不太好的

安装了 RISC OS 之后，它仍然需要一些努力才能让游戏运行起来。这是 [入门指南][11]。

对于休息室来说，这绝对不是一个很好的全能选手。没有什么比 [Kodi][12] 更好的了。它有一个网络浏览器 [NetSurf][13]，但它在支持现代 Web 方面还需要一些努力。你不会像使用模拟器套件那样得到大量可以玩的游戏。RISC OS Open 对于爱好者来说可以免费下载和使用，而且很多源代码已经开源，尽管由于这个名字，它不是一个 100％ 的开源操作系统。

#### 它适用于谁?

这是专为追求新奇的人，绝对怀旧的人，想要探索一个来自上世纪 80 年代的有趣的操作系统的人，怀旧过去的 Acorn 机器的人，以及想要一个完全不同的怀旧游戏项目的人而设计的。

### 终端游戏

你是否真的需要安装模拟器或者一个异域风情的操作系统才能重温辉煌的日子？为什么不从命令行安装一些原生 Linux 游戏呢？

#### 介绍

有一系列原生的 Linux 游戏经过测试可以在 [树莓派][14] 上运行。

#### 它有什么好处

你可以使用命令行从程序包安装其中的大部分，然后开始玩。很容易。如果你已经有了一个跑起来的 Raspbian，那么它可能是你运行游戏的最快途径。

#### 它有什么不太好的

严格来说，这并不是真正的复古游戏。Linux 诞生于 1991 年，过了一段时间才成为了一个游戏平台。这些不是经典的 8 位和 16 位时代的游戏体验；后来有一些移植的游戏或受复古影响的游戏。

#### 它适用于谁?

如果你只是想找点乐子，这没问题。但如果你想重温过去，那就不完全是这样了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/retro-gaming-raspberry-pi

作者：[James Mawson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[canhetingsky](https://github.com/canhetingsky)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dxmjames
[1]: https://retropie.org.uk/
[2]: https://www.raspbian.org/
[3]: https://emulationstation.org/
[4]: https://www.libretro.com/
[5]: https://www.youtube.com/
[6]: https://soundcloud.com/
[7]: https://www.recalbox.com/
[8]: http://www.mkw.me.uk/beebem/
[9]: http://arcem.sourceforge.net/
[10]: https://opensource.com/article/18/7/gentle-intro-risc-os
[11]: https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/
[12]: https://kodi.tv/
[13]: https://www.netsurf-browser.org/
[14]: https://www.raspberrypi.org/forums/viewtopic.php?f=78&t=51794
