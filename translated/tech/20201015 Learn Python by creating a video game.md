[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Python by creating a video game)
[#]: via: (https://opensource.com/article/20/10/learn-python-ebook)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

通过创建视频游戏来学习 Python
======
在新电子书中使用分步说明的这种娱乐方式来了解学习 Python。
![街机游戏][1]

Python 是目前最流行的程序设计语言之一。不管是为了工作还是娱乐为目的学习 Python，它都是一门功能强大且非常有用的编程语言。您可以创建应用程序来帮助您完成日常任务，创建你和你的朋友喜欢玩的游戏，创建用于处理数据的脚本，创建用于生成或分析信息的应用程序等等。

无论您计划使用哪种程序设计语言做什么，我们都认为通过创建游戏来学习比通过处理数字或变换字符串来学习更为有趣。然而，如果你完全是一个编程的新手，那么可以轻松地理解为什么必须在代码中执行某些操作，因为你可以看到代码运行在一个熟悉的环境下就像是一个电视游戏。

您可能没有选择 [Python][2] 作为可用的最佳编程语言（每个人对此都有自己的答案），但它不是一门令人恐惧的编程语言。 Python可以使用很多关键字（例如 `is` 和 `is not`）代替符号（例如 `=` 和 `!=`）。它还管理许多低级任务，因此您通常不必担心数据类型和无用信息收集之类的事情。通常，这意味着你可以开始编写代码，而不会像在 [C][3] 或 [Java][4] 那样的复杂编程语言面前遇到挫折。

为了帮助您学习 Python，我们编写了电子书，教你如何使用 Python 创建电视游戏平台。在制作电视游戏的同时逐步通过课程学习 Python。另外一个好处是，您还将学习编程逻辑，语法，运算符等更多的内容。您可以在学习过程中立即看到结果，因此您学到的所有内容都会得到及时巩固。
### 让我们开始 （Python） 吧

Python 是一种用途广泛的编程语言，这意味着它（与大多数语言一样）提供了简单的 “特有的方式” 的功能处理数字和字符。Linux 操作系统用户已经安装了 Python。 Mac 操作系统用户使用的是 Python 的旧版本，但是您可以从 Python.org 网站 [安装最新版本][5]。Windows 操作系统用户可以从这篇 [在 Windows 上安装 Python][6] 的文章中学习如何安装 Python。

安装完成后，您可以启动交互式 `Python Shell` 进行算术运算：

```
$ python3
&gt;&gt;&gt; 5+6
11
&gt;&gt;&gt; 11/2
5.5
&gt;&gt;&gt; 11//2
5
&gt;&gt;&gt; 11%2
1
```

从该示例可以了解，需要一些特殊的符号，但学过数学的人都最熟悉不过了。也许您不是数字型的人，而更喜欢字母：

```
$ python3
&gt;&gt;&gt; string = "hello world"
&gt;&gt;&gt; print(string)
hello world
&gt;&gt;&gt; print(string.upper())
HELLO WORLD
&gt;&gt;&gt; print(string[0])
h
&gt;&gt;&gt; print(string[1])
e
&gt;&gt;&gt; print(string[2])
l
&gt;&gt;&gt; print(string[3])
l
&gt;&gt;&gt; print(string[4])
o
```

同样，相对地说基础的任务有特殊的符号表示法，但是即使没有说明，你也可能已经发现 `[0]` 和 `[1]` 符号表示法是将数据 "切片"并且利用 `print` 函数将其中的数据显示在屏幕上。
### 五分钟搞定 Pygame

如果你只想使用 Python 来创建视频游戏或除基本计算以外的其他项目，这可能需要投入大量的学习，努力和时间。幸运的是，Python 诞生已有二十年了，开发者已经开发了代码库来帮助您轻松（相对）地实施典型的程序设计。 [Pygame][7] 是一组用于创建视频游戏的代码模块。它 [不是唯一的类库][8]，但是它是最古老的（不论好坏），因此在线上有很多文档和示例。

首先学习 [介绍 Python 虚拟环境工作流程][9]：

```
$ python3 -m venv mycode/venv
$ cd mycode
$ source ./venv/bin/activate
(venv)$
```

进入虚拟环境后，可以安全地将 Pygame 安装到项目文件夹中：

```
(venv)$ echo "pygame" &gt;&gt; requirements.txt
(venv)$ python -m pip install -r requirements.txt
[...] Installing collected packages: pygame
Successfully installed pygame-x.y.z
```

现在你已经安装了 Pygame，就可以创建一个简单的演示应用程序。它比您想象的要容易。 Python 可以执行称为 _object-oriented programming_ （OOP “面向对象的编程”）的操作，这是计算机科学术语，用于描述代码的结构，就像您使用代码创建物理对象一样。然而，程序员并没有受到迷惑。他们知道在编写代码时并没有真正在制造物理对象，但是这样有助于想象，因为这样可以了解编程世界的局限性。

例如，如果您被困在一个荒岛上并想要一杯咖啡，那么您就必须收集一些黏土，做一个杯子，然后烘烤它。如果你足够聪明，先创建一个模具，以便每当需要另一个杯子时，都可以从模板中快速创建一个新杯子。即使每个杯子都来自相同的模板，它们在物理上也是独立的：如果一个杯子破裂，您还会有另一个杯子。您可以通过添加颜色或蚀刻使每个咖啡杯显得独特。

在 Pygame 和许多编程任务中，你使用类似的逻辑。在定义之前，不会出现在你的编程项目中。这就是怎样做一杯咖啡在 Python 和 Pygame 定制项目的形象比喻。
#### 使用 Pygame 进行面向对象的编程

创建一个名为 `main.py` 的文件，并输入以下代码用以启动 Pygame 模块并使用 Pygame 模板创建一个窗口：

```
import pygame

pygame.init()

screen = pygame.display.set_mode((960,720))
```

就像您可能在现实生活中使用模板来创建对象一样，您也可以使用 Pygame 提供的模板来创建 _sprite_（这是 Pygame 的视觉游戏对象术语）。在面向对象的编程中，_class_ 表示对象的模板。在您的文档中输入以下代码：

```
class Cup(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)

        # image
        img = pygame.image.load('coffeecup.png').convert()
        self.image = img

        # volume
        self.rect = self.image.get_rect()
        self.rect.x = 10
        self.rect.y = 10
```

该代码块使用 Pygame 的 `sprite` 模板设计咖啡杯子精灵图形。由于 ，你的咖啡杯子精灵图形具有 `self.image` 图像，而 `self.rect` 则赋予了它体积（宽度和高度）。这些是 Pygame 期望精灵图形拥有的属性，但是如果您要创建可玩的视频游戏，则可以为其指定任何其他所需的属性，例如健康点和得分。

到目前为止，您所要做的就是创建一个窗口和一个用于咖啡杯的 _template_ 。您的游戏实际上还不是杯水。

代码的最后一部分必须使用模板来生成杯子并将其添加到游戏世界中。如您所知，计算机运行速度非常快，因此从技术上讲，您到目前为止创建的代码只能运行一毫秒左右。编写图形计算机应用程序时，无论计算机是否认为已完成规定的任务，都必须强制其保持打开状态。程序员使用 _infinite loop_ 来执行此操作，该循环在 Python 中由 `while True` 指令表示（True 始终为真，因此循环永远不会结束）。

无限循环确保您的应用程序保持打开状态足够长的时间，以使计算机用户可以查看和使用该应用程序：

```
cup = Cup()

while True:
    pygame.display.update()
    screen.blit(cup.image, cup.rect)
```

此代码示例从模板 `Cup` 创建杯子，然后使用 Pygame 函数更新显示。最后，使用 Pygame 的 `blit` 函数在其边框内绘制杯子的图像。
#### 获取图形

在成功运行代码之前，您需要为咖啡杯准备一个图形。您可以在 [FreeSVG.org][11] 上找到许多 [Creative Commons（公用创作）][10] 咖啡杯图形。我用了 [这个][12]。将图形保存在项目目录中，并将其命名为 `coffeecup.png`。
#### 运行游戏

启动应用程序：

```
`(venv)$ python ./main.py`
```

![Pygame 中的咖啡杯][13]

(Seth Kenlon, [CC BY-SA 4.0][14])

### [下载 Python 游戏电子书][15]

Pygame 是一个功能强大的框架，除了在屏幕上绘制咖啡杯之外，您还可以做更多的事情。[下载我们的免费电子书][15] 更好地了解 Pygame 和 Python。
--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/learn-python-ebook

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32 (Arcade games)
[2]: https://www.python.org/
[3]: https://opensource.com/article/20/8/c-programming-cheat-sheet
[4]: https://opensource.com/resources/java
[5]: https://www.python.org/downloads/mac-osx
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://www.pygame.org/news
[8]: https://opensource.com/article/18/4/easy-2d-game-creation-python-and-arcade
[9]: https://opensource.com/article/20/9/venv-python
[10]: https://opensource.com/article/20/1/what-creative-commons
[11]: http://freesvg.org
[12]: https://freesvg.org/1548870028
[13]: https://opensource.com/sites/default/files/uploads/pygame-cup.jpg (Coffee cup in Pygame)
[14]: https://creativecommons.org/licenses/by-sa/4.0/
[15]: https://opensource.com/downloads/python-gaming-ebook
