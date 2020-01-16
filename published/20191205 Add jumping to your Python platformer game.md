[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11790-1.html)
[#]: subject: (Add jumping to your Python platformer game)
[#]: via: (https://opensource.com/article/19/12/jumping-python-platformer-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为你的 Python 平台类游戏添加跳跃功能
======

> 在本期使用 Python Pygame 模块编写视频游戏中，学会如何使用跳跃来对抗重力。

![](https://img.linux.net.cn/data/attachment/album/202001/16/214917c8mxn82fot82fx88.jpg)

在本系列的 [前一篇文章][2] 中，你已经模拟了重力。但现在，你需要赋予你的角色跳跃的能力来对抗重力。

跳跃是对重力作用的暂时延缓。在这一小段时间里，你是向*上*跳，而不是被重力拉着向下落。但你一旦到达了跳跃的最高点，重力就会重新发挥作用，将你拉回地面。

在代码中，这种变化被表示为变量。首先，你需要为玩家精灵建立一个变量，使得 Python 能够跟踪该精灵是否正在跳跃中。一旦玩家精灵开始跳跃，他就会再次受到重力的作用，并被拉回最近的物体。

### 设置跳跃状态变量

你需要为你的 `Player` 类添加两个新变量：

  * 一个是为了跟踪你的角色是否正在跳跃中，可通过你的玩家精灵是否站在坚实的地面来确定
  * 一个是为了将玩家带回地面

将如下两个变量添加到你的 `Player` 类中。在下方的代码中，注释前的部分用于提示上下文，因此只需要添加最后两行：

```
                self.movex = 0
                self.movey = 0
                self.frame = 0
                self.health = 10
                # 此处是重力相关变量
                self.collide_delta = 0
                self.jump_delta = 6
```

第一个变量 `collide_delta` 被设为 0 是因为在正常状态下，玩家精灵没有处在跳跃中的状态。另一个变量 `jump_delta` 被设为 6，是为了防止精灵在第一次进入游戏世界时就发生反弹（实际上就是跳跃）。当你完成了本篇文章的示例，尝试把该变量设为 0 看看会发生什么。

### 跳跃中的碰撞

如果你是跳到一个蹦床上，那你的跳跃一定非常优美。但是如果你是跳向一面墙会发生什么呢？（千万不要去尝试！）不管你的起跳多么令人印象深刻，当你撞到比你更大更硬的物体时，你都会立马停下。（LCTT 译注：原理参考动量守恒定律）

为了在你的视频游戏中模拟这一点，你需要在你的玩家精灵与地面等东西发生碰撞时，将 `self.collide_delta` 变量设为 0。如果你的 `self.collide_delta` 不是 0 而是其它的什么值，那么你的玩家就会发生跳跃，并且当你的玩家与墙或者地面发生碰撞时无法跳跃。

在你的 `Player` 类的 `update` 方法中，将地面碰撞相关代码块修改为如下所示：

```
        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.y = worldy-ty-ty
            self.collide_delta = 0 # 停止跳跃
            if self.rect.y > g.rect.y:
                self.health -=1
                print(self.health)
```

这段代码块检查了地面精灵和玩家精灵之间发生的碰撞。当发生碰撞时，它会将玩家 Y 方向的坐标值设置为游戏窗口的高度减去一个瓷砖的高度再减去另一个瓷砖的高度。以此保证了玩家精灵是站在地面*上*，而不是嵌在地面里。同时它也将 `self.collide_delta` 设为 0，使得程序能够知道玩家未处在跳跃中。除此之外，它将 `self.movey` 设为 0，使得程序能够知道玩家当前未受到重力的牵引作用（这是游戏物理引擎的奇怪之处，一旦玩家落地，也就没有必要继续将玩家拉向地面）。

此处 `if` 语句用来检测玩家是否已经落到地面之*下*，如果是，那就扣除一点生命值作为惩罚。此处假定了你希望当你的玩家落到地图之外时失去生命值。这个设定不是必需的，它只是平台类游戏的一种惯例。更有可能的是，你希望这个事件能够触发另一些事件，或者说是一种能够让你的现实世界玩家沉迷于让精灵掉到屏幕之外的东西。一种简单的恢复方式是在玩家精灵掉落到地图之外时，将 `self.rect.y` 重新设置为 0，这样它就会在地图上方重新生成，并落到坚实的地面上。

### 撞向地面

模拟的重力使你玩家的 Y 坐标不断增大（LCTT 译注：此处原文中为 0，但在 Pygame 中越靠下方 Y 坐标应越大）。要实现跳跃，完成如下代码使你的玩家精灵离开地面，飞向空中。

在你的 `Player` 类的 `update` 方法中，添加如下代码来暂时延缓重力的作用：

```
        if self.collide_delta < 6 and self.jump_delta < 6:
            self.jump_delta = 6*2
            self.movey -= 33  # 跳跃的高度
            self.collide_delta += 6
            self.jump_delta    += 6
```

根据此代码所示，跳跃使玩家精灵向空中移动了 33 个像素。此处是*负* 33 是因为在 Pygame 中，越小的数代表距离屏幕顶端越近。

不过此事件视条件而定，只有当 `self.collide_delta` 小于 6（缺省值定义在你 `Player` 类的 `init` 方法中）并且 `self.jump_delta` 也于 6 的时候才会发生。此条件能够保证直到玩家碰到一个平台，才能触发另一次跳跃。换言之，它能够阻止空中二段跳。

在某些特殊条件下，你可能不想阻止空中二段跳，或者说你允许玩家进行空中二段跳。举个栗子，如果玩家获得了某个战利品，那么在他被敌人攻击到之前，都能够拥有空中二段跳的能力。

当你完成本篇文章中的示例，尝试将 `self.collide_delta` 和 `self.jump_delta` 设置为 0，从而获得百分之百的几率触发空中二段跳。

### 在平台上着陆

目前你已经定义了在玩家精灵摔落地面时的抵抗重力条件，但此时你的游戏代码仍保持平台与地面置于不同的列表中（就像本文中做的很多其他选择一样，这个设定并不是必需的，你可以尝试将地面作为另一种平台）。为了允许玩家精灵站在平台之上，你必须像检测地面碰撞一样，检测玩家精灵与平台精灵之间的碰撞。将如下代码放于你的 `update` 方法中：

```
        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.collide_delta = 0 # 跳跃结束
            self.movey = 0
```

但此处还有一点需要考虑：平台悬在空中，也就意味着玩家可以通过从上面或者从下面接触平台来与之互动。

确定平台如何与玩家互动取决于你，阻止玩家从下方到达平台也并不稀奇。将如下代码加到上方的代码块中，使得平台表现得像天花板或者说是藤架。只有在玩家精灵跳得比平台上沿更高时才能跳到平台上，但会阻止玩家从平台下方跳上来：

```
            if self.rect.y > p.rect.y:
                self.rect.y = p.rect.y+ty
            else:
                self.rect.y = p.rect.y-ty
```

此处 `if` 语句代码块的第一个子句阻止玩家精灵从平台正下方跳到平台上。如果它检测到玩家精灵的坐标比平台更大（在 Pygame 中，坐标更大意味着在屏幕的更下方），那么将玩家精灵新的 Y 坐标设置为当前平台的 Y 坐标加上一个瓷砖的高度。实际效果就是保证玩家精灵距离平台一个瓷砖的高度，防止其从下方穿过平台。

`else` 子句做了相反的事情。当程序运行到此处时，如果玩家精灵的 Y 坐标*不*比平台的更大，意味着玩家精灵是从空中落下（不论是由于玩家刚刚从此处生成，或者是玩家执行了跳跃）。在这种情况下，玩家精灵的 Y 坐标被设为平台的 Y 坐标减去一个瓷砖的高度（切记，在 Pygame 中更小的 Y 坐标代表在屏幕上的更高处）。这样就能保证玩家在平台*上*，除非他从平台上跳下来或者走下来。

你也可以尝试其他的方式来处理玩家与平台之间的互动。举个栗子，也许玩家精灵被设定为处在平台的“前面”，他能够无障碍地跳跃穿过平台并站在上面。或者你可以设计一种平台会减缓而又不完全阻止玩家的跳跃过程。甚至你可以通过将不同平台分到不同列表中来混合搭配使用。

### 触发一次跳跃

目前为此，你的代码已经模拟了所有必需的跳跃条件，但仍缺少一个跳跃触发器。你的玩家精灵的 `self.jump_delta` 初始值被设置为 6，只有当它比 6 小的时候才会触发更新跳跃的代码。

为跳跃变量设置一个新的设置方法，在你的 `Player` 类中创建一个 `jump` 方法，并将 `self.jump_delta` 设为小于 6 的值。通过使玩家精灵向空中移动 33 个像素，来暂时减缓重力的作用。


```
    def jump(self,platform_list):
        self.jump_delta = 0
```

不管你相信与否，这就是 `jump` 方法的全部。剩余的部分在 `update` 方法中，你已经在前面实现了相关代码。

要使你游戏中的跳跃功能生效，还有最后一件事情要做。如果你想不起来是什么，运行游戏并观察跳跃是如何生效的。

问题就在于你的主循环中没有调用 `jump` 方法。先前你已经为该方法创建了一个按键占位符，现在，跳跃键所做的就是将 `jump` 打印到终端。

### 调用 jump 方法

在你的主循环中，将*上*方向键的效果从打印一条调试语句，改为调用 `jump` 方法。

注意此处，与 `update` 方法类似，`jump` 方法也需要检测碰撞，因此你需要告诉它使用哪个 `plat_list`。

```
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump(plat_list)
```

如果你倾向于使用空格键作为跳跃键，使用 `pygame.K_SPACE` 替代 `pygame.K_UP` 作为按键。另一种选择，你可以同时使用两种方式（使用单独的 `if` 语句），给玩家多一种选择。

现在来尝试你的游戏吧！在下一篇文章中，你将让你的游戏卷动起来。

![Pygame 平台类游戏][3]

以下是目前为止的所有代码：

```
#!/usr/bin/env python3
# draw a world
# add a player and player control
# add player movement
# add enemy and basic collision
# add platform
# add gravity
# add jumping

# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import pygame
import sys
import os

'''
Objects
'''

class Platform(pygame.sprite.Sprite):
    # x 坐标，y 坐标，图像宽度，图像高度，图像文件
    def __init__(self,xloc,yloc,imgw,imgh,img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img)).convert()
        self.image.convert_alpha()
        self.rect = self.image.get_rect()
        self.rect.y = yloc
        self.rect.x = xloc

class Player(pygame.sprite.Sprite):
    '''
    生成一个玩家
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.health = 10
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
            self.rect  = self.image.get_rect()

    def jump(self,platform_list):
        self.jump_delta = 0

    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y > worldy and self.movey >= 0:
            self.movey = 0
            self.rect.y = worldy-ty
       
    def control(self,x,y):
        '''
        控制玩家移动
        '''
        self.movex += x
        self.movey += y
       
    def update(self):
        '''
        更新精灵位置
        '''
       
        self.rect.x = self.rect.x + self.movex
        self.rect.y = self.rect.y + self.movey

        # 向左移动
        if self.movex < 0:
            self.frame += 1
            if self.frame > ani*3:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # 向右移动
        if self.movex > 0:
            self.frame += 1
            if self.frame > ani*3:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]

        # 碰撞
        enemy_hit_list = pygame.sprite.spritecollide(self, enemy_list, False)
        for enemy in enemy_hit_list:
            self.health -= 1
            #print(self.health)

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
            self.movey -= 33  # how high to jump
            self.collide_delta += 6
            self.jump_delta    += 6
           
class Enemy(pygame.sprite.Sprite):
    '''
    生成一个敌人
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
        敌人移动
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
            enemy = Enemy(eloc[0],eloc[1],'yeti.png') # 生成敌人
            enemy_list = pygame.sprite.Group() # 创建敌人组
            enemy_list.add(enemy)              # 将敌人添加到敌人组
           
        if lvl == 2:
            print("Level " + str(lvl) )

        return enemy_list

    def loot(lvl,lloc):
        print(lvl)

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
            ploc.append((0,worldy-ty-128,3))
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

'''
Setup
'''
worldx = 960
worldy = 720

fps = 40 # 帧率
ani = 4  # 动画循环
clock = pygame.time.Clock()
pygame.init()
main = True

BLUE  = (25,25,200)
BLACK = (23,23,23 )
WHITE = (254,254,254)
ALPHA = (0,255,0)

world = pygame.display.set_mode([worldx,worldy])
backdrop = pygame.image.load(os.path.join('images','stage.png')).convert()
backdropbox = world.get_rect()
player = Player() # 生成玩家
player.rect.x = 0
player.rect.y = 0
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10 # how fast to move
jump = -24

eloc = []
eloc = [200,20]
gloc = []
#gloc = [0,630,64,630,128,630,192,630,256,630,320,630,384,630]
tx = 64 # 瓷砖尺寸
ty = 64 # 瓷砖尺寸

i=0
while i <= (worldx/tx)+tx:
    gloc.append(i*tx)
    i=i+1

enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )
plat_list = Level.platform( 1,tx,ty )

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

#    world.fill(BLACK)
    world.blit(backdrop, backdropbox)
    player.gravity() # 检查重力
    player.update()
    player_list.draw(world) # 刷新玩家位置
    enemy_list.draw(world)  # 刷新敌人
    ground_list.draw(world)  # 刷新地面
    plat_list.draw(world)   # 刷新平台
    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

本期是使用 [Pygame][5] 模块在 [Python 3][4] 中创建视频游戏连载系列的第 7 期。往期文章为：

  * [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][6]
  * [使用 Python 和 Pygame 模块构建一个游戏框架][7]
  * [如何在你的 Python 游戏中添加一个玩家][8]
  * [用 Pygame 使你的游戏角色移动起来][9]
  * [如何向你的 Python 游戏中添加一个敌人][10]
  * [在 Pygame 游戏中放置平台][11]
  * [在你的 Python 游戏中模拟引力][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/jumping-python-platformer-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32 (Arcade games)
[2]: https://linux.cn/article-11780-1.html
[3]: https://opensource.com/sites/default/files/uploads/pygame-jump.jpg (Pygame platformer)
[4]: https://www.python.org/
[5]: https://www.pygame.org/
[6]: https://linux.cn/article-9071-1.html
[7]: https://linux.cn/article-10850-1.html
[8]: https://linux.cn/article-10858-1.html
[9]: https://linux.cn/article-10874-1.html
[10]: https://linux.cn/article-10883-1.html
[11]: https://linux.cn/article-10902-1.html
