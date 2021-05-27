[#]: subject: (Play retro video games on Linux with this open source project)
[#]: via: (https://opensource.com/article/21/4/scummvm-retro-gaming)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Play retro video games on Linux with this open source project
======
ScummVM is one of the most straightforward ways to play old video games
on modern hardware.
![Gaming artifacts with joystick, GameBoy, paddle][1]

Playing adventure games has always been a big part of my experience with computers. From the earliest text-based adventure games to 2D pixel art, full-motion video, and 3D games, the adventure game genre has provided me with a lot of fond memories.

Sometimes I want to revisit those old games, but many were released before Linux was even a thing, so how do I go about replaying those games? I use [ScummVM][2], which is honestly one of my favorite open source projects.

### What is ScummVM

![ScummVM][3]

(Joshua Allen Holm, [CC BY-SA 4.0][4])

ScummVM is a program designed to play old adventure games on modern hardware. Originally designed to run games developed using LucasArt's Script Creation Utility for Maniac Mansion (SCUMM), ScummVM now supports many different game engines. It can play almost all of the classic Sierra On-Line and LucasArts adventure games as well as a wide selection of adventure games from other publishers. ScummVM does not support _every_ adventure game (yet), but it can be used to play hundreds of them. ScummVM is available for multiple platforms, including Windows, macOS, Linux, Android, iOS, and several game consoles.

### Why use ScummVM

There are plenty of ways to play old games on modern hardware, but they tend to be more complicated than using ScummVM. [DOSBox][5] can be used to play DOS games, but it requires tweaking to get the settings right so that the game plays at the right speed. Windows games can be played using [WINE][6], but that requires both the game and the game's installer to be compatible with WINE.

Even if a game runs under WINE, some games still do not work well on modern hardware because the hardware is too fast. One example of this is a puzzle in King's Quest VII that involves taking a lit firecracker somewhere. On modern hardware, the firecracker explodes way too quickly, which makes it impossible to get to the right location without the character dying multiple times.

ScummVM eliminates many of the problems present in other methods for playing retro adventure games. If ScummVM supports a game, it is straightforward to configure and play. In most cases, copying the game files from the original game discs to a directory and adding that directory in ScummVM is all that is needed to play the game. For games that came on multiple discs, it might be necessary to rename some files to avoid file name conflicts. The instructions for what data files are needed and any renaming instructions are documented on the ScummVM Wiki page for [each supported game][7].

One of the wonderful things about ScummVM is how each new release adds support for more games. ScummVM 2.2.0 added support for a dozen interactive fiction interpreters, which means ScummVM can now play hundreds of text-based adventure games. The development branch of ScummVM, which should become version 2.3.0 soon, integrates [ResidualVM][8]'s support for 3D adventure games, so now ScummVM can be used to play Grim Fandango, Myst III: Exile, and The Longest Journey. The development branch also recently added support for games created using [Adventure Game Studio][9], which adds hundreds, possibly thousands, of games to ScummVM's repertoire.

### How to install ScummVM

If you want to install ScummVM from your Linux distribution's repositories, the process is very simple. You just need to run one command. However, your distribution might offer an older release of ScummVM that does not support as many games as the latest release, so do keep that in mind.

**Install ScummVM on Debian/Ubuntu:**


```
`sudo apt install scummvm`
```

**Install ScummVM on Fedora:**


```
`sudo dnf install scummvm`
```

#### Install ScummVM using Flatpak or Snap

ScummVM is also available as a Flatpak and as a Snap. If you use one of those options, you can use one of the following commands to install the relevant version, which should always be the latest release of ScummVM:


```
`flatpak install flathub org.scummvm.ScummVM`
```

or


```
`snap install scummvm`
```

#### Compile the development branch of ScummVM

If you want to try the latest and greatest features in the not-yet-stable development branch of ScummVM, you can do so by compiling ScummVM from the source code. Do note that the development branch is constantly changing, so things might not always work correctly. If you are still interested in trying out the development branch, follow the instructions below.

To start, you will need the required development tools and libraries for your distribution, which are listed on the [Compiling ScummVM/GCC page][10] on the ScummVM Wiki.

Once you have the prerequisites installed, run the following commands:


```
git clone <https://github.com/scummvm/scummvm.git>

cd scummvm

./configure

make

sudo make install
```

### Add games to ScummVM

Adding games to ScummVM is the last thing you need to do before playing. If you do not have any supported adventure games in your collection, you can download 11 wonderful games from the [ScummVM Games page][11]. You can also purchase many of the games supported by ScummVM from [GOG.com][12]. If you purchase a game from GOG.com and need to extract the game files from the GOG download, you can use the [innoextract][13] utility.

Most games need to be in their own directory (the only exceptions to this are games that consist of a single data file), so it is best to begin by creating a directory to store your ScummVM games. You can do this using the command line or a graphical file manager. Where you store your games does not matter (except in the case of the ScummVM Flatpak, which is a sandbox and requires the games to be stored in the `~/Documents` directory). After creating this directory, place the data files for each game in their own subdirectories.

Once the files are copied to where you want them, run ScummVM and add the game to the collection by clicking **Add Game…**, selecting the appropriate directory in the file-picker dialog box that opens, and clicking **Choose**. If ScummVM properly detects the game, it will open its settings options. You can select advanced configuration options from the various tabs if you want (which can also be changed later by using the **Edit Game…** button), or you can just click **OK** to add the game with the default options. If the game is not detected, check the [Supported Games pages][14] on the ScummVM Wiki for details about special instructions that might be needed for a particular game's data files.

The only thing left to do now is select the game in ScummVM's list of games, click on **Start**, and enjoy replaying an old favorite or experiencing a classic adventure game for the first time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/scummvm-retro-gaming

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://www.scummvm.org/
[3]: https://opensource.com/sites/default/files/uploads/scummvm.png (ScummVM)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.dosbox.com/
[6]: https://www.winehq.org/
[7]: https://wiki.scummvm.org/index.php?title=Category:Supported_Games
[8]: https://www.residualvm.org/
[9]: https://www.adventuregamestudio.co.uk/
[10]: https://wiki.scummvm.org/index.php/Compiling_ScummVM/GCC
[11]: https://www.scummvm.org/games/
[12]: https://www.gog.com/
[13]: https://constexpr.org/innoextract/
[14]: https://wiki.scummvm.org/index.php/Category:Supported_Games
