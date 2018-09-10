如何在 Linux 中安装 2048 游戏
======

> 流行的移动益智游戏 2048 也可以在 Ubuntu 和 Linux 发行版上玩。啊！你甚至可以在 Linux 终端上玩 2048。如果你的生产率因为这个让人上瘾的游戏下降，请不要怪我。

早在 2014 年，2048 就是 iOS 和 Android 上最受欢迎的游戏之一。这款令人上瘾的游戏非常受欢迎，它在 Linux 上有[浏览器版][1]、桌面版和终端版。

![](https://media.giphy.com/media/wT8XEi5gckwJW/giphy.gif)

通过向上和向下，向左和向右移动滑块来玩这个小游戏。这个益智游戏的目的是通过组合匹配的滑块到数字 2048。因此 2+2 变成 4，4+4 变成 16，依此类推。这可能听起来简单而无聊，但相信我是一个令人上瘾的游戏。

### 在 Linux 中玩 2048 [GUI]

在 Ubuntu 和其他 Linux 中有些 2048 游戏。你可以在软件中心中搜索它，你可以在那里找到一些。

有一个[基于 Qt ][2]的 2048 游戏，你可以在 Ubuntu 和其他基于 Debian 和 Ubuntu 的 Linux 发行版上安装。你可以使用以下命令安装它：

```
sudo apt install 2048-qt
```

安装完成后，你可以在菜单中找到该游戏并启动它。你可以使用箭头键移动数字。你的最高分也会保存。

![2048 Game in Ubuntu Linux][3]

### 在 Linux 终端玩 2048

2048 的流行将它带到了终端。如果这让你感到惊讶，你应该知道 Linux 中有很多[很棒的终端游戏][4]，而 2048 肯定就是其中之一。

现在，有几种方法可以在 Linux 终端中玩 2048。我在这里提其中两个。

#### 1、term2048 Snap 程序

有一个名为 [term2048][6] 的 [snap 程序][5]可以安装在任何[支持 Snap 的 Linux 发行版][7]中。

如果你启用了 Snap，只需使用此命令安装 term2048：

```
sudo snap install term2048
```

Ubuntu 用户也可以在软件中心找到这个游戏并从那里安装它。

![2048 Terminal Game in Linux][8]

安装后，你可以使用命令 term2048 来运行游戏。它看起来像这样：

![2048 Terminal game][9]

你可以使用箭头键移动。

#### 2、2048 游戏的 Bash 脚本

这个游戏实际上是一个 shell 脚本，你可以在任何 Linux 终端上运行。从 Github 下载游戏/脚本：

- [下载 Bash2048][10]

解压下载的文件。进入解压后的目录，你将看到名为 2048.sh 的 shell 脚本。只需运行 shell 脚本。游戏将立即开始。你可以使用箭头键移动滑块。

![Linux Terminal game 2048][11]

### 你在Linux上玩什么游戏？

如果你喜欢在 Linux 终端上玩游戏，你也应该尝试 [Linux 终端中的经典 Snake 游戏][12]。

你经常在 Linux 中玩哪些游戏？你也在终端中玩游戏吗？如果是的话，哪个是你最喜欢的终端游戏？

--------------------------------------------------------------------------------

via: https://itsfoss.com/2048-game/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
