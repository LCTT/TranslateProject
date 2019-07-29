在树莓派上玩老式游戏的 5 种方法
======

使用这些用于树莓派的开源平台来重温游戏的黄金时代。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32)

他们不像过去那样制造他们，是吗？我指的是电子游戏。

当然，现在的设备有点普通。赛达尔公主在过去每个方向有 16 个像素，现在她头上的每根头发都有足够的图像处理能力。今天的处理器可以在一场不费吹灰之力的战斗中打败 1988 年的处理器。

但是你知道缺少什么吗？乐趣。

你已经有了一个标准和一个按钮来学习只是为了完成教程任务。可能也有故事情节。你不应该需要一个故事情节来杀死坏人。你需要的只是跳跃和射击。因此，毫不奇怪，树莓派最持久的流行用途之一是重新体验 80 年代和 90 年代早期 8 位和 16 位游戏的黄金时代。但从哪里开始呢？

在树莓派上有几种方法可以玩老式游戏。每一种都有自己的优点和缺点，我将在这里讨论。

### Retropie

[Retropie][1] 可能是树莓派上最受欢迎的复古游戏平台。它是一个可靠的万能选手，是模拟经典桌面和控制台游戏系统的绝佳选择。

#### 它是什么?

Retropie  可以在 [Raspbian][2] 上运行。如果你愿意，它也可以安装在现有的 Raspbian 映像上。它使用 [EmulationStation][3] 作为开源仿真器库（包括 [Libretro][4] 仿真器）的图形前端。

不过，玩游戏并不需要理解上面任何一个词。

#### 它有什么好处

入门很容易。你需要做的就是将映像刻录到 SD 卡，配置你的控制器，复制游戏，然后开始杀死坏人。

庞大的用户群意味着那里有大量的支持和信息，以及活跃的在线社区可以求助问题。

除了随 Retropie 映像一起安装的仿真器之外，还有一个可以从包管理器安装的庞大的仿真器库，并且它一直在增长。Retropie 还提供用户友好的菜单系统来管理，节省您的时间。

从 Retropie 菜单中，可以轻松添加 Kodi 和 Raspbian 桌面，它随 Chromium 网络浏览器一起提供。这意味着您的复古游戏装备也适用于家庭影院，[YouTube](https://www.youtube.com/)，[SoundCloud](https://soundcloud.com/) 以及所有其它“休息室电脑”的产品。

Retropie 还有许多其它自定义选项：你可以更改菜单中的图形，为不同的模拟器设置不同的控制板配置，使你的树莓派文件系统的所有内容对你的本地 Windows 网络可见。

Retropie 建立在 Raspbian 上，这意味着你可以使用树莓派最受欢迎的操作系统进行探索。你所发现的大多数树莓派项目和教程都是为 Raspbian 编写的，因此可以轻松地自定义和安装新内容。我已经使用我的 Retropie 装备作为无线桥接器，在上面安装了 MIDI 合成器，自学了一些 Python，更重要的是 ，所有这些都没有影响它作为游戏机的用途。

#### 它有什么不太好的

Retropie 的简单安装和易用性在某种程度上是一把双刃剑。你可以玩 Retropie 很长时间，甚至不需要学习像`sudo apt-get` 这样简单的东西，但这意味着你正在错过了很多树莓派的体验。

它不一定是这样的; 当你需要它时，命令行仍然存在于打字机的罩子下，但是也许用户与 Bash shell 有点隔离，而 Bash shell 最终并没有看上去那么可怕。Retropie 的主菜单只能通过控制键盘操作，当你没有插入一个键盘时，这可能很烦人，因为你一直在使用系统进行游戏以外的事情。

#### 它适用于谁?

任何想直接进入游戏领域的人，任何想拥有最大最好的模拟器库的人，以及任何想在不玩游戏的时候开始探索 Linux 的人。

### Recalbox

[Recalbox][7] 是树莓派的一个较新的开源模拟器套件。它还支持其它基于 ARM 的小型计算机。

#### 它是什么?

与 Retropie 一样， Recalbox 基于 EmulationStation 和 Libretro 。它的不同之处在于它不是基于Raspbian 构建的，而是基于它自己的 Linux：RecalboxOS。

#### 它有什么好处

Recalbox 的设置比 Retropie 更容易。你甚至不需要对 SD 卡进行映像处理； 只需复制一些文件即可。它还为一些游戏控制器提供开箱即用的支持，让你更快地达到1级。Kodi 是预装了。这是一个现成的游戏和媒体平台。

#### 它有什么不太好的

Recalbox 比 Retropie 拥有更少的仿真器，更少的自定义选项和更小的用户社区。

你的 Recalbox 装备可能总是用于模拟器和 Kodi，与安装时相同。如果你想深入了解 Linux，你可能需要为 Raspbian 提供一个新的SD卡。

#### 它适用于谁?

如果你想要绝对最简单的复古游戏体验，并且可以在没有一些更加模糊的游戏平台的情况下愉快地使用，或者如果你因为做一些技术性的想法而感到害怕（并且没有兴趣从中发展出来），那么 Recalbox 非常棒 。

对于大多数 opensource.com 读者来说，Recalbox 可能最方便推荐给你那些不太技术的朋友或亲戚。它超级简单的设置和整体缺乏选项甚至可以帮助你避免不得不帮助他们。

### 制作你自己的

好的，如你一直在关注的话，你可能已经注意到 Retropie 和 Recalbox 都是由许多相同的开源组件构建的。那么是什么阻止你自己把它们放在一起呢？

#### 它是什么?

无论你想要什么，宝贝。开源软件的本质意味着你可以使用现有的模拟器套件作为起点，或者随意使用它们。

#### 它有什么好处

如果你有自己的自定义界面，我想除了卷起袖子去做，别无事可做。这也是安装仿真器的一种方法，仿真器还没有完全进入到 Retropie 中，例如 [BeebEm](http://www.mkw.me.uk/beebem/) 或 [ArcEm](http://arcem.sourceforge.net/)。

#### 它有什么不太好的

嗯，工作量有点大，不是吗?

#### 它适用于谁?

黑客，修改者，开发者，经验丰富的业余爱好者等。

## 本机 RISC 操所系统 游戏

现在有一匹黑马：[RISC 操作系统](https://opensource.com/article/18/7/gentle-intro-risc-os)，ARM设备的原始操作系统。

#### 它是什么?

在ARM成为世界上最受欢迎的 CPU 架构之前，它最初是作为 Acorn Archimedes  的核心而构建的。现在这是一种被遗忘的野兽，但几年来它作为世界上最强大的台式计算机已经领先了很多年，并且吸引了大量的游戏开发。

因为树莓派中的 ARM 处理器是Archimedes  的曾孙，我们仍然可以在其上安装 RISC OS，只要做一点工作，就可以让这些游戏运行起来。这与我们到目前为止所涵盖的仿真器选项不同，因为我们在操作系统和 CPU 架构上玩我们的游戏。

#### 它有什么好处

这是 RISC 操作系统的完美介绍。这绝对是操作系统的瑰宝，非常值得一试。

事实上，你使用的操作系统和以前的几乎相同，以加载和玩你的游戏，这使得你的复古游戏装备成为一个时间机器。这无疑为项目增添了一些魅力和复古价值。

有一些精彩的游戏只在 Archimedes 上发布。Archimedes 的巨大硬件优势也意味着它通常拥有许多多平台游戏的最佳图形和最流畅的游戏体验。许多游戏的版权持有者非常慷慨，可以合法地免费下载。

#### 它有什么不太好的

一旦你安装了 RISC 操作系统，它仍然需要一些努力才能让游戏运行起来。这是 [入门指南](https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/)。

对于休息室来说，这绝对不是一个很好的全方位服务。没有什么比 [Kodi](https://kodi.tv/) 更好的了。有一个网络浏览器，[NetSurf](https://www.netsurf-browser.org/)，但它正在努力赶上现代网络。你将不会像使用模拟器套件那样获得要播放的标题范围。RISC OS Open 是业余爱好者可以免费下载和使用的，而且很多源代码已经开放。但尽管有这个名字，它并不是 100％ 的开源操作系统。

#### 它适用于谁?

这一款专为追求新奇的人、绝对怀旧的人、想要探索80年代有趣的操作系统的人、那些对过去的Acorn机器怀旧的人，以及想要一个完全不同的怀旧游戏项目的人而设计。

### 命令行游戏

您是否真的需要安装模拟器或异国的操作系统才能重温辉煌的日子？为什么不从命令行安装一些原生 Linux 游戏？

#### 它是什么?

有一系列原生 Linux 游戏经过测试可以在 [树莓派](https://www.raspberrypi.org/forums/viewtopic.php?f=78&t=51794) 上运行。

#### 它有什么好处

你可以使用命令行从程序包安装其中的大部分，然后开始玩。容易的。如果你已经启动并运行了 Raspbian，那么它可能是你运行游戏的最快途径。

#### 它有什么不太好的

严格来说，这并不是真正的复古游戏。Linux诞生于 1991 年，花了一段时间才能成为一个游戏平台。这不是经典的 8 位和 16 位时代的游戏；这些是后来构建的端口和受复古影响的游戏。

#### 它适用于谁?

如果你只是想找点乐子，这没问题。但如果你想重温真实的时代，那就不完全是这样了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/retro-gaming-raspberry-pi

作者：[James Mawson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[canhetingsky](https://github.com/canhetingsky)
校对：[校对者ID](https://github.com/校对者ID)

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
