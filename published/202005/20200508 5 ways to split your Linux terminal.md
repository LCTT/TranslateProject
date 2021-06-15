[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12236-1.html)
[#]: subject: (5 ways to split your Linux terminal)
[#]: via: (https://opensource.com/article/20/5/split-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 种拆分 Linux 终端的方法
======

>  本文介绍了 Linux 提供的拆分终端的方法，它能够帮助你完成多任务工作。那么，你最喜欢哪一款终端复用工具呢？

![](https://img.linux.net.cn/data/attachment/album/202005/21/132437ypzpqqppqh1qfznh.jpg)

没有什么问题是不能用一个 Linux 终端解决的，如果不行，那就用两个。

很早以前，[终端其实是一个物理设备][2]，而现在的终端实际上是在计算机上被模拟出来的一个应用程序。当你使用终端和计算机进行交互的时候，就会发现，只打开一个终端是不够用的。在进行编译、数据处理等长时间任务的时候，你不得不打开一个新终端或新<ruby>选项卡<rt>tab</rt></ruby>来同时进行其它工作。

如果你是系统管理员，你就需要更多的终端窗口，以便连接到多个不同的主机上并行工作了。

在 Linux 系统中，终端应用程序在很久之前就已经开始带有选项卡功能了。而现在的终端应用程序里，选项卡已经是标配功能了，这是非常流行的趋势。尽管如此，工作的时候在多个选项卡之间来回切换，或多或少也会分散我们的注意力，甚至带来不便。

而最好的解决方案就是将整个屏幕划分为多个部分，这样多个终端就可以在同一个终端应用程序窗口中同时存在。Linux 发行版中也有很多相关的工具可以实现这一功能。

### Shell、终端和控制台

在此之前，我们首先要明确 Shell、<ruby>终端<rt>terminal</rt></ruby>、<ruby>控制台<rt>console</rt></ruby>这三个概念。想要详细了解的话，请参阅 [Enable Sysadmin][2] 博客上的相关文章。

简而言之：

* **Shell** 是带有<ruby>命令提示符<rt>prompt</rt></ruby>的用于输入、输出的界面。准确地说，[POSIX][3] 桌面底层也运行着一个 Shell，即使这个 Shell 对用户不可见，因为用户会话就是由这个 Shell 启动的。
* **终端**是在图形界面服务器（例如 X11 或 Wayland）中运行的应用程序，其中加载了一个 Shell。只有在终端窗口启动之后，才算是运行了一个终端。终端可以认为是操作 Shell 的一个入口。
* **控制台**（或称“虚拟控制台”）通常表示在桌面环境以外使用的 Shell，你可以通过 `Alt+Ctrl+F2` 进入控制台，通常情况下从 `F3` 到 `F7` 都是不同的控制台，其中桌面环境有可能是 `F1` 或者 `F7`，这在不同的发行版中可能会有所不同。

因此，有些应用程序提供的功能是拆分 Shell 或者控制台，有些应用程序的功能则是拆分终端。

### tmux

![tmux terminal][4]

[tmux][5] 可以说是最灵活、最强大的屏幕拆分工具了，它通过键盘控制对多个终端的复用，因此你可以将一个控制台叠放在另一个控制台上面，并在两个控制台之间切换。你还可以将整个屏幕等分为多个控制台，以便同时观察不同控制台上的状况。

`tmux` 的所有操作都是通过键盘完成的，这就意味着你的手不需要离开键盘去寻找鼠标。为此，你需要记住一些按键组合。

如果你只用 `tmux` 来做屏幕拆分，那你只需要记住一下这些命令：

  * `Ctrl-B %` 竖直拆分屏幕（两个 Shell 分别位于左右）
  * `Ctrl-B "` 水平拆分屏幕（两个 Shell 分别位于上下）
  * `Ctrl-B O` 切换到另一个 Shell
  * `Ctrl-B ?` 查看帮助
  * `Ctrl-B d` 断开 `tmux` 并让其在后台运行（可以使用 `tmux attach` 重新进入）

`tmux` 的一大好处是，在一台计算机上启动 `tmux` 会话之后，也可以从另一台计算机上进入到这个会话，由此可以看出，`tmux` 对 Shell 进行了<ruby>守护进程化<rt>daemonize</rt></ruby>。

例如，当我在树莓派上运行 `tmux`，我就可以从计算机上连接到树莓派并登录 IRC，当我断开连接时，树莓派上的 `tmux` 会继续运行，并等待我的下一次连接，在此期间 IRC 是处于持续登录状态的。

### GNU Screen

![GNU Screen terminal][6]

[GNU Screen][7] 也是一个 Shell 复用工具，类似于 `tmux`，你可以在断开一个活动会话后重连到其中，它也支持竖直或水平拆分屏幕。

`screen` 的灵活性比 `tmux` 要弱一些。它默认的绑定按键组合是 `Ctrl-A`，和 Bash 中光标移动到行首的快捷键是一样的。因此，当你正在运行 `screen` 的时候，如果想要将光标移动到行首，就需要多按一次 `Ctrl-A`。而我自己的做法是，在 `$HOME/.screenrc` 文件中将绑定按键组合重新设置为 `Ctrl-J`。

```
escape ^jJ
```

尽管 `screen` 在屏幕拆分功能上做得很好，但 `tmux` 上的一些缺点在 Screen 上也同样存在。例如在拆分 Shell 时，在一个新的面板中不会启动新的 Shell ，而是需要使用 `Ctrl-A Tab` 导航到另一个面板（如果你按照我的方式重新设置了按键组合，需要对应地把 `Ctrl-A` 改为 `Ctrl-J`），然后通过 `Ctrl-A C` 手动创建一个新的 Shell。

和 `tmux` 不同的是，`screen` 在退出一个 Shell 的时候，屏幕拆分状态不会改变，这样的设计在某些情况下是比较适合的，但麻烦之处在于需要手动管理屏幕拆分状态。

尽管如此，`screen` 还是一个相当可靠灵活的应用程序，在无法使用 `tmux` 的时候，你可以选择 `screen` 作为备选方案。

在默认按键方案下，`screen` 常用的基本命令包括：

  * `Ctrl-A |` 竖直拆分屏幕（两个 Shell 分别位于左右）
  * `Ctrl-A S` 水平拆分屏幕（两个 Shell 分别位于上下）
  * `Ctrl-A Tab` 切换到另一个 Shell
  * `Ctrl-A ?` 查看帮助
  * `Ctrl-A d` 断开 `screen` 并让其在后台运行（可以使用 `screen -r` 重新进入）

### Konsole

![Konsole screen][8]

[Konsole][9] 是 KDE Plasma 桌面使用的终端应用程序。和 KDE 一样，Konsole 也以高度可定制、功能强大的特点而著称。

和 `tmux`、GNU Screen 类似，Konsole 也具有拆分屏幕的功能。由于 Konsole 是图形界面的终端，因此还可以用鼠标来控制它的屏幕拆分。

Konsole 的屏幕拆分功能在“<ruby>查看<rt>View</rt></ruby>”菜单中。它也支持竖直和水平方向的拆分，只要点击鼠标就可以切换到另一个面板上。每个面板都是一个独立的终端，因此都可以拥有独立的主题和标签页。

Konsole 和 `tmux`、GNU Screen 最大的不同之处在于不能断开和重新连接 Konsole。除非使用远程桌面软件，否则只能在打开 Konsole 时使用，这一点和大多数图形界面应用程序是一样的。

### Emacs

![Emacs rpg][10]

严格来说，Emacs 并不算是一个终端复用工具，但它的使用界面支持拆分和调整大小，同时还带有一个内建的终端。

如果 Emacs 是你日常使用的文本编辑器，你就可以在不关闭编辑器的情况下，在不同的应用程序之间轻松互相切换。由于 Emacs eshell 模块是通过 eLISP 实现的，因此你可以在 Emacs 中使用相同的命令进行交互，让一些繁琐的操作变得更为简单。

如果你是在图形界面中使用 Emacs，还可以使用鼠标进行操作。例如通过点击切换面板、用鼠标调整拆分屏幕的的大小等等。尽管如此，键盘的操作速度还是更快，因此记住一些键盘快捷键还是很有必要的。

Emacs 的一些重要快捷键包括：

  * `Ctrl-X 3` 竖直拆分屏幕（两个 Shell 分别位于左右）
  * `Ctrl-X 2` 水平拆分屏幕（两个 Shell 分别位于上下）
  * `Ctrl-X O` （大写字母 `O`）切换到另一个 Shell（你也可以使用鼠标操作）
  * `Ctrl-X 0` （数字 `0`）关闭当前面板

如果你运行了 emacs-client 的话，就可以像 tmux 和 GNU Screen 一样断开和重新连接到 Emacs 了。

### 窗口管理器

![Ratpoison split screen][11]

除了文本编辑器之外，一些 Linux 桌面也同样具有拆分屏幕、加载终端这样的功能。例如 [Ratpoison][12]、[Herbsluftwm][13]、i3、Awesome，甚至是启用了特定设置的 KDE Plasma 桌面，都可以将多个应用程序在桌面上分块显示。

这些桌面可以让各个应用程序占据屏幕的固定位置，而不是浮在你的桌面“之上”，因此你可以在多个应用程序窗口之间轻松切换。你还可以打开多个终端，排布成网格，就像终端复用工具一样。更进一步，你还可以在你的桌面复用工具中加载一个终端复用工具。

而且，没有什么可以阻止你在里面载入 Emacs 并分割缓冲区。没有人知道，如果你把它更进一步，会发生什么，大多数 Linux 用户不会外传这种秘密。

和 `tmux`、GNU Screen 不同，你在断开与桌面的连接后无法重新连接到同一个桌面会话，除非你使用了远程桌面软件进行连接。

### 更多选择

除了上面介绍到的工具以外，还有诸如 [Tilix][14]、Terminator 这样的终端模拟器，它们同样可以实现屏幕拆分、嵌入终端组件等功能。欢迎在评论区分享你喜欢的终端拆分工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/split-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://www.redhat.com/sysadmin/terminals-shells-consoles
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://opensource.com/sites/default/files/uploads/terminal-split-tmux2.png (tmux terminal)
[5]: https://github.com/tmux/tmux
[6]: https://opensource.com/sites/default/files/uploads/terminal-split-screen.png (GNU Screen terminal)
[7]: https://www.gnu.org/software/screen/
[8]: https://opensource.com/sites/default/files/uploads/konsole.jpg (Konsole screen)
[9]: https://konsole.kde.org
[10]: https://opensource.com/sites/default/files/uploads/emacs-rpg_0.jpg (Emacs rpg)
[11]: https://opensource.com/sites/default/files/uploads/advent-ratpoison-split_0.jpg (Ratpoison split screen)
[12]: https://opensource.com/article/19/12/ratpoison-linux-desktop
[13]: https://opensource.com/article/19/12/herbstluftwm-linux-desktop
[14]: https://gnunn1.github.io/tilix-web/
