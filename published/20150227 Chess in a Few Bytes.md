只有几百个字节大小的国际象棋程序
================================================================================

当我在这里提到了 ZX81 电脑时，我已经暴露了我的年龄。ZX81 是一个由英国开发者（Sincilair 研究所）生产的家庭电脑，它拥有"高达" 1KB 的内存！上面的 1KB 并不是打印错误，这个家庭电脑确实只配置有 1KB 的板载内存。但这个内存大小上的限制并没有阻止爱好者制作种类繁多的软件。事实上，这个机器引发了一代编程奇才的出现，这让他们掌握了让程序在该机上运行起来的技能。这个机器可以通过一个 16 KB 的内存卡来进行升级，这就提供了更多的编程可能。但未经扩展的 1KB 机器仍然激励着编程者们发布卓越的软件。

![1K ZX Chess ](http://www.linuxlinks.com/portal/content2/reviews/Games2/1KZXChess.jpg)

我最喜爱的 ZX81 游戏有： 模拟飞行（Flight Simulation）, 3D 版怪物迷宫（3D Monster Maze）, 小蜜蜂（Galaxians）, 以及最重要的 1K ZX Chess。 只有最后一个程序是为未扩展版的 ZX81 电脑设计的。事实上，David Horne 开发的 1K ZX Chess 只使用了仅仅 672 字节的 RAM（LCTT 译注：如果读者有兴趣，可以看看[这里](http://users.ox.ac.uk/~uzdm0006/scans/1kchess/)对该程序的代码及解释）。尽管如此，该游戏尽力去实现大多数的国际象棋规则，并提供了一个计算机虚拟对手。虽然一些重要的规则被忽略了（如：王车易位，兵的升变，和吃过路兵）
（LCTT 译注：参考了[这里](http://zh.wikibooks.org/zh/%E5%9B%BD%E9%99%85%E8%B1%A1%E6%A3%8B/%E8%A7%84%E5%88%99)和[这里](http://en.wikipedia.org/wiki/Rules_of_chess)），但能够和人工智能相对抗，这仍然令人惊讶。这个游戏占据了我逝去的青春里的相当一部分。

1K ZX Chess 保持了在所有计算机上国际象棋的最小实现的地位长达 33 年之久，直到今年由 BootChess 打破了该记录，紧接着由 Toledo AtomChess 打破。这三个程序都没有实现所有的国际象棋规则，所以为了完整性，我介绍了我最喜爱的那些实现了所有国际象棋规则的极小的国际象棋。

Linux 有着一系列极其强大的国际象棋引擎，如 Stockfish, Critter, Togo II, Crafty, GNU Chess 和 Komodo 。 在这篇文章精选的国际象棋程序虽敌不过这些好的国际象棋程序，但它们展示了使用微不足道的代码库究竟可以实现多少东西。

----------

### Toledo Atomchess

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-Toledo.png)

你可能已经看到了大量有关 BootChess 新闻报道，这个只用 487 字节写就的国际象棋程序，一举打破了先前最小的国际象棋程序 1K ZX Chess 的记录。所以，Óscar Toledo Gutiérrez 挽起袖子自己编写了一个更加紧凑的国际象棋游戏。Toledo Atomchess 是仅有 481 字节的 x86 汇编代码，都能放到引导扇区里。 在难以置信的代码大小下，这个引擎实现了一个可玩的国际象棋游戏。

特点包括:

- 基本的棋子移动
- 用 ASCII 文本表现的棋盘
- 以代数形式来输入移动(注：如 D2D4)
- 3 层的搜索深度

显然，为了将这个国际象棋程序压缩到 481 字节中，作者必须做出某些牺牲，这些局限包括：

- 没有兵的升变
- 没有王车易位
- 没有吃过路兵
- 没有移动确认

该作者也使用 C，JavaScript 和 Java 来写这个国际象棋程序，每种实现都非常小。

- 网站: [nanochess.org/chess6.html][1]
- 开发者: Óscar Toledo Gutiérrez
- 协议: 非商业用途可免费使用
- 版本号: -

----------

### BootChess

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-BootChess.png)

BootChess 是一个国际象棋的极其小巧的计算机实现。这个程序被塞进到仅仅 487 字节里，并可运行在 Windows, Mac OS X 和 Linux 等操作系统。BootChess 的棋盘和棋子单独用文本表示，其中 P 代表兵， Q 用来代表王后，以及“点”代表空白格子。

特点包括:

- 象棋棋盘和用户输入的形象的文本表示
- 引导扇区大小（512 字节）的可玩的象棋游戏
- 只需 x86 bios 硬件引导程序（没有软件依赖）
- 所有主要的正规移动包括双兵开局
- 兵升变为王后(与 1k ZX Chess 相反)
- 名为 taxiMax > minMax half-ply 的 CPU 人工智能
- 硬编码的西班牙白子开局

同样，它也存在一些重要的限制。这些遗漏的功能包括：

- 兵的低升变（升变为非王后的棋子）
- 吃过路兵
- 没有王车易位
- 3 次位置重复和局规则（注：下一步之前，同样的移动出现了两次；可以参考[这里](http://www.netplaces.com/chess-basics/ending-the-game/three-position-repetition.htm)）
- 50 步移动和局规则（注：在连续的50个回合内，双方既没有棋子被吃掉，也没有兵被移动过，则和局；可以参考[这里](http://www.chessvariants.org/d.chess/chess.html)）
- 没有开放式和封闭式布局
- 一个或多个 minMAX/negaMax 全层人工智能

- 网站: [www.pouet.net/prod.php?which=64962][2]
- 开发者: Olivier "Baudsurfer/RSi" Poudade
- 协议: WTFPL v2
- 版本号: .02

----------

###Micro-Max

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-Micro-Max.png)

Micro-Max 是一个用 133 行 C 语言写就的象棋源程序。

作者实现了一个 hash 变换表，该引擎检查输入移动的合法性，以及支持 FIDE（注： World Chess Federation 缩写，参见其[官网](https://www.fide.com/)） 的全部规则，除了低升变。

特点包括:

- 递归的 negamax 搜索
- 反夺的静态搜索
- 反夺规则的扩展
- 迭代深化
- 最佳移动优先的 `排序`
- 存储分数和最佳移动的 Hash 表
- 完整的 FIDE 规则（除了低位升变）和移动合法性检查

还有一个 1433个字符的较大版本，但允许你使用完整的 FIDE 规则的低升变。

- 网站: [home.hccnet.nl/h.g.muller/max-src2.html][3]
- 开发者: Harm Geert Muller
- 协议: The MIT License
- 版本号: 3.2

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150222033906262/ChessBytes.html

作者：Frazer Kline
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://nanochess.org/chess6.html
[2]:http://www.pouet.net/prod.php?which=64962
[3]:http://home.hccnet.nl/h.g.muller/max-src2.html