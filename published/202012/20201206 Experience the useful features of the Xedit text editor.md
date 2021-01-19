[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12930-1.html)
[#]: subject: (Experience the useful features of the Xedit text editor)
[#]: via: (https://opensource.com/article/20/12/xedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

体验 Xedit 文本编辑器的实用功能
======

> Xedit 是 X11 图形服务器的一部分，它不算好看，但却有足够的隐藏功能，使它成为一个严肃的文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202012/18/075942uzhgjgxfxve7p2ot.jpg)

X11 图形服务器由 [X.org][2] 发布，它有一些象征性的应用来展示如何使用它提供的工具进行编程。这些应用包括从 [TWM][3] 桌面到愚蠢但催眠的 Xeyes。它还包括一个名为 Xedit 的文本编辑器，它是一个看似简单的应用，却有足够的隐藏功能，使其成为一个严肃的编辑器。

### 安装 Xedit

如果你使用的是 Linux 或 BSD，你可以从你的发行版软件仓库或 ports 树中安装 Xedit。它有时会出现在一个名为 X11-apps 的软件包中，与其他 X11 应用捆绑在一起。

在 macOS 上，你可以安装 [XQuartz][4]，它提供了 Xedit、Xeyes 和其他一些小程序（以及一个 X11 图形服务器）。

### 启动 Xedit

如果它被列在你的应用菜单的话，你可以从中启动 Xedit。尽管它绝对是一个 GUI 应用，但有些发行版将它视为命令而不是 GUI 应用，所以它可能不会被列在应用菜单中。这时，你可以从终端启动 Xedit。如果你输入 `xedit &` 来启动应用，它就会启动一个空的 Xedit 编辑器，可以随时输入。如果你在输入启动命令的同时输入一个现有的文件名，Xedit 启动时会将文件加载到缓冲区。

```
$ xedit example.txt &
```

![Xedit][5]

### 加载文件

在打开的 Xedit 实例中，你可以在顶部文本输入框中输入文件的路径来加载文件。点击 **Load** 按钮（在文本输入框的左边），将文件读入 Xedit 窗口。

![Load Xedit][7]

你可以同时打开多个文件。当一个文件被加载时，它将获取焦点并出现在你的主 Xedit 缓冲区（主窗口中的大文本输入框），并将任何现有的文件切换到一个隐藏的缓冲区。

你可以使用组合键在缓冲区之间切换，这对 Emacs 用户而言很熟悉，但对其他用户会感到困惑。首先，按下 `Ctrl+X`。放开然后按 `Ctrl+B`。

### 组合键

一开始执行需要连续*两*个键盘快捷键的操作感觉很奇怪，但过了一段时间，你就会习惯。事实上，作为一个经常使用 Emacs 的用户，我发现复合键组合很有节奏感。我很惊讶也很高兴地发现，我最喜欢的一些快捷键在 Xedit 中也有效。

原来，Xedit 从几个灵感来源借用了键盘快捷键。如果你是 Emacs 用户，你会发现最常见的组合在 Xedit 中有效。例如，`C-x C-f` （即 `Ctrl+X` 后是 `Ctrl+F`）可以回到顶部的文本输入框来加载文件，而 `C-x C-s`（`Ctrl+X` 后是 `Ctrl+S`）可以保存文件。令人惊讶的是，`C-x 3` 甚至可以垂直分割窗口，而 `C-x 2` 则可以水平分割，`C-x 0` 或 `C-x 1` 则可以移除分割。

Emacs 或 Bash 用户熟悉的编辑命令也适用：

  * `Ctrl+A` 移动到行首。
  * `Ctrl+E` 移至行尾。
  * `Alt+B` 向后移动一个单词。
  * `Ctrl+B` 向后移动一个字符。
  * `Ctrl+F` 向前移动一个字符。
  * `Alt+F` 向前移动一个单词。
  * `Ctrl+D 删除下一个字符。

还有更多，它们都在 Xedit 手册页面上列出。

### 使用行编辑模式

Xedit 还含有一个类似 `ex` 的行编辑器，这对 [Vi][8] 和 `ed` 甚至 `sed` 用户应该很熟悉。要进入行编辑模式，按下 `Esc` 键。这将使你处于顶部的文本输入框，但处于命令模式。编辑命令使用的语法是：*行号*后面跟着一个*命令*和*参数*。

比如说你有这个文本文件：

```
ed is the standard Unix text editor.
This is line number two.
```

你决定将第 1 行的 `ed` 改为 `Xedit`。在 Xedit 中，移动到第 1 行，按下 `Esc`，然后输入 `.,s/ed/Xedit/`。

```
Xedit is the standard Unix text editor.
This is line number two.
```

不用将光标移到下一行，你可以将 `two` 改为 `the second`。按下 `Esc`，然后输入 `2,s/two/the second/`。

各种命令和有效的参数在 Xedit 的手册页中列出。

### 简单但稳定

Xedit 并不算好看，它很简单，没有菜单可言，但它借鉴了一些最好的 Unix 编辑器的流行的便利性。下次你在寻找新的编辑器时，不妨试试 Xedit。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/xedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.x.org/wiki/
[3]: https://opensource.com/article/19/12/twm-linux-desktop
[4]: http://xquartz.org
[5]: https://opensource.com/sites/default/files/uploads/xedit.jpeg (Xedit)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/xedit-load.jpg (Load Xedit)
[8]: https://opensource.com/article/20/12/vi-text-editor
