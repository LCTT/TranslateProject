Linux 上的五个开源益智游戏
======

> 用这些有趣好玩的游戏来测试你的战略能力。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle-pieces.jpg?itok=YHIN4_0L)

游戏一直是 Linux 的弱点之一。由于 Steam、GOG 和其他将商业游戏引入多种操作系统的努力，这种情况近年来有所改变，但这些游戏通常不是开源的。当然，这些游戏可以在开源操作系统上玩，但对于纯粹开源主义者来说还不够好。

那么，一个只使用开源软件的人，能否找到那些经过足够打磨的游戏，在不损害其开源理念的前提下，提供一种可靠的游戏体验呢？当然可以。虽然开源游戏历来不太可能与一些借由大量预算开发的 AAA 商业游戏相匹敌，但在多种类型的开源游戏中，有很多都很有趣，可以从大多数主要 Linux 发行版的仓库中安装。即使某个特定的游戏没有被打包成特定的发行版本，通常也很容易从项目的网站上下载该游戏以便安装和游戏。

这篇文章着眼于益智游戏。我已经写过[街机风格游戏][1]和[棋牌游戏][2]。 在之后的文章中，我计划涉足赛车，角色扮演、战略和模拟经营游戏。

### Atomix

![](https://opensource.com/sites/default/files/uploads/atomix.png)

[Atomix][3] 是 1990 年在 Amiga、Commodore 64、MS-DOS 和其他平台发布的 [Atomix][4] 益智游戏的开源克隆。Atomix 的目标是通过连接原子来构建原子分子。单个原子可以向上、向下、向左或向右移动，并一直朝这个方向移动，直到原子撞上一个障碍物——水平墙或另一个原子。这意味着需要进行规划，以确定在水平上构建分子的位置，以及移动单个部件的顺序。第一关是一个简单的水分子，它由两个氢原子和一个氧原子组成，但后来的关卡是更复杂的分子。

要安装 Atomix，请运行以下命令:

  * 在 Fedora： `dnf install atomix`
  * 在 Debian/Ubuntu： `apt install atomix`

### Fish Fillets - Next Generation

![](https://opensource.com/sites/default/files/uploads/fish_fillets.png)

[Fish Fillets - Next Generation][5] 是游戏 Fish fillet 的 Linux 移植版本，它于 1998 年在 Windows 发布，源代码在 2004 年以 GPL 许可证发布。游戏中，两条鱼试图将物体移出道路来通过不同的关卡。这两条鱼有不同的属性，所以玩家需要为每个任务挑选合适的鱼。较大的鱼可以移动较重的物体，但它更大，这意味着它不适合较小的空隙。较小的鱼可以适应那些较小的间隙，但它不能移动较重的物体。如果一个物体从上面掉下来，两条鱼都会被压死，所以玩家在移动棋子时要小心。

要安装 Fish fillet——Next Generation，请运行以下命令:

  * 在 Fedora：`dnf install fillets-ng`
  * 在 Debian/Ubuntu： `apt install fillets-ng`

### Frozen Bubble

![](https://opensource.com/sites/default/files/uploads/frozen-bubble.png)

[Frozen Bubble][6] 是一款街机风格的益智游戏，从屏幕底部向屏幕顶部的一堆泡泡射击。如果三个相同颜色的气泡连接在一起，它们就会被从屏幕上移除。任何连接在被移除的气泡下面但没有连接其他任何东西的气泡也会被移除。在拼图模式下，关卡的设计是固定的，玩家只需要在泡泡掉到屏幕底部的线以下前将泡泡从游戏区域中移除。该游戏街机模式和多人模式遵循相同的基本规则，但也有不同，这增加了多样性。Frozen Bubble 是一个标志性的开源游戏，所以如果你以前没有玩过它，玩玩看。

要安装 Frozen Bubble，请运行以下命令：

  * 在 Fedora: `dnf install frozen-bubble`
  * 在 Debian/Ubuntu: `apt install frozen-bubble`


### Hex-a-hop

![](https://opensource.com/sites/default/files/uploads/hex-a-hop.png)

[Hex-a-hop][7] 是一款基于六角形瓦片的益智游戏，玩家需要将所有的绿色瓦片从水平面上移除。瓦片通过移动被移除。由于瓦片在移动后会消失，所以有必要规划出穿过水平面的最佳路径，以便在不被卡住的情况下移除所有的瓦片。但是，如果玩家使用的是次优路径，会有撤销功能。之后的关卡增加了额外的复杂性，包括需要跨越多次的瓦片和使玩家跳过一定数量的六角弹跳瓦片。

要安装 Hex-a-hop，请运行以下命令：

  * 在 Fedora: `dnf install hex-a-hop`
  * 在 Debian/Ubuntu: `apt install hex-a-hop`


### Pingus

![](https://opensource.com/sites/default/files/uploads/pingus.png)

[Pingus][8] 是 [Lemmings][9] 的开源克隆。这不是一个精确的克隆，但游戏非常相似。小动物（Lemmings 里是旅鼠，Pingus 里是企鹅）通过关卡入口进入关卡，开始沿着直线行走。玩家需要使用特殊技能使小动物能够到达关卡的出口而不会被困住或者掉下悬崖。这些技能包括挖掘或建桥。如果有足够数量的小动物进入出口，这个关卡将成功完成，玩家可以进入下一个关卡。Pingus 为标准的 Lemmings 添加了一些额外的特性，包括一个世界地图和一些在原版游戏中没有的技能，但经典 Lemmings 游戏的粉丝们在这个开源版本中仍会感到自在。

要安装 Pingus，请运行以下命令：

  * 在 Fedora: `dnf install pingus`
  * 在 Debian/Ubuntu: `apt install pingus`


我漏掉你最喜欢的开源益智游戏了吗? 请在下面的评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/puzzle-games-linux

作者：[Joshua Allen Holm][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ZenMoore](https://github.com/ZenMoore)
校对：[wxy](https://github.com/wxy)

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
