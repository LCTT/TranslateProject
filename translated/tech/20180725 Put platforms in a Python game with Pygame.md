[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Put platforms in a Python game with Pygame)
[#]: via: (https://opensource.com/article/18/7/put-platforms-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

放置舞台到一个使用 Pygame 的 Python 游戏中
======
在这系列的第六部分中，在从零构建一个 Python 游戏时，为你的角色创建一些舞台来旅行。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/header.png?itok=iq8HFoEJ)

这是关于使用 Pygame 模块来在 Python 3 中创建电脑游戏的仍在进行的一系列的文章的第六部分。先前的文章是：

+ [通过构建一个简单的骰子游戏来学习如何用 Python 编程][24]
+ [使用 Python 和 Pygame 模块构建一个游戏框架][25]
+ [如何添加一个玩家到你的 Python 游戏][26]
+ [使用 Pygame 来在周围移动你的游戏角色][27]
+ [没有一个坏蛋的一个英雄是什么？如何添加一个坏蛋到你的 Python 游戏][28]


一个舞台游戏需要舞台。

在 [Pygame][1] 中，舞台本身是小精灵，正像你的可玩的小精灵。这一点是重要的，因为有对象的舞台，使你的玩家小精灵很简单地与舞台一起作用。.

创建舞台有两个主要步骤。首先，你必须编码对象，然后，你必须设计你希望对象来出现的位置。

### 编码舞台对象

为构建一个舞台对象，你创建一个称为`Platform`的类。它是一个小精灵，正像你的[`玩家`][2] [小精灵][2]，带有很多相同的属性。

你的`舞台`类需要知道很多你想要的舞台的类型的信息 ，它应该出现在游戏世界的哪里，和它应该包含的什么图片。它们中很多信息可能还尚不存在，依赖于你计划了多少游戏，但是，没有关系。正像直到[移到文章][3]的结尾时，你不告诉你的玩家小精灵多快速度移到，你没有必要告诉`Platform`预交的每一件事。

在你所写的这系列中脚本的顶部附近，创建一个新的类。在这代码示例中前三行是用于上下文，因此在注释的下面添加代码：

```
import pygame
import sys
import os
## new code below:

class Platform(pygame.sprite.Sprite):
# x location, y location, img width, img height, img file    
def __init__(self,xloc,yloc,imgw,imgh,img):
    pygame.sprite.Sprite.__init__(self)
    self.image = pygame.image.load(os.path.join('images',img)).convert()
    self.image.convert_alpha()
    self.image.set_colorkey(ALPHA)
    self.rect = self.image.get_rect()
    self.rect.y = yloc
    self.rect.x = xloc
```

当被调用时，这个类在一些 X 和 Y 位置上创建一个对象 onscreen, 带有一些宽度和高度，对于纹理使用一些图片文件。它非常类似于如何玩家或敌人绘制onscreen。

### 舞台的类型

下一步是设计你所有舞台需要出现的地方。

#### 瓷砖方法

这里有几个不同的方法来实施一个舞台游戏世界。在最初的侧面滚动游戏，例如，马里奥超级兄弟和刺猬索尼克，这个技巧是来使用"瓷砖"，意味着这里有几个块“瓷砖”来代表地面和各种各样的舞台，并且这些块被使用和重复使用来制作一个层次。你仅有8或12种不同的块，你排列它们在屏幕上来创建地面，浮动的舞台，和你游戏需要的其它的一切事物。一些人找到这最容易的方法来制作一个游戏，尽管你不得不制作(或下载)一小组价值相等的有用的事物来创建很多不同的有用的事物。然而，代码需要一点更多的数学。

![Supertux, a tile-based video game][5]

[SuperTux][6] ，一个基于瓷砖的电脑游戏。

#### 手工绘制方法

另一个方法是来使各个和每一个有用的事物作为一整个图像。如果你享受为你的游戏世界创建有用的事物，在一个图形应用程序中花费时间来构建你的游戏世界的各个和每一部件是一个极好的理由。这个方法需要较少的数学，因为所有的舞台是完整的对象，并且你告诉 [Python][7] 在屏幕上放置它们的位置。

每种方法都有优势和劣势，并且依赖于你的选择使用的代码是稍微不同的.我将覆盖这两方面,所以你可以在你的工程中使用一个或另一个,甚至两者的混合。

### 层次映射

总的来说，映射出你的游戏世界是层次设计和游戏程序的一个重要的部分。这需要数学，但是没有什么太难的，而且 Python 擅长数学，因此它可以帮助一些。

你可以发现先在纸张上设计是有益的。获取纸张的一个表格，并绘制一个方框来代表你的游戏窗体。在方框中绘制舞台，用 X 和 Y 坐标标记每一个，以及它的意欲达到的宽度和高度。在方框中的实际位置没有必要是精确的，只要你保持实际的数字。譬如，假如你的屏幕是 720 像素宽，那么你不能在一个屏幕上以 100 像素处容纳8块舞台。

当然，在你的游戏中不是所有的舞台不得不容纳在一个屏幕大小的方框，因为你的游戏将随着你的玩家行走而滚动。所以保持绘制你的游戏世界到第一屏幕的右侧，直到层次的右侧。

如果你更喜欢精确一点，你可以使用方格纸。当设计一个带有瓷砖的游戏时，这是特别有用的，因为每个方格可以代表一个瓷砖。

![Example of a level map][9]

一个平面地图示例。

#### 坐标系

你可能已经在学校中学习[笛卡尔坐标系][10]。你学习的东西应用到 Pygame，除了在 Pygame 中，你的游戏世界的坐标系放置 `0,0` 在你的屏幕的左上角而不是在中间，中间可能是你which is probably what you're used to from Geometry class.

![Example of coordinates in Pygame][12]

在 Pygame 中的坐标示例。

X 轴起始于最左边的 0 ，无限地向右增加。Y 轴起始于屏幕顶部的 0 ，向下延伸。

#### 图片大小

映射出一个游戏世界不是毫无意义的，如果你不知道你的玩家，敌人，舞台是多大的。你可以找到你的舞台的尺寸或在一个图形程序中的标题。在 [Krita][13] 中，例如，单击**图形**菜单，并选择**属性**。你可以在**属性**窗口的非常顶部处找到尺寸。

可选地，你可以创建一个简单点的 Python 脚本来告诉你的一个图形的尺寸。打开一个新的文本文件，并输入这些代码到其中：

```
#!/usr/bin/env python3

from PIL import Image
import os.path
import sys

if len(sys.argv) > 1:
    print(sys.argv[1])
else:
    sys.exit('Syntax: identify.py [filename]')

pic = sys.argv[1]
dim = Image.open(pic)
X   = dim.size[0]
Y   = dim.size[1]

print(X,Y)
```

保存文本文件为 `identify.py` 。

为安装这个脚本，你必需安装安装一组额外的 Python 模块，它们包含使用在脚本中新的关键字：

```
$ pip3 install Pillow --user
```

一旦这些被安装，在你游戏工程目录中运行你的脚本：

```
$ python3 ./identify.py images/ground.png
(1080, 97)
```

在这个示例中的地面舞台的图形的大小是1080像素宽和97像素高。

### 舞台块

如果你选择单独地绘制每个有用的事物，你必需创建一些舞台和一些你希望插入到你的游戏世界中其它的元素，每个元素都在它自己的文件中。换句话说，你应该每个有用的事物都有一个文件，像这：

![One image file per object][15]

每个对象一个图形文件。

你可以按照你希望的次数重复使用每个舞台，只要确保每个文件仅包含一个舞台。你不能使用一个包含每一件事物的文件，像这：

![Your level cannot be one image file][17]

你的层次不能是一个图形。

当你完成时，你可能希望你的游戏看起来像这样，但是如果你在一个大文件中创建你的层次，没有方法从背景中区分一个舞台，因此，要么在它们拥有的文件中绘制你的对象，要么从一个大规模文件中复制它们，并单独地保存副本。

**注意:** 如同你的其它的有用的事物，你可以使用[GIMP][18]，Krita，[MyPaint][19]，或[Inkscape][20] 来创建你的游戏的有用的事物。

舞台出现在每个层次开始的屏幕上，因此你必需在你的`Level`类中添加一个`platform`函数。在这里特殊的情况是地面舞台，作为它自身拥有的舞台组来对待是足够重要的。通过把地面看作它自身拥有的特殊类型的舞台，你可以选择它是否滚动，或在其它舞台漂浮在它上面期间是否仍然站立。它取决于你。

添加这两个函数到你的`Level`类：

```
def ground(lvl,x,y,w,h):
    ground_list = pygame.sprite.Group()
    if lvl == 1:
        ground = Platform(x,y,w,h,'block-ground.png')
        ground_list.add(ground)

    if lvl == 2:
        print("Level " + str(lvl) )

    return ground_list

def platform( lvl ):
    plat_list = pygame.sprite.Group()
    if lvl == 1:
        plat = Platform(200, worldy-97-128, 285,67,'block-big.png')
        plat_list.add(plat)
        plat = Platform(500, worldy-97-320, 197,54,'block-small.png')
        plat_list.add(plat)
    if lvl == 2:
        print("Level " + str(lvl) )
       
    return plat_list
```

 `ground` 函数需要一个 X 和 Y 位置，以便 Pygame 知道在哪里放置地面舞台。它也需要舞台的宽度和高度，这样 Pygame 知道地面延伸到每个方向有多远。该函数使用你的 `Platform` 来来生成一个对象 onscreen ，然后他就这个对象到 `ground_list` 组。

`platform` 函数本质上是相同的，除了其有更多的舞台来列出。在这个示例中，仅有两个，但是你可以想多少就多少。在进入一个舞台后，在列出另一个前，你必需添加它到 `plat_list` 中。如果你不添加一个舞台到组中，那么它将不出现在你的游戏中。

> **提示:** 很难想象你的游戏世界的0在顶部，因为在真实世界中发生的情况是相反的；当估计你多高时，你不要从天空下面测量你自己，从脚到头的顶部来测量。
>
> 如果对你来说从“地面”上来构建你的游戏世界更容易，它可能有助于表示 Y 轴值为负数。例如，你知道你的游戏世界的底部是 `worldy` 的值。因此 `worldy` 减去地面(97，在这个示例中)的高度是你的玩家正常站立的位置。如果你的角色是64像素高，那么地面减去128正好是你的玩家的两倍。事实上，一个放置在128像素处舞台大约是两层楼高度，相对于你的玩家。一个舞台在-320处是三层楼高。等等

正像你现在可能所知的，如果你不使用它们，你的类和函数是没有有价值的。添加这些代码到你的 setup 部分（第一行只是上下文，所以添加最后两行）：

```
enemy_list  = Level.bad( 1, eloc )
ground_list = Level.ground( 1,0,worldy-97,1080,97 )
plat_list   = Level.platform( 1 )
```

并提交这些行到你的主循环(再一次，第一行仅用于上下文)：

```
enemy_list.draw(world)  # refresh enemies
ground_list.draw(world)  # refresh ground
plat_list.draw(world)  # refresh platforms
```

### 瓷砖舞台

瓷砖游戏世界被认为更容易制作，因为你只需要绘制一些在前面的块，就能在游戏中反反复复创建每一个舞台。在网站上甚至有一组供你来使用的瓷砖，像 [OpenGameArt.org][21]。

`Platform` 类与在前面部分中的类是相同的。

在 `Level` 类中的 `ground` 和 `platform` ， 然而，必需使用循环来计算使用多少块来创建每个舞台。

如果你打算在你的游戏世界中有一个坚固的地面，地面是简单的。你仅从整个窗口一边到另一边"克隆"你的地面瓷砖。例如，你可以创建一个 X 和 Y 值的列表来规定每个瓷砖应该放置的位置，然后使用一个循环来获取每个值和绘制一个瓷砖。这仅是一个示例，所以不要添加这到你的代码：

```
# Do not add this to your code
gloc = [0,656,64,656,128,656,192,656,256,656,320,656,384,656]
```

如果你仔细看，不过，你也可以看到所有的 Y 值是相同的，X 值以64的增量不断地增加，这是瓷砖的东西。这种类型的重复是精确地，是计算机擅长的，因此你可以使用一点数学逻辑来让计算机为你做所有的计算：

添加这代你的脚本的 setup 部分：

```
gloc = []
tx   = 64
ty   = 64

i=0
while i <= (worldx/tx)+tx:
    gloc.append(i*tx)
    i=i+1

ground_list = Level.ground( 1,gloc,tx,ty )
```

现在，不管你的窗口的大小，Python 通过瓷砖的宽度 分割游戏世界的宽度，并创建一个数组列表列出每个 X 值。这不计算 Y 值，但是无论如何，从不在平的地面上更改。

为在一个函数中使用数组，使用一个`while`循环，查看每个条目并在适当的位置添加一个地面瓷砖：

```
def ground(lvl,gloc,tx,ty):
    ground_list = pygame.sprite.Group()
    i=0
    if lvl == 1:
        while i < len(gloc):
            ground = Platform(gloc[i],worldy-ty,tx,ty,'tile-ground.png')
            ground_list.add(ground)
            i=i+1

    if lvl == 2:
        print("Level " + str(lvl) )

    return ground_list
```

除了 `while` 循环，这几乎与在上面一部分中提供的块样式平台游戏 `ground` 函数的代码相同。

对于移到舞台，原理是相似的，但是这里有一些你可以使用的技巧来使你的生活更简单。

而不通过像素映射每个舞台，你可以通过它的起始像素（它的 X 值），从地面（它的 Y 值）的高度，绘制多少瓷砖来定义一个舞台。用那种方法，你不必担心每个舞台的宽度和高度。

这个技巧的逻辑有一点更复杂，因此仔细复制这些代码。有一个 `while` 循环在另一个 `while` 循环的内部，因为这个函数必需考虑在每个数组入口处的所有三个值来成功地建造一个完整的舞台。在这个示例中，这里仅有三个舞台被定义为 `ploc.append` 语句，但是你的游戏可能需要更多，因此你需要多少就定义多少。当然，一些也将不出现，因为它们远在屏幕外，但是一旦你实施滚动，它们将呈现眼前。

```
def platform(lvl,tx,ty):
    plat_list = pygame.sprite.Group()
    ploc = []
    i=0
    if lvl == 1:
        ploc.append((200,worldy-ty-128,3))
        ploc.append((300,worldy-ty-256,3))
        ploc.append((500,worldy-ty-128,4))
        while i < len(ploc):
            j=0
            while j <= ploc[i][2]:
                plat = Platform((ploc[i][0]+(j*tx)),ploc[i][1],tx,ty,'tile.png')
                plat_list.add(plat)
                j=j+1
            print('run' + str(i) + str(ploc[i]))
            i=i+1
           
    if lvl == 2:
        print("Level " + str(lvl) )

    return plat_list
```

为获取舞台，使其出现在你的游戏世界，它们必需在你的主循环中。如果你还没有这样做，添加这些行到你的主循环(再一次，第一行仅被用于上下文)中：

```
        enemy_list.draw(world)  # refresh enemies
        ground_list.draw(world) # refresh ground
        plat_list.draw(world)   # refresh platforms
```

启动你的游戏，根据需要调整你的舞台的放置位置。不要担心，你不能看见在屏幕外面产生的舞台；你将不久后修复。

到目前为止，这是在一个图片和在代码中游戏：

![Pygame game][23]

到目前为止，我们的 Pygame 舞台。

```
#!/usr/bin/env python3
# draw a world
# add a player and player control
# add player movement
# add enemy and basic collision
# add platform

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
            self.rect  = self.image.get_rect()

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
            enemy_list.add(enemy)              # add enemy to group

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
                print("blockgen:" + str(i))
                ground = Platform(gloc[i],worldy-ty,tx,ty,'ground.png')
                ground_list.add(ground)
                i=i+1

        if lvl == 2:
            print("Level " + str(lvl) )

        return ground_list

'''
Setup
'''
worldx = 960
worldy = 720

fps = 40 # frame rate
ani = 4  # animation cycles
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
    print("block: " + str(i))

enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )

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

#    world.fill(BLACK)
    world.blit(backdrop, backdropbox)
    player.update()
    player_list.draw(world) #refresh player position
    enemy_list.draw(world)  # refresh enemies
    ground_list.draw(world)  # refresh enemies
    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/put-platforms-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsan](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://www.pygame.org/news
[2]: https://opensource.com/article/17/12/game-python-add-a-player
[3]: https://opensource.com/article/17/12/game-python-moving-player
[4]: /file/403841
[5]: https://opensource.com/sites/default/files/uploads/supertux.png (Supertux, a tile-based video game)
[6]: https://www.supertux.org/
[7]: https://www.python.org/
[8]: /file/403861
[9]: https://opensource.com/sites/default/files/uploads/layout.png (Example of a level map)
[10]: https://en.wikipedia.org/wiki/Cartesian_coordinate_system
[11]: /file/403871
[12]: https://opensource.com/sites/default/files/uploads/pygame_coordinates.png (Example of coordinates in Pygame)
[13]: https://krita.org/en/
[14]: /file/403876
[15]: https://opensource.com/sites/default/files/uploads/pygame_floating.png (One image file per object)
[16]: /file/403881
[17]: https://opensource.com/sites/default/files/uploads/pygame_flattened.png (Your level cannot be one image file)
[18]: https://www.gimp.org/
[19]: http://mypaint.org/about/
[20]: https://inkscape.org/en/
[21]: https://opengameart.org/content/simplified-platformer-pack
[22]: /file/403886
[23]: https://opensource.com/sites/default/files/uploads/pygame_platforms.jpg (Pygame game)
[24]: Learn how to program in Python by building a simple dice game
[25]: https://opensource.com/article/17/12/game-framework-python
[26]: https://opensource.com/article/17/12/game-python-add-a-player
[27]: https://opensource.com/article/17/12/game-python-moving-player
[28]: https://opensource.com/article/18/5/pygame-enemy

