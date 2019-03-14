[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Pygame to move your game character around)
[#]: via: (https://opensource.com/article/17/12/game-python-moving-player)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Using Pygame to move your game character around
======
In the fourth part of this series, learn how to code the controls needed to move a game character.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python4-game.png?itok=tXFHaLdt)

In the first article in this series, I explained how to use Python to create a simple, [text-based dice game][1]. In the second part, we began building a game from scratch, starting with [creating the game's environment][2]. And, in the third installment, we [created a player sprite][3] and made it spawn in your (rather empty) game world. As you've probably noticed, a game isn't much fun if you can't move your character around. In this article, we'll use Pygame to add keyboard controls so you can direct your character's movement.

There are functions in Pygame to add other kinds of controls, but since you certainly have a keyboard if you're typing out Python code, that's what we'll use. Once you understand keyboard controls, you can explore other options on your own.

You created a key to quit your game in the second article in this series, and the principle is the same for movement. However, getting your character to move is a little more complex.

Let's start with the easy part: setting up the controller keys.

### Setting up keys for controlling your player sprite

Open your Python game script in IDLE, Ninja-IDE, or a text editor.

Since the game must constantly "listen" for keyboard events, you'll be writing code that needs to run continuously. Can you figure out where to put code that needs to run constantly for the duration of the game?

If you answered "in the main loop," you're correct! Remember that unless code is in a loop, it will run (at most) only once—and it may not run at all if it's hidden away in a class or function that never gets used.

To make Python monitor for incoming key presses, add this code to the main loop. There's no code to make anything happen yet, so use `print` statements to signal success. This is a common debugging technique.

```
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                print('left')
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                print('right')
            if event.key == pygame.K_UP or event.key == ord('w'):
            print('jump')

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == ord('a'):
                print('left stop')
            if event.key == pygame.K_RIGHT or event.key == ord('d'):
                print('right stop')
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False    
```

Some people prefer to control player characters with the keyboard characters W, A, S, and D, and others prefer to use arrow keys. Be sure to include both options.

**Note: **It's vital that you consider all of your users when programming. If you write code that works only for you, it's very likely that you'll be the only one who uses your application. More importantly, if you seek out a job writing code for money, you are expected to write code that works for everyone. Giving your users choices, such as the option to use either arrow keys or WASD, is a sign of a good programmer.

Launch your game using Python, and watch the console window for output as you press the right, left, and up arrows, or the A, D, and W keys.

```
$ python ./your-name_game.py
  left
  left stop
  right
  right stop
  jump
```

This confirms that Pygame detects key presses correctly. Now it's time to do the hard work of making the sprite move.

### Coding the player movement function

To make your sprite move, you must create a property for your sprite that represents movement. When your sprite is not moving, this variable is set to `0`.

If you are animating your sprite, or should you decide to animate it in the future, you also must track frames to enable the walk cycle to stay on track.

Create the variables in the Player class. The first two lines are for context (you already have them in your code, if you've been following along), so add only the last three:

```
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0 # move along X
        self.movey = 0 # move along Y
        self.frame = 0 # count frames
```

With those variables set, it's time to code the sprite's movement.

The player sprite doesn't need to respond to control all the time; sometimes it will not be moving. The code that controls the sprite, therefore, is only one small part of all the things the player sprite will do. When you want to make an object in Python do something independent of the rest of its code, you place your new code in a function. Python functions start with the keyword `def`, which stands for define.

Make a function in your Player class to add some number of pixels to your sprite's position on screen. Don't worry about how many pixels you add yet; that will be decided in later code.

```
    def control(self,x,y):
        '''
        control player movement
        '''
        self.movex += x
        self.movey += y
```

To move a sprite in Pygame, you have to tell Python to redraw the sprite in its new location—and where that new location is.

Since the Player sprite isn't always moving, the updates need to be only one function within the Player class. Add this function after the `control` function you created earlier.

To make it appear that the sprite is walking (or flying, or whatever it is your sprite is supposed to do), you need to change its position on screen when the appropriate key is pressed. To get it to move across the screen, you redefine its position, designated by the `self.rect.x` and `self.rect.y` properties, to its current position plus whatever amount of `movex` or `movey` is applied. (The number of pixels the move requires is set later.)

```
    def update(self):
        '''
        Update sprite position
        '''
        self.rect.x = self.rect.x + self.movex        
```

Do the same thing for the Y position:

```
        self.rect.y = self.rect.y + self.movey
```

For animation, advance the animation frames whenever your sprite is moving, and use the corresponding animation frame as the player image:

```
        # moving left
        if self.movex < 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # moving right
        if self.movex > 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]
```

Tell the code how many pixels to add to your sprite's position by setting a variable, then use that variable when triggering the functions of your Player sprite.

First, create the variable in your setup section. In this code, the first two lines are for context, so just add the third line to your script:

```
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10  # how many pixels to move
```

Now that you have the appropriate function and variable, use your key presses to trigger the function and send the variable to your sprite.

Do this by replacing the `print` statements in your main loop with the Player sprite's name (player), the function (.control), and how many steps along the X axis and Y axis you want the player sprite to move with each loop.

```
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
```

Remember, `steps` is a variable representing how many pixels your sprite moves when a key is pressed. If you add 10 pixels to the location of your player sprite when you press D or the right arrow, then when you stop pressing that key you must subtract 10 (`-steps`) to return your sprite's momentum back to 0.

Try your game now. Warning: it won't do what you expect.

Why doesn't your sprite move yet? Because the main loop doesn't call the `update` function.

Add code to your main loop to tell Python to update the position of your player sprite. Add the line with the comment:

```
    player.update()  # update player position
    player_list.draw(world)
    pygame.display.flip()
    clock.tick(fps)
```

Launch your game again to witness your player sprite move across the screen at your bidding. There's no vertical movement yet because those functions will be controlled by gravity, but that's another lesson for another article.

In the meantime, if you have access to a joystick, try reading Pygame's documentation for its [joystick][4] module and see if you can make your sprite move that way. Alternately, see if you can get the [mouse][5] to interact with your sprite.

Most importantly, have fun!

### All the code used in this tutorial

For your reference, here is all the code used in this series of articles so far.

```
#!/usr/bin/env python3
# draw a world
# add a player and player control
# add player movement

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

class Player(pygame.sprite.Sprite):
    '''
    Spawn a player
    '''
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.movex = 0
        self.movey = 0
        self.frame = 0
        self.images = []
        for i in range(1,5):
            img = pygame.image.load(os.path.join('images','hero' + str(i) + '.png')).convert()
            img.convert_alpha()
            img.set_colorkey(ALPHA)
            self.images.append(img)
            self.image = self.images[0]
            self.rect  = self.image.get_rect()

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
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[self.frame//ani]

        # moving right
        if self.movex > 0:
            self.frame += 1
            if self.frame > 3*ani:
                self.frame = 0
            self.image = self.images[(self.frame//ani)+4]


'''
Setup
'''
worldx = 960
worldy = 720

fps = 40        # frame rate
ani = 4        # animation cycles
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
player = Player()   # spawn player
player.rect.x = 0
player.rect.y = 0
player_list = pygame.sprite.Group()
player_list.add(player)
steps = 10      # how fast to move

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

#    world.fill(BLACK)
    world.blit(backdrop, backdropbox)
    player.update()
    player_list.draw(world) #refresh player position
    pygame.display.flip()
    clock.tick(fps)
```

You've come far and learned much, but there's a lot more to do. In the next few articles, you'll add enemy sprites, emulated gravity, and lots more. In the mean time, practice with Python!

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/game-python-moving-player

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/10/python-101
[2]: https://opensource.com/article/17/12/program-game-python-part-2-creating-game-world
[3]: https://opensource.com/article/17/12/program-game-python-part-3-spawning-player
[4]: http://pygame.org/docs/ref/joystick.html
[5]: http://pygame.org/docs/ref/mouse.html#module-pygame.mouse
