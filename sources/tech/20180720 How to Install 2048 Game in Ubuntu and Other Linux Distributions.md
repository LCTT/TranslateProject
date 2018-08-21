translating---geekpi

How to Install 2048 Game in Ubuntu and Other Linux Distributions
======
**Popular mobile puzzle game 2048 can also be played on Ubuntu and Linux distributions. Heck! You can even play 2048 in Linux terminal. Don’t blame me if your productivity goes down because of this addictive game.**

Back in 2014, 2048 was one of the most popular games on iOS and Android. This highly addictive game got so popular that it got a [browser version][1], desktop version as well as a terminal version on Linux.

<https://giphy.com/embed/wT8XEi5gckwJW>

This tiny game is played by moving the tiles up and down, left and right. The aim of this puzzle game is to reach 2048 by combining tiles with matching number. So 2+2 becomes 4, 4+4 becomes 16 and so on. It may sound simple and boring but trust me its hell of an addictive game.

### Play 2048 in Linux [GUI]

There are several implementations of 2048 game available in Ubuntu and other Linux. You can simply search for it in the Software Center and you’ll find a few of them there.

There is a [Qt-based][2] 2048 game that you can install on Ubuntu and other Debian and Ubuntu-based Linux distributions. You can install it using the command below:
```
sudo apt install 2048-qt

```

Once installed, you can find the game in the menu and start it. You can move the numbers using the arrow keys. Your highest score is saved as well.

![2048 Game in Ubuntu Linux][3]

### Play 2048 in Linux terminal

The popularity of 2048 brought it to the terminal. If this surprises you, you should know that there are plenty of [awesome terminal games in Linux][4] and 2048 is certainly one of them.

Now, there are a few ways you can play 2048 in Linux terminal. I’ll mention two of them here.

#### 1\. term2058 Snap application

There is a [snap application][5] called [term2048][6] that you can install in any [Snap supported Linux distribution][7].

If you have Snap enabled, just use this command to install term2048:
```
sudo snap install term2048

```

Ubuntu users can also find this game in the Software Center and install it from there.

![2048 Terminal Game in Linux][8]

Once installed, you can use the command term2048 to run the game. It looks something like this:

![2048 Terminal game][9]

You can move using the arrow keys.

#### 2\. Bash script for 2048 terminal game

This game is actually a shell script which you can run in any Linux terminal. Download the game/script from Github:

[Download Bash2048][10]

Extract the downloaded file. Go in the extracted directory and you’ll see a shell script named 2048.sh. Just run the shell script. The game will start immediately. You can move the tiles using the arrow keys.

![Linux Terminal game 2048][11]

#### What games do you play on Linux?

If you like playing games in Linux terminal, you should also try the [classic Snake game in Linux terminal][12].

Which games do you regularly play in Linux? Do you also play games in terminal? If yes, which is your favorite terminal game?

--------------------------------------------------------------------------------

via: https://itsfoss.com/2048-game/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:http://gabrielecirulli.github.io/2048/
[2]:https://www.qt.io/
[3]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/2048-qt-ubuntu.jpeg
[4]:https://itsfoss.com/best-command-line-games-linux/
[5]:https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[6]:https://snapcraft.io/term2048
[7]:https://itsfoss.com/install-snap-linux/
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/term2048-game.png
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/term2048.jpg
[10]:https://github.com/mydzor/bash2048
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/2048-bash-terminal.png
[12]:https://itsfoss.com/nsnake-play-classic-snake-game-linux-terminal/ (nSnake: Play The Classic Snake Game In Linux Terminal)
