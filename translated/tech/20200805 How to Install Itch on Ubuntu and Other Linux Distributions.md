[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Itch on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/install-itch-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 和其它的 Linux 发现版上安装 Itch
======

[Itch][1] 是独立数字创造者的平台，主要专注于独立游戏。它事实上是作为一个托管，销售和下载独立视频游戏的网站开始的。但是现在，Itch 也提供书籍，漫画，工具，棋类游戏，配乐和更多来自独立创造者的数字内容。

作为一名用户，你或者能够免费下载这些数字内容，或者按照创造者设定的价格下载。你所有下载和购买的东西都同步到你的账户，以便你可以在任何你想的时间内下载它们。

Consider it like Steam ，但是更专注于独立开发者和创造者。

你可以从它的网站浏览 Itch ，但是 Itch 也提供 provides and [开源桌面客户端][2]，这给与你一些额外的优势。使用桌面客户端：

  * 你可以在你的系统上，浏览游戏和其它的内容，并下载它们。
  * 桌面客户端随着所有的新特色自动更新。
  * 你下载的游戏也自动更新。
  * 如果你在 Itch 玩基于浏览器的游戏, 那么你可以使用 Itch 桌面客户端离线玩。



在这篇教程中，我将向你展示在 Ubuntu 或其它任何 Linux 发行版上安装 Itch 的步骤。

### 在 Linux 桌面上安装 Itch

Itch 提供一个名称为 itch-setup 的安装器。你可以从它的下载网页下载这个文件。

[下载 Linux 版 Itch][3]

这个 itch-setup 文件可以工作在任何的  Linux 发行版上，只要它已经安装有 GTK 3 (libgtk-3-0) 。大多数当前的 Linux 发行版应该已经有它了。

在你下载安装文件后，在其上面右击并给予它可执行权限。

![右击并给予文件可执行权限][4]

现在在这个安装文件上通过双击来运行。它将下载 Itch 的最新版本。

![][5]

它将花费的实际时间取决于你的网速。几分钟后，你应该会看到要求你登录你的 Itch 账号的这个屏幕。

![][6]

在你登录后，你可以浏览游戏和其它的内容，并下载/购买它们。

![][7]

整个安装过程类似于 [在 Ubuntu 上安装 Steam ][8]。

你可以在 ~/.itch 文件夹中找到 Itch 文件。你从 Itch 下载的内容通常位于 ~/.config/itch 。如果你不知道的话，~ 意味着你的 home 目录。

### 从你的系统中移除 Itch 桌面应用程序

出于某些原因，如果你不想再使用 Itch ，你可以从你的系统中移除它。为此，不幸的是，你将需要使用终端。

打开一个终端，并使用下面的命令：

```
~/.itch/itch-setup --uninstall
```

它将不会移除你的内容库。如果你想移除下载的游戏和材料，你可以手动删除 ~/.config/itch 文件夹。

```
rm -r ~/.config/itch
```

**你使用 Itch 吗？**

Itch 对独立创造者和此类模式支持者来说是一个有公共道德的平台。Itch 使用 “支付你想支付的东西”，买家可以支付大于或相等内容创作者设置的任何金额。

Itch 也有开放收益分享模式。创造者可以使用 Itch 可以分享或不分享他们生成的收益。

就我个人而言，我更喜欢像 Itch 和 Humble Bundle 这些有公共道德的商店。像 Humble Bundle 一样，Itch 也时不时地进行销售和捆绑销售。这有助于你节省资金并支持独立开发者和创造者。

你使用 Itch ，还是 Humble Bundle ？你还使用哪种类似的平台？

_FOSS 与 Itch 是合作伙伴。更多信息请阅读我们的 [合作政策][9]。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-itch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itch.io/?ac=ywUpyBMGXvG
[2]: https://github.com/itchio/itch
[3]: https://itch.io/app
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-installer-linux.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/installing-itch-linux.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-running-linux.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/itch-game-page.png?resize=800%2C441&ssl=1
[8]: https://itsfoss.com/install-steam-ubuntu-linux/
[9]: https://itsfoss.com/affiliate-policy/
