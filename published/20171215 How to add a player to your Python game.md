[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10858-1.html)
[#]: subject: (How to add a player to your Python game)
[#]: via: (https://opensource.com/article/17/12/game-python-add-a-player)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在你的 Python 游戏中添加一个玩家
======
> 这是用 Python 从头开始构建游戏的系列文章的第三部分。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python3-game.png?itok=jG9UdwC3)

在 [这个系列的第一篇文章][1] 中，我解释了如何使用 Python 创建一个简单的基于文本的骰子游戏。在第二部分中，我向你们展示了如何从头开始构建游戏，即从 [创建游戏的环境][2] 开始。但是每个游戏都需要一名玩家，并且每个玩家都需要一个可操控的角色，这也就是我们接下来要在这个系列的第三部分中需要做的。

在 Pygame 中，玩家操控的图标或者化身被称作<ruby>妖精<rt>sprite</rt></ruby>。如果你现在还没有任何可用于玩家妖精的图像，你可以使用 [Krita][3] 或 [Inkscape][4] 来自己创建一些图像。如果你对自己的艺术细胞缺乏自信，你也可以在 [OpenClipArt.org][5] 或 [OpenGameArt.org][6] 搜索一些现成的图像。如果你还未按照上一篇文章所说的单独创建一个 `images` 文件夹，那么你需要在你的 Python 项目目录中创建它。将你想要在游戏中使用的图片都放 `images` 文件夹中。

为了使你的游戏真正的刺激，你应该为你的英雄使用一张动态的妖精图片。这意味着你需要绘制更多的素材，并且它们要大不相同。最常见的动画就是走路循环，通过一系列的图像让你的妖精看起来像是在走路。走路循环最快捷粗糙的版本需要四张图像。

![](https://opensource.com/sites/default/files/u128651/walk-cycle-poses.jpg)

注意：这篇文章中的代码示例同时兼容静止的和动态的玩家妖精。

将你的玩家妖精命名为 `hero.png`。如果你正在创建一个动态的妖精，则需要在名字后面加上一个数字，从 `hero1.png` 开始。

### 创建一个 Python 类

在 Python 中，当你在创建一个你想要显示在屏幕上的对象时，你需要创建一个类。

在你的 Python 脚本靠近顶端的位置，加入如下代码来创建一个玩家。在以下的代码示例中，前三行已经在你正在处理的 Python 脚本中：

```
import pygame
import sys
import os # 以下是新代码

class Player(pygame.sprite.Sprite):
    '''
    生成一个玩家
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.images = []
    img = pygame.image.load(os.path.join('images','hero.png')).convert()
    self.images.append(img)
    self.image = self.images[0]
    self.rect  = self.image.get_rect()
```

如果你的可操控角色拥有一个走路循环，在 `images` 文件夹中将对应图片保存为 `hero1.png` 到 `hero4.png` 的独立文件。

使用一个循环来告诉 Python 遍历每个文件。

```
'''
对象
'''

class Player(pygame.sprite.Sprite):
    '''
    生成一个玩家
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.images = []
        for i in range(1,5):
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            self.images.append(img)
            self.image = self.images[0]
            self.rect  = self.image.get_rect()
```

### 将玩家带入游戏世界

现在已经创建好了一个 Player 类，你需要使用它在你的游戏世界中生成一个玩家妖精。如果你不调用 Player 类，那它永远不会起作用，（游戏世界中）也就不会有玩家。你可以通过立马运行你的游戏来验证一下。游戏会像上一篇文章末尾看到的那样运行，并得到明确的结果：一个空荡荡的游戏世界。

为了将一个玩家妖精带到你的游戏世界，你必须通过调用 Player 类来生成一个妖精，并将它加入到 Pygame 的妖精组中。在如下的代码示例中，前三行是已经存在的代码，你需要在其后添加代码：

```
world       = pygame.display.set_mode([worldx,worldy])
backdrop    = pygame.image.load(os.path.join('images','stage.png')).convert()
backdropbox = screen.get_rect()

# 以下是新代码

player = Player()   # 生成玩家
player.rect.x = 0   # 移动 x 坐标
player.rect.y = 0   # 移动 y 坐标
player_list = pygame.sprite.Group()
player_list.add(player)
```

尝试启动你的游戏来看看发生了什么。高能预警：它不会像你预期的那样工作，当你启动你的项目，玩家妖精没有出现。事实上它生成了，只不过只出现了一毫秒。你要如何修复一个只出现了一毫秒的东西呢？你可能回想起上一篇文章中，你需要在主循环中添加一些东西。为了使玩家的存在时间超过一毫秒，你需要告诉 Python 在每次循环中都绘制一次。

将你的循环底部的语句更改如下：

```
    world.blit(backdrop, backdropbox)
    player_list.draw(screen) # 绘制玩家
    pygame.display.flip()
    clock.tick(fps)
```

现在启动你的游戏，你的玩家出现了！

### 设置 alpha 通道

根据你如何创建你的玩家妖精，在它周围可能会有一个色块。你所看到的是 alpha 通道应该占据的空间。它本来是不可见的“颜色”，但 Python 现在还不知道要使它不可见。那么你所看到的，是围绕在妖精周围的边界区（或现代游戏术语中的“<ruby>命中区<rt>hit box</rt></ruby>”）内的空间。

![](https://opensource.com/sites/default/files/u128651/greenscreen.jpg)

你可以通过设置一个 alpha 通道和 RGB 值来告诉 Python 使哪种颜色不可见。如果你不知道你使用 alpha 通道的图像的 RGB 值，你可以使用 Krita 或 Inkscape 打开它，并使用一种独特的颜色，比如 `#00ff00`（差不多是“绿屏绿”）来填充图像周围的空白区域。记下颜色对应的十六进制值（此处为 `#00ff00`，绿屏绿）并将其作为 alpha 通道用于你的 Python 脚本。

使用 alpha 通道需要在你的妖精生成相关代码中添加如下两行。类似第一行的代码已经存在于你的脚本中，你只需要添加另外两行：

```
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            img.convert_alpha()     # 优化 alpha
            img.set_colorkey(ALPHA) # 设置 alpha
```

除非你告诉它，否则 Python 不知道将哪种颜色作为 alpha 通道。在你代码的设置相关区域，添加一些颜色定义。将如下的变量定义添加于你的设置相关区域的任意位置：

```
ALPHA = (0, 255, 0)
```

在以上示例代码中，`0,255,0` 被我们使用，它在 RGB 中所代表的值与 `#00ff00` 在十六进制中所代表的值相同。你可以通过一个优秀的图像应用程序，如 [GIMP][7]、Krita 或 Inkscape，来获取所有这些颜色值。或者，你可以使用一个优秀的系统级颜色选择器，如 [KColorChooser][8]，来检测颜色。

![](https://opensource.com/sites/default/files/u128651/kcolor.png)

如果你的图像应用程序将你的妖精背景渲染成了其他的值，你可以按需调整 `ALPHA` 变量的值。不论你将 alpha 设为多少，最后它都将“不可见”。RGB 颜色值是非常严格的，因此如果你需要将 alpha 设为 000，但你又想将 000 用于你图像中的黑线，你只需要将图像中线的颜色设为 111。这样一来，（图像中的黑线）就足够接近黑色，但除了电脑以外没有人能看出区别。

运行你的游戏查看结果。

![](https://opensource.com/sites/default/files/u128651/alpha.jpg)

在 [这个系列的第四篇文章][9] 中，我会向你们展示如何使你的妖精动起来。多么的激动人心啊！

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/game-python-add-a-player

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-9071-1.html
[2]: https://linux.cn/article-10850-1.html
[3]: http://krita.org
[4]: http://inkscape.org
[5]: http://openclipart.org
[6]: https://opengameart.org/
[7]: http://gimp.org
[8]: https://github.com/KDE/kcolorchooser
[9]: https://opensource.com/article/17/12/program-game-python-part-4-moving-your-sprite
