[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add scorekeeping to your Python game)
[#]: via: (https://opensource.com/article/20/1/add-scorekeeping-your-python-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Add scorekeeping to your Python game
======
In the tenth article in this series on programming with Python's Pygame
module, display your game player's score when they collect loot or take
damage.
![connecting yellow dots in a maze][1]

This is part 10 in an ongoing series about creating video games in [Python 3][2] using the [Pygame][3] module. Previous articles are:

  * [Learn how to program in Python by building a simple dice game][4]
  * [Build a game framework with Python using the Pygame module][5]
  * [How to add a player to your Python game][6]
  * [Using Pygame to move your game character around][7]
  * [What's a hero without a villain? How to add one to your Python game][8]
  * [Simulate gravity in your Python game][9]
  * [Add jumping to your Python platformer game][10]
  * [Enable your Python game player to run forward and backward][11]
  * [Using Python to set up loot in Pygame][12]



If you've followed along with this series, you've learned all the essential syntax and patterns you need to create a video game with Python. However, it still lacks one vital component. This component isn't important just for programming games in Python; it's something you must master no matter what branch of computing you explore: Learning new tricks as a programmer by reading a language's or library's documentation.

Luckily, the fact that you're reading this article is a sign that you're comfortable with documentation. For the practical purpose of making your platform game more polished, in this article, you will add a score and health display to your game screen. But the not-so-secret agenda of this lesson is to teach you how to find out what a library offers and how you can use new features.

### Displaying the score in Pygame

Now that you have loot that your player can collect, there's every reason to keep score so that your player sees just how much loot they've collected. You can also track the player's health so that when they hit one of the enemies, it has a consequence.

You already have variables that track score and health, but it all happens in the background. This article teaches you to display these statistics in a font of your choice on the game screen during gameplay.

### Read the docs

Most Python modules have documentation, and even those that do not can be minimally documented by Python's Help function. [Pygame's main page][13] links to its documentation. However, Pygame is a big module with a lot of documentation, and its docs aren't exactly written in the same approachable (and friendly and elucidating and helpful) narrative style as articles on Opensource.com. They're technical documents, and they list each class and function available in the module, what kind of inputs each expects, and so on. If you're not comfortable referring to descriptions of code components, this can be overwhelming.

The first thing to do, before bothering with a library's documentation, is to think about what you are trying to achieve. In this case, you want to display the player's score and health on the screen.

Once you've determined your desired outcome, think about what components are required for it. You can think of this in terms of variables and functions or, if that doesn't come naturally to you yet, you can think generically. You probably recognize that displaying a score requires some text, which you want Pygame to draw on the screen. If you think it through, you might realize that it's not very different from rendering a player or loot or a platform on screen.

Technically, you _could_ use graphics of numbers and have Pygame display those. It's not the easiest way to achieve your goal, but if it's the only way you know, then it's a valid way. However, if you refer to Pygame's docs, you see that one of the modules listed is **font**, which is Pygame's method for making printing text on the screen as easy as typing.

### Deciphering technical documentation

The **font** documentation page starts with **pygame.font.init()**, which it lists as the function that is used to initialize the font module. It's called automatically by **pygame.init()**, which you already call in your code. Once again, you've reached a point that that's technically _good enough_. While you don't know _how_ yet, you know that you _can_ use the **pygame.font** functions to print text on the screen.

If you read further, however, you find that there's yet an even better way to print fonts. The **pygame.freetype** module is described in the docs this way:

> The pygame.freetype module is a replacement for pygame.fontpygame module for loading and rendering fonts. It has all of the functionality of the original, plus many new features.

Further down the **pygame.freetype** documentation page, there's some sample code:


```
import pygame
import pygame.freetype
```

Your code already imports Pygame, but modify your **import** statements to include the Freetype module:


```
import pygame
import sys
import os
import pygame.freetype
```

### Using a font in Pygame

From the description of the font modules, it's clear that Pygame uses a font, whether it's one you provide or a default font built into Pygame, to render text on the screen. Scroll through the **pygame.freetype** documentation to find the **pygame.freetype.Font** function:


```
pygame.freetype.Font
Create a new Font instance from a supported font file.

Font(file, size=0, font_index=0, resolution=0, ucs4=False) -&gt; Font

pygame.freetype.Font.name
  Proper font name.

pygame.freetype.Font.path
  Font file path

pygame.freetype.Font.size
  The default point size used in rendering
```

This describes how to construct a font "object" in Pygame. It may not feel natural to you to think of a simple object onscreen as the combination of several code attributes, but it's very similar to how you built your hero and enemy sprites. Instead of an image file, you need a font file. Once you have a font file, you can create a font object in your code with the **pygame.freetype.Font** function and then use that object to render text on the screen.

Because not everyone in the world has the exact same fonts on their computers, it's important to bundle your chosen font with your game. To bundle a font, first create a new directory in your game folder, right along with the directory you created for your images. Call it **fonts**.

Even though several fonts come with your computer, it's not legal to give those fonts away. It seems strange, but that's how the law works. If you want to ship a font with your game, you must find an open source or Creative Commons font that permits you to give the font away along with your game.

Sites that specialize in free and legal fonts include:

  * [Font Library][14]
  * [Font Squirrel][15]
  * [League of Moveable Type][16]



When you find a font that you like, download it. Extract the ZIP or [TAR][17] file and move the **.ttf** or **.otf** file into the **fonts** folder in your game project directory.

You aren't installing the font on your computer. You're just placing it in your game's **fonts** folder so that Pygame can use it. You _can_ install the font on your computer if you want, but it's not necessary. The important thing is to have it in your game directory, so Pygame can "trace" it onto the screen.

If the font file has a complicated name with spaces or special characters, just rename it. The filename is completely arbitrary, and the simpler it is, the easier it is for you to type into your code.

Now tell Pygame about your font. From the documentation, you know that you'll get a font object in return when you provide at least the path to a font file to **pygame.freetype.Font** (the docs state explicitly that all remaining attributes are optional):


```
`Font(file, size=0, font_index=0, resolution=0, ucs4=False) -> Font`
```

Create a new variable called **myfont** to serve as your font in the game, and place the results of the **Font** function into that variable. This example uses the **amazdoom.ttf** font, but you can use whatever font you want. Place this code in your Setup section:


```
font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),"fonts","amazdoom.ttf")
font_size = tx
myfont = pygame.freetype.Font(font_path, font_size)
```

### Displaying text in Pygame

Now that you've created a font object, you need a function to draw the text you want onto the screen. This is the same principle you used to draw the background and platforms in your game.

First, create a function, and use the **myfont** object to create some text, setting the color to some RGB value. This must be a global function; it does not belong to any specific class:


```
def stats(score,health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), WHITE, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), WHITE, None, size=64)
```

Of course, you know by now that nothing happens in your game if it's not in the Main loop, so add a call to your **stats** function near the bottom of the file:


```
    for e in enemy_list:
        e.move()
    stats(player.score,player.health) # draw text
    pygame.display.flip()
```

Try your game.

When the player collects loot, the score goes up. When the player gets hit by an enemy, health goes down. Success!

![Keeping score in Pygame][18]

There is one problem, though. When a player gets hit by an enemy, health goes _way_ down, and that's not fair. You have just discovered a non-fatal bug. Non-fatal bugs are those little problems in applications that don't keep the application from starting up or even from working (mostly), but they either don't make sense, or they annoy the user. Here's how to fix this one.

### Fixing the health counter

The problem with the current health point system is that health is subtracted for every tick of the Pygame clock that the enemy is touching the player. That means that a slow-moving enemy can take a player down to –200 health in just one encounter, and that's not fair. You could, of course, just give your player a starting health score of 10,000 and not worry about it; that would work, and possibly no one would mind. But there is a better way.

Currently, your code detects when a player and an enemy collide. The fix for the health-point problem is to detect _two_ separate events: when the player and enemy collide and, once they have collided, when they _stop_ colliding.

First, in your Player class, create a variable to represent when a player and enemy have collided:


```
        self.frame = 0
        self.health = 10
        self.damage = 0
```

In the update function of your Player class, _remove_ this block of code:


```
        for enemy in enemy_hit_list:
            self.health -= 1
            #print(self.health)
```

And in its place, check for collision as long as the player is not currently being hit:


```
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)
```

You might see similarities between the block you deleted and the one you just added. They're both doing the same job, but the new code is more complex. Most importantly, the new code runs only if the player is not _currently_ being hit. That means that this code runs once when a player and enemy collide and not constantly for as long as the collision happens, the way it used to.

The new code uses two new Pygame functions. The **self.rect.contains** function checks to see if an enemy is currently within the player's bounding box, and **self.rect.colliderect** sets your new **self.damage** variable to one when it is true, no matter how many times it is true.

Now even three seconds of getting hit by an enemy still looks like one hit to Pygame.

I discovered these functions by reading through Pygame's documentation. You don't have to read all the docs at once, and you don't have to read every word of each function. However, it's important to spend time with the documentation of a new library or module that you're using; otherwise, you run a high risk of reinventing the wheel. Don't spend an afternoon trying to hack together a solution to something that's already been solved by the framework you're using. Read the docs, find the functions, and benefit from the work of others!

Finally, add another block of code to detect when the player and the enemy are no longer touching. Then and only then, subtract one point of health from the player.


```
        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # set damage back to 0
                self.health -= 1  # subtract 1 hp
```

Notice that this new code gets triggered _only_ if the player has been hit. That means this code doesn't run while your player is running around your game world exploring or collecting loot. It only runs when the **self.damage** variable gets activated.

When the code runs, it uses **self.rect.collidelist** to see whether or not the player is _still_ touching an enemy in your enemy list (**collidelist** returns negative one when it detects no collision). Once it is not touching an enemy, it's time to pay the **self.damage** debt: deactivate the **self.damage** variable by setting it back to zero and subtract one point of health.

Try your game now.

### Score reaction

Now that you have a way for your player to know their score and health, you can make certain events occur when your player reaches certain milestones. For instance, maybe there's a special loot item that restores some health points. And maybe a player who reaches zero health points has to start back at the beginning of a level.

You can check for these events in your code and manipulate your game world accordingly. You already know how, so go skim the documentation for new tricks and try them out on your own.

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
# add scrolling
# add loot
# add score

# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import pygame
import sys
import os
import pygame.freetype

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
        self.damage = 0
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
        if self.damage == 0:
            for enemy in enemy_hit_list:
                if not self.rect.contains(enemy):
                    self.damage = self.rect.colliderect(enemy)

        if self.damage == 1:
            idx = self.rect.collidelist(enemy_hit_list)
            if idx == -1:
                self.damage = 0   # set damage back to 0
                self.health -= 1  # subtract 1 hp

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

def stats(score,health):
    myfont.render_to(world, (4, 4), "Score:"+str(score), SNOWGRAY, None, size=64)
    myfont.render_to(world, (4, 72), "Health:"+str(health), SNOWGRAY, None, size=64)

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
SNOWGRAY = (137,164,166)
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
tx = 64 #tile size
ty = 64 #tile size

font_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),"fonts","amazdoom.ttf")
font_size = tx
myfont = pygame.freetype.Font(font_path, font_size)
   
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
    stats(player.score,player.health) # draw text
    pygame.display.flip()
    clock.tick(fps)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/add-scorekeeping-your-python-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_maze.png?itok=mZ5LP4-X (connecting yellow dots in a maze)
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
[12]: https://opensource.com/article/19/12/loot-python-platformer-game
[13]: http://pygame.org/news
[14]: https://fontlibrary.org/
[15]: https://www.fontsquirrel.com/
[16]: https://www.theleagueofmoveabletype.com/
[17]: https://opensource.com/article/17/7/how-unzip-targz-file
[18]: https://opensource.com/sites/default/files/uploads/pygame-score.jpg (Keeping score in Pygame)
