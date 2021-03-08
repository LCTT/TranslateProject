[#]: subject: (3 Linux terminals you need to try)
[#]: via: (https://opensource.com/article/21/2/linux-terminals)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13186-1.html)

值得尝试的 3 个 Linux 终端
======

> Linux 让你能够选择你喜欢的终端界面，而不是它强加的界面。

![](https://img.linux.net.cn/data/attachment/album/202103/09/054053zum6n77cpnnug0x1.jpg)

在 2021 年，人们喜欢 Linux 的理由比以往任何时候都多。在这个系列中，我将分享 21 个使用 Linux 的不同理由。能够选择自己的终端是使用 Linux 的一个重要原因。

很多人认为一旦你用过一个终端界面，你就已经用过所有的终端了。但喜欢终端的用户都知道，它们之间有一些细微但重要的区别。本文将介绍我最喜欢的三种。

不过在深入研究它们之前，先要了解 shell 和<ruby>终端<rt>terminal</rt></ruby>之间的区别。终端（技术上说是<ruby>终端模拟器<rt>terminal emulator</rt></ruby>，因为终端曾经是物理硬件设备）是一个在桌面上的窗口中运行的应用。shell 是在终端窗口中对你可见的引擎。流行的 shell 有 [Bash][2]、[tcsh][3] 和 [zsh][4]，它们都在终端中运行。

在现代 Linux 上几乎不用说，至少本文中所有的终端都有标签界面。

### Xfce 终端

![Xfce ][5]

[轻量级 Xfce 桌面][7] 提供了一个轻量级的终端，很好地平衡了功能和简单性。它提供了对 shell 的访问（如预期的那样），并且它可以轻松访问几个重要的配置选项。你可以设置当你双击文本时哪些字符会断字、选择你的默认字符编码，并禁用终端窗口的 Alt 快捷方式，这样你最喜欢的 Bash 快捷方式就会传递到 shell。你还可以设置字体和新的颜色主题，或者从常用预设列表中加载颜色主题。它甚至在顶部有一个可选的工具栏，方便你访问你最喜欢的功能。

对我来说，Xfce 的亮点功能是可以非常容易地为你打开的每一个标签页改变背景颜色。当在服务器上运行远程 shell 时，这是非常有价值的。它让我知道自己在哪个标签页中，从而避免了我犯愚蠢的错误。

### rxvt-unicode

![rxvt][8]

[rxvt 终端][9] 是我最喜欢的轻量级控制台。它有许多老式 [xterm][10] 终端仿真器的功能，但它的扩展性更强。它的配置是在 `~/.Xdefaults` 中定义的，所以没有偏好面板或设置菜单，但这使得它很容易管理和备份你的设置。通过使用一些 Perl 库，rxvt 可以有标签，并且通过 xrdb，它可以访问字体和任何你能想到的颜色主题。你可以设置像 `URxvt.urlLancher: firefox` 这样的属性来设置当你打开 URL 时启动的网页浏览器，改变滚动条的外观，修改键盘快捷键等等。

最初的 rxvt 不支持 Unicode（因为当时 Unicode 还不存在），但 `rxvt-unicode`（有时也叫 `urxvt`）包提供了一个完全支持 Unicode 的补丁版本。

我在每台电脑上都有 rxvt，因为对我来说它是最好的通用终端。它不一定是所有用户的最佳终端（例如，它没有拖放界面）。不过，对于寻找快速和灵活终端的中高级用户来说，rxvt 是一个简单的选择。

### Konsole

![Konsole][11]

Konsole 是 KDE Plasma 桌面的终端，是我转到 Linux 后使用的第一个终端，所以它是我对所有其他终端的标准。它确实设定了一个很高的标准。Konsole 有所有通常的不错的功能（还有些其他的），比如简单的颜色主题加上配置文件支持、字体选择、编码、可分离标签、可重命名标签等等。但这在现代桌面上是可以预期的（至少，如果你的桌面运行的是 Plasma 的话）。

Konsole 比其他终端领先许多年（或者几个月）。它可以垂直或水平地分割窗口。你可以把输入复制到所有的标签页上（就像 [tmux][12] 一样）。你可以将其设置为监视自身是否静音或活动并配置通知。如果你在 Android 手机上使用 KDE Connect，这意味着当一个任务完成时，你可以在手机上收到通知。你可以将 Konsole 的输出保存到文本或 HTML 文件中，为打开的标签页添加书签，克隆标签页，调整搜索设置等等。

Konsole 是一个真正的高级用户终端，但它也非常适合新用户。你可以将文件拖放到 Konsole 中，将目录改为硬盘上的特定位置，也可以将路径粘贴进去，甚至可以将文件复制到 Konsole 的当前工作目录中。这让使用终端变得很简单，这也是所有用户都能理解的。

### 尝试一个终端

你的审美观念是黑暗的办公室和黑色背景下绿色文字的温暖光芒吗？还是喜欢阳光明媚的休息室和屏幕上舒缓的墨黑色字体？无论你对完美电脑设置的愿景是什么，如果你喜欢通过输入命令高效地与操作系统交流，那么 Linux 已经为你提供了一个接口。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-terminals

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/20/8/tcsh
[4]: https://opensource.com/article/19/9/getting-started-zsh
[5]: https://opensource.com/sites/default/files/uploads/terminal-xfce.jpg (Xfce )
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/19/12/xfce-linux-desktop
[8]: https://opensource.com/sites/default/files/uploads/terminal-rxvt.jpg (rxvt)
[9]: https://opensource.com/article/19/10/why-use-rxvt-terminal
[10]: https://opensource.com/article/20/7/xterm
[11]: https://opensource.com/sites/default/files/uploads/terminal-konsole.jpg (Konsole)
[12]: https://opensource.com/article/20/1/tmux-console
