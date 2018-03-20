5 open source card and board games for Linux
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN)

Gaming has traditionally been one of Linux's weak points. That has changed somewhat in recent years thanks to Steam, GOG, and other efforts to bring commercial games to multiple operating systems, but many of those games are not open source. Sure, the games can be played on an open source operating system, but that is not good enough for an open source purist.

So, can someone who uses only free and open source software find games that are polished enough to offer a solid gaming experience without compromising their open source ideals? Absolutely. While open source games are unlikely ever to rival some of the AAA commercial games developed with massive budgets, there are plenty of open source games in many genres that are fun to play and can be installed from the repositories of most major Linux distributions. Even if a particular game is not packaged for a particular distribution, it is usually easy to download, install, and play by downloading it from the project's website.

This article looks at computer versions of popular board and card games. I have already written about [arcade-style games][1]. In future articles, I plan to cover puzzle, racing, role-playing, and strategy & simulation games.

### Kajongg

There are many applications that are called [Mahjong][2], but almost all are versions of the tile-matching solitaire game that uses Mahjong tiles. [Kajongg][3] is a rare exception because it is an implementation of the classic rummy-style game for four players. This traditional multi-player version of Mahjong is most popular throughout East and Southeast Asia, but there are players throughout the world. This means there are many variations of [Mahjong rules][4]. Unfortunately, Kajongg does not support them all, but it does allow players to play a fairly standard game of Mahjong with two different rules variants. Kajongg can be played locally against computer players or online versus human opponents.

To install Kajongg, run the following command:

On Fedora: `dnf install kajongg`

On Debian/Ubuntu: `apt install kajongg`

### Pioneers

Klaus Teuber's [The Settlers of Catan][5] board game and its various expansions introduced many players to a world of board games that were more complex and more interesting than some of the most familiar board games like [Monopoly][6], [Sorry!][7], and [Risk][8].

Catan, for those not familiar with the game, is played on a board made of hexagonal tiles, each of which has a different terrain type and provides a resource like lumber or wool. During the initial setup phase, players take turns placing their initial settlements as well as segments of road. Settlements are placed at the point where the hexagonal tiles meet. Each tile has a number, and when that number is rolled during a player's turn, every player whose settlements are next to that tile get the associated resource. These resources are then used to build more and better structures. The first person to earn a certain number of victory points by building structures or by other methods wins the game. (There are more rules, but that is the basic premise.)

[Pioneers][9] brings an unofficial adaptation of that iconic board game to computers, complete with AI opponents and online play. There are several map layouts available in Pioneers, from the basic map to maps of North America and Europe for more complex games. While Pioneers does have a few minor rough edges, it is a solid implementation of Catan and a great way to experience or re-experience a classic board game.

To install Pioneers, run the following command:

On Fedora: `dnf install pioneers`

On Debian/Ubuntu: `apt install pioneers`

### PokerTH

[PokerTH][10] is a computer version of [Texas hold 'em poker][11], complete with online multiplayer (but no real gambling). Play against the computer locally, or go online to compete against other people. PokerTH is available for multiple platforms, so there are plenty of people playing it online. PokerTH's implementation of Texas hold 'em is polished and the game is feature-complete, with solid online play. Any fan of Texas hold 'em should check out PokerTH.

To install PokerTH, run the following command:

On Fedora: `dnf install pokerth`

On Debian/Ubuntu: `apt install pokerth`

### TripleA

[TripleA][12] is a turn-based strategy game styled after the [Axis & Allies][13] board game and other similar board games. TripleA's gameplay is very much like Axis & Allies, but there are many different maps available for TripleA that can alter the experience. The standard game board is based on World War II, but there are other maps that feature other settings—some historical, some fantastical, like J.R.R. Tolkien's Middle Earth. There are also maps that make the game behave like the board game [Diplomacy][14]. TripleA can be played locally against the computer or against other people in hot seat mode. Online play is also available using either the network option or the play by email/forum post option.

To install TripleA, run the following command:

On Debian/Ubuntu: `apt install triplea`

Unfortunately, TripleA is not packaged for Fedora, but a [Linux installer][15] is available from the project's website.

### XBoard

There are so many [chess computer programs][16], it is hard to pick just one, even from just the open source offerings. However, [XBoard][17] is a good choice for most users. XBoard supports multiple chess engines, can handle non-Western and non-traditional chess variants and has online and play-by-email capabilities. Some of the other open source chess applications might look a little nicer, but XBoard provides many features that make up for the lack of graphical polish. If you are looking for a lighter chess application with fancy 3D chessmen, you might want to look elsewhere, but if you want a powerful program that can help you analyze and improve your chess skills, XBoard is the superior open source option.

To install XBoard, run the following command:

On Fedora: `dnf install xboard`

On Debian/Ubuntu: `apt install xboard`

Did I miss one of your favorite open source board or card games? Share it in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/card-board-games-linux

作者：[Joshua Allen Holm][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
[1]:https://opensource.com/article/18/1/arcade-games-linux
[2]:https://boardgamegeek.com/boardgame/2093/mahjong
[3]:https://www.kde.org/applications/games/kajongg/
[4]:https://en.wikipedia.org/wiki/Mahjong#Variations
[5]:https://boardgamegeek.com/boardgame/13/catan
[6]:https://boardgamegeek.com/boardgame/1406/monopoly
[7]:https://boardgamegeek.com/boardgame/2407/sorry
[8]:https://boardgamegeek.com/boardgame/181/risk
[9]:http://pio.sourceforge.net/
[10]:https://pokerth.net
[11]:https://en.wikipedia.org/wiki/Texas_hold_%27em
[12]:http://www.triplea-game.org
[13]:https://boardgamegeek.com/boardgame/98/axis-allies
[14]:https://boardgamegeek.com/boardgame/483/diplomacy
[15]:http://triplea-game.org/download/
[16]:https://boardgamegeek.com/boardgame/171/chess
[17]:https://www.gnu.org/software/xboard
