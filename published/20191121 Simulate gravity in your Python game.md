[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11780-1.html)
[#]: subject: (Simulate gravity in your Python game)
[#]: via: (https://opensource.com/article/19/11/simulate-gravity-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在你的 Python 游戏中模拟引力
======

> 学习如何使用 Python 的 Pygame 模块编程电脑游戏，并开始操作引力。

![](https://img.linux.net.cn/data/attachment/album/202001/13/223923k6t4zmvvmo6tfmmg.png)

真实的世界充满了运动和生活。物理学使得真实的生活如此忙碌和动态。物理学是物质在空间中运动的方式。既然一个电脑游戏世界没有物质，它也就没有物理学规律，使用游戏程序员不得不*模拟*物理学。

从大多数电脑游戏来说，这里基本上仅有两个方面的物理学是重要的：引力和碰撞。

当你[添加一个敌人][2]到你的游戏中时，你实现了一些碰撞检测，但是这篇文章要添加更多的东西，因为引力需要碰撞检测。想想为什么引力可能涉及碰撞。如果你不能想到任何原因，不要担心 —— 它会随着你开发示例代码工作而且显然。

在真实世界中的引力是有质量的物体来相互吸引的倾向性。物体（质量）越大，它施加越大的引力作用。在电脑游戏物理学中，你不必创建质量足够大的物体来证明引力的正确；你可以在电脑游戏世界本身中仅编程一个物体落向假设的最大的对象的倾向。

### 添加一个引力函数

记住你的玩家已经有了一个决定动作的属性。使用这个属性来将玩家精灵拉向屏幕底部。

在 Pygame 中，较高的数字更接近屏幕的底部边缘。

在真实的世界中，引力影响一切。然而，在平台游戏中，引力是有选择性的 —— 如果你添加引力到你的整个游戏世界，你的所有平台都将掉到地上。反之，你可以仅添加引力到你的玩家和敌人精灵中。

首先，在你的 `Player` 类中添加一个 `gravity` 函数：

```
    def gravity(self):
        self.movey += 3.2 # 玩家掉落的多快
```

这是一个简单的函数。首先，不管你的玩家是否想运动，你设置你的玩家垂直运动。也就是说，你已经编程你的玩家总是在下降。这基本上就是引力。

为使引力函数生效，你必须在你的主循环中调用它。这样，当每一个处理循环时，Python 都应用下落运动到你的玩家。

在这代码中，添加第一行到你的循环中：

```
    player.gravity() # 检查引力
    player.update()
```

启动你的游戏来看看会发生什么。要注意，因为它发生的很快：你是玩家从天空上下落，马上掉出了你的游戏屏幕。

你的引力模拟是工作的，但是，也许太好了。

作为一次试验，尝试更改你玩家下落的速度。

### 给引力添加一个地板

你的游戏没有办法发现你的角色掉落出世界的问题。在一些游戏中，如果一个玩家掉落出世界，该精灵被删除，并在某个新的位置重生。在另一些游戏中，玩家会丢失分数或一条生命。当一个玩家掉落出世界时，不管你想发生什么，你必须能够侦测出玩家何时消失在屏幕外。

在 Python 中，要检查一个条件，你可以使用一个 `if` 语句。

你必需查看你玩家**是否**正在掉落，以及你的玩家掉落的程度。如果你的玩家掉落到屏幕的底部，那么你可以做*一些事情*。简化一下，设置玩家精灵的位置为底部边缘上方 20 像素。

使你的 `gravity` 函数看起来像这样：

```
    def gravity(self):
        self.movey += 3.2 # 玩家掉落的多快
       
        if self.rect.y > worldy and self.movey >= 0:
            self.movey = 0
            self.rect.y = worldy-ty
```

然后，启动你的游戏。你的精灵仍然下落，但是它停在屏幕的底部。不过，你也许不能*看到*你在地面层之上的精灵。一个简单的解决方法是，在精灵碰撞游戏世界的底部后，通过添加另一个 `-ty` 到它的新 Y 位置，从而使你的精灵弹跳到更高处：

```
    def gravity(self):
        self.movey += 3.2 # 玩家掉落的多快
       
        if self.rect.y > worldy and self.movey >= 0:
            self.movey = 0
            self.rect.y = worldy-ty-ty
```

现在你的玩家在屏幕底部弹跳，恰好在你地面精灵上面。

你的玩家真正需要的是反抗引力的方法。引力问题是，你不能反抗它，除非你有一些东西来推开引力作用。因此，在接下来的文章中，你将添加地面和平台碰撞以及跳跃能力。在这期间，尝试应用引力到敌人精灵。

到目前为止，这里是全部的代码：

```
#!/usr/bin/env python3
# draw a world
# add a player and player control
# add player movement
# add enemy and basic collision
# add platform
# add gravity

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
        self.score = 1
        self.images = []
        for i in range(1,9):
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect  = self.image.get_rect()

    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y > worldy and self.movey >= 0:
            self.movey = 0
            self.rect.y = worldy-ty-ty
       
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
        for enemy in enemy_hit_list:
            self.health -= 1
            print(self.health)

        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.health -= 1
            print(self.health)

class Enemy(pygame.sprite.Sprite):
    '''
    Spawn an enemy
    '''
    def __init__(self,x,y,img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img))
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

        if self.counter >= 0 and self.counter <= distance:
            self.rect.x += speed
        elif self.counter >= distance and self.counter <= distance*2:
            self.rect.x -= speed
        else:
            self.counter = 0

        self.counter += 1

class Level():
    def bad(lvl,eloc):
        if lvl == 1:
            enemy = Enemy(eloc[0],eloc[1],'yeti.png') # spawn enemy
            enemy_list = pygame.sprite.Group() # create enemy group
            enemy_list.add(enemy)              # add enemy to group
           
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

fps = 40 # frame rate
ani = 4  # animation cycles
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
player = Player() # spawn player
player.rect.x = 0
player.rect.y = 0
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10 # how fast to move

eloc = []
eloc = [200,20]
gloc = []
#gloc = [0,630,64,630,128,630,192,630,256,630,320,630,384,630]
tx = 64 #tile size
ty = 64 #tile size

i=0
while i <= (worldx/tx)+tx:
    gloc.append(i*tx)
    i=i+1

enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )
plat_list = Level.platform( 1,tx,ty )

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
                print('jump')

            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False

    world.blit(backdrop, backdropbox)
    player.gravity() # check gravity
    player.update()
    player_list.draw(world)
    enemy_list.draw(world)
    ground_list.draw(world)
    plat_list.draw(world)
    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

* * *

这是仍在进行中的关于使用 [Pygame][4] 模块来在 [Python 3][3] 在创建电脑游戏的第七部分。先前的文章是：

  * [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][5]
  * [使用 Python 和 Pygame 模块构建一个游戏框架][6]
  * [如何在你的 Python 游戏中添加一个玩家][7]
  * [用 Pygame 使你的游戏角色移动起来][8]
  * [如何向你的 Python 游戏中添加一个敌人][2]
  * [在 Pygame 游戏中放置平台][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/simulate-gravity-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmic.jpg?itok=bE94WtN- (Cosmic stars in outer space)
[2]: https://linux.cn/article-10883-1.html
[3]: https://www.python.org/
[4]: https://www.pygame.org
[5]: https://linux.cn/article-9071-1.html
[6]: https://linux.cn/article-10850-1.html
[7]: https://linux.cn/article-10858-1.html
[8]: https://linux.cn/article-10874-1.html
[9]: https://linux.cn/article-10902-1.html
