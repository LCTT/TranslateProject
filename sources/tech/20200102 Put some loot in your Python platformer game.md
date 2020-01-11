[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Put some loot in your Python platformer game)
[#]: via: (https://opensource.com/article/20/1/loot-python-platformer-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Put some loot in your Python platformer game
======
Give your players some treasures to collect and boost their score in
this installment on programming video games with Python's Pygame module.
![Hearts, stars, and dollar signs][1]

This is part 9 in an ongoing series about creating video games in [Python 3][2] using the [Pygame][3] module. Previous articles are:

  * [Learn how to program in Python by building a simple dice game][4]
  * [Build a game framework with Python using the Pygame module][5]
  * [How to add a player to your Python game][6]
  * [Using Pygame to move your game character around][7]
  * [What's a hero without a villain? How to add one to your Python game][8]
  * [Simulate gravity in your Python game][9]
  * [Add jumping to your Python platformer game][10]
  * [Enable your Python game player to run forward and backward][11]



If you've followed along with the previous articles in this series, then you know all the basics of programming video game mechanics. You can build upon these basics to create a fully functional video game all your own. Following a "recipe" like the code samples in this series is helpful when you're first learning, but eventually, the recipe becomes a constraint. It's time to use the principles you've learned and apply them in new ways.

If that sounds easier said than done, this article demonstrates an example of how to leverage what you already know for new purposes. Specifically, it covers how to implement a looting system

using what you have already learned about platforms from previous lessons.

In most video games, you have the opportunity to "loot," or collect treasures and other items within the game world. Loot usually increases your score or your health or provides information leading to your next quest.

Including loot in your game is similar to programming platforms. Like platforms, loot has no user controls, scrolls with the game world, and must check for collisions with the player sprite.

### Creating the loot function

Loot is so similar to platforms that you don't even need a Loot class. You can just reuse the **Platform** class and call the results loot.

Since loot type and placement probably differ from level to level, create a new function called **loot** in your **Level** class, if you don't already have one. Since loot items are not platforms, you must also create a new **loot_list** group and then add loot objects to it. As with platforms, ground, and enemies, this group is used when checking for collisions:


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

You can add as many loot objects as you like; just remember to add each one to your loot list. The arguments for the **Platform** class are the X position, the Y position, the width and height of the loot sprite (it's usually easiest to keep your loot sprite the same size as all other tiles), and the image you want to use as loot. Placement of loot can be just as complex as mapping platforms, so use the level design document you created when creating the level.

Call your new loot function in the **Setup** section of your script. In the following code, the first three lines are for context, so just add the fourth:


```
enemy_list = Level.bad( 1, eloc )
ground_list = Level.ground( 1,gloc,tx,ty )
plat_list = Level.platform( 1,tx,ty )
loot_list = Level.loot(1,tx,ty)
```

As you know by now, the loot won't get drawn to the screen unless you include it in your main loop. Add the final line from the following code sample to your loop:


```
    enemy_list.draw(world)
    ground_list.draw(world)
    plat_list.draw(world)
    loot_list.draw(world)
```

Launch your game to see what happens.

![Loot in Python platformer][12]

Your loot objects are spawned, but they don't do anything when your player runs into them, nor do they scroll when your player runs past them. Fix these issues next.

### Scrolling loot

Like platforms, loot has to scroll when the player moves through the game world. The logic is identical to platform scrolling. To scroll the loot forward, add the last two lines:


```
        for e in enemy_list:
            e.rect.x -= scroll
        for l in loot_list:
            l.rect.x -= scroll
```

To scroll it backward, add the last two lines:


```
        for e in enemy_list:
            e.rect.x += scroll
        for l in loot_list:
            l.rect.x += scroll
```

Launch your game again to see that your loot objects now act like they're _in_ the game world instead of just painted on top of it.

### Detecting collisions

As with platforms and enemies, you can check for collisions between loot and your player. The logic is the same as other collisions, except that a hit doesn't (necessarily) affect gravity or health. Instead, a hit causes the loot to disappear and increment the player's score.

When your player touches a loot object, you can remove that object from the **loot_list**. This means that when your main loop redraws all loot items in **loot_list**, it won't redraw that particular object, so it will look like the player has grabbed the loot.

Add the following code above the platform collision detection in the **update** function of your **Player** class (the last line is just for context):


```
                loot_hit_list = pygame.sprite.spritecollide(self, loot_list, False)
                for loot in loot_hit_list:
                        loot_list.remove(loot)
                        self.score += 1
                print(self.score)
 
        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
```

Not only do you remove the loot object from its group when a collision happens, but you also award your player a bump in score. You haven't created a score variable yet, so add that to your player's properties, created in the **__init__** function of the **Player** class. In the following code, the first two lines are for context, so just add the score variable:


```
        self.frame = 0
        self.health = 10
        self.score = 0
```

When calling the **update** function in your main loop, include the **loot_list**:


```
        player.gravity()
        player.update()
```

As you can see, you've got all the basics. All you have to do now is use what you know in new ways.

There are a few more tips in the next article, but in the meantime, use what you've learned to make a few simple, single-level games. Limiting the scope of what you are trying to create is important so that you don't overwhelm yourself. It also makes it easier to end up with a finished product that looks and feels finished.

Here's all the code you've written for this Python platformer so far:


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
       
        if self.rect.y &gt; worldy and self.movey &gt;= 0:
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
            if self.rect.y &gt; p.rect.y:
                self.rect.y = p.rect.y+ty
            else:
                self.rect.y = p.rect.y-ty
           
        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.y = worldy-ty-ty
            self.collide_delta = 0 # stop jumping
            if self.rect.y &gt; g.rect.y:
                self.health -=1
                print(self.health)
               
        if self.collide_delta &lt; 6 and self.jump_delta &lt; 6:
            self.jump_delta = 6*2
            self.movey -= 33  # how high to jump
            self.collide_delta += 6
            self.jump_delta    += 6
           
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
       
        if self.counter &gt;= 0 and self.counter &lt;= distance:
            self.rect.x += speed
        elif self.counter &gt;= distance and self.counter &lt;= distance*2:
            self.rect.x -= speed
        else:
            self.counter = 0
       
        self.counter += 1

        if not self.rect.y &gt;= worldy-ty-ty:
            self.rect.y += self.movey

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.movey = 0
            if self.rect.y &gt; p.rect.y:
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
            enemy_list.add(enemy)              # add enemy to group
           
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
            ploc.append((20,worldy-ty-128,3))
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
while i &lt;= (worldx/tx)+tx:
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
    if player.rect.x &gt;= forwardx:
        scroll = player.rect.x - forwardx
        player.rect.x = forwardx
        for p in plat_list:
            p.rect.x -= scroll
        for e in enemy_list:
            e.rect.x -= scroll
        for l in loot_list:
            l.rect.x -= scroll
               
    # scroll the world backward
    if player.rect.x &lt;= backwardx:
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
    enemy_list.draw(world)  # refresh enemies
    ground_list.draw(world)  # refresh enemies
    plat_list.draw(world)   # refresh platforms
    loot_list.draw(world)   # refresh loot

    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/loot-python-platformer-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_lovemoneyglory2.png?itok=AvneLxFp (Hearts, stars, and dollar signs)
[2]: https://www.python.org/
[3]: https://www.pygame.org/news
[4]: https://opensource.com/article/17/10/python-101
[5]: https://opensource.com/article/17/12/game-framework-python
[6]: https://opensource.com/article/17/12/game-python-add-a-player
[7]: https://opensource.com/article/17/12/game-python-moving-player
[8]: https://opensource.com/article/18/5/pygame-enemy
[9]: https://opensource.com/article/19/11/simulate-gravity-python
[10]: https://opensource.com/article/19/12/jumping-python-platformer-game
[11]: https://opensource.com/article/19/12/python-platformer-game-run
[12]: https://opensource.com/sites/default/files/uploads/pygame-loot.jpg (Loot in Python platformer)
