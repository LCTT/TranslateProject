[#]: subject: (Linux tips for using GNU Screen)
[#]: via: (https://opensource.com/article/21/4/gnu-screen-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (ddl-hust)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13387-1.html)

使用 GNU Screen 的小技巧
======

> 学习基本的 GNU Screen 终端复用技术，然后下载我们的终端命令备忘录，以便你能够熟悉常用的快捷方式。

![](https://img.linux.net.cn/data/attachment/album/202105/13/105050halpppp0pop96ap7.jpg)

对于一般用户而言，命令行终端窗口可能是令人困惑和神秘的。但随着你对 Linux 终端的进一步了解，你很快就会意识到它的高效和强大。不过，也不需要很长时间，你就会想让终端变得更加高效，除了将更多的终端放到你的终端，还有什么高好的方法能够提升你的终端效率呢？

### 终端复用

终端的许多优点之一是它是一个集中控制的界面。它是一个能让你访问数百个应用程序的窗口，而你与每一个应用程序进行交互所需要的只是一个键盘。但是，现代计算机几乎总是有多余的处理能力，而且现代计算机专家喜欢多任务处理，导致一个窗口处理数百个应用程序的能力是相当有限的。

解决这一问题的常见答案是终端复用：即将虚拟终端叠放在一起，然后在它们之间移动的能力。通过终端复用器，你保持了集中控制，但是当你进行多任务时，你能够进行终端切换。更好的是，你能够在终端中拆分屏幕，使得在同一时间显示多个屏幕窗口。

### 选择合适的复用器

一些终端提供类似的功能，有标签式界面和分割式视图，但也有细微的差别。首先，这些终端的功能依赖于图形化的桌面环境。其次，许多图形化的终端功能需要鼠标交互或使用不方便的键盘快捷键。终端复用器的功能在文本控制台上和在图形桌面上一样好用，而且键位绑定是针对常见的终端序列设计的，很方便。

现有两种流行的复用器：[tmux][2] 和 [GNU Screen][3]。尽管你与它们互动的方式略有不同，但它们做同样的事情，而且大多具有相同的功能。这篇文章是 GNU Screen 的入门指南。关于 tmux 的相关介绍，请阅读 Kevin Sonney 的 [tmux 介绍][4]。

### 使用 GNU Screen

GNU Screen 的基本用法很简单，通过 `screen` 命令启动，你将进入 Screen 会话的第 0 个窗口。在你决定需要一个新的终端提示符前，你可能很难注意到有什么变化。

当一个终端窗口被某项活动占用（比如，你启动了文本编辑器 [Vim][5] 或 [Jove][6] 或者你在处理音视频，或运行批处理任务），你可以新建一个窗口。要打开一个新的窗口，按 `Ctrl+A`，释放，然后按 `c`。这将在你现有窗口的基础上创建一个新的窗口。

你会知道当前你是在一个新的窗口中，因为你的终端除了默认的提示符外，似乎没有任何东西。当然，你的另一个终端仍然存在，它只是躲在新窗口的后面。要遍历打开的窗口，按 `Ctrl+A`，释放，然后按 `n`（表示下一个）或按 `p`（表示上一个）。在只打开两个窗口的情况下， `n` 和 `p` 的功能是一样的，但你可以随时打开更多的窗口（`Ctrl+A`，然后 `c` ），并在它们之间切换。

### 分屏

GNU Screen 的默认行为更像移动设备的屏幕，而不是桌面：你一次只能看到一个窗口。如果你因为喜欢多任务而使用 GNU Screen ，那么只关注一个窗口可能看起来是一种退步。幸运的是，GNU Screen 可以让你把终端分成窗口中的窗口。

要创建一个水平分割窗口，按 `Ctrl+A`，然后按 `s` 。这将把一个窗口置于另一个窗口之上，就像窗格一样。然而，在你告诉它要显示什么之前，分割的空间是没有用途的。因此，在创建一个分割窗后，你可以用 `Ctrl+A` ，然后用 `Tab` 移动到分割窗中。一旦进入，使用 `Ctrl+A` 然后 `n` 浏览所有可用的窗口，直到你想显示的内容出现在分割窗格中。

你也可以按 `Ctrl+A` 然后按 `|` （这是一个管道字符，在大多数键盘上通过按下 `shift` 键加上 `\`）创建垂直分割窗口。

### 自定义 GNU Screen

 GNU Screen 使用基于 `Ctrl+A` 的快捷键。根据你的习惯，这可能会让你感觉非常自然，也可能非常不方便，因为你可能会用 `Ctrl+A` 来移动到一行的开头。无论怎样，GNU Screen 允许通过 `.screenrc` 配置文件进行各种定制。你可以用这个来改变触发键的绑定（称为 “转义” 键绑定）。

```
escape ^jJ
```

你还可以添加一个状态行，以帮助你在 Screen 会话中保持自己不迷失。

```
# status bar, with current window highlighted
hardstatus alwayslastline
hardstatus string '%{= kG}[%{G}%H%? %1`%?%{g}][%= %{= kw}%-w%{+b yk} %n*%t%?(%u)%? %{-}%+w %=%{g}][%{B}%m/%d %{W}%C%A%{g}]'

# enable 256 colors
attrcolor b ".I"
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
defbce on
```

在有多个窗口打开的会话中，有一个时刻提醒哪些窗口具有焦点活动，哪些窗口有后台活动的提醒器特别有用。它类似一种终端的任务管理器。

### 下载备忘单

当你学习 GNU Screen 的使用方法时，需要记住很多新的键盘命令。有些命令你马上就能记住，但那些你不常使用的命令可能就很难记住了。你可以按 `Ctrl+A` 然后再按 `?` 来访问 GNU Screen 的帮助界面，但如果你更喜欢一些可以打印出来并放在键盘边的东西，请 [下载我们的 GNU Screen 备忘单][7]。

学习 GNU Screen 是提高你使用你最喜欢的 [终端模拟器][8] 的效率和敏捷性的一个好方法。请试一试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/gnu-screen-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[ddl-hust](https://github.com/ddl-hust)
校对：[wxy](https://github.com/wxy)

本文由[LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/)荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/tmux/tmux/wiki
[3]: https://www.gnu.org/software/screen/
[4]: https://opensource.com/article/20/1/tmux-console
[5]: https://opensource.com/tags/vim
[6]: https://opensource.com/article/17/1/jove-lightweight-alternative-vim
[7]: https://opensource.com/downloads/gnu-screen-cheat-sheet
[8]: https://opensource.com/article/21/2/linux-terminals
