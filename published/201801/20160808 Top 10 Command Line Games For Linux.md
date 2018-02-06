十大 Linux 命令行游戏
======

概要： 本文列举了 Linux 中最好的命令行游戏。

Linux 从来都不是游戏的首选操作系统，尽管近日来 [Linux 的游戏][1]提供了很多，你也可以从许多资源[下载到 Linux 游戏][2]。

也有专门的 [游戏版 Linux][3]。没错，确实有。但是今天，我们并不是要欣赏游戏版 Linux。

Linux 有一个超过 Windows 的优势。它拥有一个强大的 Linux 终端。在 Linux 终端上，你可以做很多事情，包括玩 **命令行游戏**。

当然，我们都是 Linux 终端的骨灰粉。终端游戏轻便、快速、有地狱般的魔力。而这最有意思的事情是，你可以在 Linux 终端上重温大量经典游戏。

### 最好的 Linux 终端游戏

来揭秘这张榜单，找出 Linux 终端最好的游戏。

#### 1. Bastet

谁还没花上几个小时玩[俄罗斯方块][4]？它简单而且容易上瘾。 Bastet 就是 Linux 版的俄罗斯方块。

![Linux 终端游戏 Bastet][5]

使用下面的命令获取 Bastet：

```
sudo apt install bastet
```

运行下列命令，在终端上开始这个游戏：

```
bastet
```

使用空格键旋转方块，方向键控制方块移动。

#### 2. Ninvaders

Space Invaders（太空侵略者）。我仍记得这个游戏里，和我兄弟为了最高分而比拼。这是最好的街机游戏之一。

![Linux 终端游戏 nInvaders][6]

复制粘贴这段代码安装 Ninvaders。

```
sudo apt-get install ninvaders
```

使用下面的命令开始游戏：

```
ninvaders
```

方向键移动太空飞船。空格键射击外星人。

[推荐阅读：2016 你可以开始的 Linux 游戏 Top 10][21]

#### 3. Pacman4console

是的，这个就是街机之王。Pacman4console 是最受欢迎的街机游戏 Pacman（吃豆人）的终端版。

![Linux 命令行吃豆豆游戏 Pacman4console][7]

使用以下命令获取 pacman4console：

```
sudo apt-get install pacman4console
```

打开终端，建议使用最大的终端界面。键入以下命令启动游戏：

```
pacman4console
```

使用方向键控制移动。

#### 4. nSnake

记得在老式诺基亚手机里玩的贪吃蛇游戏吗？

这个游戏让我在很长时间内着迷于手机。我曾经设计过各种姿态去获得更长的蛇身。

![nsnake : Linux 终端上的贪吃蛇游戏][8]

我们拥有 [Linux 终端上的贪吃蛇游戏][9] 得感谢 [nSnake][9]。使用下面的命令安装它：

```
sudo apt-get install nsnake
```

键入下面的命令开始游戏：

```
nsnake
```

使用方向键控制蛇身并喂它。

#### 5. Greed

Greed 有点像 Tron（类似贪吃蛇的进化版），但是减少了速度，也没那么刺激。

你当前的位置由闪烁的 ‘@’ 表示。你被数字所环绕，你可以在四个方向任意移动。

你选择的移动方向上标识的数字，就是你能移动的步数。你将重复这个步骤。走过的路不能再走，如果你无路可走，游戏结束。

似乎我让它听起来变得更复杂了。

![Greed : 命令行上的 Tron][10]

通过下列命令获取 Greed：

```
sudo apt-get install greed
```

通过下列命令启动游戏，使用方向键控制游戏。

```
greed
```

#### 6. Air Traffic Controller

还有什么比做飞行员更有意思的？那就是空中交通管制员。在你的终端中，你可以模拟一个空中交通系统。说实话，在终端里管理空中交通蛮有意思的。

![Linux 空中交通管理员][11]

使用下列命令安装游戏：

```
sudo apt-get install bsdgames
```

键入下列命令启动游戏：

```
atc
```

ATC 不是孩子玩的游戏。建议查看官方文档。

#### 7. Backgammon（双陆棋）

无论之前你有没有玩过 [双陆棋][12]，你都应该看看这个。 它的说明书和控制手册都非常友好。如果你喜欢，可以挑战你的电脑或者你的朋友。

![Linux 终端上的双陆棋][13]

使用下列命令安装双陆棋：

```
sudo apt-get install bsdgames
```

键入下列命令启动游戏:

```
backgammon
```

当你提示游戏规则时，回复 ‘y’ 即可。

#### 8. Moon Buggy

跳跃、开火。欢乐时光不必多言。

![Moon buggy][14]

使用下列命令安装游戏：

```
sudo apt-get install moon-buggy
```

使用下列命令启动游戏：

```
moon-buggy
```

空格跳跃，‘a’ 或者 ‘l’射击。尽情享受吧。

#### 9. 2048

2048 可以活跃你的大脑。[2048][15] 是一个策咯游戏，很容易上瘾。以获取 2048 分为目标。

![Linux 终端上的 2048][16]

复制粘贴下面的命令安装游戏：

```
wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c

gcc -o 2048 2048.c
```

键入下列命令启动游戏：

```
./2048
```

#### 10. Tron

没有动作类游戏，这张榜单怎么可能结束？

![Linux 终端游戏 Tron][17]

是的，Linux 终端可以实现这种精力充沛的游戏 Tron。为接下来迅捷的反应做准备吧。无需被下载和安装困扰。一个命令即可启动游戏，你只需要一个网络连接：

```
ssh sshtron.zachlatta.com
```

如果有别的在线游戏者，你可以多人游戏。了解更多：[Linux 终端游戏 Tron][18]。

### 你看上了哪一款?

伙计，十大 Linux 终端游戏都分享给你了。我猜你现在正准备键入 `ctrl+alt+T`（终端快捷键） 了。榜单中那个是你最喜欢的游戏？或者你有其它的终端游戏么？尽情分享吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-command-line-games-linux/

作者：[Aquil Roshan][a]
译者：[CYLeft](https://github.com/CYleft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/aquil/
[1]:https://linux.cn/article-7316-1.html
[2]:https://itsfoss.com/download-linux-games/
[3]:https://itsfoss.com/manjaro-gaming-linux/
[4]:https://en.wikipedia.org/wiki/Tetris
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/bastet.jpg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/ninvaders.jpg
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/pacman.jpg
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/nsnake.jpg
[9]:https://itsfoss.com/nsnake-play-classic-snake-game-linux-terminal/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/greed.jpg
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/atc.jpg
[12]:https://en.wikipedia.org/wiki/Backgammon
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/backgammon.jpg
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/moon-buggy.jpg
[15]:https://itsfoss.com/2048-offline-play-ubuntu/
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/2048.jpg
[17]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2016/08/tron.jpg
[18]:https://itsfoss.com/play-tron-game-linux-terminal/
[19]:https://twitter.com/abhishek_pc
[20]:https://itsfoss.com/linux-gaming-guide/
[21]:https://itsfoss.com/best-linux-games/
