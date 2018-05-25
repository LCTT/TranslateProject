A CLI Game To Learn Vim Commands
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/PacVim-720x340.png)

Howdy, Vim users! Today, I stumbled upon a cool utility to sharpen your Vim usage skills. Vim is a great editor to write and edit code. However, some of you (including me) are still struggling with the steep learning curve. Not anymore! Meet **PacVim** , a CLI game that helps you to learn Vim commands. PacVim is inspired by the classic game [**PacMan**][1] and it gives you plenty of practice with Vim commands in a fun and interesting way. Simply put, PacVim is a fun, free way to learn about the vim commands in-depth. Please do not confuse PacMan with [**pacman**][2] (the arch Linux package manager). PacMan is a classic, popular arcade game released in the 1980s.

In this brief guide, we will see how to install and use PacVim in Linux.

### Install PacVim

First, install **Ncurses** library and **development tools** as described in the following links.

Please note that this game may not compile and install properly without gcc version 4.8.X or higher. I tested PacVim on Ubuntu 18.04 LTS and it worked perfectly.

Once Ncurses and gcc are installed, run the following commands to install PacVim.
```
$ git clone https://github.com/jmoon018/PacVim.git
$ cd PacVim
$ sudo make install

```

## Learn Vim Commands Using PacVim

### Start PacVim game

To play this game, just run:
```
$ pacvim [LEVEL_NUMER] [MODE]

```

For example, the following command starts the game in 5th level with normal mode.
```
$ pacvim 5 n

```

Here, **“5”** represents the level and **“n”** represents the mode. There are two modes

  * **n** – normal mode.
  * **h** – hard mode.



The default mode is h, which is hard:

To start from the beginning (0 level), just run:
```
$ pacvim

```

Here is the sample output from my Ubuntu 18.04 LTS system.

![][4]

To begin the game, just press **ENTER**.

![][5]

Now start playing the game. Read the next chapter to know how to play.

To quit, press **ESC** or **q**.

The following command starts the game in 5th level with hard mode.
```
$ pacvim 5 h

```

Or,
```
$ pacvim 5

```

### How to play PacVim?

The usage of PacVim is very similar to PacMan.

You must run over all the characters on the screen while avoiding the ghosts (the red color characters).

PacVim has two special obstacles:

  1. You cannot move into the walls (yellow color). You must use vim motions to jump over them.
  2. If you step on a tilde character (cyan `~`), you lose!



You are given three lives. You gain a life each time you beat level 0, 3, 6, 9, etc. There are 10 levels in total, starting from 0 to 9. After beating the 9th level, the game is reset to the 0th level, but the ghosts move faster.

**Winning conditions**

Use vim commands to move the cursor over the letters and highlight them. After all letters are highlighted, you win and proceed to the next level.

**Losing conditions**

If you touch a ghost (indicated by a **red G** ) or a **tilde** character, you lose a life. If you have less than 0 lives, you will lose the entire game.

Here is the list of Implemented Commands:-

key what it does q quit the game h move left j move down k move up l move right w move forward to next word beginning W move forward to next WORD beginning e move forward to next word ending E move forward to next WORD ending b move backward to next word beginning B move backward to next WORD beginning $ move to the end of the line 0 move to the beginning of the line gg/1G move to the beginning of the first line numberG move to the beginning of the line given by number G move to the beginning of the last line ^ move to the first word at the current line & 1337 cheatz (beat current level)

After playing couple levels, you may notice there is a slight improvement in Vim usage. Keep playing this game once in a while until you mastering the Vim usage.

**Suggested read:**

And, that’s all for now. Hope this was useful. Playing PacVim is fun, interesting and keep you occupied. At the same time, you should be able to thoroughly learn the enough Vim commands. Give it a try, you won’t be disappointed.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://en.wikipedia.org/wiki/Pac-Man
[2]:https://www.ostechnix.com/getting-started-pacman/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/pacvim-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/05/pacvim-2.png
