用于游戏开发的图形和音乐工具
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Life_opengame.png?itok=JPxruL3k)

在十月初，我们的俱乐部，来自马歇尔大学的 [Geeks and Gadgets][1] ， 参加就职 [Open Jam][2], 一个游戏 jam ，庆祝最好的开源工具。游戏 jams 是参与者为娱乐像团队协作的来开发计算机游戏的事件。Jams 倾向于非常简短--仅三天时间长--并非常让人精疲力尽。Opensource.com 在八月下旬 [宣布][3] Open Jam ，更多 [three dozen games][4] 进入到竞赛中。

我们的俱乐部希望在我们的工程中创建和使用开放源码软件，所以 Open Jam 自然是我们想要参与的 jam 。我们的提交的文件是一个实验性的名称为 [Mark My Words][5] 的游戏。我们使用多种自由和开放源码 (FOSS) 工具来开发它；在这篇文章中，我们将讨论一些我们使用和意识到有潜在的障碍物的工具。

### 音频工具

#### MilkyTracker

[MilkyTracker][6] 是最好的可用于构成旧样式电子游戏音乐的软件包中的一个。它是一个 [music tracker][7] 的一个示例，一个强大的带有特殊的基于网格的图形编辑器的 MOD 和 XM 文件创建器。在我们的游戏中，我们使用它来构成大多数的音乐片段。这个程序最好的特点是，它比我们其它的大多数工具消耗更少的硬盘空间和 RAM 。虽然如此，MilkyTracker 仍然非常强大。

![](https://opensource.com/sites/default/files/u128651/mtracker.png)

用户界面需要一会来习惯，这里有对一些想试用MilkyTracker的音乐家的一些提示：

  * 转到 Config > Misc. ，设置 edit 模式控制样式为 "MilkyTracker." 这将给你几乎所有的现代键盘快捷方式
  * 撤销 Ctrl+Z
  * 重做 Ctrl+Y
  * 切换 pattern-edit 模式 空格键
  * 删除先前的注释 退格键
  * 插入一行 Insert键
  * 默认情况下，一个注释将持续作用，直到它在这频道上被替换。你可以明确地结束一个注释，通过使用一个反引号 (`) 键插入一个 KeyOff 注释
  * 在你开始谱写乐曲前，你将不得不创建或查找示例。我们建议在网站上查找 [Creative Commons][8] 协议的示例，例如 [Freesound][9] 或 [ccMixter][10]



另外，保持 [MilkyTracker 文档页面][11] 在手边。它含有数不清的教程和手册的链接。一个好的开始点是在该项目 wiki 上的 [MilkyTracker 指南][12] 。

#### LMMS

我们中的两个音乐家使用多用途和现代音乐创建工具 [LMMS][13] 。它带来一个绝妙的示例和效果库，加一个灵活的多种多样的插件来生成独特的声音。 The learning curve for LMMS 的学习曲线令人吃惊的低，在某种程度上是因为友好的节拍/低音线编辑器。

![](https://opensource.com/sites/default/files/u128651/lmms_plugins.png)

我们对音乐家有一个建议，尝试 LMMS：使用插件。 对于 [chiptune][14]-样式音乐，我们推荐 [sfxr][15] ，[BitInvader][16] ，和 [FreeBoy][17] 。对于其它样式， [ZynAddSubFX][18] 是一个好的选择。它带来一个宽波段的可以被你任意更改的人工合成工具。

### 图形工具

#### Tiled

在开放源码游戏开发中，[Tiled][19] 是一个流行的组件地图类(tilemap)编辑器。我们使用它为来为我们在游戏场景中组合连续的，复古的背景。

![](https://opensource.com/sites/default/files/u128651/tiled.png)

Tiled 可以导出地图为 XM L，JSON ，或平坦的图像。它是稳定的和跨平台的。

Tiled 的特征一，在 jam 期间，我们不能使用, 允许你定义和随意的放置游戏对象，例如硬币和永久能力提升道具到地图上。你需要做的全部是加载对象的图像为一个平铺显示集，然后使用插入平铺显示放置它们。

一般来说，对于一些需要一个地图编辑器的工程，Tiled 是我们建议软件的一个主要的部分。

#### Piskel

[Piskel][20] 是一个像素艺术编辑器，它的源文件代码是在 [Apache 协议, 版本 2.0][21] 协议下。在 jam 期间，我们对我们的大多数的图像资源使用 Piskel ，我们当然也将在未来的工程中使用它。

Piskel 的特征二，在 jam 的 onion skin和Spritesheet导出期间极大地帮助我们。

##### Onion skin

onion skin 特征将使 Piskel 显示你编辑的动画的前一帧和后一帧的一个幽灵似的覆盖物，像这样:

![](https://opensource.com/sites/default/files/u128651/onionshow.gif)

Onion skin 是便于使用的，因为它适合作为一个绘制指南和在动画进程期间帮助你维护在你的角色上连续的图形和声音。为启用它，只需要在屏幕的右上方预览窗体的下面单击 onion-shaped 图标。

![](https://opensource.com/sites/default/files/u128651/onionenable.png)

##### Spritesheet 导出

Piskel 的能力是导出动画为一个 spritesheet ，也是非常有用的。一个 spritesheet 是一个单个光栅图象，它包含一个动画的所有的帧。例如，这是一个我们从 Piskel 导出的 spritesheet ：

![](https://opensource.com/sites/default/files/u128651/sprite-artist.png)

spritesheet 包含两幅帧。一幅帧是图像的上半部分，另一帧是图像的下半部分。Spritesheets 通过启用一个完整的动画来从单个文件加载，大大地简化一个游戏的代码。这是上面的 spritesheet 的一个动画版本：

![](https://opensource.com/sites/default/files/u128651/sprite-artist-anim.gif)

##### Unpiskel.py

在 jam 期间，我们很多次想批量转换 Piskel 文件到 PNG 文件。尽管 Piskel 文件格式基于 JSON ，我们写一个小的 GPLv3 协议的称为 [unpiskel.py][22] 的 Python 脚本来做转换。

它像这样被引用：
```
python unpiskel.py input.piskel
```

这个脚本将从一个 Piskel 文件（这里 `input.piskel`）中提取 PNG 数据帧和层，并存储它们在它们拥有的文件中。这些文件采用模式 `NAME_XX_YY.png` ，在这里 `NAME` 是 Piskel 文件的缩减名称，`XX` 是帧的编号，`YY` 是层的编号。

因为脚本可以从一个 shell 中引用,它可以被使用在文件的整个列表中。
```
for f in *.piskel; do python unpiskel.py "$f"; done
```

### Python, Pygame, 和 cx_Freeze

#### Python 和 Pygame

我们使用 [Python][23] 语言来自制作我们的游戏。它是一个脚本语言，通常被用于文本处理和桌面应用程序开发。它也可以用于游戏开发，例如工程，像 [Angry Drunken Dwarves][24] 和 [Ren'Py][25] 已经显示。这两个工程都使用一个称为 [Pygame][26] 的 Python 库来显示图形和产生声音，所以我们也决定在 Open Jam 中使用这个库。

Pygame 被证明是既稳定又富有特色，并且它对我们创建的街机游戏来说是优秀的。在低分辨率时，库的速度足够快的，但是在高分辨率时，它的仅 CPU 渲染开始变慢。这是因为 Pygame 不使用硬件加速渲染。然而，开发者可以充分利用 OpenGL 基础设施。

如果你正在寻找一个好的 2D 游戏编程库，Pygame 是值得密切注意的一个。它的网站有 [一个好的教程][27] 来开始。务必看看它！

#### cx_Freeze

准备发行我们的游戏是有趣的。我们知道，Windows 用户不喜欢有一个 Python 安装，并且要求他们来安装它可能很过分。除此之外，他们也可能不得不安装 Pygame ，在 Windows 上，这不是一个简单的工作。

有一件事很清楚：我们不得不放置我们的游戏到一个更方便的结构中。很多其他的 Open Jam 参与者使用专有的游戏引擎 Unity ，它能够使它们的游戏在网页浏览器中来玩。这使得它们非常方便地来玩。便利性是一个我们的游戏恰巧一丝的都没有的东西。但是，感谢生机勃勃的 Python 生态系统，我们有选择。在 Windows 上现有的工具帮助 Python 程序员准备发行他们的游戏。我们考虑的两个是 [cx_Freeze][28] 和 [Pygame2exe][29] (它使用 [py2exe][30])。我们下决心在 cx_Freeze 上，因为它是跨平台的。

在 cx_Freeze 中，你可以为发行版打包一个单个脚本游戏，只要在shell运行一个命令，像这样:
```
cxfreeze main.py --target-dir dist
```

`cxfreeze` 的这个调用将拿你的脚本(这里 `main.py`) 和在你系统上的 Python 解释器，并捆绑定它们到 `dist` 目录。一旦完成它，你需要做的是手动复制你的游戏的数据文件到 `dist` 目录。你将发现，`dist` 目录包含一个可以运行来开始你的游戏的可执行文件。

这里有更复杂难解的方法来使用 cx_Freeze ，允许你自动地复制数据文件，但是我们发现简单的调用 `cxfreeze` 足够我们的需要。感谢这个工具，我们使我们的游戏稍微便利的运行。

### 庆祝开放源码

Open Jam 是重要的，因为它庆祝软件开发的开放源码模式。这是来分析开放源码工具的当前状态和我们在未来工作中需求的一个机会。，对于游戏开发者来设法推动它们的工具的使用范围，学习必需提高未来游戏开发者的益处，游戏 jams 或许是最好的时间。

开放源码工具使人们能够探索他们的创造性，而不妥协他们的自由和前期的投资。尽管我们可能不能成为专业的游戏开发者，我们仍然能获取它的一段小的体验，使用我们简短的，实验性的称为 [Mark My Words][5] 的游戏。它是一个语言学方面地的有特定主题的游戏，它描述一个小说写作系统在它历史期间的演化。Open Jam 有一些令人愉快的提交，并且它们是值得校核。真的, [去看看][31] ！

在结束前，我们想要感谢所有的 [参加俱乐部的成员][32]，使这次经历真正的有价值。我们也想要感谢 [Michael Clayton][33]，[Jared Sprague][34] 和 [Opensource.com][35] 主办 open Jam。它是一次欢乐。

现在，我们对读者有一些问题。你是一个 FOSS 游戏开发者吗？你选择的工具是什么？务必在下面留下一个评论！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/graphics-music-tools-game-dev

作者：[Charlie Murphy][a]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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
