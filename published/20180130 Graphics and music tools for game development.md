用于游戏开发的图形和音乐工具
======
> 要在三天内打造一个可玩的游戏，你需要一些快速而稳定的好工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Life_opengame.png?itok=JPxruL3k)

在十月初，我们的俱乐部马歇尔大学的 [Geeks and Gadgets][1] 参加了首次 [Open Jam][2]，这是一个庆祝最佳开源工具的游戏 Jam。游戏 Jam 是一种活动，参与者以团队协作的方式来开发有趣的计算机游戏。Jam 一般都很短，仅有三天，并且非常累。Opensource.com 在八月下旬[发布了][3] Open Jam 活动，足有 [45 支游戏][4] 进入到了竞赛中。

我们的俱乐部希望在我们的项目中创建和使用开放源码软件，所以 Open Jam 自然是我们想要参与的 Jam 了。我们提交的游戏是一个实验性的游戏，名为 [Mark My Words][5]。我们使用了多种自由和开放源码 (FOSS) 工具来开发它；在这篇文章中，我们将讨论一些我们使用的工具和我们注意到可能有潜在阻碍的地方。

### 音频工具

#### MilkyTracker

[MilkyTracker][6] 是一个可用于编曲老式视频游戏中的音乐的软件包。它是一种<ruby>[音乐声道器][7]<rt>music tracker</rt></ruby>，是一个强大的 MOD 和 XM 文件创建器，带有基于特征网格的模式编辑器。在我们的游戏中，我们使用它来编曲大多数的音乐片段。这个程序最好的地方是，它比我们其它的大多数工具消耗更少的硬盘空间和内存。虽然如此，MilkyTracker 仍然非常强大。

![](https://opensource.com/sites/default/files/u128651/mtracker.png)

其用户界面需要一会来习惯，这里有对一些想试用 MilkyTracker 的音乐家的一些提示：

  * 转到 “Config > Misc.” ，设置编辑模式的控制风格为 “MilkyTracker”，这将给你提供几乎全部现代键盘快捷方式。
  * 用 `Ctrl+Z` 撤销
  * 用 `Ctrl+Y` 重做
  * 用空格键切换模式编辑方式
  * 用退格键删除先前的音符
  * 用插入键来插入一行
  * 默认情况下，一个音符将持续作用，直到它在该频道上被替换。你可以明确地结束一个音符，通过使用一个反引号（`）键来插入一个 KeyOff 音符
  * 在你开始谱写乐曲前，你需要创建或查找采样。我们建议在诸如 [Freesound][9] 或 [ccMixter][10] 这样的网站上查找采用 [Creative Commons][8] 协议的采样，

另外，把 [MilkyTracker 文档页面][11] 放在手边。它含有数不清的教程和手册的链接。一个好的起点是在该项目 wiki 上的 [MilkyTracker 指南][12]。

#### LMMS

我们的两个音乐家使用多用途的现代音乐创建工具 [LMMS][13]。它带有一个绝妙的采样和效果库，以及多种多样的灵活的插件来生成独特的声音。LMMS 的学习曲线令人吃惊的低，在某种程度上是因为其好用的节拍/低音线编辑器。

![](https://opensource.com/sites/default/files/u128651/lmms_plugins.png)

我们对于想试试 LMMS 的音乐家有一个建议：使用插件。对于 [chiptune][14]式音乐，我们推荐 [sfxr][15]、[BitInvader][16] 和 [FreeBoy][17]。对于其它风格，[ZynAddSubFX][18] 是一个好的选择。它配备了各种合成仪器，可以根据您的需要进行更改。

### 图形工具

#### Tiled

在开放源码游戏开发中，[Tiled][19] 是一个流行的贴片地图编辑器。我们使用它为来为我们在游戏场景中组合连续的、复古式的背景。

![](https://opensource.com/sites/default/files/u128651/tiled.png)

Tiled 可以导出地图为 XML、JSON 或普通的图片。它是稳定的、跨平台的。

Tiled 的功能之一允许你在地图上定义和放置随意的游戏对象，例如硬币和提升道具，但在 jam 期间我们没有使用它。你需要做的全部是以贴片集的方式加载对象的图像，然后使用“插入平铺”来放置它们。

一般来说，对于需要一个地图编辑器的项目，Tiled 是我们所推荐的软件中一个不可或缺的部分。

#### Piskel

[Piskel][20] 是一个像素艺术编辑器，它的源文件代码以 [Apache 2.0 协议][21] 发布。在这次 Jam 期间，们的大多数的图像资源都使用 Piskel 来处理，我们当然也将在未来的工程中使用它。

在这个 Jam 期间，Piskel 极大地帮助我们的两个功能是<ruby>洋葱皮<rt>Onion skin</rt></ruby>和<ruby>精灵序列图<rt>spritesheet</rt></ruby>导出。

##### 洋葱皮

洋葱皮功能将使 Piskel 以虚影显示你编辑的动画的前一帧和后一帧的，像这样:

![](https://opensource.com/sites/default/files/u128651/onionshow.gif)

洋葱皮是很方便的，因为它适合作为一个绘制指引和帮助你在整个动画进程中保持角色的一致形状和体积。 要启用它，只需单击屏幕右上角预览窗口下方的洋葱形图标即可。

![](https://opensource.com/sites/default/files/u128651/onionenable.png)

##### 精灵序列图导出

Piskel 将动画导出为精灵序列图的能力也非常有用。精灵序列图是一个包含动画所有帧的光栅图像。例如，这是我们从 Piskel 导出的精灵序列图：

![](https://opensource.com/sites/default/files/u128651/sprite-artist.png)

该精灵序列图包含两帧。一帧位于图像的上半部分，另一帧位于图像的下半部分。精灵序列图通过从单个文件加载整个动画，大大简化了游戏的代码。这是上面精灵序列图的动画版本：

![](https://opensource.com/sites/default/files/u128651/sprite-artist-anim.gif)

##### Unpiskel.py

在 Jam 期间，我们很多次想批量转换 Piskel 文件到 PNG 文件。由于 Piskel 文件格式基于 JSON，我们写一个基于 GPLv3 协议的名为 [unpiskel.py][22] 的 Python 小脚本来做转换。

它像这样被调用的：

```
python unpiskel.py input.piskel
```

这个脚本将从一个 Piskel 文件（这里是 `input.piskel`）中提取 PNG 数据帧和图层，并将它们各自存储。这些文件采用模式 `NAME_XX_YY.png` 命名，在这里 `NAME` 是 Piskel 文件的缩减名称，`XX` 是帧的编号，`YY` 是层的编号。

因为脚本可以从一个 shell 中调用，它可以用在整个文件列表中。

```
for f in *.piskel; do python unpiskel.py "$f"; done
```

### Python、Pygame 和 cx_Freeze

#### Python 和 Pygame

我们使用 [Python][23] 语言来制作我们的游戏。它是一个脚本语言，通常被用于文本处理和桌面应用程序开发。它也可以用于游戏开发，例如像 [Angry Drunken Dwarves][24] 和 [Ren'Py][25] 这样的项目所展示的。这两个项目都使用一个称为 [Pygame][26] 的 Python 库来显示图形和产生声音，所以我们也决定在 Open Jam 中使用这个库。

Pygame 被证明是既稳定又富有特色，并且它对我们创建的街机式游戏来说是很棒的。在低分辨率时，库的速度足够快的，但是在高分辨率时，它只用 CPU 的渲染开始变慢。这是因为 Pygame 不使用硬件加速渲染。然而，开发者可以充分利用 OpenGL 基础设施的优势。

如果你正在寻找一个好的 2D 游戏编程库，Pygame 是值得密切注意的一个。它的网站有 [一个好的教程][27] 可以作为起步。务必看看它！

#### cx_Freeze

准备发行我们的游戏是有趣的。我们知道，Windows 用户不喜欢装一套 Python，并且要求他们来安装它可能很过分。除此之外，他们也可能必须安装 Pygame，在 Windows 上，这不是一个简单的工作。

很显然：我们必须放置我们的游戏到一个更方便的格式中。很多其他的 Open Jam 参与者使用专有的游戏引擎 Unity，它能够使他们的游戏在网页浏览器中来玩。这使得它们非常方便地来玩。便利性是一个我们的游戏中根本不存在的东西。但是，感谢生机勃勃的 Python 生态系统，我们有选择。已有的工具可以帮助 Python 程序员将他们的游戏做成 Windows 上的发布版本。我们考虑过的两个工具是 [cx_Freeze][28] 和 [Pygame2exe][29]（它使用 [py2exe][30]）。我们最终决定用 cx_Freeze，因为它是跨平台的。

在 cx_Freeze 中，你可以把一个单脚本游戏打包成发布版本，只要在 shell 中运行一个命令，像这样：

```
cxfreeze main.py --target-dir dist
```

`cxfreeze` 的这个调用将把你的脚本（这里是 `main.py`）和在你系统上的 Python 解释器捆绑到到 `dist` 目录。一旦完成，你需要做的是手动复制你的游戏的数据文件到 `dist` 目录。你将看到，`dist` 目录包含一个可以运行来开始你的游戏的可执行文件。

这里有使用 cx_Freeze 的更复杂的方法，允许你自动地复制数据文件，但是我们发现简单的调用 `cxfreeze` 足够满足我们的需要。感谢这个工具，我们使我们的游戏玩起来更便利一些。

### 庆祝开源

Open Jam 是庆祝开源模式的软件开发的重要活动。这是一个分析开源工具的当前状态和我们在未来工作中需求的一个机会。对于游戏开发者探求其工具的使用极限，学习未来游戏开发所必须改进的地方，游戏 Jam 或许是最好的时机。

开源工具使人们能够在不损害自由的情况下探索自己的创造力，而无需预先投入资金。虽然我们可能不会成为专业的游戏开发者，但我们仍然能够通过我们的简短的实验性游戏 [Mark My Words][5] 获得一点点体验。它是一个以语言学为主题的游戏，描绘了虚构的书写系统在其历史中的演变。还有很多其他不错的作品提交给了 Open Jam，它们都值得一试。 真的，[去看看][31]！

在本文结束前，我们想要感谢所有的 [参加俱乐部的成员][32]，使得这次经历真正的有价值。我们也想要感谢 [Michael Clayton][33]、[Jared Sprague][34] 和 [Opensource.com][35] 主办 Open Jam。简直酷毙了。

现在，我们对读者提出了一些问题。你是一个 FOSS 游戏开发者吗？你选择的工具是什么？务必在下面留下一个评论！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/graphics-music-tools-game-dev

作者：[Charlie Murphy][a]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rsg167
[1]:http://mugeeks.org/
[2]:https://itch.io/jam/open-jam-1
[3]:https://opensource.com/article/17/8/open-jam-announcement
[4]:https://opensource.com/article/17/11/open-jam
[5]:https://mugeeksalpha.itch.io/mark-omy-words
[6]:http://milkytracker.titandemo.org/
[7]:https://en.wikipedia.org/wiki/Music_tracker
[8]:https://creativecommons.org/
[9]:https://freesound.org/
[10]:http://ccmixter.org/view/media/home
[11]:http://milkytracker.titandemo.org/documentation/
[12]:https://github.com/milkytracker/MilkyTracker/wiki/MilkyTracker-Guide
[13]:https://lmms.io/
[14]:https://en.wikipedia.org/wiki/Chiptune
[15]:https://github.com/grimfang4/sfxr
[16]:https://lmms.io/wiki/index.php?title=BitInvader
[17]:https://lmms.io/wiki/index.php?title=FreeBoy
[18]:http://zynaddsubfx.sourceforge.net/
[19]:http://www.mapeditor.org/
[20]:https://www.piskelapp.com/
[21]:https://github.com/piskelapp/piskel/blob/master/LICENSE
[22]:https://raw.githubusercontent.com/MUGeeksandGadgets/MarkMyWords/master/tools/unpiskel.py
[23]:https://www.python.org/
[24]:https://www.sacredchao.net/~piman/angrydd/
[25]:https://renpy.org/
[26]:https://www.Pygame.org/
[27]:http://Pygame.org/docs/tut/PygameIntro.html
[28]:https://anthony-tuininga.github.io/cx_Freeze/
[29]:https://Pygame.org/wiki/Pygame2exe
[30]:http://www.py2exe.org/
[31]:https://itch.io/jam/open-jam-1/entries
[32]:https://github.com/MUGeeksandGadgets/MarkMyWords/blob/3e1e8aed12ebe13acccf0d87b06d4f3bd124b9db/README.md#credits
[33]:https://twitter.com/mwcz
[34]:https://twitter.com/caramelcode
[35]:https://opensource.com/
