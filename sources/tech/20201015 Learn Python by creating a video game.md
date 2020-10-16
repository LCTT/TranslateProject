[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Python by creating a video game)
[#]: via: (https://opensource.com/article/20/10/learn-python-ebook)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn Python by creating a video game
======
Get to know Python the fun way using the step-by-step instructions in
our new eBook.
![Arcade games][1]

Python is one of the most popular programming languages out there. Whether you want to learn it for work or for fun, it's a powerful and useful language for any purpose. You can create applications to help you with daily tasks, fun games you and your friends can play, scripts to process data, applications to generate or parse information, and much more.

No matter what you intend to do with a programming language, we think it's more fun to learn by creating a game than by crunching numbers or transforming strings. And if you're completely new to programming, it's a lot easier to understand why you have to do something in code when you can see the code working in a familiar setting like a video game.

You may not select [Python][2] as the best programming language available (everyone has their own answer for that), but it is a relatively non-intimidating one. Python can use a lot of words (such as `is` and `is not`) instead of symbols (such as `=` and `!=`). It also manages many low-level tasks so that you usually don't have to worry about things like data types and garbage collection. This generally means you can get started coding without the upfront frustration that a complex language like [C][3] or [Java][4] presents.

To help you learn Python, we wrote an eBook showing how to create a platformer video game with it. Step through the lessons to learn Python while building a video game. As an additional benefit, you'll also learn about programming logic, syntax, operators, and more. You can see immediate results as you learn, so everything you learn is promptly reinforced.

### Python in a minute

Python is a general-purpose language, meaning it (like most languages) provides functions to do simple "tricks" with numbers and letters. Linux users already have Python installed. Mac users have an old version of Python, but you can [install the latest version][5] from the Python.org website. Windows users can learn to install Python from this [install Python on Windows][6] article.

Once installed, you can start an interactive Python shell and do math:


```
$ python3
&gt;&gt;&gt; 5+6
11
&gt;&gt;&gt; 11/2
5.5
&gt;&gt;&gt; 11//2
5
&gt;&gt;&gt; 11%2
1
```

As you can see from this sample, there's some special notation required, but it's mostly familiar to anyone comfortable with math. Maybe you're not a numbers person and prefer letters:


```
$ python3
&gt;&gt;&gt; string = "hello world"
&gt;&gt;&gt; print(string)
hello world
&gt;&gt;&gt; print(string.upper())
HELLO WORLD
&gt;&gt;&gt; print(string[0])
h
&gt;&gt;&gt; print(string[1])
e
&gt;&gt;&gt; print(string[2])
l
&gt;&gt;&gt; print(string[3])
l
&gt;&gt;&gt; print(string[4])
o
```

Again, there's special notation for relatively basic tasks, but even without an explanation, you probably already detected that the `[0]` and `[1]` notation enables you to "slice" data and `print` presents data on your screen.

### Pygame in five minutes

If you want to create a video game or anything beyond a basic calculator with Python alone, it could take a lot of study, work, and time. Luckily, Python's been around for a couple of decades, so people have developed libraries of code to help you perform typical programming feats with (comparatively) very little effort. [Pygame][7] is a set of code modules designed for creating video games. It's [not the only such library][8], but it's the oldest (for better and for worse), so there's a lot of documentation and examples online.

Start by learning the [recommended Python virtual environment workflow][9]:


```
$ python3 -m venv mycode/venv
$ cd mycode
$ source ./venv/bin/activate
(venv)$
```

Once you're in a virtual environment, you can safely install Pygame into your project folder:


```
(venv)$ echo "pygame" &gt;&gt; requirements.txt
(venv)$ python -m pip install -r requirements.txt
[...] Installing collected packages: pygame
Successfully installed pygame-x.y.z
```

Now that you have Pygame installed, you can create a simple demo application. It's easier than you think. Python can do what's called _object-oriented programming_ (OOP), which is a fancy computer science term to describe when code is structured as if you were creating physical objects with code. Programmers aren't deluded, though. They know they're not really making physical objects when they code, but it can help to imagine it that way because then you understand the limits of your programmed world.

For instance, if you were stranded on a desert island and wanted a coffee cup to appear, you'd have to harvest some clay, fashion a cup, and bake it. If you were very clever, you'll create a mold first so that whenever you want another cup, you can quickly create a new one from your template. Even though each cup came from the same template, they would be physically independent: should one break, you still have others. And you could make each coffee cup appear unique by adding color or etchings.

In Pygame, and in many programming tasks, you use similar logic. A thing can't appear in your programmed world until you define it. Here's how to make a coffee cup appear in a Python and Pygame program.

#### Object-oriented programming with Pygame

Create a new file called `main.py` and enter this code to initiate the Pygame module and to use a Pygame template to create a window:


```
import pygame

pygame.init()

screen = pygame.display.set_mode((960,720))
```

Just as you might use a template to create an object in real life, you use a template provided by Pygame to create a _sprite_ (which is Pygame's term for a visual game object). In object-oriented programming, a _class_ represents a template for an object. Type this code into your document:


```
class Cup(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)

        # image
        img = pygame.image.load('coffeecup.png').convert()
        self.image = img

        # volume
        self.rect = self.image.get_rect()
        self.rect.x = 10
        self.rect.y = 10
```

This code block uses Pygame's `sprite` template to design a coffee cup sprite. Your coffee cup sprite has an image because of `self.image`, while `self.rect` gives it volume (width and height). These are attributes Pygame expects a sprite to possess, but if you were creating a playable video game, you could give it any other attribute you want, such as health points and a score.

All you've done so far is create a window and the _template_ for a coffee cup. Your game doesn't actually _make_ a cup yet.

The last part of your code must use your template to generate a cup and add it to your game world. As you may know, computers are very fast, so technically, the code you've created so far would only run for a millisecond or so. When writing a graphical computer application, you must force the computer to remain open whether or not it thinks it has completed the prescribed tasks. Programmers do this with an _infinite loop_, which in Python is represented by the instruction `while True` (True is always true, so the loop never ends).

An infinite loop ensures your application stays open long enough for the computer user to see and use the application:


```
cup = Cup()

while True:
    pygame.display.update()
    screen.blit(cup.image, cup.rect)
```

This code sample creates a cup from your template `Cup` and then updates the display using a Pygame function. Finally, it draws the cup's image within its bounding box using Pygame's `blit` function.

#### Get a graphic

Before you can run the code successfully, you need a graphic for your coffee cup. You can find lots of [Creative Commons][10] coffee cup graphics on [FreeSVG.org][11]. I used [this one][12]. Save the graphic in your project directory, and call it `coffeecup.png`.

#### Run the game

Launch your application:


```
`(venv)$ python ./main.py`
```

![Coffee cup in Pygame][13]

(Seth Kenlon, [CC BY-SA 4.0][14])

### [Download the Python gaming eBook][15]

Pygame is a powerful framework, and there's a lot more you can do with it than just draw coffee cups on your screen. [Download our free eBook][15] to get to know Pygame—and Python itself—better.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/learn-python-ebook

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32 (Arcade games)
[2]: https://www.python.org/
[3]: https://opensource.com/article/20/8/c-programming-cheat-sheet
[4]: https://opensource.com/resources/java
[5]: https://www.python.org/downloads/mac-osx
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://www.pygame.org/news
[8]: https://opensource.com/article/18/4/easy-2d-game-creation-python-and-arcade
[9]: https://opensource.com/article/20/9/venv-python
[10]: https://opensource.com/article/20/1/what-creative-commons
[11]: http://freesvg.org
[12]: https://freesvg.org/1548870028
[13]: https://opensource.com/sites/default/files/uploads/pygame-cup.jpg (Coffee cup in Pygame)
[14]: https://creativecommons.org/licenses/by-sa/4.0/
[15]: https://opensource.com/downloads/python-gaming-ebook
