[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12877-1.html)
[#]: subject: (Add sound to your Python game)
[#]: via: (https://opensource.com/article/20/9/add-sound-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

添加声音到你的 Python 游戏
======

> 通过添加声音到你的游戏中，听听当你的英雄战斗、跳跃、收集战利品时会发生什么。学习如何在这个 Pygame 系列的第十三篇文章中，创建一个声音平台类精灵。

![](https://img.linux.net.cn/data/attachment/album/202012/02/092244du74f14837zmo7fz.jpg)

在 [Python 3][2] 中使用 [Pygame][3] 模块来创建电脑游戏的系列文章仍在进行中，这是第十三部分。先前的文章是:

  1. [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][4]
  2. [使用 Python 和 Pygame 模块构建一个游戏框架][5]
  3. [如何在你的 Python 游戏中添加一个玩家][6]
  4. [用 Pygame 使你的游戏角色移动起来][7]
  5. [如何向你的 Python 游戏中添加一个敌人][8]
  6. [在 Pygame 游戏中放置平台][9]
  7. [在你的 Python 游戏中模拟引力][10]
  8. [为你的 Python 平台类游戏添加跳跃功能][11]
  9. [使你的 Python 游戏玩家能够向前和向后跑][12]
  10. [在你的 Python 平台类游戏中放一些奖励][13]
  11. [添加计分到你的 Python 游戏][14]
  12. [在你的 Python 游戏中加入投掷机制][15]

Pygame 提供了一种简单的方法来集成声音到你的 Python 电脑游戏中。Pygame 的 [mixer 模块][16] 可以依据命令播放一个或多个声音，并且你也可以将这些声音混合在一起，例如，你能够在听到你的英雄收集奖励或跳过敌人声音的同时播放背景音乐。

集成 `mixer` 模块到一个已存在的游戏中是很容易的，因此，与其给你代码示例来向你展示放置它们的位置，不如在这篇文章解释在你的应用程序中获得声音所需的四个步骤。

### 启动 mixer

首先，在你代码的设置部分，启动 `mixer` 进程。你的代码已经启动 Pygame 和 Pygame 字体，因此将它们归类到一起是一个很好的主意:

```
pygame.init()
pygame.font.init()
pygame.mixer.init() # add this line
```

### 定义声音

接下来，你必需定义你想要使用的声音。这样就要求你的计算机上有声音文件，就像使用字体就要求你有字体文件，使用图像就要求你有图像文件一样。

你还必需把这些声音与你的游戏捆绑在一起，以便任何玩你游戏的人都有这些声音文件。

为将一个声音与你的游戏捆绑在一起，首先在你的游戏目录中创建一个新的目录，就像你为你图像和字体创建的目录一样。称它为 `sound`:

```
s = 'sound'
```

尽管在互联网上有很多声音文件，下载这些声音文件并将其与你的游戏一起分发并不一定是合法的。这看起来是很奇怪的，因为这么多来自著名电脑游戏的声音是流行文化的一部分，但法律就是这样运作的。如果你想与你的游戏一起分发一个声音文件，你必需找到一个开源或[共创许可][17]的声音文件，它们准许与游戏一起提供声音。

这里有一些专门提供自由和合法的声音文件的网站，包括:

  * [Freesound][18] 托管存储所有种类的音效。
  * [Incompetech][19] 托管存储背景音乐。
  * [Open Game Art][20] 托管存储一些音效和音乐。

一些声音文件只要你给予作曲家或声音设计师一个致谢就可以自由使用。在与你的游戏捆绑前，仔细阅读使用条件！音乐家和声音设计师在声音上的工作就像你在代码上的工作一样努力，因此即使他们不要求，给予他们致谢也是极好的。

给予你的声音源文件一些致谢，在一个名为 `CREDIT` 的文本文件中列出你使用的声音，并在你的游戏文件夹中放置该文本文件。

你也可以尝试制作你自己的音乐。优秀的 [LMMS][21] 音频工作站易于使用，并带有很多有趣的声音。它在所有主要的平台上都可以使用，也可以导出为 [Ogg Vorbis][22]（OGG）音频格式。

### 添加声音到 Pygame

当你找到你喜欢的一个声音文件时，下载它。如果它是一个 ZIP 或 TAR 文件，提取它并将其移动到你游戏目录中的 `sound` 文件夹中。

如果声音文件的名字带有空格或特殊字符，重新命名它。文件名称是完全随意的，它的名称越简单，你就越容易输入到你的代码中。

大多数的电脑游戏使用 OGG 格式声音文件，因为这种格式可以占有较小空间而提供高质量的声音。当你下载一个声音文件时，它可能是一个 MP3、WAVE、FLAC 或者其它的音频格式。为保持你的文件的较高兼容性和降低下载文件大小，使用一个像 [fre:ac][23] 或 [Miro][24] 这样的工具来转换这些的文件格式为 Ogg 格式。

例如，假设你已经下载一个称为 `ouch.ogg` 的声音文件。

在你代码的设置部分中，创建一个变量，代表你想使用的声音文件：

```
ouch = pygame.mixer.Sound(os.path.join(s, 'ouch.ogg'))
```

### 触发一个声音

为使用一个声音，你所要做的就是在你想触发它的时候调用这个变量。例如，当你的玩家击中一名敌人时，触发 `OUCH` 声音效果:

```
for enemy in enemy_hit_list:
    pygame.mixer.Sound.play(ouch)
    score -= 1
```

你可以为各种动作创建声音，例如，跳跃、收集奖励、投掷、碰撞，以及其他任何你能想象到的动作。

### 添加背景音乐

如果你有想在你的游戏的背景中播放的音乐或令人激动的音效，你可以使用 Pygame 中的 `mixer` 模块中的 `music` 函数。在你的设置部分中，加载音乐文件：

```
music = pygame.mixer.music.load(os.path.join(s, 'music.ogg'))
```

然后，开始音乐:

```
pygame.mixer.music.play(-1)
```

`-1` 值告诉 Pygame 无限循环音乐文件。你可以将其设置为从 0 到更高的值之间的任意数值，以定义音乐在停止前循环多少次。

### 享受音效

音乐和声音可以为你的游戏添加很多韵味。尝试添加一些声音到你的 Pygame 工程!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/add-sound-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://www.python.org/
[3]: https://www.pygame.org/news
[4]: https://linux.cn/article-9071-1.html
[5]: https://linux.cn/article-10850-1.html
[6]: https://linux.cn/article-10858-1.html
[7]: https://linux.cn/article-10874-1.html
[8]: https://linux.cn/article-10883-1.html
[9]: https://linux.cn/article-10902-1.html
[10]: https://linux.cn/article-11780-1.html
[11]: https://linux.cn/article-11790-1.html
[12]: https://linux.cn/article-11819-1.html
[13]: https://linux.cn/article-11828-1.html
[14]: https://linux.cn/article-11839-1.html
[15]: https://linux.cn/article-12872-1.html
[16]: https://www.pygame.org/docs/ref/mixer.html
[17]: https://opensource.com/article/20/1/what-creative-commons
[18]: https://freesound.org
[19]: https://incompetech.filmmusic.io
[20]: https://opengameart.org
[21]: https://opensource.com/life/16/2/linux-multimedia-studio
[22]: https://en.wikipedia.org/wiki/Vorbis
[23]: https://www.freac.org/index.php/en/downloads-mainmenu-330
[24]: http://getmiro.com
