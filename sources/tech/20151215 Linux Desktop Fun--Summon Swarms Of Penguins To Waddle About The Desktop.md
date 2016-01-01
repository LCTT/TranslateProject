translation by strugglingyouth
Linux Desktop Fun: Summon Swarms Of Penguins To Waddle About The Desktop
================================================================================
XPenguins is a program for animating cute cartoons animals in your root window. By default it will be penguins they drop in from the top of the screen, walk along the tops of your windows, up the side of your windows, levitate, skateboard, and do other similarly exciting things. Now you can send an army of cute little penguins to invade the screen of someone else on your network.

### Install XPenguins ###

Open a command-line terminal (select Applications > Accessories > Terminal), and then type the following commands to install XPenguins program. First, type the command apt-get update to tell apt to refresh its package information by querying the configured repositories and then install the required program:

    $ sudo apt-get update
    $ sudo apt-get install xpenguins

### How do I Start XPenguins Locally? ###

Type the following command:

    $ xpenguins

Sample outputs:

![An army of cute little penguins invading the screen](http://files.cyberciti.biz/uploads/tips/2011/07/Workspace-1_002_12_07_2011.png)

An army of cute little penguins invading the screen

![Linux: Cute little penguins walking along the tops of your windows](http://files.cyberciti.biz/uploads/tips/2011/07/Workspace-1_001_12_07_2011.png)

Linux: Cute little penguins walking along the tops of your windows

![Xpenguins Screenshot](http://files.cyberciti.biz/uploads/tips/2011/07/xpenguins-screenshot.jpg)

Xpenguins Screenshot

Be careful when you move windows as the little guys squash easily. If you send the program an interupt signal (Ctrl-C) they will burst.

### Themes ###

To list themes, enter:

    $ xpenguins -l

Sample outputs:

    Big Penguins
    Bill
    Classic Penguins
    Penguins
    Turtles

You can use alternative themes as follows:

    $ xpenguins --theme "Big Penguins" --theme "Turtles"

You can install additional themes as follows:

    $ cd /tmp
    $ wget http://xpenguins.seul.org/xpenguins_themes-1.0.tar.gz
    $ tar -zxvf xpenguins_themes-1.0.tar.gz
    $ mkdir ~/.xpenguins
    $ mv -v themes ~/.xpenguins/
    $ xpenguins -l

Sample outputs:

    Lemmings
    Sonic the Hedgehog
    The Simpsons
    Winnie the Pooh
    Worms
    Big Penguins
    Bill
    Classic Penguins
    Penguins
    Turtles

To start with a random theme, enter:

    $ xpenguins --random-theme

To load all available themes and run them simultaneously, enter:

    $ xpenguins --all

More links and information:

- [XPenguins][1] home page.
- man penguins
- More Linux / UNIX desktop fun with [Steam Locomotive][2] and [Terminal ASCII Aquarium][3].

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/linux-cute-little-xpenguins-walk-along-tops-ofyour-windows.html

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://xpenguins.seul.org/
[2]:http://www.cyberciti.biz/tips/displays-animations-when-accidentally-you-type-sl-instead-of-ls.html
[3]:http://www.cyberciti.biz/tips/linux-unix-apple-osx-terminal-ascii-aquarium.html
