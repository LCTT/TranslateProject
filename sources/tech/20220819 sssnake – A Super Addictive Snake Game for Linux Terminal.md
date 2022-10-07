[#]: subject: "sssnake – A Super Addictive Snake Game for Linux Terminal"
[#]: via: "https://www.debugpoint.com/sssnake-game-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

sssnake – A Super Addictive Snake Game for Linux Terminal
======
Try out this fun sssnake game in your Linux terminal.

Spending too much time on Linux, in general can be counter-productive. Our brain is not designed to work continuously. That’s why you need some activities to free up your mind. Some take walks, have coffee breaks, and go for a drive. But for some who can’t leave the desktop – there are very few choices to relax.

Here’s a classic snake game which only requires a terminal for you. Whil;e it may not be the ultimate solution, but hey, give it a try.

### sssnake game for Linux terminal

The sssnaks is one of variant of [classic snake game][1]. The classic snake game is famous since the Nokia 3300 device, before the smartphone revolution.

This game requires the ncurses-devel package for compilation from Git.

So, fire up a terminal and run the following command to install the ncurses.

* Ubuntu Linux and other similar distros:

```
sudo apt install git libncurses-dev
```

* For Fedora and related distros:

```
sudo dnf install git ncurses-devel
```

* Arch folks, use this:

```
sudo pacman -S ncurses
```

After installation, clone the [official Git repo][2] and compile.

```
git clone https://github.com/AngelJumbo/sssnake.gitcd sssnakemakesudo make install
```

![Installing sssnake game in Linux (Fedora)][3]

That’s it. It’s now time to play the game.

### Playing the sssnake game in Linux

Since it’s a terminal-based game, run the below command to verify whether it got installed. It outputs the help and instructions (if you want to read them).

```
sssnake -h
```

Alright, its time to play.

Run the following to start the game normally. You can steer the snake head with keys – WASD or HJKL from the keyboard.

sssnake

* You can use the option `-a` for autoplay mode. It can play itself, and you can watch it.
* Use the option `-S` for set it as screensaver.
* Control the speed using `-s` and followed by number for speed.
* And add random blocks for difficult with option `-j`.

![sssnake game in terminal in Fedora Linux][4]

Ready?

Here are some commands for you to try.

* Use this for standard speed.

```
sssnake -s 13
```

* The following command gives you some blocks to avoid.

```
sssnake -a -s 13 -j 5
```

* And finally, run this and see the computer plays for you.

```
sssnake -a -s 13 -j 5
```

* You can combine above commands as per your comfort and difficulty level.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/sssnake-game-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/snake-game
[2]: https://github.com/AngelJumbo/sssnake
[3]: https://www.debugpoint.com/wp-content/uploads/2022/08/Installing-sssnake-game-in-Linux-Fedora.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/08/sssnake-game-in-terminal-in-Fedora-Linux-1.jpg
