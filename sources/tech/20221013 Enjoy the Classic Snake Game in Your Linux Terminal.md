[#]: subject: "Enjoy the Classic Snake Game in Your Linux Terminal"
[#]: via: "https://www.debugpoint.com/snake-game-linux-terminal/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Enjoy the Classic Snake Game in Your Linux Terminal
======
This is how you can install and play the classic Snake Game in Linux Terminal.

Remember the classic and simple snake game of old mobile phones? I remember playing it for hours. Hey, no other options at the time, right? Smartphones were still not in the market. And all you have is this –

![Nokia 3310 with legacy snake game][1]

But over time, the Snake Game was replaced by more advanced graphical games with various options. But nothing beats that classic snake game.

And what if I told you, you could play this game in the Linux Terminal itself? Whether you are running Ubuntu Linux, Fedora Linux or Arch Linux doesn’t matter. This game is available for most of the [distros][2].

![nsnake Game - Main Menu][3]

### Install nSnake – Snake Game for Linux Terminal

You can install [this game][4] via the terminal using the below methods.

For Ubuntu, Linux Mint or other related distributions:

```
sudo apt install nsnake
```

For Fedora Linux and others:

```
sudo dnf install nsnake
```

For Arch Linux, this snake game is available in the [Arch User repository][5]. You can install it using the following steps.

* [Set up Yay AUR helper][6]
* Then open a terminal and run the below command

```
yay -S nsnake
```

The above command installs the stock repository version of the game, which might not be the latest. However, if you want the latest version, you may need to compile the source via GitHub. I have added the compilation instructions at the end of this page for your reference.

### Playing the game

Playing the game is very simple. Type nsnake in the terminal, which will launch the game.

To quit immediately, press q.

Following are the default key bindings.

* Arrow keys – to move the snake
* q – Quit the game
* p – Pause the game

You can also configure the game in various ways, which are available via the main menu.

![nsnake Linux Terminal Snake Game Settings][7]

So, enjoy!

##### Compilation

To compile the latest version, use the following commands in all Linux distributions.

Oh, make sure you have `git` and `ncurses-devel` installed, which are the required packages for compilation.

```
git clone https://github.com/alexdantas/nSnake.gitcd nsnakemakemake install
```

So, do you like Snake Game? Do you prefer it over other terminal-based games? Share your views with other readers in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/snake-game-linux-terminal/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/12/Nokia-3310-with-legacy-snake-game.jpg
[2]: https://www.debugpoint.com/category/distributions
[3]: https://www.debugpoint.com/wp-content/uploads/2021/12/nsnake-Game-Main-Menu.jpg
[4]: https://github.com/alexdantas/nsnake
[5]: https://aur.archlinux.org/packages/nsnake/
[6]: https://www.debugpoint.com/2021/01/install-yay-arch/
[7]: https://www.debugpoint.com/wp-content/uploads/2021/12/nsnake-Linux-Terminal-Snake-Game-Settings.jpg
