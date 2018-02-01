巨洞冒险：史上最有名的经典文字冒险游戏
======

[<ruby>巨洞冒险<rt>Colossal Cave Adventure</rt></ruby>](https://zh.wikipedia.org/wiki/%E5%B7%A8%E6%B4%9E%E5%86%92%E9%9A%AA)，又名 ADVENT、Clossal Cave 或 Adventure，是八十年代初到九十年代末最受欢迎的基于文字的冒险游戏。这款游戏还作为史上第一款“<ruby>互动小说<rt>interactive fiction</rt></ruby>”类游戏而闻名。在 1976 年，一个叫 Will Crowther 的程序员开发了这款游戏的一个早期版本，之后另一位叫 Don Woods 的程序员改进了这款游戏，为它添加了许多新元素，包括计分系统以及更多的幻想角色和场景。这款游戏最初是为 PDP-10 开发的，这是一种历史悠久的大型计算机。后来，它被移植到普通家用台式电脑上，比如 IBM PC 和 Commodore 64。游戏的最初版使用 Fortran 开发，之后在八十年代初它被微软加入到 MS-DOS 1.0 当中。

![](https://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-1.jpeg)

1995 年发布的最终版本 Adventure 2.5 从来没有可用于现代操作系统的安装包。它已经几乎绝版。万幸的是，在多年之后身为开源运动提倡者的 Eric Steven Raymond （ESR）得到了原作者们的同意之后将这款经典游戏移植到了现代操作系统上。他把这款游戏开源并将源代码以 “open-adventure” 之名托管在 GitLab 上。

你在这款游戏的主要目标是找到一个传言中藏有大量宝藏和金子的洞穴并活着离开它。玩家在这个虚拟洞穴中探索时可以获得分数。一共可获得的分数是 430 点。这款游戏的灵感主要来源于原作者 Will Crowther 丰富的洞穴探索的经历。他曾经经常在洞穴中冒险，特别是肯塔基州的<ruby>猛犸洞<rt>Mammoth Cave</rt></ruby>。因为游戏中的洞穴结构大体基于猛犸洞，你也许会注意到游戏中的场景和现实中的猛犸洞的相似之处。

### 安装巨洞冒险

Open Adventure 在 [AUR][1] 上有面对 Arch 系列操作系统的安装包。所以我们可以在 Arch Linux 或者像 Antergos 和 Manjaro Linux 等基于 Arch 的发行版上使用任何 AUR 辅助程序安装这款游戏。

使用 [Pacaur][2]：

```
pacaur -S open-adventure
```

使用  [Packer][3]：

```
packer -S open-adventure
```

使用 [Yaourt][4]：

```
yaourt -S open-adventure
```

在其他 Linux 发行版上，你也许需要经过如下步骤来从源代码编译并安装这款游戏。

首先安装依赖项：

在 Debian 和 Ubuntu 上：

```
sudo apt-get install python3-yaml libedit-dev
```

在 Fedora 上：
```
sudo dnf install python3-PyYAML libedit-devel
```

你也可以使用 `pip` 来安装 PyYAML：

```
sudo pip3 install PyYAML
```

安装好依赖项之后，用以下命令从源代码编译并安装 open-adventure：

```
git clone https://gitlab.com/esr/open-adventure.git
make
make check
```

最后，运行 `advent` 程序开始游戏：

```
advent
```

在 [Google Play 商店][5] 上还有这款游戏的安卓版。

### 游戏说明

要开始游戏，只需在终端中输入这个命令：

```
advent
```

你会看到一个欢迎界面。按 `y` 来查看教程，或者按 `n` 来开始冒险之旅。

![][6]

游戏在一个小砖房前面开始。玩家需要使用由一到两个简单的英语单词单词组成的命令来控制角色。要移动角色，只需输入 `in`、 `out`、`enter`、`exit`、`building`、`forest`、`east`、`west`、`north`、`south`、`up` 或 `down` 等指令。

比如说，如果你输入 `south` 或者简写 `s`，游戏角色就会向当前位置的南方移动。注意每个单词只有前五个字母有效，所以当你需要输入更长的单词时需要使用缩写，比如要输入 `northeast` 时，只需输入 NE（大小写均可）。要输入 `southeast` 则使用 SE。要捡起物品，输入 `pick`。要进入一个建筑物或者其他的场景，输入 `in`。要从任何场景离开，输入 `exit`，诸如此类。当你遇到危险时你会受到警告。你也可以使用两个单词的短语作为命令，比如 `eat food`、`drink water`、`get lamp`、`light lamp`、`kill snake`  等等。你可以在任何时候输入 `help` 来显示游戏帮助。

![][8]

我花了一整个下午来探索这款游戏。天哪，这真是段超级有趣、激动人心又紧张刺激的冒险体验！

![][9]

我打通了许多关卡并在路上探索了各式各样的场景。我甚至找到了金子，还被一条蛇和一个矮人袭击过。我必须承认这款游戏真是非常让人上瘾，简直是最好的时间杀手。

如果你安全地带着财宝离开了洞穴，你会取得游戏胜利，并获得财宝全部的所有权。你在找到财宝的时候也会获得部分的奖励。要提前离开你的冒险，输入 `quit`。要暂停冒险，输入 `suspend`（或者 `pause` 或 `save`）。你可以在之后继续冒险。要看你现在的进展如何，输入 `score`。记住，被杀或者退出会导致丢分。

祝你们玩得开心！再见！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/colossal-cave-adventure-famous-classic-text-based-adventure-game/

作者：[SK][a]
译者：[yixunx](https://github.com/yixunx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/open-adventure/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://play.google.com/store/apps/details?id=com.ecsoftwareconsulting.adventure430
[6]:https://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-2.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-3.png
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/Colossal-Cave-Adventure-1.png
