[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add throwing mechanics to your Python game)
[#]: via: (https://opensource.com/article/20/9/add-throwing-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Add throwing mechanics to your Python game
======
Running around avoiding enemies is one thing. Fighting back is another.
Learn how in the 12th article in this series on creating a platformer in
Pygame.
![Gaming on a grid with penguin pawns][1]

This is part 12 in an ongoing series about creating video games in [Python 3][2] using the [Pygame][3] module. Previous articles are:

  1. [Learn how to program in Python by building a simple dice game][4]
  2. [Build a game framework with Python using the Pygame module][5]
  3. [How to add a player to your Python game][6]
  4. [Using Pygame to move your game character around][7]
  5. [What's a hero without a villain? How to add one to your Python game][8]
  6. [Put platforms in a Python game with Pygame][9]
  7. [Simulate gravity in your Python game][10]
  8. [Add jumping to your Python platformer game][11]
  9. [Enable your Python game player to run forward and backward][12]
  10. [Put some loot in your Python platformer game][13]
  11. [Add scorekeeping to your Python game][14]



My previous article was meant to be the final article in this series, and it encouraged you to go program your own additions to this game. Many of you did! I got emails asking for help with a common mechanic that I hadn't yet covered: combat. After all, jumping to avoid baddies is one thing, but sometimes it's awfully satisfying to just make them go away. It's common in video games to throw something at your enemies, whether it's a ball of fire, an arrow, a bolt of lightning, or whatever else fits the game.

Unlike anything you have programmed for your platformer game in this series so far, throwable items have a _time to live_. Once you throw an object, it's expected to travel some distance and then disappear. If it's an arrow or something like that, it may disappear when it passes the edge of the screen. If it's a fireball or a bolt of lightning, it might fizzle out after some amount of time.

That means each time a throwable item is spawned, a unique measure of its lifespan must also be spawned. To introduce this concept, this article demonstrates how to throw only one item at a time. (In other words, only one throwable item may exist at a time.) On the one hand, this is a game limitation, but on the other hand, it is a game mechanic in itself. Your player won't be able to throw 50 fireballs at once, since you only allow one at a time, so it becomes a challenge for your player to time when they release a fireball to try to hit an enemy. And behind the scenes, this also keeps your code simple.

If you want to enable more throwable items at once, challenge yourself after you finish this tutorial by building on the knowledge you gain.

### Create the throwable class

If you followed along with the other articles in this series, you should be familiar with the basic `__init__` function when spawning a new object on the screen. It's the same function you used for spawning your [player][6] and your [enemies][8]. Here's an `__init__` function to spawn a throwable object:


```
class Throwable(pygame.sprite.Sprite):
    """
    Spawn a throwable object
    """
    def __init__(self, x, y, img, throw):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images',img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect   = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.firing = throw
```

The primary difference in this function compared to your `Player` class or `Enemy` class `__init__` function is that it has a `self.firing` variable. This variable keeps track of whether or not a throwable object is currently alive on screen, so it stands to reason that when a throwable object is created, the variable is set to `1`.

### Measure time to live

Next, just as with `Player` and `Enemy`, you need an `update` function so that the throwable object moves on its own once it's thrown into the air toward an enemy.

The easiest way to determine the lifespan of a throwable object is to detect when it goes off-screen. Which screen edge you need to monitor depends on the physics of your throwable object.

  * If your player is throwing something that travels quickly along the horizontal axis, like a crossbow bolt or arrow or a very fast magical force, then you want to monitor the horizontal limit of your game screen. This is defined by `worldx`.
  * If your player is throwing something that travels vertically or both horizontally and vertically, then you must monitor the vertical limit of your game screen. This is defined by `worldy`.



This example assumes your throwable object goes a little forward and eventually falls to the ground. The object does not bounce off the ground, though, and continues to fall off the screen. You can try different settings to see what fits your game best:


```
    def update(self,worldy):
        '''
        throw physics
        '''
        if self.rect.y &lt; worldy: #vertical axis
            self.rect.x  += 15 #how fast it moves forward
            self.rect.y  += 5  #how fast it falls
        else:
            self.kill()     #remove throwable object
            self.firing = 0 #free up firing slot
```

To make your throwable object move faster, increase the momentum of the `self.rect` values.

If the throwable object is off-screen, then the object is destroyed, freeing up the RAM that it had occupied. In addition, `self.firing` is set back to `0` to allow your player to take another shot.

### Set up your throwable object

Just like with your player and enemies, you must create a sprite group in your setup section to hold the throwable object.

Additionally, you must create an inactive throwable object to start the game with. If there isn't a throwable object when the game starts, the first time a player attempts to throw a weapon, it will fail.

This example assumes your player starts with a fireball as a weapon, so each instance of a throwable object is designated by the `fire` variable. In later levels, as the player acquires new skills, you could introduce a new variable using a different image but leveraging the same `Throwable` class.

In this block of code, the first two lines are already in your code, so don't retype them:


```
player_list = pygame.sprite.Group() #context
player_list.add(player)             #context
fire = Throwable(player.rect.x,player.rect.y,'fire.png',0)
firepower = pygame.sprite.Group()
```

Notice that a throwable item starts at the same location as the player. That makes it look like the throwable item is coming from the player. The first time the fireball is generated, a `0` is used so that `self.firing` shows as available.

### Get throwing in the main loop

Code that doesn't appear in the main loop will not be used in the game, so you need to add a few things in your main loop to get your throwable object into your game world.

First, add player controls. Currently, you have no firepower trigger. There are two states for a key on a keyboard: the key can be down, or the key can be up. For movement, you use both: pressing down starts the player moving, and releasing the key (the key is up) stops the player. Firing needs only one signal. It's a matter of taste as to which key event (a key press or a key release) you use to trigger your throwable object.

In this code block, the first two lines are for context:


```
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump(platform_list)
            if event.key == pygame.K_SPACE:
                if not fire.firing:
                    fire = Throwable(player.rect.x,player.rect.y,'fire.png',1)
                    firepower.add(fire)
```

Unlike the fireball you created in your setup section, you use a `1` to set `self.firing` as unavailable.

Finally, you must update and draw your throwable object. The order of this matters, so put this code between your existing `enemy.move` and `player_list.draw` lines:


```
    enemy.move()  # context

    if fire.firing:
        fire.update(worldy)
        firepower.draw(world)
    player_list.draw(screen)  # context
    enemy_list.draw(screen)   # context
```

Notice that these updates are performed only if the `self.firing` variable is set to 1. If it is set to 0, then `fire.firing` is not true, and the updates are skipped. If you tried to do these updates, no matter what, your game would crash because there wouldn't be a `fire` object to update or draw.

Launch your game and try to throw your weapon.

### Detect collisions

If you played your game with the new throwing mechanic, you probably noticed that you can throw objects, but it doesn't have any effect on your foes.

The reason is that your enemies do not check for a collision. An enemy can be hit by your throwable object and never know about it.

You've already done collision detection in your `Player` class, and this is very similar. In your `Enemy` class, add a new `update` function:


```
    def update(self,firepower, enemy_list):
        """
        detect firepower collision
        """
        fire_hit_list = pygame.sprite.spritecollide(self,firepower,False)
        for fire in fire_hit_list:
            enemy_list.remove(self)
```

The code is simple. Each enemy object checks to see if it has been hit by the `firepower` sprite group. If it has, then the enemy is removed from the enemy group and disappears.

To integrate that function into your game, call the function in your new firing block in the main loop:


```
    if fire.firing:                             # context
        fire.update(worldy)                    # context
        firepower.draw(screen)                  # context
        enemy_list.update(firepower,enemy_list) # update enemy
```

You can try your game now, and most everything works as expected. There's still one problem, though, and that's the direction of the throw.

### Change the throw mechanic direction

Currently, your hero's fireball moves only to the right. This is because the `update` function of the `Throwable` class adds pixels to the position of the fireball, and in Pygame, a larger number on the X-axis means movement toward the right of the screen. When your hero turns the other way, you probably want it to throw its fireball to the left.

By this point, you know how to implement this, at least technically. However, the easiest solution uses a variable in what may be a new way for you. Generically, you can "set a flag" (sometimes also termed "flip a bit") to indicate the direction your hero is facing. Once you do that, you can check that variable to learn whether the fireball needs to move left or right.

First, create a new variable in your `Player` class to represent which direction your hero is facing. Because my hero faces right naturally, I treat that as the default:


```
        self.score = 0
        self.facing_right = True  # add this
        self.is_jumping = True
```

When this variable is `True`, your hero sprite is facing right. It must be set anew every time the player changes the hero's direction, so do that in your main loop on the relevant `keyup` events:


```
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps, 0)
                player.facing_right = False  # add this line
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps, 0)
                player.facing_right = True  # add this line
```

Finally, change the `update` function of your `Throwable` class to check whether the hero is facing right or not and to add or subtract pixels from the fireball's position as appropriate:


```
        if self.rect.y &lt; worldy:
            if player.facing_right:
                self.rect.x += 15
            else:
                self.rect.x -= 15
            self.rect.y += 5
```

Try your game again and clear your world of some baddies.

![Python platformer with throwing capability][15]

(Seth Kenlon, [CC BY-SA 4.0][16])

As a bonus challenge, try incrementing your player's score whenever an enemy is vanquished.

### The complete code


```
#!/usr/bin/env python3
# by Seth Kenlon

# GPLv3
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see &lt;[http://www.gnu.org/licenses/\&gt;][17].

import pygame
import pygame.freetype
import sys
import os

'''
Variables
'''

worldx = 960
worldy = 720
fps = 40
ani = 4
world = pygame.display.set_mode([worldx, worldy])
forwardx  = 600
backwardx = 120

BLUE = (80, 80, 155)
BLACK = (23, 23, 23)
WHITE = (254, 254, 254)
ALPHA = (0, 255, 0)

tx = 64
ty = 64

font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "fonts", "amazdoom.ttf")
font_size = tx
pygame.freetype.init()
myfont = pygame.freetype.Font(font_path, font_size)

'''
Objects
'''

def stats(score, health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), BLUE, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), BLUE, None, size=64)

class Throwable(pygame.sprite.Sprite):
    """
    Spawn a throwable object
    """
    def __init__(self, x, y, img, throw):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.firing = throw

    def update(self, worldy):
        '''
        throw physics
        '''
        if self.rect.y &lt; worldy:
            if player.facing_right:
                self.rect.x += 15
            else:
                self.rect.x -= 15
            self.rect.y += 5
        else:
            self.kill()
            self.firing = 0

# x location, y location, img width, img height, img file
class Platform(pygame.sprite.Sprite):
    def __init__(self, xloc, yloc, imgw, imgh, img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img)).convert()
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.y = yloc
        self.rect.x = xloc

class Player(pygame.sprite.Sprite):
    """
    Spawn a player
    """

    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.health = 10
        self.damage = 0
        self.score = 0
        self.facing_right = True
        self.is_jumping = True
        self.is_falling = True
        self.images = []
        for i in range(1, 5):
            img = pygame.image.load(os.path.join('images', 'walk' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect = self.image.get_rect()

    def gravity(self):
        if self.is_jumping:
            self.movey += 3.2

    def control(self, x, y):
        """
        control player movement
        """
        self.movex += x

    def jump(self):
        if self.is_jumping is False:
            self.is_falling = False
            self.is_jumping = True

    def update(self):
        """
        Update sprite position
        """

        # moving left
        if self.movex &lt; 0:
            self.is_jumping = True
            self.frame += 1
            if self.frame &gt; 3 * ani:
                self.frame = 0
            self.image = pygame.transform.flip(self.images[self.frame // ani], True, False)

        # moving right
        if self.movex &gt; 0:
            self.is_jumping = True
            self.frame += 1
            if self.frame &gt; 3 * ani:
                self.frame = 0
            self.image = self.images[self.frame // ani]

        # collisions
        enemy_hit_list = pygame.sprite.spritecollide(self, enemy_list, False)
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)
        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # set damage back to 0
                self.health -= 1  # subtract 1 hp

        ground_hit_list = pygame.sprite.spritecollide(self, ground_list, False)
        for g in ground_hit_list:
            self.movey = 0
            self.rect.bottom = g.rect.top
            self.is_jumping = False  # stop jumping

        # fall off the world
        if self.rect.y &gt; worldy:
            self.health -=1
            print(self.health)
            self.rect.x = tx
            self.rect.y = ty

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)
        for p in plat_hit_list:
            self.is_jumping = False  # stop jumping
            self.movey = 0
            if self.rect.bottom &lt;= p.rect.bottom:
               self.rect.bottom = p.rect.top
            else:
               self.movey += 3.2

        if self.is_jumping and self.is_falling is False:
            self.is_falling = True
            self.movey -= 33  # how high to jump

        loot_hit_list = pygame.sprite.spritecollide(self, loot_list, False)
        for loot in loot_hit_list:
            loot_list.remove(loot)
            self.score += 1
            print(self.score)

        plat_hit_list = pygame.sprite.spritecollide(self, plat_list, False)

        self.rect.x += self.movex
        self.rect.y += self.movey

class Enemy(pygame.sprite.Sprite):
    """
    Spawn an enemy
    """

    def __init__(self, x, y, img):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.image.load(os.path.join('images', img))
        self.image.convert_alpha()
        self.image.set_colorkey(ALPHA)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        self.counter = 0

    def move(self):
        """
        enemy movement
        """
        distance = 80
        speed = 8

        if self.counter &gt;= 0 and self.counter &lt;= distance:
            self.rect.x += speed
        elif self.counter &gt;= distance and self.counter &lt;= distance * 2:
            self.rect.x -= speed
        else:
            self.counter = 0

        self.counter += 1

    def update(self, firepower, enemy_list):
        """
        detect firepower collision
        """
        fire_hit_list = pygame.sprite.spritecollide(self, firepower, False)
        for fire in fire_hit_list:
            enemy_list.remove(self)

class Level:
    def ground(lvl, gloc, tx, ty):
        ground_list = pygame.sprite.Group()
        i = 0
        if lvl == 1:
            while i &lt; len(gloc):
                ground = Platform(gloc[i], worldy - ty, tx, ty, 'tile-ground.png')
                ground_list.add(ground)
                i = i + 1

        if lvl == 2:
            print("Level " + str(lvl))

        return ground_list

    def bad(lvl, eloc):
        if lvl == 1:
            enemy = Enemy(eloc[0], eloc[1], 'enemy.png')
            enemy_list = pygame.sprite.Group()
            enemy_list.add(enemy)
        if lvl == 2:
            print("Level " + str(lvl))

        return enemy_list

    # x location, y location, img width, img height, img file
    def platform(lvl, tx, ty):
        plat_list = pygame.sprite.Group()
        ploc = []
        i = 0
        if lvl == 1:
            ploc.append((200, worldy - ty - 128, 3))
            ploc.append((300, worldy - ty - 256, 3))
            ploc.append((550, worldy - ty - 128, 4))
            while i &lt; len(ploc):
                j = 0
                while j &lt;= ploc[i][2]:
                    plat = Platform((ploc[i][0] + (j * tx)), ploc[i][1], tx, ty, 'tile.png')
                    plat_list.add(plat)
                    j = j + 1
                print('run' + str(i) + str(ploc[i]))
                i = i + 1

        if lvl == 2:
            print("Level " + str(lvl))

        return plat_list

    def loot(lvl):
        if lvl == 1:
            loot_list = pygame.sprite.Group()
            loot = Platform(tx*5, ty*5, tx, ty, 'loot_1.png')
            loot_list.add(loot)

        if lvl == 2:
            print(lvl)

        return loot_list

'''
Setup
'''

backdrop = pygame.image.load(os.path.join('images', 'stage.png'))
clock = pygame.time.Clock()
pygame.init()
backdropbox = world.get_rect()
main = True

player = Player()  # spawn player
player.rect.x = 0  # go to x
player.rect.y = 30  # go to y
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10
fire = Throwable(player.rect.x, player.rect.y, 'fire.png', 0)
firepower = pygame.sprite.Group()

eloc = []
eloc = [300, worldy-ty-80]
enemy_list = Level.bad(1, eloc)
gloc = []

i = 0
while i &lt;= (worldx / tx) + tx:
    gloc.append(i * tx)
    i = i + 1

ground_list = Level.ground(1, gloc, tx, ty)
plat_list = Level.platform(1, tx, ty)
enemy_list = Level.bad( 1, eloc )
loot_list = Level.loot(1)

'''
Main Loop
'''

while main:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            try:
                sys.exit()
            finally:
                main = False

        if event.type == pygame.KEYDOWN:
            if event.key == ord('q'):
                pygame.quit()
                try:
                    sys.exit()
                finally:
                    main = False
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(-steps, 0)
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(steps, 0)
            if event.key == pygame.K_UP or event.key == ord('w'):
                player.jump()

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                player.control(steps, 0)
                player.facing_right = False
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                player.control(-steps, 0)
                player.facing_right = True
            if event.key == pygame.K_SPACE:
                if not fire.firing:
                    fire = Throwable(player.rect.x, player.rect.y, 'fire.png', 1)
                    firepower.add(fire)

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
    player.update()
    player.gravity()
    player_list.draw(world)
    if fire.firing:
        fire.update(worldy)
        firepower.draw(world)
    enemy_list.draw(world)
    enemy_list.update(firepower, enemy_list)
    loot_list.draw(world)
    ground_list.draw(world)
    plat_list.draw(world)
    for e in enemy_list:
        e.move()
    stats(player.score, player.health)
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/add-throwing-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/game_pawn_grid_linux.png?itok=4gERzRkg (Gaming on a grid with penguin pawns)
[2]: https://www.python.org/
[3]: https://www.pygame.org/news
[4]: https://opensource.com/article/17/10/python-101
[5]: https://opensource.com/article/17/12/game-framework-python
[6]: https://opensource.com/article/17/12/game-python-add-a-player
[7]: https://opensource.com/article/17/12/game-python-moving-player
[8]: https://opensource.com/article/18/5/pygame-enemy
[9]: https://opensource.com/article/18/7/put-platforms-python-game
[10]: https://opensource.com/article/19/11/simulate-gravity-python
[11]: https://opensource.com/article/19/12/jumping-python-platformer-game
[12]: https://opensource.com/article/19/12/python-platformer-game-run
[13]: https://opensource.com/article/19/12/loot-python-platformer-game
[14]: https://opensource.com/article/20/1/add-scorekeeping-your-python-game
[15]: https://opensource.com/sites/default/files/uploads/pygame-throw.jpg (Python platformer with throwing capability)
[16]: https://creativecommons.org/licenses/by-sa/4.0/
[17]: http://www.gnu.org/licenses/\>
