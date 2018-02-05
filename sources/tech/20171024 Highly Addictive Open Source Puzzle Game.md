Highly Addictive Open Source Puzzle Game
======
![](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/10/Wizznic-Level4.png?resize=640%2C400&ssl=1)

### About Wizznic!

This is an open source game inspired by the classic Puzznic, a tile-matching puzzle arcade game developed and produced by Taito in 1989. The game is way more than a clone of Puzznic. But like Puzznic, it's a frighteningly addictive game. If you like puzzle games, Wizznic! is definitely a recommended download.

The premise of the game is quite simple, but many of the levels are fiendishly difficult. The objective of each level is to make all the bricks vanish. The bricks disappear when they touch others of the same kind. The bricks are heavy, so you can only push them sideways, but not lift them up. The level has to be cleared of bricks before the time runs out, or you lose a life. With all but the first game pack, you only have 3 lives.

### Installation

I've mostly played Wizznic! on a Beelink S1 mini PC running a vanilla Ubuntu 17.10 installation. The mini PC only has on-board graphics, but this game doesn't require any fancy graphics card. I needed to install three SDL libraries before the game's binary would start. Many Linux users will already have these libraries installed on their PC, but they are trivial to install.

`sudo apt install libsdl-dev`
`sudo apt-get install libsdl-image1.2`
`sudo apt-get install libsdl-mixer1.2`

The full source code is available on GitHub available under an open source license, so you can compile the source code if you really want. The Windows binary works 'out of the box'.

### Wizznic! in action

To give a flavour of Wizznic! in action, here's a short YouTube video of the game in action. Apologies for the poor quality sound, this is my first video made with the Beelink S1 mini PC (see footnote).

### Screenshots

#### Level 4 from the Wizznic! 1 Official Pack

![Wizznic! Level4][1]

The puzzles in the first pack offer a gentle introduction to the game.

#### Game Editor

![Wizznic! Editor][2]

The game sports its own puzzle creator. With the game editor, it's simple to make your own puzzles and share them with your friends, colleagues, and the rest of the world.

Features of the game include:

  * Atmospheric music - composed by SeanHawk
  * 2 game modes: Career, Arcade
  * Many hours of mind-bending puzzles to master
  * Create your own graphics (background images, tile sets, fonts), sound, levels, and packs
  * Built-in game editor - create your own puzzles
  * Play your own music
  * High Score table for each level
  * Skip puzzles after two failed attempts to solve them
  * Game can be controlled with the mouse, no keyboard needed
  * Level packs:
    * Wizznic! 1 - Official Pack with 20 levels, 5 lives. A fairly gentle introduction
    * Wizznic! 2 - Official Pack with 20 levels
    * Wizznic Silver - Proof of concept with 8 levels
    * Nes levels - NES Puzznic with 31 levels
    * Puzznic! S.4 - Stage 4 from Puzznic with 10 levels
    * Puzznic! S.8 - Stage 8 from Puzznic with 10 levels
    * Puzznic! S.9 - Stage 9 from Puzznic with 10 levels
    * Puzznic! S.10 - Stage 10 from Puzznic with 9 levels
    * Puzznic! S.11 - Stage 11 from Puzznic with 10 levels
    * Puzznic! S.12 - Stage 12 from Puzznic with 10 levels
    * Puzznic! S.13 - Stage 13 from Puzznic with 10 levels
    * Puzznic! S.14 - Stage 14 from Puzznic with 10 levels



### Command-Line Options

![Wizznic Command Options][3]

By default OpenGL is enabled, but it can be disabled. There are options to play the game in full screen mode, or scale to a 640×480 window. There's also Oculus Rift support, and the ability to dump screenshots of the levels.

**OS** **Supported** **Notes** ![][4]![][5] Besides Linux and Windows, there are official binaries available for Pandora, GP2X Wiz, GCW-Zero. There are also unofficial ports available for Android, Debian, Ubuntu, Gentoo, FreeBSD, Haiku, Amiga OS4, Canoo, Dingux, Motorola ZN5, U9, E8, EM30, VE66, EM35, and Playstation Portable.

Homepage: **[wizznic.org][6]**
Developer: Jimmy Christensen (Programming, Graphics, Sound Direction), ViperMD (Graphics)
License: GNU GPL v3
Written in: **[C][7]**

![][8]![][5] ![][9]![][10]

**Footnote**

The game's audio is way better. I probably should have tried the record facility available from the command line (see later); instead I used vokoscreen to make the video.


--------------------------------------------------------------------------------

via: https://www.ossblog.org/wizznic-highly-addictive-open-source-puzzle-game/

作者：[Steve Emms][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ossblog.org/author/steve/
[1]:https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/10/Wizznic-Level4.png?resize=640%2C510&ssl=1
[2]:https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/10/Wizznic-Editor.png?resize=640%2C510&ssl=1
[3]:https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/10/Wizznic-CommandOptions.png?resize=800%2C397&ssl=1
[4]:https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/01/linux.png?resize=48%2C48&ssl=1
[5]:https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/01/tick.png?resize=49%2C48&ssl=1
[6]:http://wizznic.org/
[7]:https://www.ossblog.org/c-programming-language-profile/
[8]:https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/01/windows.png?resize=48%2C48&ssl=1
[9]:https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/01/apple_green.png?resize=48%2C48&ssl=1
[10]:https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/01/cross.png?resize=48%2C48&ssl=1
