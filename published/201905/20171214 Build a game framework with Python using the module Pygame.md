[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10850-1.html)
[#]: subject: (Build a game framework with Python using the module Pygame)
[#]: via: (https://opensource.com/article/17/12/game-framework-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Python 和 Pygame 模块构建一个游戏框架
======

 > 这系列的第一篇通过创建一个简单的骰子游戏来探究 Python。现在是来从零制作你自己的游戏的时间。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python2-header.png?itok=tEvOVo4A)

在我的[这系列的第一篇文章][1] 中， 我已经讲解如何使用 Python 创建一个简单的、基于文本的骰子游戏。这次，我将展示如何使用 Python 模块 Pygame 来创建一个图形化游戏。它将需要几篇文章才能来得到一个确实做成一些东西的游戏，但是到这系列的结尾，你将更好地理解如何查找和学习新的 Python 模块和如何从其基础上构建一个应用程序。

在开始前，你必须安装 [Pygame][2]。

### 安装新的 Python 模块

有几种方法来安装 Python 模块，但是最通用的两个是：

  * 从你的发行版的软件存储库
  * 使用 Python 的软件包管理器 `pip`

两个方法都工作的很好，并且每一个都有它自己的一套优势。如果你是在 Linux 或 BSD 上开发，可以利用你的发行版的软件存储库来自动和及时地更新。

然而，使用 Python 的内置软件包管理器可以给予你控制更新模块时间的能力。而且，它不是特定于操作系统的，这意味着，即使当你不是在你常用的开发机器上时，你也可以使用它。`pip` 的其它的优势是允许本地安装模块，如果你没有正在使用的计算机的管理权限，这是有用的。

### 使用 pip

如果 Python 和 Python3 都安装在你的系统上，你想使用的命令很可能是 `pip3`，它用来区分 Python 2.x 的 `pip` 的命令。如果你不确定，先尝试 `pip3`。

`pip` 命令有些像大多数 Linux 软件包管理器一样工作。你可以使用 `search` 搜索 Python 模块，然后使用 `install` 安装它们。如果你没有你正在使用的计算机的管理权限来安装软件，你可以使用 `--user` 选项来仅仅安装模块到你的家目录。

```
$ pip3 search pygame
[...]
Pygame (1.9.3)                 - Python Game Development
sge-pygame (1.5)               - A 2-D game engine for Python
pygame_camera (0.1.1)          - A Camera lib for PyGame
pygame_cffi (0.2.1)            - A cffi-based SDL wrapper that copies the pygame API.
[...]
$ pip3 install Pygame --user
```

Pygame 是一个 Python 模块，这意味着它仅仅是一套可以使用在你的 Python 程序中的库。换句话说，它不是一个像 [IDLE][3] 或 [Ninja-IDE][4] 一样可以让你启动的程序。

### Pygame 新手入门

一个电子游戏需要一个背景设定：故事发生的地点。在 Python 中，有两种不同的方法来创建你的故事背景：

  * 设置一种背景颜色
  * 设置一张背景图片

你的背景仅是一张图片或一种颜色。你的电子游戏人物不能与在背景中的东西相互作用，因此，不要在后面放置一些太重要的东西。它仅仅是设置装饰。

### 设置你的 Pygame 脚本

要开始一个新的 Pygame 工程，先在计算机上创建一个文件夹。游戏的全部文件被放在这个目录中。在你的工程文件夹内部保持所需要的所有的文件来运行游戏是极其重要的。

![](https://opensource.com/sites/default/files/u128651/project.jpg)

一个 Python 脚本以文件类型、你的姓名，和你想使用的许可证开始。使用一个开放源码许可证，以便你的朋友可以改善你的游戏并与你一起分享他们的更改：

```
#!/usr/bin/env python3
# by Seth Kenlon

## GPLv3
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

然后，你告诉 Python 你想使用的模块。一些模块是常见的 Python 库，当然，你想包括一个你刚刚安装的 Pygame 模块。

```
import pygame  # 加载 pygame 关键字
import sys     # 让 python 使用你的文件系统
import os      # 帮助 python 识别你的操作系统
```

由于你将用这个脚本文件做很多工作，在文件中分成段落是有帮助的，以便你知道在哪里放代码。你可以使用块注释来做这些，这些注释仅在看你的源文件代码时是可见的。在你的代码中创建三个块。

```
'''
Objects
'''

# 在这里放置 Python 类和函数

'''
Setup
'''

# 在这里放置一次性的运行代码

'''
Main Loop
'''

# 在这里放置游戏的循环代码指令
```

接下来，为你的游戏设置窗口大小。注意，不是每一个人都有大计算机屏幕，所以，最好使用一个适合大多数人的计算机的屏幕大小。

这里有一个方法来切换全屏模式，很多现代电子游戏都会这样做，但是，由于你刚刚开始，简单起见仅设置一个大小即可。

```
'''
Setup
'''
worldx = 960
worldy = 720
```

在脚本中使用 Pygame 引擎前，你需要一些基本的设置。你必须设置帧频，启动它的内部时钟，然后开始 （`init`）Pygame 。

```
fps   = 40  # 帧频
ani   = 4   # 动画循环
clock = pygame.time.Clock()
pygame.init()
```

现在你可以设置你的背景。

### 设置背景

在你继续前，打开一个图形应用程序，为你的游戏世界创建一个背景。在你的工程目录中的 `images` 文件夹内部保存它为 `stage.png` 。

这里有一些你可以使用的自由图形应用程序。

* [Krita][5] 是一个专业级绘图素材模拟器，它可以被用于创建漂亮的图片。如果你对创建电子游戏艺术作品非常感兴趣，你甚至可以购买一系列的[游戏艺术作品教程][6]。
* [Pinta][7] 是一个基本的，易于学习的绘图应用程序。
* [Inkscape][8] 是一个矢量图形应用程序。使用它来绘制形状、线、样条曲线和贝塞尔曲线。

你的图像不必很复杂，你可以以后回去更改它。一旦有了它，在你文件的 Setup 部分添加这些代码：

```
world    = pygame.display.set_mode([worldx,worldy])
backdrop = pygame.image.load(os.path.join('images','stage.png').convert())
backdropbox = world.get_rect()
```

如果你仅仅用一种颜色来填充你的游戏的背景，你需要做的就是：

```
world = pygame.display.set_mode([worldx,worldy])
```

你也必须定义颜色以使用。在你的 Setup 部分，使用红、绿、蓝 (RGB) 的值来创建一些颜色的定义。

```
'''
Setup
'''

BLUE  = (25,25,200)
BLACK = (23,23,23 )
WHITE = (254,254,254)
```

至此，你理论上可以启动你的游戏了。问题是，它可能仅持续了一毫秒。

为证明这一点，保存你的文件为 `your-name_game.py`（用你真实的名称替换 `your-name`）。然后启动你的游戏。

如果你正在使用 IDLE，通过选择来自 “Run” 菜单的 “Run Module” 来运行你的游戏。

如果你正在使用 Ninja，在左侧按钮条中单击 “Run file” 按钮。

![](https://opensource.com/sites/default/files/u128651/ninja_run_0.png)

你也可以直接从一个 Unix 终端或一个 Windows 命令提示符中运行一个 Python 脚本。

```
$ python3 ./your-name_game.py
```

如果你正在使用 Windows，使用这命令：

```
py.exe your-name_game.py
```

启动它，不过不要期望很多，因为你的游戏现在仅仅持续几毫秒。你可以在下一部分中修复它。

### 循环

除非另有说明，一个 Python 脚本运行一次并仅一次。近来计算机的运行速度是非常快的，所以你的 Python 脚本运行时间会少于 1 秒钟。

为强制你的游戏来处于足够长的打开和活跃状态来让人看到它（更不要说玩它），使用一个 `while` 循环。为使你的游戏保存打开，你可以设置一个变量为一些值，然后告诉一个 `while` 循环只要变量保持未更改则一直保存循环。

这经常被称为一个“主循环”，你可以使用术语 `main` 作为你的变量。在你的 Setup 部分的任意位置添加代码：

```
main = True
```

在主循环期间，使用 Pygame 关键字来检查键盘上的按键是否已经被按下或释放。添加这些代码到你的主循环部分：

```
'''
Main loop
'''
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False
```

也是在你的循环中，刷新你世界的背景。

如果你使用一个图片作为背景：

```
world.blit(backdrop, backdropbox)
```

如果你使用一种颜色作为背景：

```
world.fill(BLUE)
```

最后，告诉 Pygame 来重新刷新屏幕上的所有内容，并推进游戏的内部时钟。

```
    pygame.display.flip()
    clock.tick(fps)
```

保存你的文件，再次运行它来查看你曾经创建的最无趣的游戏。

退出游戏，在你的键盘上按 `q` 键。

在这系列的 [下一篇文章][9] 中，我将向你演示，如何加强你当前空空如也的游戏世界，所以，继续学习并创建一些将要使用的图形！

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/game-framework-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-9071-1.html
[2]: http://www.pygame.org/wiki/about
[3]: https://en.wikipedia.org/wiki/IDLE
[4]: http://ninja-ide.org/
[5]: http://krita.org
[6]: https://gumroad.com/l/krita-game-art-tutorial-1
[7]: https://pinta-project.com/pintaproject/pinta/releases
[8]: http://inkscape.org
[9]: https://opensource.com/article/17/12/program-game-python-part-3-spawning-player
