5 open source puzzle games for Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle-pieces.jpg?itok=YHIN4_0L)

Gaming has traditionally been one of Linux's weak points. That has changed somewhat in recent years thanks to Steam, GOG, and other efforts to bring commercial games to multiple operating systems, but those games are often not open source. Sure, the games can be played on an open source operating system, but that is not good enough for an open source purist.

So, can someone who only uses free and open source software find games that are polished enough to present a solid gaming experience without compromising their open source ideals? Absolutely. While open source games are unlikely ever to rival some of the AAA commercial games developed with massive budgets, there are plenty of open source games, in many genres, that are fun to play and can be installed from the repositories of most major Linux distributions. Even if a particular game is not packaged for a particular distribution, it is usually easy to download the game from the project's website in order to install and play it.

This article looks at puzzle games. I have already written about [arcade-style games][1] and [board and card games][2]. In future articles, I plan to cover racing, role-playing, and strategy & simulation games.

### Atomix
![](https://opensource.com/sites/default/files/uploads/atomix.png)
[Atomix][3] is an open source clone of the [Atomix][4] puzzle game released in 1990 for Amiga, Commodore 64, MS-DOS, and other platforms. The goal of Atomix is to construct atomic molecules by connecting atoms. Individual atoms can be moved up, down, left, or right and will keep moving in that direction until the atom hits an obstacle—either the level's walls or another atom. This means that planning is needed to figure out where in the level to construct the molecule and in what order to move the individual pieces. The first level features a simple water molecule, which is made up of two hydrogen atoms and one oxygen atom, but later levels feature more complex molecules.

To install Atomix, run the following command:

  * On Fedora: `dnf`` install ``atomix`
  * On Debian/Ubuntu: `apt install`



### Fish Fillets - Next Generation
![](https://opensource.com/sites/default/files/uploads/fish_fillets.png)
[Fish Fillets - Next Generation][5] is a Linux port of the game Fish Fillets, which was released in 1998 for Windows, and the source code was released under the GPL in 2004. The game involves two fish trying to escape various levels by moving objects out of their way. The two fish have different attributes, so the player needs to pick the right fish for each task. The larger fish can move heavier objects but it is bigger, which means it cannot fit in smaller gaps. The smaller fish can fit in those smaller gaps, but it cannot move the heavier objects. Both fish will be crushed if an object is dropped on them from above, so the player needs to be careful when moving pieces.

To install Fish Fillets, run the following command:

  * On Fedora: `dnf`` install fillets-ng`
  * On Debian/Ubuntu: `apt install fillets-ng`



### Frozen Bubble
![](https://opensource.com/sites/default/files/uploads/frozen-bubble.png)
[Frozen Bubble][6] is an arcade-style puzzle game that involves shooting bubbles from the bottom of the screen toward a collection of bubbles at the top of the screen. If three bubbles of the same color connect, they are removed from the screen. Any other bubbles that were connected below the removed bubbles but that were not connected to anything else are also removed. In puzzle mode, the design of the levels is fixed, and the player simply needs to remove the bubbles from the play area before the bubbles drop below a line near the bottom of the screen. The games arcade mode and multiplayer modes follow the same basic rules but provide some differences, which adds to the variety. Frozen Bubble is one of the iconic open source games, so if you have not played it before, check it out.

To install Frozen Bubble, run the following command:

  * On Fedora: `dnf`` install frozen-bubble`
  * On Debian/Ubuntu: `apt install frozen-bubble`



### Hex-a-hop
![](https://opensource.com/sites/default/files/uploads/hex-a-hop.png)
[Hex-a-hop][7] is a hexagonal tile-based puzzle game in which the player needs to remove all the green tiles from the level. Tiles are removed by moving over them. Since tiles disappear after they are moved over, it is imperative to plan the optimal path through the level to remove all the tiles without getting stuck. However, there is an undo feature if the player uses a sub-optimal path. Later levels add extra complexity by including tiles that need to be crossed over multiple times and bouncing tiles that cause the player to jump over a certain number of hexes.

To install Hex-a-hop, run the following command:

  * On Fedora: `dnf`` install hex-a-hop`
  * On Debian/Ubuntu: `apt install hex-a-hop`



### Pingus
![](https://opensource.com/sites/default/files/uploads/pingus.png)
[Pingus][8] is an open source clone of [Lemmings][9]. It is not an exact clone, but the game-play is very similar. Small creatures (lemmings in Lemmings, penguins in Pingus) enter the level through the level's entrance and start walking in a straight line. The player needs to use special abilities to make it so that the creatures can reach the level's exit without getting trapped or falling off a cliff. These abilities include things like digging or building a bridge. If a sufficient number of creatures make it to the exit, the level is successfully solved and the player can advance to the next level. Pingus adds a few extra features to the standard Lemmings features, including a world map and a few abilities not found in the original game, but fans of the classic Lemmings game should feel right at home in this open source variant.

To install Pingus, run the following command:

  * On Fedora: `dnf`` install ``pingus`
  * On Debian/Ubuntu: `apt install ``pingus`



Did I miss one of your favorite open source puzzle games? Share it in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/puzzle-games-linux

作者：[Joshua Allen Holm][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
[1]:https://opensource.com/article/18/1/arcade-games-linux
[2]:https://opensource.com/article/18/3/card-board-games-linux
[3]:https://wiki.gnome.org/action/raw/Apps/Atomix
[4]:https://en.wikipedia.org/w/index.php?title=Atomix_(video_game)
[5]:http://fillets.sourceforge.net/index.php
[6]:http://www.frozen-bubble.org/home/
[7]:http://hexahop.sourceforge.net/index.html
[8]:https://pingus.seul.org/index.html
[9]:http://en.wikipedia.org/wiki/Lemmings
