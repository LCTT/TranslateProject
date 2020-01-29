[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11828-1.html)
[#]: subject: (Put some loot in your Python platformer game)
[#]: via: (https://opensource.com/article/20/1/loot-python-platformer-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在你的 Python 平台类游戏中放一些奖励
======

> 这部分是关于在使用 Python 的 Pygame 模块开发的视频游戏总给你的玩家提供收集的宝物和经验值的内容。

![](https://img.linux.net.cn/data/attachment/album/202001/29/131158jkwnhgd1nnawzn86.jpg)

这是正在进行的关于使用 [Python 3][2] 的 [Pygame][3] 模块创建视频游戏的系列文章的第十部分。以前的文章有:

  * [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][4]
  * [使用 Python 和 Pygame 模块构建一个游戏框架][5]
  * [如何在你的 Python 游戏中添加一个玩家][6]
  * [用 Pygame 使你的游戏角色移动起来][7]
  * [如何向你的 Python 游戏中添加一个敌人][8]
  * [在 Pygame 游戏中放置平台][13]
  * [在你的 Python 游戏中模拟引力][9]
  * [为你的 Python 平台类游戏添加跳跃功能][10]
  * [使你的 Python 游戏玩家能够向前和向后跑][11]

如果你已经阅读了本系列的前几篇文章，那么你已经了解了编写游戏的所有基础知识。现在你可以在这些基础上，创造一个全功能的游戏。当你第一次学习时，遵循本系列代码示例，这样的“用例”是有帮助的，但是，用例也会约束你。现在是时候运用你学到的知识，以新的方式应用它们了。

如果说，说起来容易做起来难，这篇文章展示了一个如何将你已经了解的内容用于新目的的例子中。具体来说，就是它涵盖了如何使用你以前的课程中已经了解到的来实现奖励系统。

在大多数电子游戏中，你有机会在游戏世界中获得“奖励”或收集到宝物和其他物品。奖励通常会增加你的分数或者你的生命值，或者为你的下一次任务提供信息。

游戏中包含的奖励类似于编程平台。像平台一样，奖励没有用户控制，随着游戏世界的滚动进行，并且必须检查与玩家的碰撞。

### 创建奖励函数

奖励和平台非常相似，你甚至不需要一个奖励的类。你可以重用 `Platform` 类，并将结果称为“奖励”。

由于奖励类型和位置可能因关卡不同而不同，如果你还没有，请在你的 `Level` 中创建一个名为 `loot` 的新函数。因为奖励物品不是平台，你也必须创建一个新的 `loot_list` 组，然后添加奖励物品。与平台、地面和敌人一样，该组用于检查玩家碰撞:

```
    def loot(lvl,lloc):
        if lvl == 1:
            loot_list = pygame.sprite.Group()
            loot = Platform(300,ty*7,tx,ty, 'loot_1.png')
            loot_list.add(loot)

        if lvl == 2:
            print(lvl)

        return loot_list
```

你可以随意添加任意数量的奖励对象；记住把每一个都加到你的奖励清单上。`Platform` 类的参数是奖励图标的 X 位置、Y 位置、宽度和高度（通常让你的奖励精灵保持和所有其他方块一样的大小最为简单），以及你想要用作的奖励的图片。奖励的放置可以和贴图平台一样复杂，所以使用创建关卡时需要的关卡设计文档。

在脚本的设置部分调用新的奖励函数。在下面的代码中，前三行是上下文，所以只需添加第四行:

```
enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )
plat_list = Level.platform( 1,tx,ty )
loot_list = Level.loot(1,tx,ty)
```

正如你现在所知道的，除非你把它包含在你的主循环中，否则奖励不会被显示到屏幕上。将下面代码示例的最后一行添加到循环中:

```
    enemy_list.draw(world)
    ground_list.draw(world)
    plat_list.draw(world)
    loot_list.draw(world)
```

启动你的游戏看看会发生什么。

![Loot in Python platformer][12]

你的奖励将会显示出来，但是当你的玩家碰到它们时，它们不会做任何事情，当你的玩家经过它们时，它们也不会滚动。接下来解决这些问题。

### 滚动奖励

像平台一样，当玩家在游戏世界中移动时，奖励必须滚动。逻辑与平台滚动相同。要向前滚动奖励物品，添加最后两行:

```
        for e in enemy_list:
            e.rect.x -= scroll
        for l in loot_list:
            l.rect.x -= scroll
```

要向后滚动，请添加最后两行：

```
        for e in enemy_list:
            e.rect.x += scroll
        for l in loot_list:
            l.rect.x += scroll
```

再次启动你的游戏，看看你的奖励物品现在表现得像在游戏世界里一样了，而不是仅仅画在上面。

### 检测碰撞

就像平台和敌人一样，你可以检查奖励物品和玩家之间的碰撞。逻辑与其他碰撞相同，除了撞击不会（必然）影响重力或生命值。取而代之的是，命中会导致奖励物品会消失并增加玩家的分数。

当你的玩家触摸到一个奖励对象时，你可以从 `loot_list` 中移除该对象。这意味着当你的主循环在 `loot_list` 中重绘所有奖励物品时，它不会重绘那个特定的对象，所以看起来玩家已经获得了奖励物品。

在 `Player` 类的 `update` 函数中的平台碰撞检测之上添加以下代码（最后一行仅用于上下文）：

```
                loot_hit_list = pygame.sprite.spritecollide(self, loot_list, False)
                for loot in loot_hit_list:
                        loot_list.remove(loot)
                        self.score += 1
                print(self.score)
 
        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
```

当碰撞发生时，你不仅要把奖励从它的组中移除，还要给你的玩家一个分数提升。你还没有创建分数变量，所以请将它添加到你的玩家属性中，该属性是在 `Player` 类的 `__init__` 函数中创建的。在下面的代码中，前两行是上下文，所以只需添加分数变量:

```
        self.frame = 0
        self.health = 10
        self.score = 0
```

当在主循环中调用 `update` 函数时，需要包括 `loot_list`：

```
        player.gravity()
        player.update()
```

如你所见，你已经掌握了所有的基本知识。你现在要做的就是用新的方式使用你所知道的。

在下一篇文章中还有一些提示，但是与此同时，用你学到的知识来制作一些简单的单关卡游戏。限制你试图创造的东西的范围是很重要的，这样你就不会埋没自己。这也使得最终的成品看起来和感觉上更容易完成。

以下是迄今为止你为这个 Python 平台编写的所有代码:

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
        for enemy in enemy_hit_list:
            self.health -= 1
            #print(self.health)

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
steps = 10
forwardx = 600
backwardx = 230

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
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/loot-python-platformer-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_lovemoneyglory2.png?itok=AvneLxFp (Hearts, stars, and dollar signs)
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
[12]: https://opensource.com/sites/default/files/uploads/pygame-loot.jpg (Loot in Python platformer)
[13]: https://linux.cn/article-10902-1.html
