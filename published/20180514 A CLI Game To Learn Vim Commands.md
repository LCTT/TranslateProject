PacVim：一个学习 vim 命令的命令行游戏
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/PacVim-720x340.png)

你好，Vim用户！今天，我偶然发现了一个很酷的程序来提高 Vim 的使用技巧。Vim 是编写和编辑代码的绝佳编辑器。然而，你们中的一些人（包括我）仍在陡峭的学习曲线中挣扎。再也不用了！来看看 **PacVim**，一款可帮助你学习 Vim 命令的命令行游戏。PacVim 的灵感来源于经典游戏 [PacMan][1]，它以一种好玩有趣的方式为你提供了大量的 Vim 命令练习。简而言之，PacVim 是一种深入了解 vim 命令的有趣而自由的方式。请不要将 PacMan 与 [pacman][2] （arch Linux 包管理器）混淆。 PacMan 是 20 世纪 80 年代发布的经典流行街机游戏。

在本简要指南中，我们将看到如何在 Linux 中安装和使用 PacVim。

### 安装 PacVim

首先按如下链接安装 **Ncurses** 库和**开发工具**。

- [如何在 Linux 中安装 Ncurses 库][6]
- [如何在 Linux 中安装开发工具][7]

请注意，如果没有 gcc 4.8.X 或更高版本，这款游戏可能无法正确编译和安装。我在 Ubuntu 18.04 LTS 上测试了 PacVim，并且完美运行。

安装 Ncurses 和 gcc 后，运行以下命令来安装 PacVim。

```
$ git clone https://github.com/jmoon018/PacVim.git
$ cd PacVim
$ sudo make install
```

### 使用 PacVim 学习 Vim 命令

#### 启动 PacVim 游戏

要玩这个游戏，只需运行：

```
$ pacvim [LEVEL_NUMER] [MODE]
```

例如，以下命令以普通模式启动游戏第 5 关。

```
$ pacvim 5 n
```

这里，`5` 表示等级，`n`表示模式。有两种模式：

  * `n` – 普通模式。
  * `h` – 困难模式。

默认模式是 `h`，这很难：

要从头开始（`0` 级），请运行：

```
$ pacvim
```

以下是我 Ubuntu 18.04 LTS 的示例输出。

![][4]

要开始游戏，只需按下回车。

![][5]

现在开始游戏。阅读下一节了解如何玩。

要退出，请按下 `ESC` 或 `q`。

以下命令以困难模式启动游戏第 `5` 关。

```
$ pacvim 5 h
```

或者，

```
$ pacvim 5
```

#### 如何玩 PacVim？

PacVim 的使用与 PacMan 非常相似。

你必须跑过屏幕上所有的字符，同时避免鬼魂（红色字符）。

PacVim有两个特殊的障碍：

  1. 你不能移动到墙壁中（黄色）。你必须使用 vim 动作来跳过它们。
  2. 如果你踩到波浪字符（青色的 `~`），你就输了！

你有三条生命。每次打赢 0、3、6、9 关时你都会获得新生命。总共有 10 关，从 0 到 9，打赢第 9 关后，游戏重置为第 0 关，但是鬼魂速度变快。

**获胜条件**

使用 vim 命令将光标移动到字母上并高亮显示它们。所有字母都高亮显示后，你就会获胜并进入下一关。

**失败条件**

如果你碰到鬼魂（用**红色 G** 表示）或者**波浪字符**，你就会失去一条命。如果命小于 0 条，你将会输掉整个游戏。

这是实现的命令列表： 

| 键 | 作用 |
|---|---|
| q | 退出游戏 |
| h | 向左移动| 
| j | 向下移动 |
| k | 向上移动 |
| l | 向右移动 |
| w | 向前移动到下一个 word 开始 |
| W | 向前移动到下一个 WORD 开始 |
| e | 向前移动到下一个 word 结束 |
| E | 向前移动到下一个 WORD 结束 |
| b | 向后移动到下一个 word 开始 |
| B | 向后移动到下一个 WORD 开始 |
| $ | 移动到行的末尾 |
| 0 | 移动到行的开始 |
| gg/1G | 移动到第一行的开始 |
| 数字加 G | 移动到由数字给出的行的开始 |
| G | 移到最后一行的开头 |
| ^ | 移到当前行的第一个 word |
| ＆ | 1337 cheatz（打赢当前关）|

玩过几关之后，你可能会注意到 vim 的使用有改善。一段时间后继续玩这个游戏，直到你掌握 Vim 的使用。

**建议阅读：**

今天就是这些。希望这篇文章有用。PacVim 好玩又有趣并且让你有事做。同时，你应该能够彻底学习足够的 Vim 命令。试试看，你不会感到失望。

还有更多的好东西。敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://en.wikipedia.org/wiki/Pac-Man
[2]:https://www.ostechnix.com/getting-started-pacman/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/pacvim-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/05/pacvim-2.png
[6]:https://www.ostechnix.com/how-to-install-ncurses-library-in-linux/
[7]:https://www.ostechnix.com/install-development-tools-linux/