[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12933-1.html)
[#]: subject: (Optimize your GNOME experience with the Gedit text editor)
[#]: via: (https://opensource.com/article/20/12/gedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 gedit 文本编辑器优化你的 GNOME 体验
======

> 它是一个可以完成工作的简约编辑器，并以隐藏的增强功能使得事情更简单。

![](https://img.linux.net.cn/data/attachment/album/202012/19/110419snchihpnjn8juxqc.jpg)

作为默认的文本编辑器是一项吃力不讨好的工作。人们通常把默认文本编辑器几乎看作是一个演示应用、一个稍微好一点的 “hello World” 示例，说明应用在该平台上的是如何运行的。在极少数情况下，当用户需要将一些文本保存到一个可能永远不会再看的文件中时，用户会找到默认文本编辑器。对于“严肃”的工作，他们会转向文字处理器或 IDE，或终端中的编辑器，或者至少是一个不同的文本编辑器，必须像“真正的”应用一样下载和安装。

很奇怪，默认的文本编辑器很难被人重视，然而 GNOME 桌面的编辑器 gedit 却被广泛认为是一个真正有价值的文本编辑器，超越了它所在的桌面。它被用作网页设计课程的必备文本编辑器，是新手开发者和系统管理员的推荐工具，也是许多桌面 Linux 用户最喜欢的可靠伙伴。

### 安装 gedit

如果你运行的是 GNOME 桌面，你可能已经安装了 gedit，尽管它可能只作为“文本编辑器”出现在你的应用菜单中。如果你不确定，只需在你的活动界面中输入 `gedit`，然后在打开的文本编辑器中进入 “About” 菜单项。

![gedit terminal box with black background and white letters][2]

在 Windows 上，你可以[从微软商店下载并安装 gedit][3]。

在 Mac 上，你可以[使用 Homebrew][4]或 [MacPorts][5] 安装 gedit。

### 使用 gedit

当你第一次启动 gedit 时，你会看到一个简约的界面，包括一个文本输入面板、一个标题栏和一个位于窗口底部的状态面板。底部的状态面板提供了一些常用的设置：你想使用哪种语法高亮模式、你喜欢的制表符宽度、以及一些流行的偏好，如行号、文本换行等等。这些选项中的大部分也可以在 “Preferences” 菜单中进行全局设置，它可在应用程序右上角的 “汉堡” 样式的菜单中找到。

### gedit 的隐藏功能

从表面上看，gedit 正是它所标榜的那样：一个不起眼的文本编辑器，它不会妨碍你的工作，因此你可以在屏幕上的框中输入字母。但是，这个简单的文本编辑器却隐藏着一些你可能不知道的令人兴奋的功能，即使你已经使用它多年。

这些键盘功能在 gedit 中并没有被记录下来：

  * `Ctrl+D` 删除当前行。这对于编码者或以标记格式（如 Asciidoc、reST 或 CommonMark）写作的人特别有用。
  * `Ctrl+I` 会弹出 “Go to Line” 下拉框。输入一个数字，你就会立即跳到该行。
  * `Alt+向上箭头` 或 `Alt+向下箭头` 会抓取当前行，并将它在文档中向上或向下移动。
  * `Alt+向左箭头` 或 `Alt+向右箭头` 抓取最近的单词（在光标左侧）并将其向左或向右移动。
  * 要输入特殊的 Unicode 字符，请按下 `Shift+Ctrl+U` 并松开，然后输入 Unicode 字符代码。你通常必须查找字符代码（除非你已经记住了一些，但谁有记性来记住这些字符代码？）例如，要打出一只企鹅，按下 `Shift+Ctrl+U` 然后松开。当你松开按键后，你会看到一个带下划线的 U，然后输入 `1F427`，后面跟一个空格，你的 Unicode 字符就会变成一个友好的 `🐧`。诚然，这并不完全是 gedit 所独有的，但这是个很有用的技巧，而且它在 gedit 中也确实有效。

### 稳定简单

Gedit 很像 GNOME 本身。它客观上比许多同类软件（比如 KDE 的 Kate）更简单，但它仍然能够满足你日常 80% 或 90% 的期望。

当然，可能会有一些任务 gedit 不是最佳工具。你可能会发现自己要深入研究一些独特的日志文件，或者需要一个精确的解析器或代码检查器，你会转向专门的应用。这没关系。gedit 并不意味着对所有用户都适用。但对于那些需要文本编辑器的人来说，它是一个很好的文本编辑器，有时这就是所需要的。在 Linux 或者在任何你正在使用的平台上，试一下 gedit，因为它很有可能是一个比默认应用的更好的选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/sites/default/files/uploads/gedit-31_days_gedit-opensource.jpg (gedit terminal box with black background and white letters)
[3]: https://www.microsoft.com/en-nz/p/gedit
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/11/macports
