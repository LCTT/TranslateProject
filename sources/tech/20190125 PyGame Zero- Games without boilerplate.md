[#]: collector: (lujun9972)
[#]: translator: (xiqingongzi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PyGame Zero: Games without boilerplate)
[#]: via: (https://opensource.com/article/19/1/pygame-zero)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

PyGame Zero: Games without boilerplate
======
Say goodbye to boring boilerplate in your game development with PyGame Zero.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python3-game.png?itok=jG9UdwC3)

Python is a good beginner programming language. And games are a good beginner project: they are visual, self-motivating, and fun to show off to friends and family. However, the most common library to write games in Python, [PyGame][1], can be frustrating for beginners because forgetting seemingly small details can easily lead to nothing rendering.

Until people understand why all the parts are there, they treat many of them as "mindless boilerplate"—magic paragraphs that need to be copied and pasted into their program to make it work.

[PyGame Zero][2] is intended to bridge that gap by putting a layer of abstraction over PyGame so it requires literally no boilerplate.

When we say literally, we mean it.

This is a valid PyGame Zero file:

```
# This comment is here for clarity reasons
```

We can run put it in a **game.py** file and run:

```
$ pgzrun game.py
```

This will show a window and run a game loop that can be shut down by closing the window or interrupting the program with **CTRL-C**.

This will, sadly, be a boring game. Nothing happens.

To make it slightly more interesting, we can draw a different background:

```
def draw():
    screen.fill((255, 0, 0))
```

This will make the background red instead of black. But it is still a boring game. Nothing is happening. We can make it slightly more interesting:

```
colors = [0, 0, 0]

def draw():
    screen.fill(tuple(colors))

def update():
    colors[0] = (colors[0] + 1) % 256
```

This will make a window that starts black, becomes brighter and brighter red, then goes back to black, over and over again.

The **update** function updates parameters, while the **draw** function renders the game based on these parameters.

However, there is no way for the player to interact with the game! Let's try something else:

```
colors = [0, 0, 0]

def draw():
    screen.fill(tuple(colors))

def update():
    colors[0] = (colors[0] + 1) % 256

def on_key_down(key, mod, unicode):
    colors[1] = (colors[1] + 1) % 256
```

Now pressing keys on the keyboard will increase the "greenness."

These comprise the three important parts of a game loop: respond to user input, update parameters, and re-render the screen.

PyGame Zero offers much more, including functions for drawing sprites and playing sound clips.

Try it out and see what type of game you can come up with!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/pygame-zero

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://www.pygame.org/news
[2]: https://pygame-zero.readthedocs.io/en/stable/
