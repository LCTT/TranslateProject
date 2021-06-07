[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11839-1.html)
[#]: subject: (Add scorekeeping to your Python game)
[#]: via: (https://opensource.com/article/20/1/add-scorekeeping-your-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

添加计分到你的 Python 游戏
======

> 在本系列的第十一篇有关使用 Python Pygame 模块进行编程的文章中，显示玩家获得战利品或受到伤害时的得分。

![](https://img.linux.net.cn/data/attachment/album/202002/01/154838led0y08y2aqetz1q.jpg)

这是仍在进行中的关于使用 [Pygame][3] 模块来在 [Python 3][2] 在创建电脑游戏的第十一部分。先前的文章是：

  * [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][4]
  * [使用 Python 和 Pygame 模块构建一个游戏框架][5]
  * [如何在你的 Python 游戏中添加一个玩家][6]
  * [用 Pygame 使你的游戏角色移动起来][7]
  * [如何向你的 Python 游戏中添加一个敌人][8]
  * [在 Pygame 游戏中放置平台][19]
  * [在你的 Python 游戏中模拟引力][9]
  * [为你的 Python 平台类游戏添加跳跃功能][10]
  * [使你的 Python 游戏玩家能够向前和向后跑][11]
  * [在你的 Python 平台类游戏中放一些奖励][12]

如果你已经跟随这一系列很久，那么已经学习了使用 Python 创建一个视频游戏所需的所有基本语法和模式。然而，它仍然缺少一个至关重要的组成部分。这一组成部分不仅仅对用 Python 编程游戏重要；不管你探究哪个计算机分支，你都必需精通：作为一个程序员，通过阅读一种语言的或库的文档来学习新的技巧。

幸运的是，你正在阅读本文的事实表明你熟悉文档。为了使你的平台类游戏更加美观，在这篇文章中，你将在游戏屏幕上添加得分和生命值显示。不过，教你如何找到一个库的功能以及如何使用这些新的功能的这节课程并没有多神秘。

### 在 Pygame 中显示得分

现在，既然你有了可以被玩家收集的奖励，那就有充分的理由来记录分数，以便你的玩家看到他们收集了多少奖励。你也可以跟踪玩家的生命值，以便当他们被敌人击中时会有相应结果。

你已经有了跟踪分数和生命值的变量，但是这一切都发生在后台。这篇文章教你在游戏期间在游戏屏幕上以你选择的一种字体来显示这些统计数字。

### 阅读文档

大多数 Python 模块都有文档，即使那些没有文档的模块，也能通过 Python 的帮助功能来进行最小的文档化。[Pygame 的主页面][13] 链接了它的文档。不过，Pygame 是一个带有很多文档的大模块，并且它的文档不像在 Opensource.com 上的文章一样，以同样易理解的（和友好的、易解释的、有用的）叙述风格来撰写的。它们是技术文档，并且列出在模块中可用的每个类和函数，各自要求的输入类型等等。如果你不适应参考代码组件描述，这可能会令人不知所措。

在烦恼于库的文档前，第一件要做的事，就是来想想你正在尝试达到的目标。在这种情况下，你想在屏幕上显示玩家的得分和生命值。

在你确定你需要的结果后，想想它需要什么的组件。你可以从变量和函数的方面考虑这一点，或者，如果你还没有自然地想到这一点，你可以进行一般性思考。你可能意识到需要一些文本来显示一个分数，你希望 Pygame 在屏幕上绘制这些文本。如果你仔细思考，你可能会意识到它与在屏幕上渲染一个玩家、奖励或一个平台并多么大的不同。

从技术上讲，你*可以*使用数字图形，并让 Pygame 显示这些数字图形。它不是达到你目标的最容易的方法，但是如果它是你唯一知道的方法，那么它是一个有效的方法。不过，如果你参考 Pygame 的文档，你看到列出的模块之一是 `font`，这是 Pygame 使得在屏幕上来使打印文本像输入文字一样容易的方法。

### 解密技术文档

`font` 文档页面以 `pygame.font.init()` 开始，它列出了用于初始化字体模块的函数。它由 `pygame.init()` 自动地调用，你已经在代码中调用了它。再强调一次，从技术上讲，你已经到达一个*足够好*的点。虽然你尚不知道*如何做*，你知道你*能够*使用 `pygame.font` 函数来在屏幕上打印文本。

然而，如果你阅读更多一些，你会找到这里还有一种更好的方法来打印字体。`pygame.freetype` 模块在文档中的描述方式如下：

> `pygame.freetype` 模块是 `pygame.fontpygame` 模块的一个替代品，用于加载和渲染字体。它有原函数的所有功能，外加很多新的功能。

在 `pygame.freetype` 文档页面的下方，有一些示例代码：

```
import pygame
import pygame.freetype
```

你的代码应该已经导入了 Pygame，不过，请修改你的 `import` 语句以包含 Freetype 模块：

```
import pygame
import sys
import os
import pygame.freetype
```

### 在 Pygame 中使用字体

从  `font` 模块的描述中可以看出，显然 Pygame 使用一种字体（不管它的你提供的或内置到 Pygame 的默认字体）在屏幕上渲染字体。滚动浏览 `pygame.freetype` 文档来找到 `pygame.freetype.Font` 函数：

```
pygame.freetype.Font
从支持的字体文件中创建一个新的字体实例。

Font(file, size=0, font_index=0, resolution=0, ucs4=False) -> Font

pygame.freetype.Font.name
  符合规则的字体名称。

pygame.freetype.Font.path
  字体文件路径。

pygame.freetype.Font.size
  在渲染中使用的默认点大小
```

这描述了如何在 Pygame 中构建一个字体“对象”。把屏幕上的一个简单对象视为一些代码属性的组合对你来说可能不太自然，但是这与你构建英雄和敌人精灵的方式非常类似。你需要一个字体文件，而不是一个图像文件。在你有一个字体文件后，你可以在你的代码中使用 `pygame.freetype.Font` 函数来创建一个字体对象，然后使用该对象来在屏幕上渲染文本。

因为并不是世界上的每个人的电脑上都有完全一样的字体，因此将你选择的字体与你的游戏捆绑在一起是很重要的。要捆绑字体，首先在你的游戏文件夹中创建一个新的目录，放在你为图像而创建的文件目录旁边。称其为 `fonts` 。

即使你的计算机操作系统随附了几种字体，但是将这些字体给予其他人是非法的。这看起来很奇怪，但法律就是这样运作的。如果想与你的游戏一起随附一种字体，你必需找到一种开源或知识共享的字体，以允许你随游戏一起提供该字体。

专门提供自由和合法字体的网站包括：

  * [Font Library][14]
  * [Font Squirrel][15]
  * [League of Moveable Type][16]

当你找到你喜欢的字体后，下载下来。解压缩 ZIP 或 [TAR][17] 文件，并移动 `.ttf` 或 `.otf` 文件到你的项目目录下的 `fonts` 文件夹中。

你没有安装字体到你的计算机上。你只是放置字体到你游戏的 `fonts` 文件夹中，以便 Pygame 可以使用它。如果你想，你*可以*在你的计算机上安装该字体，但是没有必要。重要的是将字体放在你的游戏目录中，这样 Pygame 可以“描绘”字体到屏幕上。

如果字体文件的名称复杂且带有空格或特殊字符，只需要重新命名它即可。文件名称是完全任意的，并且对你来说，文件名称越简单，越容易将其键入你的代码中。

现在告诉 Pygame 你的字体。从文档中你知道，当你至少提供了字体文件路径给 `pygame.freetype.Font` 时（文档明确指出所有其余属性都是可选的），你将在返回中获得一个字体对象：

```
Font(file, size=0, font_index=0, resolution=0, ucs4=False) -> Font
```

创建一个称为 `myfont` 的新变量来充当你在游戏中字体，并放置 `Font` 函数的结果到这个变量中。这个示例中使用 `amazdoom.ttf` 字体，但是你可以使用任何你想使用的字体。在你的设置部分放置这些代码：

```
font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),"fonts","amazdoom.ttf")
font_size = tx
myfont = pygame.freetype.Font(font_path, font_size)
```

### 在 Pygame 中显示文本

现在你已经创建一个字体对象，你需要一个函数来绘制你想绘制到屏幕上的文本。这和你在你的游戏中绘制背景和平台是相同的原理。

首先，创建一个函数，并使用 `myfont` 对象来创建一些文本，设置颜色为某些 RGB 值。这必须是一个全局函数；它不属于任何具体的类：

```
def stats(score,health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), WHITE, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), WHITE, None, size=64)
```

当然，你此刻已经知道，如果它不在主循环中，你的游戏将不会发生任何事，所以在文件的底部添加一个对你的 `stats` 函数的调用：

```
    for e in enemy_list:
        e.move()
    stats(player.score,player.health) # draw text
    pygame.display.flip()
```

尝试你的游戏。

当玩家收集奖励品时，得分会上升。当玩家被敌人击中时，生命值下降。成功！

![Keeping score in Pygame][18]

不过，这里有一个问题。当一个玩家被敌人击中时，健康度会*一路*下降，这是不公平的。你刚刚发现一个非致命的错误。非致命的错误是这些在应用程序中小问题，（通常）不会阻止应用程序启动或甚至导致停止工作，但是它们要么没有意义，要么会惹恼用户。这里是如何解决这个问题的方法。

### 修复生命值计数

当前生命值系统的问题是，敌人接触玩家时，Pygame 时钟的每一次滴答，健康度都会减少。这意味着一个缓慢移动的敌人可能在一次遭遇中将一个玩家降低健康度至 -200 ，这不公平。当然，你可以给你的玩家一个 10000 的起始健康度得分，而不用担心它；这可以工作，并且可能没有人会注意。但是这里有一个更好的方法。

当前，你的代码侦查出一个玩家和一个敌人发生碰撞的时候。生命值问题的修复是检测*两个*独立的事件：什么时候玩家和敌人碰撞，并且，在它们碰撞后，什么时候它们*停止*碰撞。

首先，在你的玩家类中，创建一个变量来代表玩家和敌人碰撞在一起：

```
        self.frame = 0
        self.health = 10
        self.damage = 0
```

在你的 `Player` 类的 `update` 函数中，*移除*这块代码块：

```
        for enemy in enemy_hit_list:
            self.health -= 1
            #print(self.health)
```

并且在它的位置，只要玩家当前没有被击中，检查碰撞：

```
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)
```

你可能会在你删除的语句块和你刚刚添加的语句块之间看到相似之处。它们都在做相同的工作，但是新的代码更复杂。最重要的是，只有当玩家*当前*没有被击中时，新的代码才运行。这意味着，当一个玩家和敌人碰撞时，这些代码运行一次，而不是像以前那样一直发生碰撞。

新的代码使用两个新的 Pygame 函数。`self.rect.contains` 函数检查一个敌人当前是否在玩家的边界框内，并且当它是 `true` 时， `self.rect.colliderect` 设置你的新的 `self.damage` 变量为 1，而不管它多少次是 `true` 。

现在，即使被一个敌人击中 3 秒，对 Pygame 来说仍然看作一次击中。

我通过通读 Pygame 的文档而发现了这些函数。你没有必要一次阅读完全部的文档，并且你也没有必要阅读每个函数的每个单词。不过，花费时间在你正在使用的新的库或模块的文档上是很重要的；否则，你极有可能在重新发明轮子。不要花费一个下午的时间来尝试修改拼接一个解决方案到一些东西，而这些东西已经被你正在使用的框架的所解决。阅读文档，知悉函数，并从别人的工作中获益！

最后，添加另一个代码语句块来侦查出什么时候玩家和敌人不再接触。然后直到那时，才从玩家减少一个生命值。

```
        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # set damage back to 0
                self.health -= 1  # subtract 1 hp
```

注意，*只有*当玩家被击中时，这个新的代码才会被触发。这意味着，在你的玩家在你的游戏世界正在探索或收集奖励时，这个代码不会运行。它仅当 `self.damage` 变量被激活时运行。

当代码运行时，它使用 `self.rect.collidelist` 来查看玩家是否*仍然*接触在你敌人列表中的敌人（当其未侦查到碰撞时，`collidelist` 返回 -1）。在它没有接触敌人时，是该处理 `self.damage` 的时机：通过设置 `self.damage` 变量回到 0 来使其无效，并减少一点生命值。

现在尝试你的游戏。

### 得分反应

现在，你有一个来让你的玩家知道它们分数和生命值的方法，当你的玩家达到某些里程碑时，你可以确保某些事件发生。例如，也许这里有一个特殊的恢复一些生命值的奖励项目。也许一个到达 0 生命值的玩家不得不从一个关卡的起始位置重新开始。

你可以在你的代码中检查这些事件，并且相应地操纵你的游戏世界。你已经知道该怎么做，所以请浏览文档来寻找新的技巧，并且独立地尝试这些技巧。

这里是到目前为止所有的代码：

```
#!/usr/bin/env python3
# draw a world
# add a player and player control
# add player movement
# add enemy and basic collision
# add platform
# add gravity
# add jumping
# add scrolling
# add loot
# add score

# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import pygame
import sys
import os
import pygame.freetype

'''
Objects
'''
       
class Platform(pygame.sprite.Sprite):
    # x location, y location, img width, img height, img file    
    def __init__(self,xloc,yloc,imgw,imgh,img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img)).convert()
        self.image.convert_alpha()
        self.rect = self.image.get_rect()
        self.rect.y = yloc
        self.rect.x = xloc

class Player(pygame.sprite.Sprite):
    '''
    Spawn a player
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.health = 10
        self.damage = 0
        self.collide_delta = 0
        self.jump_delta = 6
        self.score = 1
        self.images = []
        for i in range(1,9):
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect  = self.image.get_rect()

    def jump(self,platform_list):
        self.jump_delta = 0

    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y > worldy and self.movey >= 0:
            self.movey = 0
            self.rect.y = worldy-ty
       
    def control(self,x,y):
        '''
        control player movement
        '''
        self.movex += x
        self.movey += y
       
    def update(self):
        '''
        Update sprite position
        '''
       
        self.rect.x = self.rect.x + self.movex
        self.rect.y = self.rect.y + self.movey

        # moving left
        if self.movex < 0:
            self.frame += 1
            if self.frame > ani*3:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # moving right
        if self.movex > 0:
            self.frame += 1
            if self.frame > ani*3:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]

        # collisions
        enemy_hit_list = pygame.sprite.spritecollide(self, enemy_list, False)
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)

        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # set damage back to 0
                self.health -= 1  # subtract 1 hp

        loot_hit_list = pygame.sprite.spritecollide(self, loot_list, False)
        for loot in loot_hit_list:
            loot_list.remove(loot)
            self.score += 1
            print(self.score)

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.collide_delta = 0 # stop jumping
            self.movey = 0
            if self.rect.y > p.rect.y:
                self.rect.y = p.rect.y+ty
            else:
                self.rect.y = p.rect.y-ty
           
        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.y = worldy-ty-ty
            self.collide_delta = 0 # stop jumping
            if self.rect.y > g.rect.y:
                self.health -=1
                print(self.health)
               
        if self.collide_delta < 6 and self.jump_delta < 6:
            self.jump_delta = 6*2
            self.movey -= 33  # how high to jump
            self.collide_delta += 6
            self.jump_delta    += 6
           
class Enemy(pygame.sprite.Sprite):
    '''
    Spawn an enemy
    '''
    def __init__(self,x,y,img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img))
        self.movey = 0
        #self.image.convert_alpha()
        #self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.counter = 0

               
    def move(self):
        '''
        enemy movement
        '''
        distance = 80
        speed = 8

        self.movey += 3.2
       
        if self.counter >= 0 and self.counter <= distance:
            self.rect.x += speed
        elif self.counter >= distance and self.counter <= distance*2:
            self.rect.x -= speed
        else:
            self.counter = 0
       
        self.counter += 1

        if not self.rect.y >= worldy-ty-ty:
            self.rect.y += self.movey

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.movey = 0
            if self.rect.y > p.rect.y:
                self.rect.y = p.rect.y+ty
            else:
                self.rect.y = p.rect.y-ty

        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.rect.y = worldy-ty-ty

       
class Level():
    def bad(lvl,eloc):
        if lvl == 1:
            enemy = Enemy(eloc[0],eloc[1],'yeti.png') # spawn enemy
            enemy_list = pygame.sprite.Group() # create enemy group
            enemy_list.add(enemy)              # add enemy to group
           
        if lvl == 2:
            print("Level " + str(lvl) )

        return enemy_list

    def loot(lvl,tx,ty):
        if lvl == 1:
            loot_list = pygame.sprite.Group()
            loot = Platform(200,ty*7,tx,ty, 'loot_1.png')
            loot_list.add(loot)

        if lvl == 2:
            print(lvl)

        return loot_list

    def ground(lvl,gloc,tx,ty):
        ground_list = pygame.sprite.Group()
        i=0
        if lvl == 1:
            while i < len(gloc):
                ground = Platform(gloc[i],worldy-ty,tx,ty,'ground.png')
                ground_list.add(ground)
                i=i+1

        if lvl == 2:
            print("Level " + str(lvl) )

        return ground_list

    def platform(lvl,tx,ty):
        plat_list = pygame.sprite.Group()
        ploc = []
        i=0
        if lvl == 1:
            ploc.append((20,worldy-ty-128,3))
            ploc.append((300,worldy-ty-256,3))
            ploc.append((500,worldy-ty-128,4))

            while i < len(ploc):
                j=0
                while j <= ploc[i][2]:
                    plat = Platform((ploc[i][0]+(j*tx)),ploc[i][1],tx,ty,'ground.png')
                    plat_list.add(plat)
                    j=j+1
                print('run' + str(i) + str(ploc[i]))
                i=i+1

        if lvl == 2:
            print("Level " + str(lvl) )

        return plat_list

def stats(score,health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), SNOWGRAY, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), SNOWGRAY, None, size=64)

'''
Setup
'''
worldx = 960
worldy = 720

fps = 40 # frame rate
ani = 4  # animation cycles
clock = pygame.time.Clock()
pygame.init()
main = True

BLUE  = (25,25,200)
BLACK = (23,23,23 )
WHITE = (254,254,254)
SNOWGRAY = (137,164,166)
ALPHA = (0,255,0)
   
world = pygame.display.set_mode([worldx,worldy])
backdrop = pygame.image.load(os.path.join('images','stage.png')).convert()
backdropbox = world.get_rect()
player = Player() # spawn player
player.rect.x = 0
player.rect.y = 0
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10
forwardx = 600
backwardx = 230

eloc = []
eloc = [200,20]
gloc = []
tx = 64 #tile size
ty = 64 #tile size

font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),"fonts","amazdoom.ttf")
font_size = tx
myfont = pygame.freetype.Font(font_path, font_size)
   
i=0
while i <= (worldx/tx)+tx:
    gloc.append(i*tx)
    i=i+1

enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )
plat_list = Level.platform( 1,tx,ty )
loot_list = Level.loot(1,tx,ty)

'''
Main loop
'''
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                print("LEFT")
                player.control(-steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                print("RIGHT")
                player.control(steps,0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                print('jump')

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps,0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps,0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump(plat_list)

            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False

    # scroll the world forward
    if player.rect.x >= forwardx:
        scroll = player.rect.x - forwardx
        player.rect.x = forwardx
        for p in plat_list:
            p.rect.x -= scroll
        for e in enemy_list:
            e.rect.x -= scroll
        for l in loot_list:

            l.rect.x -= scroll
               
    # scroll the world backward
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
    player.gravity() # check gravity
    player.update()
    player_list.draw(world) #refresh player position
    enemy_list.draw(world)  # refresh enemies
    ground_list.draw(world)  # refresh enemies
    plat_list.draw(world)   # refresh platforms
    loot_list.draw(world)   # refresh loot
    for e in enemy_list:
        e.move()
    stats(player.score,player.health) # draw text
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/add-scorekeeping-your-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_maze.png?itok=mZ5LP4-X (connecting yellow dots in a maze)
[2]: https://www.python.org/
[3]: https://www.pygame.org/news
[4]: https://linux.cn/article-9071-1.html
[5]: https://linux.cn/article-10850-1.html
[6]: https://linux.cn/article-10858-1.html
[7]: https://linux.cn/article-10874-1.html
[8]: https://linux.cn/article-10883-1.html
[9]: https://linux.cn/article-11780-1.html
[10]: https://linux.cn/article-11790-1.html
[11]: https://linux.cn/article-11819-1.html
[12]: https://linux.cn/article-11828-1.html
[13]: http://pygame.org/news
[14]: https://fontlibrary.org/
[15]: https://www.fontsquirrel.com/
[16]: https://www.theleagueofmoveabletype.com/
[17]: https://opensource.com/article/17/7/how-unzip-targz-file
[18]: https://opensource.com/sites/default/files/uploads/pygame-score.jpg (Keeping score in Pygame)
[19]: https://linux.cn/article-10902-1.html
