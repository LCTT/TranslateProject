[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a game framework with Python using the module Pygame)
[#]: via: (https://opensource.com/article/17/12/game-framework-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Build a game framework with Python using the module Pygame
======
The first part of this series explored Python by creating a simple dice game. Now it's time to make your own game from scratch.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python2-header.png?itok=tEvOVo4A)

In my [first article in this series][1], I explained how to use Python to create a simple, text-based dice game. This time, I'll demonstrate how to use the Python module Pygame to create a graphical game. It will take several articles to get a game that actually does anything, but by the end of the series, you will have a better understanding of how to find and learn new Python modules and how to build an application from the ground up.

Before you start, you must install [Pygame][2].

### Installing new Python modules

There are several ways to install Python modules, but the two most common are:

  * From your distribution's software repository
  * Using the Python package manager, pip



Both methods work well, and each has its own set of advantages. If you're developing on Linux or BSD, leveraging your distribution's software repository ensures automated and timely updates.

However, using Python's built-in package manager gives you control over when modules are updated. Also, it is not OS-specific, meaning you can use it even when you're not on your usual development machine. Another advantage of pip is that it allows local installs of modules, which is helpful if you don't have administrative rights to a computer you're using.

### Using pip

If you have both Python and Python3 installed on your system, the command you want to use is probably `pip3`, which differentiates it from Python 2.x's `pip` command. If you're unsure, try `pip3` first.

The `pip` command works a lot like most Linux package managers. You can search for Python modules with `search`, then install them with `install`. If you don't have permission to install software on the computer you're using, you can use the `--user` option to just install the module into your home directory.

```
$ pip3 search pygame
[...]
Pygame (1.9.3)                 - Python Game Development
sge-pygame (1.5)               - A 2-D game engine for Python
pygame_camera (0.1.1)          - A Camera lib for PyGame
pygame_cffi (0.2.1)            - A cffi-based SDL wrapper that copies the pygame API.
[...]
$ pip3 install Pygame --user
```

Pygame is a Python module, which means that it's just a set of libraries that can be used in your Python programs. In other words, it's not a program that you launch, like [IDLE][3] or [Ninja-IDE][4] are.

### Getting started with Pygame

A video game needs a setting; a world in which it takes place. In Python, there are two different ways to create your setting:

  * Set a background color
  * Set a background image



Your background is only an image or a color. Your video game characters can't interact with things in the background, so don't put anything too important back there. It's just set dressing.

### Setting up your Pygame script

To start a new Pygame project, create a folder on your computer. All your game files go into this directory. It's vitally important that you keep all the files needed to run your game inside of your project folder.

![](https://opensource.com/sites/default/files/u128651/project.jpg)

A Python script starts with the file type, your name, and the license you want to use. Use an open source license so your friends can improve your game and share their changes with you:

```
#!/usr/bin/env python3
# by Seth Kenlon

## GPLv3
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

Then you tell Python what modules you want to use. Some of the modules are common Python libraries, and of course, you want to include the one you just installed, Pygame.

```
import pygame  # load pygame keywords
import sys     # let  python use your file system
import os      # help python identify your OS
```

Since you'll be working a lot with this script file, it helps to make sections within the file so you know where to put stuff. You do this with block comments, which are comments that are visible only when looking at your source code. Create three blocks in your code.

```
'''
Objects
'''

# put Python classes and functions here

'''
Setup
'''

# put run-once code here

'''
Main Loop
'''

# put game loop here
```

Next, set the window size for your game. Keep in mind that not everyone has a big computer screen, so it's best to use a screen size that fits on most people's computers.

There is a way to toggle full-screen mode, the way many modern video games do, but since you're just starting out, keep it simple and just set one size.

```
'''
Setup
'''
worldx = 960
worldy = 720
```

The Pygame engine requires some basic setup before you can use it in a script. You must set the frame rate, start its internal clock, and start (`init`) Pygame.

```
fps   = 40  # frame rate
ani   = 4   # animation cycles
clock = pygame.time.Clock()
pygame.init()
```

Now you can set your background.

### Setting the background

Before you continue, open a graphics application and create a background for your game world. Save it as `stage.png` inside a folder called `images` in your project directory.

There are several free graphics applications you can use.

  * [Krita][5] is a professional-level paint materials emulator that can be used to create beautiful images. If you're very interested in creating art for video games, you can even purchase a series of online [game art tutorials][6].
  * [Pinta][7] is a basic, easy to learn paint application.
  * [Inkscape][8] is a vector graphics application. Use it to draw with shapes, lines, splines, and Bézier curves.



Your graphic doesn't have to be complex, and you can always go back and change it later. Once you have it, add this code in the setup section of your file:

```
world    = pygame.display.set_mode([worldx,worldy])
backdrop = pygame.image.load(os.path.join('images','stage.png').convert())
backdropbox = world.get_rect()
```

If you're just going to fill the background of your game world with a color, all you need is:

```
world = pygame.display.set_mode([worldx,worldy])
```

You also must define a color to use. In your setup section, create some color definitions using values for red, green, and blue (RGB).

```
'''
Setup
'''

BLUE  = (25,25,200)
BLACK = (23,23,23 )
WHITE = (254,254,254)
```

At this point, you could theoretically start your game. The problem is, it would only last for a millisecond.

To prove this, save your file as `your-name_game.py` (replace `your-name` with your actual name). Then launch your game.

If you are using IDLE, run your game by selecting `Run Module` from the Run menu.

If you are using Ninja, click the `Run file` button in the left button bar.

![](https://opensource.com/sites/default/files/u128651/ninja_run_0.png)

You can also run a Python script straight from a Unix terminal or a Windows command prompt.

```
$ python3 ./your-name_game.py
```

If you're using Windows, use this command:

```
py.exe your-name_game.py
```

However you launch it, don't expect much, because your game only lasts a few milliseconds right now. You can fix that in the next section.

### Looping

Unless told otherwise, a Python script runs once and only once. Computers are very fast these days, so your Python script runs in less than a second.

To force your game to stay open and active long enough for someone to see it (let alone play it), use a `while` loop. To make your game remain open, you can set a variable to some value, then tell a `while` loop to keep looping for as long as the variable remains unchanged.

This is often called a "main loop," and you can use the term `main` as your variable. Add this anywhere in your setup section:

```
main = True
```

During the main loop, use Pygame keywords to detect if keys on the keyboard have been pressed or released. Add this to your main loop section:

```
'''
Main loop
'''
while main == True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit(); sys.exit()
            main = False

        if event.type == pygame.KEYDOWN:
            if event.key == ord('q'):
                pygame.quit()
                sys.exit()
                main = False
```

Also in your main loop, refresh your world's background.

If you are using an image for the background:

```
world.blit(backdrop, backdropbox)
```

If you are using a color for the background:

```
world.fill(BLUE)
```

Finally, tell Pygame to refresh everything on the screen and advance the game's internal clock.

```
    pygame.display.flip()
    clock.tick(fps)
```

Save your file, and run it again to see the most boring game ever created.

To quit the game, press `q` on your keyboard.

In the [next article][9] of this series, I'll show you how to add to your currently empty game world, so go ahead and start creating some graphics to use!

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/game-framework-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/10/python-101
[2]: http://www.pygame.org/wiki/about
[3]: https://en.wikipedia.org/wiki/IDLE
[4]: http://ninja-ide.org/
[5]: http://krita.org
[6]: https://gumroad.com/l/krita-game-art-tutorial-1
[7]: https://pinta-project.com/pintaproject/pinta/releases
[8]: http://inkscape.org
[9]: https://opensource.com/article/17/12/program-game-python-part-3-spawning-player
