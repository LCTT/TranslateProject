[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Enable your Python game player to run forward and backward)
[#]: via: (https://opensource.com/article/19/12/python-platformer-game-run)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Enable your Python game player to run forward and backward
======
Let your player run free by enabling the side-scroller effect in your
Python platformer using the Pygame module.
![Gaming artifacts with joystick, GameBoy, paddle][1]

This is part 8 in an ongoing series about creating video games in Python 3 using the Pygame module. Previous articles are:

  * [Learn how to program in Python by building a simple dice game][2]
  * [Build a game framework with Python using the Pygame module][3]
  * [How to add a player to your Python game][4]
  * [Using Pygame to move your game character around][5]
  * [What's a hero without a villain? How to add one to your Python game][6]
  * [Simulate gravity in your Python game][7]
  * [Add jumping to your Python platformer game][8]



In previous entries in this series about creating video games in [Python 3][9] using the [Pygame][10] module, you designed your level-design layout, but some portion of your level probably extended past your viewable screen. The ubiquitous solution to that problem in platformer games is, as the term "side-scroller" suggests, scrolling.

The key to scrolling is to make the platforms around the player sprite move when the player sprite gets close to the edge of the screen. This provides the illusion that the screen is a "camera" panning across the game world.

This scrolling trick requires two dead zones at either edge of the screen, at which point your avatar stands still while the world scrolls by.

### Putting the scroll in side-scroller

You need one trigger point to go forward and another if you want your player to be able to go backward. These two points are simply two variables. Set them each about 100 or 200 pixels from each screen edge. Create the variables in your **setup** section. In the following code, the first two lines are for context, so just add the last two lines:


```
player_list.add(player)
steps = 10
forwardX  = 600
backwardX = 230
```

In the main loop, check to see if your player sprite is at the **forwardx** or **backwardx** scroll point. If so, move all platforms either left or right, depending on whether the world is moving forward or backward. In the following code, the final three lines of code are only for your reference:


```
        # scroll the world forward
        if player.rect.x &gt;= forwardx:
                scroll = player.rect.x - forwardx
                player.rect.x = forwardx
                for p in plat_list:
                        p.rect.x -= scroll

        # scroll the world backward
        if player.rect.x &lt;= backwardx:
                scroll = backwardx - player.rect.x
                player.rect.x = backwardx
                for p in plat_list:
                        p.rect.x += scroll

        ## scrolling code above
    world.blit(backdrop, backdropbox)
    player.gravity() # check gravity
    player.update()
```

Launch your game and try it out.

![Scrolling the world in Pygame][11]

Scrolling works as expected, but you may notice a small problem that happens when you scroll the world around your player and non-player sprites: the enemy sprite doesn't scroll along with the world. Unless you want

your enemy sprite to pursue your player endlessly, you need to modify the enemy code so that when your player makes an expeditious retreat, the enemy is left behind.

### Enemy scroll

In your main loop, you must apply the same rules for scrolling platforms to your enemy's position. Because your game world will (presumably) have more than one enemy in it, the rules are applied to your enemy list rather than an individual enemy sprite. That's one of the advantages of grouping similar elements into lists.

The first two lines are for context, so just add the final two to your main loop:


```
    # scroll the world forward
    if player.rect.x &gt;= forwardx:
        scroll = player.rect.x - forwardx
        player.rect.x = forwardx
        for p in plat_list:
            p.rect.x -= scroll
        for e in enemy_list:
            e.rect.x -= scroll
```

To scroll in the other direction:


```
    # scroll the world backward
    if player.rect.x &lt;= backwardx:
        scroll = backwardx - player.rect.x
        player.rect.x = backwardx
        for p in plat_list:
            p.rect.x += scroll
        for e in enemy_list:
            e.rect.x += scroll
```

Launch the game again and see what happens.

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
               
    # scroll the world backward
    if player.rect.x &lt;= backwardx:
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
    enemy_list.draw(world)  # refresh enemies
    ground_list.draw(world)  # refresh enemies
    plat_list.draw(world)   # refresh platforms
    for e in enemy_list:
        e.move()
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/python-platformer-game-run

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://opensource.com/article/17/10/python-101
[3]: https://opensource.com/article/17/12/game-framework-python
[4]: https://opensource.com/article/17/12/game-python-add-a-player
[5]: https://opensource.com/article/17/12/game-python-moving-player
[6]: https://opensource.com/article/18/5/pygame-enemy
[7]: https://opensource.com/article/19/11/simulate-gravity-python
[8]: https://opensource.com/article/19/12/jumping-python-platformer-game
[9]: https://www.python.org/
[10]: https://www.pygame.org/news
[11]: https://opensource.com/sites/default/files/uploads/pygame-scroll.jpg (Scrolling the world in Pygame)
