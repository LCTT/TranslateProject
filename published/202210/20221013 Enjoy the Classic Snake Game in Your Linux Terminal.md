[#]: subject: "Enjoy the Classic Snake Game in Your Linux Terminal"
[#]: via: "https://www.debugpoint.com/snake-game-linux-terminal/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15186-1.html"

在你的 Linux 终端中玩经典的贪吃蛇游戏
======

![](https://img.linux.net.cn/data/attachment/album/202210/28/091539oanrjizald7rzr7a.jpg)

> 这是你在 Linux 终端中安装和玩经典贪吃蛇的方法。

还记得老式手机经典简单的贪吃蛇吗？我记得玩了几个小时。嘿，当时没有其他选择，对吧？智能手机仍未上市。而你所拥有的只有这个。

![Nokia 3310 中的旧版贪吃蛇游戏][1]

但随着时间的推移，贪吃蛇被具有各种选项的更高级的图形游戏所取代。但没有什么能比得上经典贪吃蛇游戏。

如果我告诉你，你可以在 Linux 终端中玩这个游戏呢？无论你运行的是 Ubuntu Linux、Fedora Linux 还是 Arch Linux，都无关紧要。该游戏适用于大多数 [发行版][2]。

![nsnake - 主菜单][3]

### 安装 nSnake – Linux 终端的贪吃蛇

你可以使用以下方法通过终端安装 [此游戏][4]。

对于 Ubuntu、Linux Mint 或其他相关发行版：

```
sudo apt install nsnake
```

对于 Fedora Linux 和其他：

```
sudo dnf install nsnake
```

对于 Arch Linux，此游戏可在 [Arch 用户仓库（AUR）][5] 中获得。你可以使用以下步骤安装它。

* [设置 Yay AUR 助手][6]
* 然后打开终端并运行以下命令

```
yay -S nsnake
```

上面的命令会安装游戏的软件仓库版本，它可能不是最新的。但是，如果你想要最新版本，你可能需要通过 GitHub 编译源代码。我在本页末尾添加了编译说明供你参考。

### 玩游戏

玩游戏非常简单。在终端中输入 `nsnake`，这将启动游戏。

要立即退出，请按 `q`。

以下是默认键绑定。

* `箭头键` - 移动蛇
* `q` – 退出游戏
* `p` – 暂停游戏

你还可以通过主菜单以各种方式配置游戏。

![nsnake Linux 终端贪吃蛇设置][7]

完成了，玩吧！

### 编译

要编译最新版本，请在所有 Linux 发行版中使用以下命令。

哦，确保你已经安装了 `git` 和 `ncurses-devel`，它们是编译所需的包。

```
git clone https://github.com/alexdantas/nSnake.git
cd nsnake
make
make install
```

那么，你喜欢贪吃蛇游戏吗？与其他基于终端的游戏相比，你更喜欢它吗？在下面的评论框中与其他读者分享你的观点。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/snake-game-linux-terminal/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
