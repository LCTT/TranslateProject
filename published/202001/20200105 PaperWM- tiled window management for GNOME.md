[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11779-1.html)
[#]: subject: (PaperWM: tiled window management for GNOME)
[#]: via: (https://jvns.ca/blog/2020/01/05/paperwm/)
[#]: author: (Julia Evans https://jvns.ca/)

PaperWM：GNOME 下的平铺窗口管理
======

![](https://img.linux.net.cn/data/attachment/album/202001/13/212936hsk572f4jrsj2jsh.jpg)

当我开始在个人计算机上使用 Linux 时，首先令我兴奋的就是轻巧的窗口管理器，这主要是因为当时我的笔记本电脑只有有 32MB 的内存，其它的都运行不了了。

接着我开始接触 [xmonad][1] 之类的平铺窗口管理器！我可以用键盘管理窗口了！它们是如此之快！我可以通过编写 Haskell 程序来配置 xmonad！我可以用各种有趣的方式自定义所有内容（例如使用 [dmenu][2] 作为启动器）！这些年来，我用过 3、4 个不同的平铺窗口管理器，它们都很有趣。

大约 6 年前，我觉得配置平铺窗口管理器对我来说不再是一件有趣的事情，因此转而使用 Ubuntu 桌面环境 Gnome。（现在，我的笔记本电脑中的内存增加了 500 倍，这要快得多  :) ）

我使用 Gnome 已有很长时间了，但是我仍然有点想念平铺窗口管理器。六个月前，一个朋友告诉我有关 [PaperWM][3] 的消息，它使你可以在 Gnome 中平铺窗口！我立即安装了它，并从那时起我一直在使用它。

### PaperWM：Gnome 下的平铺窗口管理

[PaperWM][3] 的基本思想是：你想继续使用 Gnome（因为在 Gnome 中各种任务都能完成），但是你也希望使用平铺窗口管理器。

它是一个 Gnome 扩展程序（而不是一个独立的窗口管理器），并且使用 Javascript。

### “Paper” 表示你的所有窗户都在一行中

PaperWM 的主要想法是将所有窗口排成一行，这实际上与传统的平铺窗口管理器大不相同，在传统的平铺窗口管理器中，你可以按任意方式平铺窗口。这是我写这篇博客时在几个窗口之间切换/调整大小的 gif 图像（有一个浏览器和两个终端窗口）：

![][4]

PaperWM 的 Github README 链接了此视频：<http://10gui.com/video/>，它描述为一个类似的”线性窗口管理器“。

我以前从未听说过这种组织窗口的方式，但是我喜欢它的简单性。如果要查找特定的窗口，只需向左/向右移动，直到找到它。

### 我在 PaperWM 中所做的一切

还有很多其他功能，但这是我使用的功能：

* 在窗口之间左右移动（`Super + ,`、`Super + .`）
* 按顺序向左/向右移动窗口（`Super+Shift+,`、`Super+Shift+.`）
* 全屏显示窗口（`Super + f`）
* 缩小窗口（`Super + r`）

### 我喜欢不需要配置的工具

我在笔记本上使用 PaperWM 已经 6 个月了，我真的很喜欢它！即使它是可配置（通过编写 Javascript 配置文件），我也非常欣赏它，它自带我想要的功能，我无需研究如何去配置。

[fish shell][5] 是另一个类似的令人愉悦的工具，我基本上没有配置 fish（除了设置环境变量等），我真的很喜欢它的默认功能。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/01/05/paperwm/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://xmonad.org/
[2]: https://wiki.archlinux.org/index.php/Dmenu
[3]: https://github.com/paperwm/PaperWM
[4]: https://jvns.ca/images/paperwm.gif
[5]: https://jvns.ca/blog/2017/04/23/the-fish-shell-is-awesome/
