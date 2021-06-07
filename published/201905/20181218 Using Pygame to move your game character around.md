[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10874-1.html)
[#]: subject: (Using Pygame to move your game character around)
[#]: via: (https://opensource.com/article/17/12/game-python-moving-player)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

用 Pygame 使你的游戏角色移动起来
======
> 在本系列的第四部分，学习如何编写移动游戏角色的控制代码。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python4-game.png?itok=tXFHaLdt)

在这个系列的第一篇文章中，我解释了如何使用 Python 创建一个简单的[基于文本的骰子游戏][1]。在第二部分中，我向你们展示了如何从头开始构建游戏，即从 [创建游戏的环境][2] 开始。然后在第三部分，我们[创建了一个玩家妖精][3]，并且使它在你的（而不是空的）游戏世界内生成。你可能已经注意到，如果你不能移动你的角色，那么游戏不是那么有趣。在本篇文章中，我们将使用 Pygame 来添加键盘控制，如此一来你就可以控制你的角色的移动。

在 Pygame 中有许多函数可以用来添加（除键盘外的）其他控制，但如果你正在敲击 Python 代码，那么你一定是有一个键盘的，这将成为我们接下来会使用的控制方式。一旦你理解了键盘控制，你可以自己去探索其他选项。

在本系列的第二篇文章中，你已经为退出游戏创建了一个按键，移动角色的（按键）原则也是相同的。但是，使你的角色移动起来要稍微复杂一点。

让我们从简单的部分入手：设置控制器按键。

### 为控制你的玩家妖精设置按键

在 IDLE、Ninja-IDE 或文本编辑器中打开你的 Python 游戏脚本。

因为游戏需要时刻“监听”键盘事件，所以你写的代码需要连续运行。你知道应该把需要在游戏周期中持续运行的代码放在哪里吗？

如果你回答“放在主循环中”，那么你是正确的！记住除非代码在循环中，否则（大多数情况下）它只会运行仅一次。如果它被写在一个从未被使用的类或函数中，它可能根本不会运行。

要使 Python 监听传入的按键，将如下代码添加到主循环。目前的代码还不能产生任何的效果，所以使用 `print` 语句来表示成功的信号。这是一种常见的调试技术。

```
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                print('left')
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                print('right')
            if event.key == pygame.K_UP or event.key == ord('w'):
	            print('jump')

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                print('left stop')
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                print('right stop')
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False    
```

一些人偏好使用键盘字母 `W`、`A`、`S` 和 `D` 来控制玩家角色，而另一些偏好使用方向键。因此确保你包含了两种选项。

注意：当你在编程时，同时考虑所有用户是非常重要的。如果你写代码只是为了自己运行，那么很可能你会成为你写的程序的唯一用户。更重要的是，如果你想找一个通过写代码赚钱的工作，你写的代码就应该让所有人都能运行。给你的用户选择权，比如提供使用方向键或 WASD 的选项，是一个优秀程序员的标志。

使用 Python 启动你的游戏，并在你按下“上下左右”方向键或 `A`、`D` 和 `W` 键的时候查看控制台窗口的输出。

```
$ python ./your-name_game.py
  left
  left stop
  right
  right stop
  jump
```

这验证了 Pygame 可以正确地检测按键。现在是时候来完成使妖精移动的艰巨任务了。

### 编写玩家移动函数

为了使你的妖精移动起来，你必须为你的妖精创建一个属性代表移动。当你的妖精没有在移动时，这个变量被设为 `0`。

如果你正在为你的妖精设置动画，或者你决定在将来为它设置动画，你还必须跟踪帧来使走路循环保持在轨迹上。

在 `Player` 类中创建如下变量。开头两行作为上下文对照（如果你一直跟着做，你的代码中就已经有这两行），因此只需要添加最后三行：

```
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0 # 沿 X 方向移动
        self.movey = 0 # 沿 Y 方向移动
        self.frame = 0 # 帧计数
```

设置好了这些变量，是时候去为妖精移动编写代码了。

玩家妖精不需要时刻响应控制，有时它并没有在移动。控制妖精的代码，仅仅只是玩家妖精所有能做的事情中的一小部分。在 Python 中，当你想要使一个对象做某件事并独立于剩余其他代码时，你可以将你的新代码放入一个函数。Python 的函数以关键词 `def` 开头，（该关键词）代表了定义函数。

在你的 `Player` 类中创建如下函数，来为你的妖精在屏幕上的位置增加几个像素。现在先不要担心你增加几个像素，这将在后续的代码中确定。

```
    def control(self,x,y):
        '''
        控制玩家移动
        '''
        self.movex += x
        self.movey += y
```

为了在 Pygame 中移动妖精，你需要告诉 Python 在新的位置重绘妖精，以及这个新位置在哪里。

因为玩家妖精并不总是在移动，所以更新只需要是 Player 类中的一个函数。将此函数添加前面创建的 `control` 函数之后。

要使妖精看起来像是在行走（或者飞行，或是你的妖精应该做的任何事），你需要在按下适当的键时改变它在屏幕上的位置。要让它在屏幕上移动，你需要将它的位置（由 `self.rect.x` 和 `self.rect.y` 属性指定）重新定义为当前位置加上已应用的任意 `movex` 或 `movey`。（移动的像素数量将在后续进行设置。）

```
    def update(self):
        '''
        更新妖精位置
        '''
        self.rect.x = self.rect.x + self.movex        
```

对 Y 方向做同样的处理：

```
        self.rect.y = self.rect.y + self.movey
```

对于动画，在妖精移动时推进动画帧，并使用相应的动画帧作为玩家的图像：

```
        # 向左移动
        if self.movex < 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # 向右移动
        if self.movex > 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]
```

通过设置一个变量来告诉代码为你的妖精位置增加多少像素，然后在触发你的玩家妖精的函数时使用这个变量。

首先，在你的设置部分创建这个变量。在如下代码中，开头两行是上下文对照，因此只需要在你的脚本中增加第三行代码：

```
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10  # 移动多少个像素
```

现在你已经有了适当的函数和变量，使用你的按键来触发函数并将变量传递给你的妖精。

为此，将主循环中的 `print` 语句替换为玩家妖精的名字（`player`）、函数（`.control`）以及你希望玩家妖精在每个循环中沿 X 轴和 Y 轴移动的步数。

```
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(-steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(steps,0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                print('jump')

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps,0)
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False
```

记住，`steps` 变量代表了当一个按键被按下时，你的妖精会移动多少个像素。如果当你按下 `D` 或右方向键时，你的妖精的位置增加了 10 个像素。那么当你停止按下这个键时，你必须（将 `step`）减 10（`-steps`）来使你的妖精的动量回到 0。

现在尝试你的游戏。注意：它不会像你预想的那样运行。

为什么你的妖精仍无法移动？因为主循环还没有调用 `update` 函数。

将如下代码加入到你的主循环中来告诉 Python 更新你的玩家妖精的位置。增加带注释的那行：

```
    player.update()  # 更新玩家位置
    player_list.draw(world)
    pygame.display.flip()
    clock.tick(fps)
```

再次启动你的游戏来见证你的玩家妖精在你的命令下在屏幕上来回移动。现在还没有垂直方向的移动，因为这部分函数会被重力控制，不过这是另一篇文章中的课程了。

与此同时，如果你拥有一个摇杆，你可以尝试阅读 Pygame 中 [joystick][4] 模块相关的文档，看看你是否能通过这种方式让你的妖精移动起来。或者，看看你是否能通过[鼠标][5]与你的妖精互动。

最重要的是，玩的开心！

### 本教程中用到的所有代码

为了方便查阅，以下是目前本系列文章用到的所有代码。

```
#!/usr/bin/env python3
# 绘制世界
# 添加玩家和玩家控制
# 添加玩家移动控制

# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import pygame
import sys
import os

'''
Objects
'''

class Player(pygame.sprite.Sprite):
    '''
    生成玩家
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.images = []
        for i in range(1,5):
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect  = self.image.get_rect()

    def control(self,x,y):
        '''
        控制玩家移动
        '''
        self.movex += x
        self.movey += y

    def update(self):
        '''
        更新妖精位置
        '''

        self.rect.x = self.rect.x + self.movex
        self.rect.y = self.rect.y + self.movey

        # 向左移动
        if self.movex < 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # 向右移动
        if self.movex > 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]


'''
设置
'''
worldx = 960
worldy = 720

fps = 40        # 帧刷新率
ani = 4        # 动画循环
clock = pygame.time.Clock()
pygame.init()
main = True

BLUE  = (25,25,200)
BLACK = (23,23,23 )
WHITE = (254,254,254)
ALPHA = (0,255,0)

world = pygame.display.set_mode([worldx,worldy])
backdrop = pygame.image.load(os.path.join('images','stage.png')).convert()
backdropbox = world.get_rect()
player = Player()   # 生成玩家
player.rect.x = 0
player.rect.y = 0
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10      # 移动速度

'''
主循环
'''
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(-steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(steps,0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                print('jump')

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps,0)
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False

#    world.fill(BLACK)
    world.blit(backdrop, backdropbox)
    player.update()
    player_list.draw(world) # 更新玩家位置
    pygame.display.flip()
    clock.tick(fps)
```

你已经学了很多，但还仍有许多可以做。在接下来的几篇文章中，你将实现添加敌方妖精、模拟重力等等。与此同时，练习 Python 吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/game-python-moving-player

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-9071-1.html
[2]: https://linux.cn/article-10850-1.html
[3]: https://linux.cn/article-10858-1.html
[4]: http://pygame.org/docs/ref/joystick.html
[5]: http://pygame.org/docs/ref/mouse.html#module-pygame.mouse
