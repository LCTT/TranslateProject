[#]: subject: "How to Change Color of Ubuntu Terminal"
[#]: via: "https://itsfoss.com/change-terminal-color-ubuntu/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13947-1.html"

如何更改 Ubuntu 的终端的颜色
======

![](https://img.linux.net.cn/data/attachment/album/202111/03/173150n4wjwgi4iii4662z.jpg)

如果你只是想完成一些工作，默认的终端已经看起来足够好了。

但是，如果你想要一个独一无二的的终端体验或者符合你自身品位的一些东西，你也可以改变你的 Ubuntu 的终端的颜色。

在这篇速成教程中，我将专注于调整 Ubuntu 中的颜色方案。由于 Ubuntu 使用 GNOME 的终端，因此这些步骤可能也对大多数的使用 GNOME 桌面环境的其它的发行版有效。

### 更改你的 Ubuntu 的终端的颜色

这些步骤类似于 [如何更改终端的字体和大小][1]。你必须找到自定义颜色的选项，就是这样的简单。

让我们快速指出你需要找到什么：

**步骤 1**：[在 Ubuntu 中打开终端窗口][2]，方法是按 `Ctrl+Alt+T` 组合键。

**步骤 2**：打开终端<ruby>首选项<rt>Preferences</rt></ruby>。你可以单击菜单按钮或者右击终端屏幕的任意位置来访问首选项。

![][3]

针对你的自定义选项，创建一个独立的配置文件将会是一个好主意，因为这样做不会更改默认的设置。

![][4]

**步骤 3**：现在，你可以找到一些调整字体大小和样式的选项。但是，在这里，你需要前往 “<ruby>颜色<rt>Colors</rt></ruby>” 选项卡，如下面的屏幕截图所示。

![][5]

**步骤 4**：在默认情况下，你将会注意到：它使用来自系统主题的颜色。如果你想融入你自己的系统主题，这应该是首选的方式。

但是，如果你想要自定义，你需要先取消系统的颜色的选项，然后再开始选择颜色。

![][6]

如你在上面的屏幕截图中能够注意到的那样，你可以选择使用一些内置的颜色方案，也可以 **通过更改文本和背景的默认颜色选项** 来完成自定义颜色方案。

如果你选择一种“自定义”内置方案，那么你可以自定义从文本到光标的各个层面的终端的屏幕颜色。

![][7]

再强调一次！如果你想快速地访问终端的不同的自定义版本，请创建一个单独的配置，否则，每次当你想要一种独特的颜色组合方案时，你都将需要重新自定义。

### 更改终端的颜色的其它的方法

这里有其它的几种更改 Ubuntu 的终端的颜色的方法：

#### 更改主题

大多数的 Ubuntu 主题都有它们自己的终端的颜色的实现，并且其中的一些实现看起来非常漂亮。这里是如何针对 Ant 和 Orchis 主题进行更改终端的颜色方案：

![][8]

你可以选择一种黑暗主题，接下来你的主题将会变成黑色。不需要担心选择颜色方案的问题。

#### 依据你的壁纸选择终端颜色

如果你不想手动自定义你的终端的颜色，你可以使用 Pywal 。使用这个方便的 Python 工具，你的计算机能够随着你的每一张壁纸来 [更改你的终端的颜色方案][9] 。

它将自动地适配你所使用的壁纸。因此，你不需要费心地自定义终端。

### 针对你的终端的自定义选项

如果你是一个更高级的玩家，你可能会热衷于更多的自定义终端的外貌的选项。你可以通读我们关于 [调整终端的外貌的不同的方法][10] 的资源来探索更多的信息。

你更喜欢自定义终端吗？在下面的评论区，让我们知道你的经历！

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-terminal-color-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/change-terminal-font-ubuntu/
[2]: https://itsfoss.com/open-terminal-ubuntu/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/terminal-preference.png?resize=800%2C428&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/terminal-profiles.jpg?resize=800%2C619&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/terminal-colors-option.png?resize=800%2C330&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/changing-colors-ubuntu-terminal.webp?resize=800%2C654&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-terminal-color-customize.png?resize=800%2C550&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/terminal-ant-theme.png?resize=742%2C316&ssl=1
[9]: https://itsfoss.com/pywal/
[10]: https://itsfoss.com/customize-linux-terminal/
