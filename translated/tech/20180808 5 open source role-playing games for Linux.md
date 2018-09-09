
五个 Linux 上的开源角色扮演游戏
======

> 换一个新的身份，并用这些开源的角色扮演游戏探索新世界。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN)

游戏是 Linux 的传统弱项之一，感谢 Steam、GOG 和其他的游戏开发商将商业游戏移植到了多个操作系统，Linux 的这个弱项在近几年有所改观，但是这些游戏通常都不是开源的。当然，这些游戏可以在开源系统上运行，但是对于开源的纯粹主义者来说这还不够好。

那么，有没有一款能让只使用自由开源软件的人在不影响他们开源理念的情况下也能享受到可靠游戏体验的精致游戏呢？

当然有啦！虽然开源游戏不太可能和拥有大量开发预算的 3A 级大作相媲美，但有许多类型的开源游戏也很有趣，而且它们可以直接从大多数主要的 Linux 发行版的仓库中进行安装。即使某个游戏没有被某些仓库打包，你也可以很简单地从这个游戏的官网下载它，并进行安装和运行。

这篇文章着眼于角色扮演游戏，我已经写过关于[街机游戏][1]、[棋牌游戏][2]、[益智游戏][3]，以及[赛车和飞行游戏][4]。在本系列的最后一篇文章中，我打算覆盖战略游戏和模拟游戏这两方面。

### Endless Sky

![](https://opensource.com/sites/default/files/uploads/endless_sky.png)

[Endless Sky][5] 是 Ambrosia Software 的 [Escape Velocity][6] 系列的开源克隆品。玩家乘坐一艘宇宙飞船，在不同的世界之间旅行来运送货物和乘客，并在沿途中承接其他任务，或者玩家也可以变成海盗，并从其他货船中偷取货物。这个游戏让玩家自己决定要如何去体验这个游戏，以太阳系为背景的超大地图是非常具有探索性的。Endless Sky 是那些违背正常游戏类别分类的游戏之一。但这个兼具动作、角色扮演、太空模拟和交易这四种类型的游戏非常值得一试。

如果要安装 Endless Sky ，请运行下面的命令。

在 Fedora 上：

```
dnf install endless-sky
```

在 Debian/Ubuntu 上：

```
apt install endless-sky
```

### FreeDink

![](https://opensource.com/sites/default/files/uploads/freedink.png)

[FreeDink][7] 是 [Dink Smallwood][8] 的开源版本，Dink Smallwood 是一个由 RTSoft 在 1997 年发售的动作角色扮演游戏。Dink Smallwood 在 1999 年时变为了免费游戏，并在 2003 年时公布了源代码。在 2008 年时，游戏的数据除了少部分的声音文件，都在开源协议下进行了开源。FreeDink 用一些替代的声音文件替换了缺少的那部分文件，来提供了一个完整的游戏。游戏的玩法类似于任天堂的[塞尔达传说][9]系列。玩家控制的角色和 Dink Smallwood 同名，他在从一个任务地点移动到下一个任务地点的时候，探索这个充满隐藏物品和隐藏洞穴的世界地图。由于这个游戏的年龄，FreeDink 不能和现代的商业游戏相抗衡，但它仍然是一个拥有着有趣故事的有趣的游戏。游戏可以通过 [D-Mods][10] 进行扩展，D-Mods 是提供额外任务的附加模块，但是 D-Mods 在复杂性、质量，和年龄适应性上确实有很大的差异。游戏主要适合青少年，但也有部分额外组件适用于成年玩家。

要安装 FreeDink ，请运行下面的命令。

在 Fedora 上： 

```
dnf install freedink
```

在 Debian/Ubuntu 上：

```
apt install freedink
```

### ManaPlus

![](https://opensource.com/sites/default/files/uploads/manaplus.png)

从技术上讲，[ManaPlus][11] 本身并不是一个游戏，它是一个访问各种大型多人在线角色扮演游戏的客户端。[The Mana World][12] 和 [Evol Online][13] 是两款可以通过 ManaPlus 访问的开源游戏，但是游戏的服务器不在那里。这个游戏的 2D 精灵图像让人想起超级任天堂游戏，虽然 ManaPlus 支持的游戏没有一款能像商业游戏那样受欢迎的，但它们都有一个有趣的世界，并且在绝大部分时间里都有至少一小部分玩家在线。一个玩家不太可能遇到很多的其他玩家，但通常都能有足够的人一起在这个 [MMORPG][14] 游戏里进行冒险，而不是一个需要连接到服务器的单机游戏。Mana World 和 Evol Online 的开发者联合起来进行未来的开发，但是对于目前而言，Mana World 的历史服务器和 Evol Online 提供了不同的游戏体验。

要安装 ManaPlus，请运行下面的命令。

在 Fedora 上：

```
dnf install manaplus
```

在 Debian/Ubuntu 上：

```
apt install manaplus
```

### Minetest

![](https://opensource.com/sites/default/files/uploads/minetest.png)

使用 [Minetest][15] 来在一个开放式世界里进行探索和创造，Minetest 是 Minecraft 的克隆品。就像它所基于的 Minecraft 一样，Minetest 提供了一个开放的世界，玩家可以在这个世界里探索和创造他们想要的一切。Minetest 提供了各种各样的方块和工具，对于想要一个比 Minecraft 更加开放的游戏的人来说，Minetest 是一个很好的替代品。除了基本的游戏之外，Minetest 还可以通过[额外的模块][16]进行可扩展，增加更多的选项。

如果要安装 Minetest ，请运行下面的命令。

在 Fedora 上：

```
dnf install minetest
```

在 Debian/Ubuntu 上：

```
apt install minetest
```

### NetHack

![](https://opensource.com/sites/default/files/uploads/nethack.png)

[NetHack][17] 是一款经典的 [Roguelike][18] 类型的角色扮演游戏，玩家可以从不同的角色种族、分类和阵营中进行选择，来探索这个多层次的地下城。这个游戏的目的就是找回 Yendor 的护身符，玩家从地下层的第一层开始探索，并尝试向下一层移动，每一层都是随机生成的，这样每次都能获得不同的游戏体验。虽然这个游戏只具有 ASCII 图形和基本图形，但是游戏玩法的深度能够弥补画面的不足。玩家如果想要更好一些的画面的话，可能就需要去查看 [NetHack 的 Vulture][19] 了，这个方式可以提供更好的图像、声音和背景音乐。

如果要安装 NetHack ，请运行下面的命令。

在 Fedora 上：

```
dnf install nethack
```

在 Debian/Ubuntu 上：

```
apt install nethack-x11 or apt install nethack-console
```

我有错过了你最喜欢的角色扮演游戏吗？请在下面的评论区分享出来。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/role-playing-games-linux

作者：[Joshua Allen Holm][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
[1]:https://opensource.com/article/18/1/arcade-games-linux
[2]:https://opensource.com/article/18/3/card-board-games-linux
[3]:https://opensource.com/article/18/6/puzzle-games-linux
[4]:https://opensource.com/article/18/7/racing-flying-games-linux
[5]:https://endless-sky.github.io/
[6]:https://en.wikipedia.org/wiki/Escape_Velocity_(video_game)
[7]:http://www.gnu.org/software/freedink/
[8]:http://www.rtsoft.com/pages/dink.php
[9]:https://en.wikipedia.org/wiki/The_Legend_of_Zelda
[10]:http://www.dinknetwork.com/files/category_dmod/
[11]:http://manaplus.org/
[12]:http://www.themanaworld.org/
[13]:http://evolonline.org/
[14]:https://en.wikipedia.org/wiki/Massively_multiplayer_online_role-playing_game
[15]:https://www.minetest.net/
[16]:https://wiki.minetest.net/Mods
[17]:https://www.nethack.org/
[18]:https://en.wikipedia.org/wiki/Roguelike
[19]:http://www.darkarts.co.za/vulture-for-nethack
