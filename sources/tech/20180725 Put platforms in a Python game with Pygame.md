[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Put platforms in a Python game with Pygame)
[#]: via: (https://opensource.com/article/18/7/put-platforms-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Put platforms in a Python game with Pygame
======
In part six of this series on building a Python game from scratch, create some platforms for your characters to travel.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/header.png?itok=iq8HFoEJ)

This is part 6 in an ongoing series about creating video games in Python 3 using the Pygame module. Previous articles are:

+ [Learn how to program in Python by building a simple dice game][24]
+ [Build a game framework with Python using the Pygame module][25]
+ [How to add a player to your Python game][26]
+ [Using Pygame to move your game character around][27]
+ [What's a hero without a villain? How to add one to your Python game][28]


A platformer game needs platforms.

In [Pygame][1], the platforms themselves are sprites, just like your playable sprite. That's important because having platforms that are objects makes it a lot easier for your player sprite to interact with them.

There are two major steps in creating platforms. First, you must code the objects, and then you must map out where you want the objects to appear.

### Coding platform objects

To build a platform object, you create a class called `Platform`. It's a sprite, just like your [`Player`][2] [sprite][2], with many of the same properties.

Your `Platform` class needs to know a lot of information about what kind of platform you want, where it should appear in the game world, and what image it should contain. A lot of that information might not even exist yet, depending on how much you have planned out your game, but that's all right. Just as you didn't tell your Player sprite how fast to move until the end of the [Movement article][3], you don't have to tell `Platform` everything upfront.

Near the top of the script you've been writing in this series, create a new class. The first three lines in this code sample are for context, so add the code below the comment:

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

When called, this class creates an object onscreen in some X and Y location, with some width and height, using some image file for texture. It's very similar to how players or enemies are drawn onscreen.

### Types of platforms

The next step is to map out where all your platforms need to appear.

#### The tile method

There are a few different ways to implement a platform game world. In the original side-scroller games, such as Mario Super Bros. and Sonic the Hedgehog, the technique was to use "tiles," meaning that there were a few blocks to represent the ground and various platforms, and these blocks were used and reused to make a level. You have only eight or 12 different kinds of blocks, and you line them up onscreen to create the ground, floating platforms, and whatever else your game needs. Some people find this the easier way to make a game since you just have to make (or download) a small set of level assets to create many different levels. The code, however, requires a little more math.

![Supertux, a tile-based video game][5]

[SuperTux][6], a tile-based video game.

#### The hand-painted method

Another method is to make each and every asset as one whole image. If you enjoy creating assets for your game world, this is a great excuse to spend time in a graphics application, building each and every part of your game world. This method requires less math, because all the platforms are whole, complete objects, and you tell [Python][7] where to place them onscreen.

Each method has advantages and disadvantages, and the code you must use is slightly different depending on the method you choose. I'll cover both so you can use one or the other, or even a mix of both, in your project.

### Level mapping

Mapping out your game world is a vital part of level design and game programming in general. It does involve math, but nothing too difficult, and Python is good at math so it can help some.

You might find it helpful to design on paper first. Get a sheet of paper and draw a box to represent your game window. Draw platforms in the box, labeling each with its X and Y coordinates, as well as its intended width and height. The actual positions in the box don't have to be exact, as long as you keep the numbers realistic. For instance, if your screen is 720 pixels wide, then you can't fit eight platforms at 100 pixels each all on one screen.

Of course, not all platforms in your game have to fit in one screen-sized box, because your game will scroll as your player walks through it. So keep drawing your game world to the right of the first screen until the end of the level.

If you prefer a little more precision, you can use graph paper. This is especially helpful when designing a game with tiles because each grid square can represent one tile.

![Example of a level map][9]

Example of a level map.

#### Coordinates

You may have learned in school about the [Cartesian coordinate system][10]. What you learned applies to Pygame, except that in Pygame, your game world's coordinates place `0,0` in the top-left corner of your screen instead of in the middle, which is probably what you're used to from Geometry class.

![Example of coordinates in Pygame][12]

Example of coordinates in Pygame.

The X axis starts at 0 on the far left and increases infinitely to the right. The Y axis starts at 0 at the top of the screen and extends down.

#### Image sizes

Mapping out a game world is meaningless if you don't know how big your players, enemies, and platforms are. You can find the dimensions of your platforms or tiles in a graphics program. In [Krita][13], for example, click on the **Image** menu and select **Properties**. You can find the dimensions at the very top of the **Properties** window.

Alternately, you can create a simple Python script to tell you the dimensions of an image. Open a new text file and type this code into it:

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

Save the text file as `identify.py`.

To set up this script, you must install an extra set of Python modules that contain the new keywords used in the script:

```
$ pip3 install Pillow --user
```

Once that is installed, run your script from within your game project directory:

```
$ python3 ./identify.py images/ground.png
(1080, 97)
```

The image size of the ground platform in this example is 1080 pixels wide and 97 high.

### Platform blocks

If you choose to draw each asset individually, you must create several platforms and any other elements you want to insert into your game world, each within its own file. In other words, you should have one file per asset, like this:

![One image file per object][15]

One image file per object.

You can reuse each platform as many times as you want, just make sure that each file only contains one platform. You cannot use a file that contains everything, like this:

![Your level cannot be one image file][17]

Your level cannot be one image file.

You might want your game to look like that when you've finished, but if you create your level in one big file, there is no way to distinguish a platform from the background, so either paint your objects in their own file or crop them from a large file and save individual copies.

**Note:** As with your other assets, you can use [GIMP][18], Krita, [MyPaint][19], or [Inkscape][20] to create your game assets.

Platforms appear on the screen at the start of each level, so you must add a `platform` function in your `Level` class. The special case here is the ground platform, which is important enough to be treated as its own platform group. By treating the ground as its own special kind of platform, you can choose whether it scrolls or whether it stands still while other platforms float over the top of it. It's up to you.

Add these two functions to your `Level` class:

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

The `ground` function requires an X and Y location so Pygame knows where to place the ground platform. It also requires the width and height of the platform so Pygame knows how far the ground extends in each direction. The function uses your `Platform` class to generate an object onscreen, and then adds that object to the `ground_list` group.

The `platform` function is essentially the same, except that there are more platforms to list. In this example, there are only two, but you can have as many as you like. After entering one platform, you must add it to the `plat_list` before listing another. If you don't add a platform to the group, then it won't appear in your game.

> **Tip:** It can be difficult to think of your game world with 0 at the top, since the opposite is what happens in the real world; when figuring out how tall you are, you don't measure yourself from the sky down, you measure yourself from your feet to the top of your head.
>
> If it's easier for you to build your game world from the "ground" up, it might help to express Y-axis values as negatives. For instance, you know that the bottom of your game world is the value of `worldy`. So `worldy` minus the height of the ground (97, in this example) is where your player is normally standing. If your character is 64 pixels tall, then the ground minus 128 is exactly twice as tall as your player. Effectively, a platform placed at 128 pixels is about two stories tall, relative to your player. A platform at -320 is three more stories. And so on.

As you probably know by now, none of your classes and functions are worth much if you don't use them. Add this code to your setup section (the first line is just for context, so add the last two lines):

```
enemy_list  = Level.bad( 1, eloc )
ground_list = Level.ground( 1,0,worldy-97,1080,97 )
plat_list   = Level.platform( 1 )
```

And add these lines to your main loop (again, the first line is just for context):

```
enemy_list.draw(world)  # refresh enemies
ground_list.draw(world)  # refresh ground
plat_list.draw(world)  # refresh platforms
```

### Tiled platforms

Tiled game worlds are considered easier to make because you just have to draw a few blocks upfront and can use them over and over to create every platform in the game. There are even sets of tiles for you to use on sites like [OpenGameArt.org][21].

The `Platform` class is the same as the one provided in the previous sections.

The `ground` and `platform` in the `Level` class, however, must use loops to calculate how many blocks to use to create each platform.

If you intend to have one solid ground in your game world, the ground is simple. You just "clone" your ground tile across the whole window. For instance, you could create a list of X and Y values to dictate where each tile should be placed, and then use a loop to take each value and draw one tile. This is just an example, so don't add this to your code:

```
# Do not add this to your code
gloc = [0,656,64,656,128,656,192,656,256,656,320,656,384,656]
```

If you look carefully, though, you can see all the Y values are always the same, and the X values increase steadily in increments of 64, which is the size of the tiles. That kind of repetition is exactly what computers are good at, so you can use a little bit of math logic to have the computer do all the calculations for you:

Add this to the setup part of your script:

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

Now, regardless of the size of your window, Python divides the width of the game world by the width of the tile and creates an array listing each X value. This doesn't calculate the Y value, but that never changes on flat ground anyway.

To use the array in a function, use a `while` loop that looks at each entry and adds a ground tile at the appropriate location:

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

This is nearly the same code as the `ground` function for the block-style platformer, provided in a previous section above, aside from the `while` loop.

For moving platforms, the principle is similar, but there are some tricks you can use to make your life easier.

Rather than mapping every platform by pixels, you can define a platform by its starting pixel (its X value), the height from the ground (its Y value), and how many tiles to draw. That way, you don't have to worry about the width and height of every platform.

The logic for this trick is a little more complex, so copy this code carefully. There is a `while` loop inside of another `while` loop because this function must look at all three values within each array entry to successfully construct a full platform. In this example, there are only three platforms defined as `ploc.append` statements, but your game probably needs more, so define as many as you need. Of course, some won't appear yet because they're far offscreen, but they'll come into view once you implement scrolling.

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

To get the platforms to appear in your game world, they must be in your main loop. If you haven't already done so, add these lines to your main loop (again, the first line is just for context):

```
        enemy_list.draw(world)  # refresh enemies
        ground_list.draw(world) # refresh ground
        plat_list.draw(world)   # refresh platforms
```

Launch your game, and adjust the placement of your platforms as needed. Don't worry that you can't see the platforms that are spawned offscreen; you'll fix that soon.

Here is the game so far in a picture and in code:

![Pygame game][23]

Our Pygame platformer so far.

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
译者：[译者ID](https://github.com/译者ID)
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

