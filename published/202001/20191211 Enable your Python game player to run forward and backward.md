[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11819-1.html)
[#]: subject: (Enable your Python game player to run forward and backward)
[#]: via: (https://opensource.com/article/19/12/python-platformer-game-run)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使你的 Python 游戏玩家能够向前和向后跑
======
> 使用 Pygame 模块来使你的 Python 平台开启侧滚效果，来让你的玩家自由奔跑。

![](https://img.linux.net.cn/data/attachment/album/202001/25/220636x5mabbl47xvtsk55.jpg)

这是仍在进行中的关于使用 Pygame 模块来在 Python 3 中在创建电脑游戏的第九部分。先前的文章是：

  * [通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程][2]
  * [使用 Python 和 Pygame 模块构建一个游戏框架][3]
  * [如何在你的 Python 游戏中添加一个玩家][4]
  * [用 Pygame 使你的游戏角色移动起来][5]
  * [如何向你的 Python 游戏中添加一个敌人][6]
  * [在 Pygame 游戏中放置平台][12] 
  * [在你的 Python 游戏中模拟引力][7]
  * [为你的 Python 平台类游戏添加跳跃功能][8]

在这一系列关于使用 [Pygame][10] 模块来在 [Python 3][9] 中创建电脑游戏的先前文章中，你已经设计了你的关卡设计布局，但是你的关卡的一些部分可能已近超出你的屏幕的可视区域。在平台类游戏中，这个问题的普遍解决方案是，像术语“<ruby>侧滚<rt>side-scroller</rt></ruby>”表明的一样，滚动。

滚动的关键是当玩家精灵接近屏的幕边缘时，使在玩家精灵周围的平台移动。这样给予一种错觉，屏幕是一个在游戏世界中穿梭追拍的"摄像机"。

这个滚动技巧需要两个在屏幕边缘的绝对区域，在绝对区域内的点处，在世界滚动期间，你的化身静止不动。

### 在侧滚动条中放置卷轴

如果你希望你的玩家能够后退，你需要一个触发点来向前和向后。这两个点仅仅是两个变量。设置它们各个距各个屏幕边缘大约 100 或 200 像素。在你的设置部分中创建变量。在下面的代码中，前两行用于上下文说明，所以仅需要添加这行后的代码：

```
player_list.add(player)
steps = 10
forwardX  = 600
backwardX = 230
```

在主循环中，查看你的玩家精灵是否在 `forwardx` 或 `backwardx` 滚动点处。如果是这样，向左或向右移动使用的平台，取决于世界是向前或向后移动。在下面的代码中，代码的最后三行仅供你参考：

```
        # scroll the world forward
        if player.rect.x >= forwardx:
                scroll = player.rect.x - forwardx
                player.rect.x = forwardx
                for p in plat_list:
                        p.rect.x -= scroll

        # scroll the world backward
        if player.rect.x <= backwardx:
                scroll = backwardx - player.rect.x
                player.rect.x = backwardx
                for p in plat_list:
                        p.rect.x += scroll

        ## scrolling code above
    world.blit(backdrop, backdropbox)
    player.gravity() # check gravity
    player.update()
```

启动你的游戏，并尝试它。

![Scrolling the world in Pygame][11]

滚动像预期的一样工作，但是你可能注意到一个发生的小问题，当你滚动你的玩家和非玩家精灵周围的世界时：敌人精灵不随同世界滚动。除非你要你的敌人精灵要无休止地追逐你的玩家，你需要修改敌人代码，以便当你的玩家快速撤退时，敌人被留在后面。

### 敌人卷轴

在你的主循环中，你必须对卷轴平台为你的敌人的位置的应用相同的规则。因为你的游戏世界将（很可能）有不止一个敌人在其中，该规则应该被应用于你的敌人列表，而不是一个单独的敌人精灵。这是分组类似元素到列表中的优点之一。

前两行用于上下文注释，所以只需添加这两行后面的代码到你的主循环中：

```
    # scroll the world forward
    if player.rect.x >= forwardx:
        scroll = player.rect.x - forwardx
        player.rect.x = forwardx
        for p in plat_list:
            p.rect.x -= scroll
        for e in enemy_list:
            e.rect.x -= scroll
```

来滚向另一个方向：

```
    # scroll the world backward
    if player.rect.x <= backwardx:
        scroll = backwardx - player.rect.x
        player.rect.x = backwardx
        for p in plat_list:
            p.rect.x += scroll
        for e in enemy_list:
            e.rect.x += scroll
```

再次启动游戏，看看发生什么。

这里是到目前为止你已经为这个 Python 平台所写所有的代码：

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
               
    # scroll the world backward
    if player.rect.x <= backwardx:
        scroll = backwardx - player.rect.x
        player.rect.x = backwardx
        for p in plat_list:
            p.rect.x += scroll
        for e in enemy_list:
            e.rect.x += scroll

    world.blit(backdrop, backdropbox)
    player.gravity() # check gravity
    player.update()
    player_list.draw(world) #refresh player position
    enemy_list.draw(world)  # refresh enemies
    ground_list.draw(world)  # refresh enemies
    plat_list.draw(world)   # refresh platforms
    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/python-platformer-game-run

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://linux.cn/article-9071-1.html
[3]: https://linux.cn/article-10850-1.html
[4]: https://linux.cn/article-10858-1.html
[5]: https://linux.cn/article-10874-1.html
[6]: https://linux.cn/article-10883-1.html
[7]: https://linux.cn/article-11780-1.html
[8]: https://linux.cn/article-11790-1.html
[9]: https://www.python.org/
[10]: https://www.pygame.org/news
[11]: https://opensource.com/sites/default/files/uploads/pygame-scroll.jpg (Scrolling the world in Pygame)
[12]:https://linux.cn/article-10902-1.html
