[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12872-1.html)
[#]: subject: (Add throwing mechanics to your Python game)
[#]: via: (https://opensource.com/article/20/9/add-throwing-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在你的 Python 游戏中添加投掷机制
======

> 四处奔跑躲避敌人是一回事，反击敌人是另一回事。学习如何在这系列的第十二篇文章中在 Pygame 中创建平台游戏。

![](https://img.linux.net.cn/data/attachment/album/202011/30/124457xcj9mztw9kx9c7zj.jpg)

这是仍在进行中的关于使用 [Pygame][3] 模块在 [Python 3][2] 中创建电脑游戏的第十二部分。先前的文章是：

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

我的上一篇文章本来是这一系列文章的最后一篇，它鼓励你为这个游戏编写自己的附加程序。你们很多人都这么做了！我收到了一些电子邮件，要求帮助我还没有涵盖的常用机制：战斗。毕竟，跳起来躲避坏人是一回事，但是有时候让他们走开是一件非常令人满意的事。在电脑游戏中向你的敌人投掷一些物品是很常见的，不管是一个火球、一支箭、一道闪电，还是其它适合游戏的东西。

与迄今为止你在这个系列中为你的平台游戏编程的任何东西不同，可投掷物品有一个*生存时间*。在你投掷一个物品后，它会如期在移动一段距离后消失。如果它是一支箭或其它类似的东西，它可能会在通过屏幕的边缘时而消失。如果它是一个火球或一道闪电，它可能会在一段时间后熄灭。

这意味着每次生成一个可投掷的物品时，也必须生成一个独特的衡量其生存时间的标准。为了介绍这个概念，这篇文章演示如何一次只投掷一个物品。（换句话说，每次仅存在一个投掷物品）。 一方面，这是一个游戏的限制条件，但另一方面，它却是游戏本身的运行机制。你的玩家不能每次同时投掷 50 个火球，因为每次仅允许一个投掷物品，所以当你的玩家释放一个火球来尝试击中一名敌人就成为了一项挑战。而在幕后，这也使你的代码保持简单。

如果你想启用每次投掷多个项目，在完成这篇教程后，通过学习这篇教程所获取的知识来挑战你自己。

### 创建 Throwable 类

如果你跟随学习这系列的其它文章，那么你应该熟悉在屏幕上生成一个新的对象基础的 `__init__` 函数。这和你用来生成你的 [玩家][6] 和 [敌人][8] 的函数是一样的。这里是生成一个 `throwable` 对象的 `__init__` 函数来：

```
class Throwable(pygame.sprite.Sprite):
    """
    生成一个 throwable 对象
    """
    def __init__(self, x, y, img, throw):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect   = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.firing = throw
```

同你的 `Player` 类或 `Enemy` 类的 `__init__` 函数相比，这个函数的主要区别是，它有一个 `self.firing` 变量。这个变量保持跟踪一个投掷的物品是否在当前屏幕上活动，因此当一个 `throwable` 对象创建时，将变量设置为 `1` 的合乎情理的。

### 判断存活时间

接下来，就像使用 `Player` 和 `Enemy` 一样，你需要一个 `update` 函数，以便投掷的物品在瞄准敌人抛向空中时，它会自己移动。

测定一个投掷的物品存活时间的最简单方法是侦测它何时离开屏幕。你需要监视的屏幕边缘取决于你投掷的物品的物理特性。

  * 如果你的玩家正在投掷的物品是沿着水平轴快速移动的，像一只弩箭或箭或一股非常快的魔法力量，而你想监视你游戏屏幕的水平轴极限。这可以通过 `worldx` 定义。
  * 如果你的玩家正在投掷的物品是沿着垂直方向或同时沿着水平方向和垂直方向移动的，那么你必须监视你游戏屏幕的垂直轴极限。这可以通过 `worldy` 定义。

这个示例假设你投掷的物品向前移动一点并最终落到地面上。不过，投掷的物品不会从地面上反弹起来，而是继续掉落出屏幕。你可以尝试不同的设置来看看什么最适合你的游戏：

```
    def update(self,worldy):
        '''
        投掷物理学
        '''
        if self.rect.y < worldy:   #垂直轴 
            self.rect.x  += 15     #它向前移动的速度有多快
            self.rect.y  += 5      #它掉落的速度有多快
        else:
            self.kill()            #移除投掷对象
            self.firing = 0        #解除火力发射
```

为使你的投掷物品移动地更快，增加 `self.rect` 的动量值。

如果投掷物品不在屏幕上，那么该物品将被销毁，以及释放其所占用的寄存器。另外，`self.firing` 将被设置回 `0` 以允许你的玩家来进行另一次射击。

### 设置你的投掷对象

就像使用你的玩家和敌人一样，你必须在你的设置部分中创建一个精灵组来保持投掷对象。

此外，你必须创建一个非活动的投掷对象来供开始的游戏使用。如果在游戏开始时却没有一个投掷对象，那么玩家在第一次尝试投掷一柄武器时，投掷将失败。

这个示例假设你的玩家使用一个火球作为开始的武器，因此，每一个投掷实例都是由 `fire` 变量指派的。在后面的关卡中，当玩家获取新的技能时，你可以使用相同的 `Throwable` 类来引入一个新的变量以使用一张不同的图像。

在这代码块中，前两行已经在你的代码中，因此不要重新键入它们:

```
player_list = pygame.sprite.Group() #上下文
player_list.add(player)             #上下文
fire = Throwable(player.rect.x,player.rect.y,'fire.png',0)
firepower = pygame.sprite.Group()
```

注意，每一个投掷对象的起始位置都是和玩家所在的位置相同。这使得它看起来像是投掷对象来自玩家。在第一个火球生成时，使用 `0` 来显示 `self.firing` 是可用的。

### 在主循环中获取投掷行为

没有在主循环中出现的代码不会在游戏中使用，因此你需要在你的主循环中添加一些东西，以便能在你的游戏世界中获取投掷对象。

首先，添加玩家控制。当前，你没有火力触发器。在键盘上的按键是有两种状态的：释放的按键，按下的按键。为了移动，你要使用这两种状态：按下按键来启动玩家移动，释放按键来停止玩家移动。开火仅需要一个信号。你使用哪个按键事件（按键按下或按键释放）来触发你的投掷对象取决于你的品味。

在这个代码语句块中，前两行是用于上下文的：

```
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump(platform_list)
            if event.key == pygame.K_SPACE:
                if not fire.firing:
                    fire = Throwable(player.rect.x,player.rect.y,'fire.png',1)
                    firepower.add(fire)
```

与你在设置部分创建的火球不同，你使用一个 `1` 来设置 `self.firing` 为不可用。

最后，你必须更新和绘制你的投掷物品。这个顺序很重要，因此把这段代码放置到你现有的 `enemy.move` 和 `player_list.draw` 的代码行之间：

```
    enemy.move()  # 上下文

    if fire.firing:
        fire.update(worldy)
        firepower.draw(world)
    player_list.draw(screen)  # 上下文
    enemy_list.draw(screen)   # 上下文
```

注意，这些更新仅在 `self.firing` 变量被设置为 1 时执行。如果它被设置为 0 ，那么 `fire.firing` 就不为 `true`，接下来就跳过更新。如果你尝试做上述这些更新，不管怎样，你的游戏都会崩溃，因为在游戏中将不会更新或绘制一个 `fire` 对象。

启动你的游戏，尝试挑战你的武器。

### 检测碰撞

如果你玩使用了新投掷技巧的游戏，你可能会注意到，你可以投掷对象，但是它却不会对你的敌人有任何影响。

原因是你的敌人没有被查到碰撞事故。一名敌人可能会被你的投掷物品所击中，但是敌人却从来不知道被击中了。

你已经在你的 `Player` 类中完成了碰撞检测，这非常类似。在你的 `Enemy` 类中，添加一个新的 `update` 函数：

```
    def update(self,firepower, enemy_list):
        """
        检测火力碰撞
        """
        fire_hit_list = pygame.sprite.spritecollide(self,firepower,False)
        for fire in fire_hit_list:
            enemy_list.remove(self)
```

代码很简单。每个敌人对象都检查并看看它自己是否被 `firepower` 精灵组的成员所击中。如果它被击中，那么敌人就会从敌人组中移除和消失。

为集成这些功能到你的游戏之中，在主循环中调用位于新触发语句块中的函数：

```
    if fire.firing:                             # 上下文
        fire.update(worldy)                     # 上下文
        firepower.draw(screen)                  # 上下文
        enemy_list.update(firepower,enemy_list) # 更新敌人
```

你现在可以尝试一下你的游戏了，大多数的事情都如预期般的那样工作。不过，这里仍然有一个问题，那就是投掷的方向。

### 更改投掷机制的方向

当前，你英雄的火球只会向右移动。这是因为 `Throwable` 类的 `update` 函数将像素添加到火球的位置，在 Pygame 中，在 X 轴上一个较大的数字意味着向屏幕的右侧移动。当你的英雄转向另一个方向时，你可能希望它投掷的火球也抛向左侧。

到目前为止，你已经知道如何实现这一点，至少在技术上是这样的。然而，最简单的解决方案却是使用一个变量，在一定程度上对你来说可能是一种新的方法。一般来说，你可以“设置一个标记”（有时也被称为“翻转一个位”）来标明你的英雄所面向的方向。在你做完后，你就可以检查这个变量来得知火球是向左移动还是向右移动。

首先，在你的 `Player` 类中创建一个新的变量来代表你的游戏所面向的方向。因为我的游戏天然地面向右侧，由此我把面向右侧作为默认值：

```
        self.score = 0
        self.facing_right = True  # 添加这行
        self.is_jumping = True
```

当这个变量是 `True` 时，你的英雄精灵是面向右侧的。当玩家每次更改英雄的方向时，变量也必须重新设置，因此，在你的主循环中相关的 `keyup` 事件中这样做：

```
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps, 0)
                player.facing_right = False  # 添加这行
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps, 0)
                player.facing_right = True   # 添加这行
```

最后，更改你的 `Throwable` 类的 `update` 函数，以检测英雄是否面向右侧，并恰当地添加或减去来自火球位置的像素：

```
        if self.rect.y < worldy:
            if player.facing_right:
                self.rect.x += 15
            else:
                self.rect.x -= 15
            self.rect.y += 5
```

再次尝试你的游戏，清除掉你游戏世界中的一些坏人。

![Python 平台类使用投掷能力][15]

作为一项额外的挑战，当彻底打败敌人时，尝试增加你玩家的得分。

### 完整的代码

```
#!/usr/bin/env python3
# 作者: Seth Kenlon

# GPLv3
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
# along with this program.  If not, see <[http://www.gnu.org/licenses/>][17].

import pygame
import pygame.freetype
import sys
import os

'''
变量
'''

worldx = 960
worldy = 720
fps = 40
ani = 4
world = pygame.display.set_mode([worldx, worldy])
forwardx  = 600
backwardx = 120

BLUE = (80, 80, 155)
BLACK = (23, 23, 23)
WHITE = (254, 254, 254)
ALPHA = (0, 255, 0)

tx = 64
ty = 64

font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "fonts", "amazdoom.ttf")
font_size = tx
pygame.freetype.init()
myfont = pygame.freetype.Font(font_path, font_size)

'''
对象
'''

def stats(score, health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), BLUE, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), BLUE, None, size=64)

class Throwable(pygame.sprite.Sprite):
    """
    生成一个投掷的对象
    """
    def __init__(self, x, y, img, throw):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.firing = throw

    def update(self, worldy):
        '''
        投掷物理学
        '''
        if self.rect.y < worldy:
            if player.facing_right:
                self.rect.x += 15
            else:
                self.rect.x -= 15
            self.rect.y += 5
        else:
            self.kill()
            self.firing = 0

# x 位置, y 位置, img 宽度, img 高度, img 文件
class Platform(pygame.sprite.Sprite):
    def __init__(self, xloc, yloc, imgw, imgh, img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img)).convert()
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.y = yloc
        self.rect.x = xloc

class Player(pygame.sprite.Sprite):
    """
    生成一名玩家
    """

    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.health = 10
        self.damage = 0
        self.score = 0
        self.facing_right = True
        self.is_jumping = True
        self.is_falling = True
        self.images = []
        for i in range(1, 5):
            img = pygame.image.load(os.path.join('images', 'walk' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect = self.image.get_rect()

    def gravity(self):
        if self.is_jumping:
            self.movey += 3.2

    def control(self, x, y):
        """
        控制玩家移动
        """
        self.movex += x

    def jump(self):
        if self.is_jumping is False:
            self.is_falling = False
            self.is_jumping = True

    def update(self):
        """
        更新精灵位置
        """

        # 向左移动
        if self.movex < 0:
            self.is_jumping = True
            self.frame += 1
            if self.frame > 3 * ani:
                self.frame = 0
            self.image = pygame.transform.flip(self.images[self.frame // ani], True, False)

        # 向右移动
        if self.movex > 0:
            self.is_jumping = True
            self.frame += 1
            if self.frame > 3 * ani:
                self.frame = 0
            self.image = self.images[self.frame // ani]

        # 碰撞
        enemy_hit_list = pygame.sprite.spritecollide(self, enemy_list, False)
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)
        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # 设置伤害回 0
                self.health -= 1  # 减去 1 单位健康度

        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.bottom = g.rect.top
            self.is_jumping = False  # 停止跳跃

        # 掉落世界
        if self.rect.y > worldy:
            self.health -=1
            print(self.health)
            self.rect.x = tx
            self.rect.y = ty

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.is_jumping = False  # 停止跳跃
            self.movey = 0
            if self.rect.bottom <= p.rect.bottom:
               self.rect.bottom = p.rect.top
            else:
               self.movey += 3.2

        if self.is_jumping and self.is_falling is False:
            self.is_falling = True
            self.movey -= 33  # 跳跃多高

        loot_hit_list = pygame.sprite.spritecollide(self, loot_list, False)
        for loot in loot_hit_list:
            loot_list.remove(loot)
            self.score += 1
            print(self.score)

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)

        self.rect.x += self.movex
        self.rect.y += self.movey

class Enemy(pygame.sprite.Sprite):
    """
    生成一名敌人
    """

    def __init__(self, x, y, img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.counter = 0

    def move(self):
        """
        敌人移动
        """
        distance = 80
        speed = 8

        if self.counter >= 0 and self.counter <= distance:
            self.rect.x += speed
        elif self.counter >= distance and self.counter <= distance * 2:
            self.rect.x -= speed
        else:
            self.counter = 0

        self.counter += 1

    def update(self, firepower, enemy_list):
        """
        检测火力碰撞
        """
        fire_hit_list = pygame.sprite.spritecollide(self, firepower, False)
        for fire in fire_hit_list:
            enemy_list.remove(self)

class Level:
    def ground(lvl, gloc, tx, ty):
        ground_list = pygame.sprite.Group()
        i = 0
        if lvl == 1:
            while i < len(gloc):
                ground = Platform(gloc[i], worldy - ty, tx, ty, 'tile-ground.png')
                ground_list.add(ground)
                i = i + 1

        if lvl == 2:
            print("Level " + str(lvl))

        return ground_list

    def bad(lvl, eloc):
        if lvl == 1:
            enemy = Enemy(eloc[0], eloc[1], 'enemy.png')
            enemy_list = pygame.sprite.Group()
            enemy_list.add(enemy)
        if lvl == 2:
            print("Level " + str(lvl))

        return enemy_list

    # x 位置, y 位置, img 宽度, img 高度, img 文件
    def platform(lvl, tx, ty):
        plat_list = pygame.sprite.Group()
        ploc = []
        i = 0
        if lvl == 1:
            ploc.append((200, worldy - ty - 128, 3))
            ploc.append((300, worldy - ty - 256, 3))
            ploc.append((550, worldy - ty - 128, 4))
            while i &lt; len(ploc):
                j = 0
                while j <= ploc[i][2]:
                    plat = Platform((ploc[i][0] + (j * tx)), ploc[i][1], tx, ty, 'tile.png')
                    plat_list.add(plat)
                    j = j + 1
                print('run' + str(i) + str(ploc[i]))
                i = i + 1

        if lvl == 2:
            print("Level " + str(lvl))

        return plat_list

    def loot(lvl):
        if lvl == 1:
            loot_list = pygame.sprite.Group()
            loot = Platform(tx*5, ty*5, tx, ty, 'loot_1.png')
            loot_list.add(loot)

        if lvl == 2:
            print(lvl)

        return loot_list

'''
Setup 部分
'''

backdrop = pygame.image.load(os.path.join('images', 'stage.png'))
clock = pygame.time.Clock()
pygame.init()
backdropbox = world.get_rect()
main = True

player = Player()         # 生成玩家
player.rect.x = 0         # 转到 x
player.rect.y = 30        # 转到 y
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10
fire = Throwable(player.rect.x, player.rect.y, 'fire.png', 0)
firepower = pygame.sprite.Group()

eloc = []
eloc = [300, worldy-ty-80]
enemy_list = Level.bad(1, eloc)
gloc = []

i = 0
while i &lt;= (worldx / tx) + tx:
    gloc.append(i * tx)
    i = i + 1

ground_list = Level.ground(1, gloc, tx, ty)
plat_list = Level.platform(1, tx, ty)
enemy_list = Level.bad( 1, eloc )
loot_list = Level.loot(1)

'''
主循环
'''

while main:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            try:
                sys.exit()
            finally:
                main = False

        if event.type == pygame.KEYDOWN:
            if event.key == ord('q'):
                pygame.quit()
                try:
                    sys.exit()
                finally:
                    main = False
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(-steps, 0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(steps, 0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump()

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps, 0)
                player.facing_right = False
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps, 0)
                player.facing_right = True
            if event.key == pygame.K_SPACE:
                if not fire.firing:
                    fire = Throwable(player.rect.x, player.rect.y, 'fire.png', 1)
                    firepower.add(fire)

    # 向向滚动世界
    if player.rect.x >= forwardx:
        scroll = player.rect.x - forwardx
        player.rect.x = forwardx
        for p in plat_list:
            p.rect.x -= scroll
        for e in enemy_list:
            e.rect.x -= scroll
        for l in loot_list:
            l.rect.x -= scroll

    # 向后滚动世界
    if player.rect.x <= backwardx:
        scroll = backwardx - player.rect.x
        player.rect.x = backwardx
        for p in plat_list:
            p.rect.x += scroll
        for e in enemy_list:
            e.rect.x += scroll
        for l in loot_list:
            l.rect.x += scroll

    world.blit(backdrop, backdropbox)
    player.update()
    player.gravity()
    player_list.draw(world)
    if fire.firing:
        fire.update(worldy)
        firepower.draw(world)
    enemy_list.draw(world)
    enemy_list.update(firepower, enemy_list)
    loot_list.draw(world)
    ground_list.draw(world)
    plat_list.draw(world)
    for e in enemy_list:
        e.move()
    stats(player.score, player.health)
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/add-throwing-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/game_pawn_grid_linux.png?itok=4gERzRkg (Gaming on a grid with penguin pawns)
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
[15]: https://opensource.com/sites/default/files/uploads/pygame-throw.jpg (Python platformer with throwing capability)
[16]: https://creativecommons.org/licenses/by-sa/4.0/
[17]: http://www.gnu.org/licenses/\>
