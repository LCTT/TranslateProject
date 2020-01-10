[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add jumping to your Python platformer game)
[#]: via: (https://opensource.com/article/19/12/jumping-python-platformer-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Add jumping to your Python platformer game
======
Learn how to fight gravity with jumping in this installment on
programming video games with Python's Pygame module.
![Arcade games][1]

In the [previous article][2] in this series, you simulated gravity, but now you need to give your player a way to fight against gravity by jumping.

A jump is a temporary reprieve from gravity. For a few moments, you jump _up_ instead of falling down, the way gravity is pulling you. But once you hit the peak of your jump, gravity kicks in again and pulls you back down to earth.

In code, this translates to variables. First, you must establish variables for the player sprite so that Python can track whether or not the sprite is jumping. Once the player sprite is jumping, then gravity is applied to the player sprite again, pulling it back down to the nearest object.

### Setting jump state variables

You must add two new variables to your Player class:

  * One to track whether your player is jumping or not, determined by whether or not your player sprite is standing on solid ground
  * One to bring the player back down to the ground



Add these variables to your **Player** class. In the following code, the lines above the comment are for context, so just add the final two lines:


```
                self.movex = 0
                self.movey = 0
                self.frame = 0
                self.health = 10
                # gravity variables here
                self.collide_delta = 0
                self.jump_delta = 6
```

The first variable (**collide_delta**) is set to 0 because, in its natural state, the player sprite is not in a mid-jump. The other variable (**jump_delta**) is set to 6 to prevent the sprite from bouncing (actually, jumping) when it first lands in the game world. When you've finished this article's examples, try setting it to 0 to see what happens.

### Colliding mid-jump

If you jump on a trampoline, your jumps are pretty impressive. But what would happen if you jumped into a wall? (Don't try it to find out!) Your jump, no matter how impressively it started, would end very quickly when you collide with something much larger and much more solid than you.

To mimic this in your video game, you must set the **self.collide_delta** variable to 0 whenever your player sprite collides with something, like the ground. If **self.collide_delta** is anything other than 0, then your player is jumping, and your player can't jump when it hits a wall or the ground.

In the **update** function of your **Player** class, modify the ground collision block to look like this:


```
        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.y = worldy-ty-ty
            self.collide_delta = 0 # stop jumping
            if self.rect.y &gt; g.rect.y:
                self.health -=1
                print(self.health)
```

This code block checks for collisions happening between the ground sprites and the player sprite. In the event of a collision, it sets the Y-position of the player to a value equal to the height of the game window (**worldy**) minus the height of a tile minus the height of another tile (so that the player sprite appears to be standing on top of the ground and not in the middle of it). It also sets **self.collide_delta** to 0 so that the program is aware that the player is not in mid-jump. Additionally, it sets **self.movey** to 0 so that the program is aware that the player is not being pulled by gravity (it's a quirk of game physics that you don't need to continue to pull your player toward earth once the player has been grounded).

The **if** statement detects whether the player has descended _below_ the level of the ground; if so, it deducts health points as a penalty. This assumes that you want your player to lose health points for falling off the world. That's not strictly necessary; it's just a common convention in platformers. More than likely, you want this event to trigger something, though, or else your real-world player will be stuck playing a game with a sprite that's fallen off the screen. An easy recovery is to set **self.rect.y** to 0 again so that when the player sprite falls off the world, it respawns at the top of the world and falls back onto solid ground.

### Hitting the ground

Your simulated gravity wants your player's Y-axis movement to be 0 or more. To create a jump, write code that sends your player sprite off solid ground and into the air.

In the **update** function of your **Player** class, add a temporary reprieve from gravity:


```
        if self.collide_delta &lt; 6 and self.jump_delta &lt; 6:
            self.jump_delta = 6*2
            self.movey -= 33  # how high to jump
            self.collide_delta += 6
            self.jump_delta    += 6
```

According to this code, a jump sends the player sprite 33 pixels into the air. It's _negative_ 33 because a lower number in Pygame means it's closer to the top of the screen.

This event is conditional, though. It only happens if **self.collide_delta** is less than 6 (its default value established in the **init** function of your **Player** sprite) and if **self.jump_delta** is less than 6. This condition prevents the player from triggering another jump until it collides with a platform. In other words, it prevents mid-air jumps.

You don't have to prevent mid-air jumps, or you can allow for mid-air jumps under special conditions; for instance, if a player obtains a special loot item, then you could grant it the ability to perform mid-air jumps until the next time it is hit by an enemy.

When you've finished this article's examples, try setting **self.collide_delta** and **self.jump_delta** to 0 for a 100% chance to jump in mid-air.

### Landing on a platform

So far, you've defined an anti-gravity condition for when the player sprite hits the ground, but the game code keeps platforms and the ground in separate lists. (As with so many choices made in this article, that's not strictly necessary, and you can experiment with treating the ground as just another platform.) To enable a player sprite to stand on top of a platform, you must detect a collision between the player sprite and a platform sprite and then perform the same actions as you did for a ground collision. Place this code into your **update** function:


```
        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.collide_delta = 0 # stop jumping
            self.movey = 0
```

There's one additional concern, though: platforms hang in the air, meaning the player can interact with them by approaching them from either the top or the bottom.

It's up to you how you want the platforms to react to your player. It's not uncommon to block a player from accessing a platform from below. Add this code to the above code block to treat platforms as a sort of ceiling or pergola, such that the player sprite can jump onto a platform as long as it jumps higher than the platform's topside, but obstructs the player when it tries to jump from beneath:


```
            if self.rect.y &gt; p.rect.y:
                self.rect.y = p.rect.y+ty
            else:
                self.rect.y = p.rect.y-ty
```

The first clause of this **if** statement blocks the player from accessing a platform when the player sprite is directly under the platform. It does this by detecting that the player sprite's position is greater (in Pygame, that means lower on the screen, from top to bottom), and then sets the player sprite's new Y position to its current Y position plus the height of a tile, effectively keeping the player one tile's height away from ever passing through a platform from beneath it.

The **else** clause does the opposite. If the program is running this code, then the player sprite's Y position is _not_ greater than the platforms, meaning that the player sprite is falling from the sky (either because it has been freshly spawned there or because the player has jumped). In this event, the player sprite's position is set to the position of the platform minus one tile's height (because, remember, in Pygame, lower numbers mean something is higher up on the screen). This keeps the player on top of the platform unless it jumps or walks off of it.

You can experiment with other ways of dealing with sprite and platform interaction. For instance, maybe the player is assumed to be "in front" of the platforms and can seamlessly jump through them to stand on top of one. Or a platform could slow a player's leap but not block it entirely. You can even mix and match by grouping platforms into different lists.

### Triggering a jump

Your code now simulates all the necessary jump conditions, but it still lacks a jump trigger. Your player sprite's **self.jump_delta** is set to 6 initially, and the jump update code is triggered only when it's less than 6.

To trigger a new setting for the jumping variable, create a **jump** function in your **Player** class that sets the **self.jump_delta** to less than 6, causing gravity to be temporarily reprieved by sending your player sprite 33 pixels into the air:


```
    def jump(self,platform_list):
        self.jump_delta = 0
```

That's all the **jump** function requires, believe it or not. The rest happens in the **update** function, and you've already written that code.

There's one last thing to do before jumping is functional in your game. If you can't think of what it is, try playing your game to see how jumping works for you.

The problem is that nothing in your main loop is calling the **jump** function. You made a placeholder keypress for it early on, but right now, all the jump key does is print **jump** to the terminal.

### Calling the jump function

In your main loop, change the result of the Up arrow from printing a debug statement to calling the **jump** function.

Notice that the **jump** function, like the **update** function, needs to know about collisions, so you have to tell it which **plat_list** to use.


```
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump(plat_list)
```

If you would rather use the Spacebar for jumping, set the key to **pygame.K_SPACE** instead of **pygame.K_UP**. Alternately, you can use both (as separate **if** statements) so that the player has a choice.

Try your game now. In the next article, you'll make your world scroll.

![Pygame platformer][3]

Here's all the code so far:


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
steps = 10 # how fast to move
jump = -24

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

#    world.fill(BLACK)
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

This is the 7th installment in an ongoing series about creating video games in [Python 3][4] using the [Pygame][5] module. Previous articles are:

  * [Learn how to program in Python by building a simple dice game][6]
  * [Build a game framework with Python using the Pygame module][7]
  * [How to add a player to your Python game][8]
  * [Using Pygame to move your game character around][9]
  * [What's a hero without a villain? How to add one to your Python game][10]
  * [Simulate gravity in your Python game][2]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/jumping-python-platformer-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32 (Arcade games)
[2]: https://opensource.com/article/19/11/simulate-gravity-python
[3]: https://opensource.com/sites/default/files/uploads/pygame-jump.jpg (Pygame platformer)
[4]: https://www.python.org/
[5]: https://www.pygame.org/
[6]: https://opensource.com/article/17/10/python-101
[7]: https://opensource.com/article/17/12/game-framework-python
[8]: https://opensource.com/article/17/12/game-python-add-a-player
[9]: https://opensource.com/article/17/12/game-python-moving-player
[10]: https://opensource.com/article/18/5/pygame-enemy
