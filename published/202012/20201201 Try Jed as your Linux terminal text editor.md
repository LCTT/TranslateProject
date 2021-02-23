[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12901-1.html)
[#]: subject: (Try Jed as your Linux terminal text editor)
[#]: via: (https://opensource.com/article/20/12/jed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

尝试将 Jed 作为你的 Linux 终端文本编辑器
======

> Jed 方便的下拉菜单，让新用户可以轻松地使用终端文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202012/09/085456f7fmt74eu6eekpmt.jpg)

你可能听说过 Emacs、Vim 和 Nano 这些典型的 Linux 文本编辑器，但 Linux 有大量的开源文本编辑器，我的目标是在 12 月份对其中的 31 个文本编辑器进行一次公平的测试。

在这篇文章中，我将介绍 [Jed][2]，它是一个基于终端的编辑器，它的特点是有一个方便的下拉菜单，这让那些刚刚接触终端编辑器的用户，以及那些不喜欢记住每个功能的组合键的用户而言变得特别容易。

### 安装 Jed

在 Linux 上，你的发行版软件仓库可能会让 Jed 通过你的软件包管理器安装：

```
$ sudo dnf install jed
```

并不是所有发行版都是如此，但它是一个很容易从源码编译的应用。首先，下载 [S 语言][3]（Jed 的编写语言）并安装（其中 `x.y.z` 请替换为对应的版本号）：

```
$ wget https://www.jedsoft.org/releases/slang/slang-x.y.z.tar.bz2
$ tar xvf slang*bz2
$ cd slang-x.y.z
$ ./configure ; make
$ sudo make install
```

安装好后，对 [Jed 源码][4]也同样操作（其中 `x.y.z` 请替换为对应的版本号）：

```
$ wget https://www.jedsoft.org/releases/jed/jed-x.y.z.tar.bz2
$ tar xvf jed*bz2
$ cd jed-x.y.z
$ ./configure ; make
$ sudo make install
```

### 启动 Jed

Jed 在终端中运行，所以要启动它，只需打开终端，输入 `jed`：

```
F10 key ==> File   Edit   Search   Buffers   Windows   System   Help


     This is a scratch buffer.  It is NOT saved when you exit.

     To access the menus, press F10 or ESC-m and the use the arrow
     keys to navigate.

     Latest version information is available on the web from
     <http://www.jedsoft.org/jed/>.  Other sources of JED
     information include the usenet newsgroups comp.editors and
     alt.lang.s-lang.  To subscribe to the jed-users mailing list, see
     <http://www.jedsoft.org/jed/mailinglists.html>.

     Copyright (C) 1994, 2000-2009  John E. Davis
     Email comments or suggestions to <jed@jedsoft.org>.

[ (Jed 0.99.19U) Emacs: *scratch*    ()  1/16   8:49am ]
```

### 如何使用 Jed

Jed 自动加载的说明很清晰且很有帮助。你可以按 `F10` 键或 `Esc` 键，然后按字母 `M` 进入顶部菜单。这将使你的光标进入 Jed 顶部的菜单栏，但它不会打开菜单。要打开菜单，请按键盘上的回车键。使用方向键来浏览每个菜单。

屏幕上的菜单不仅对初次使用的用户很有帮助，对有经验的用户来说，它还提供了很好的键盘快捷键提醒。例如，你大概能猜到如何保存正在处理的文件。进入 **File** 菜单，选择 **Save**。如果你想加快这个过程，你可以记住 `Ctrl+X`，然后 `Ctrl+S` 的组合键（是的，这是连续的两个组合键）。

### 探索 Jed 的功能

对于一个简单的编辑器来说，Jed 拥有一系列令人惊讶的实用功能。它有一个内置的多路复用器，允许你同时打开多个文件，但它会“叠”在另一个文件之上，所以你可以在它们之间切换。你可以分割你的 Jed 窗口，让多个文件同时出现在屏幕上，改变你的颜色主题，或者打开一个 shell。

对于任何有 Emacs 使用经验的人来说，Jed 的许多“没有宣传”的功能，例如用于导航和控制的组合键，都是一目了然的。然而，当一个组合键与你所期望的大相径庭时，就会有一个轻微的学习（或者说没有学习）曲线。例如，GNU Emacs 中的 `Alt+B` 可以将光标向后移动一个字，但在 Jed 中，默认情况下，它是 **Buffers** 菜单的快捷键。这让我措手不及，大约本文每句话都遇到一次。

![Jed][8]

Jed 也有**模式**，允许你加载模块或插件来帮助你编写特定种类的文本。例如，我使用默认的 text 模式写了这篇文章，但当我在编写 [Lua][9] 时，我能够切换到 lua 模式。这些模式提供语法高亮，并帮助匹配括号和其他分隔符。你可以在 `/usr/share/jed/lib` 中查看 Jed 捆绑了哪些模式，而且因为它们是用 S 语言编写的，你可以浏览代码，并可能学习一种新的语言。

### 尝试 Jed

Jed 是一个令人愉快且清新的 Linux 终端文本编辑器。它轻量级，易于使用，设计相对简单。作为 Vi 的替代方案，你可以在你的 `~/.bashrc` 文件中（如果你是 root 用户，在 root 用户的 `~/.bashrc` 文件中）将 Jed 设置为 `EDITOR` 和 `VISUAL` 变量。今天就试试 Jed 吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/jed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.jedsoft.org/jed
[3]: https://www.jedsoft.org/releases/slang/
[4]: https://www.jedsoft.org/releases/jed
[5]: http://www.jedsoft.org/jed/\>
[6]: http://www.jedsoft.org/jed/mailinglists.html\>
[7]: mailto:jed@jedsoft.org
[8]: https://opensource.com/sites/default/files/jed.png (Jed)
[9]: https://opensource.com/article/20/2/lua-cheat-sheet
