The Most Famous Classic Text-based Adventure Game
======
**Colossal Cave Adventure** , also known as **ADVENT** , **Colossal Cave** , or **Adventure** , is a most popular text-based adventure game in the period of early 80s and late 90s. This game is also known to be historic first "interactive fiction" game. In 1976, a Programmer named **Will Crowther** wrote the early version of this game, and later a fellow programmer **Don Woods** improved the game with many features by adding scoring system, more fantasy characters and locations. This game is originally developed for **PDP-10** , a good-old giant Mainframe computer. Later, it was ported to normal home desktop computers like IBM PC and Commodore 64. The original game was written using Fortran, and later it was introduced in MS-DOS 1.0 in the early 1980s by Microsoft.

The **Adventure 2.5** final version released in 1995 has never been packaged for modern operating systems. It went nearly extinct. Thankfully, after several years the open source advocate **Eric Steven Raymond** has ported this classic game to modern operating systems with the permission from original authors. He open sourced this classic game and hosted the source code in GitLab with a new name **" open-adventure"**.

The main objective of this game is to find a cave rumored to be filled with a lot of treasure and gold and get out of it alive. The player earns points as he moves around the imaginary cave. The total number of points is 430. This game is mainly inspired by the extensive knowledge of cave exploration of the original author **Will Crowther**. He had been actively exploring in caves, particularly Mammoth Cave in Kentucky. Since the game 's cave structured loosely around the Mammoth Cave, you may notice many similarities between the locations in the game and those in Mammoth Cave.

### Installing Colossal Cave Adventure game

Open-Adventure has been packaged for Arch based systems and is available in [**AUR**][1]. So, we can install it using any AUR helpers in Arch Linux and its variants such as Antergos, and Manjaro Linux.

Using [**Pacaur**][2]:
```
pacaur -S open-adventure
```

Using [**Packer**][3]:
```
packer -S open-adventure
```

Using [**Yaourt**][4]:
```
yaourt -S open-adventure
```

On other Linux distros, you might need to compile and install it from the source as described below.

Install the perquisites first:

On Debian and Ubuntu:
```
sudo apt-get install python3-yaml libedit-dev
```

On Fedora:
```
sudo dnf install python3-PyYAML libedit-devel
```

You can also use pip to install PyYAML:
```
sudo pip3 install PyYAML
```

After installing the prerequisites, compile and install open-adventure from source as shown below:
```
git clone https://gitlab.com/esr/open-adventure.git
```
```
make
```
```
make check
```

Finally, run 'advent' binary to play:
```
advent
```

There is also an Android version of this game available in [**Google Play store**][5].

### How to play?

To start the game, just type the following from Terminal:
```
advent
```

You will see a welcome screen. Type "y" if you want instructions or type "n" to get into the adventurous trip.

[![][6]][7]

The game begins in-front of a small brick building. The player needs to direct the character with simple one or two word commands in simple English. To move your character, just type commands like **in** , **out** , **enter** , **exit** , **building** , **forest** , **east** , **west** , **north** , **south** , **up** , or **down**. You can also use one-word letters to specify the direction. Here are some one letters to direct the character to move: **N** , **S** , **E** , **W** , **NW** , **SE** , etc.

For example, if you type **" south"** or simply **" s"** the character will go south side of the present location. Please note that the character will understand only the first five characters. So when you have to type some long words, such as **northeast** , just use NE (small or caps). To specify southeast use SE. To pick up an item, type **pick**. To exit from a place, type **exit**. To go inside the building or any place, type **in**. To exit from any place, type **exit** and so on. It also warns you if there are any danger along the way. Also you can interact with two-word commands like **" eat food"**, **" drink water"**, **" get lamp"**, **" light lamp"**, **" kill snake"** etc. You can display the help section at any time by simply typing "help".

[![][6]][8]

I spent my entire afternoon to see what is in this game. Oh dear, it was super fun, exciting, thrill and adventurous experience!

[![][6]][9]

I went into many levels and explored many locations along the way. I even got gold and was attacked by a snake and a dwarf once. I must admit that this game is really addictive and best time killer.

If you left the cave safely with treasure, you win and you will get full credit to the treasure. You will also get partial credit just for locating the treasure. To end your adventure early, type **" quit"**. To suspend your adventure, type **" suspend"** (or "pause" or "save"). You can resume the adventure later. To see how well you're doing, type **" score"**. Please remember that you will lose points for getting killed, or for quitting.

Have fun! Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/colossal-cave-adventure-famous-classic-text-based-adventure-game/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/open-adventure/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://play.google.com/store/apps/details?id=com.ecsoftwareconsulting.adventure430
[6]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-2.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-3.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-1.png ()
