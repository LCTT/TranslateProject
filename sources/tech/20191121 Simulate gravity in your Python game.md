[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Simulate gravity in your Python game)
[#]: via: (https://opensource.com/article/19/11/simulate-gravity-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Simulate gravity in your Python game
======
Learn how to program video games with Python's Pygame module and start
manipulating gravity.
![Cosmic stars in outer space][1]

The real world is full of movement and life. The thing that makes the real world so busy and dynamic is physics. Physics is the way matter moves through space. Since a video game world has no matter, it also has no physics, so game programmers have to _simulate_ physics.

In terms of most video games, there are basically only two aspects of physics that are important: gravity and collision.

You implemented some collision detection when you [added an enemy][2] to your game, but this article adds more because gravity requires collision detection. Think about why gravity might involve collisions. If you can't think of any reasons, don't worry—it'll become apparent as you work through the sample code.

Gravity in the real world is the tendency for objects with mass to be drawn toward one another. The larger the object, the more gravitational influence it exerts. In video game physics, you don't have to create objects with mass great enough to justify a gravitational pull; you can just program a tendency for objects to fall toward the presumed largest object in the video game world: the world itself.

### Adding a gravity function

Remember that your player already has a property to determine motion. Use this property to pull the player sprite toward the bottom of the screen.

In Pygame, higher numbers are closer to the bottom edge of the screen.

In the real world, gravity affects everything. In platformers, however, gravity is selective—if you add gravity to your entire game world, all of your platforms would fall to the ground. Instead, you add gravity just to your player and enemy sprites.

First, add a **gravity** function in your **Player** class:


```
    def gravity(self):
        self.movey += 3.2 # how fast player falls
```

This is a simple function. First, you set your player in vertical motion, whether your player wants to be in motion or not. In other words, you have programmed your player to always be falling. That's basically gravity.

For the gravity function to have an effect, you must call it in your main loop. This way, Python applies the falling motion to your player once every clock tick.

In this code, add the first line to your loop:


```
    player.gravity() # check gravity
    player.update()
```

Launch your game to see what happens. Look sharp, because it happens fast: your player falls out of the sky, right off your game screen.

Your gravity simulation is working, but maybe too well.

As an experiment, try changing the rate at which your player falls.

### Adding a floor to gravity

The problem with your character falling off the world is that there's no way for your game to detect it. In some games, if a player falls off the world, the sprite is deleted and respawned somewhere new. In other games, the player loses points or a life. Whatever you want to happen when a player falls off the world, you have to be able to detect when the player disappears offscreen.

In Python, to check for a condition, you can use an **if** statement.

You must check to see **if** your player is falling and how far your player has fallen. If your player falls so far that it reaches the bottom of the screen, then you can do _something_. To keep things simple, set the position of the player sprite to 20 pixels above the bottom edge.

Make your **gravity** function look like this:


```
    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y &gt; worldy and self.movey &gt;= 0:
            self.movey = 0
            self.rect.y = worldy-ty
```

Then launch your game. Your sprite still falls, but it stops at the bottom of the screen. You may not be able to _see_ your sprite behind the ground layer, though. An easy fix is to make your player sprite bounce higher by adding another **-ty** to its new Y position after it hits the bottom of the game world:


```
    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y &gt; worldy and self.movey &gt;= 0:
            self.movey = 0
            self.rect.y = worldy-ty-ty
```

Now your player bounces at the bottom of the screen, just behind your ground sprites.

What your player really needs is a way to fight gravity. The problem with gravity is, you can't fight it unless you have something to push off of. So, in the next article, you'll add ground and platform collision and the ability to jump. In the meantime, try applying gravity to the enemy sprite.

Here's all the code so far:


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

    def gravity(self):
        self.movey += 3.2 # how fast player falls
       
        if self.rect.y &gt; worldy and self.movey &gt;= 0:
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
        if self.movex &lt; 0:
            self.frame += 1
            if self.frame &gt; ani*3:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # moving right
        if self.movex &gt; 0:
            self.frame += 1
            if self.frame &gt; ani*3:
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

        if self.counter &gt;= 0 and self.counter &lt;= distance:
            self.rect.x += speed
        elif self.counter &gt;= distance and self.counter &lt;= distance*2:
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
            while i &lt; len(gloc):
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

            while i &lt; len(ploc):
                j=0
                while j &lt;= ploc[i][2]:
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
while i &lt;= (worldx/tx)+tx:
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

This is part 6 in an ongoing series about creating video games in [Python 3][3] using the [Pygame][4] module. Previous articles are:

  * [Learn how to program in Python by building a simple dice game][5]
  * [Build a game framework with Python using the Pygame module][6]
  * [How to add a player to your Python game][7]
  * [Using Pygame to move your game character around][8]
  * [What's a hero without a villain? How to add one to your Python game][2]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/simulate-gravity-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmic.jpg?itok=bE94WtN- (Cosmic stars in outer space)
[2]: https://opensource.com/article/18/5/pygame-enemy
[3]: https://www.python.org/
[4]: https://www.pygame.org
[5]: https://opensource.com/article/17/10/python-101
[6]: https://opensource.com/article/17/12/game-framework-python
[7]: https://opensource.com/article/17/12/game-python-add-a-player
[8]: https://opensource.com/article/17/12/game-python-moving-player
