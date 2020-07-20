[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customizing my Linux terminal with tmux and Git)
[#]: via: (https://opensource.com/article/20/7/tmux-git)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

使用 tmux 和 Git 自定义我的 Linux 终端
======
设置你的控制台，以便你能知道你在哪里和接下来该做什么
![woman on laptop sitting at the window][1]

我使用 GNOME Terminal，主要是因为它是我的发行版的默认设置。但是我终端内远非“默认值”。在开始自定义它之前，它是这个样子：

![Moshe Zadka's terminal][2]

(Moshe Zadka, [CC BY-SA 4.0][3])

### 从底部开始

我使用终端多路复用技术 [tmux][4] 管理我的终端体验。

在上图的底部，你可以看到我的绿色 tmux 栏。底部的 `[3]` 表示它是第三个终端：每个终端都运行自己的 tmux 会话。 （我创建了一个新会话来放大字体，这样可在截图中更容易看到；这是它与其他终端之间的唯一区别。）

提示看起来也很有趣，对吧？在提示中塞入了太多信息后，我想插在换行符中，这样一来，如果我想即兴 shell 编程或编写五步流水线，就可以不会溢出而做到这点。折衷方案是简单的命令序列（新建、复制、移动），可以更快地滚动到我的屏幕之外。

一行的最后是 [Aleph null][5]，它是最小的[无限基数][6]。我喜欢它在一行的最后很明显，并且当我意识到 Aleph 和下标 0 都是 Unicode 字符时，我忍不住要使用 Aleph null 作为提示的一部分的诱惑。（数学呆子，团结起来！）

在此之前是我的用户名。由于我在不同用户名的多台计算机上使用相同的 [dotfiles][7]（保存在 Git 中），因此这个非常有用。

用户名之前是我所在目录的最后一部分。完整路径通常太长且无用，但是当前目录对于像我这样的经常忘记在做什么人来说是很有用的。在此之前是机器的名称。我所有的机器都以我喜欢的电视节目命名。我的旧笔记本是 `mcgyver`。

提示中的第一位是我最喜欢的位：一个让我知道目录的 Git 状态的字母。如果目录为”不在 Git 中“，那么是 `G`。如果目录为“没有问题” （OK），且无需任何操作，那么是 `K`。如果有 Git 未知的文件需要添加或忽略，那么是 `!`。如果需要提交，那么是 `C`。如果没有上游，那么是 `U`。如果存在上游，但我没有推送，那么是 `P`。该方案不是基于当前状态，而是描述了我要做的_下一个动作_。 （要回顾 Git 术语，请阅读[本文][8]。）

终端功能是通过一个有趣的 Python 程序完成的。它运行 `python -m howsit`（在虚拟环境中安装 [howsit][9] 之后）。

你可以在上图中看到渲染，但是为了完整起见，这是我的 PS1：


```
[$(~/.virtualenvs/howsit/bin/python -m howsit)]\h:\W \u ℵ₀  
$
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/tmux-git

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/sites/default/files/uploads/terminal-tmux-moshezadka.png (Moshe Zadka's terminal)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/20/1/tmux-console
[5]: https://simple.wikipedia.org/wiki/Aleph_null#:~:text=Aleph%20null%20(also%20Aleph%20naught,series%20of%20infinite%20cardinal%20numbers.
[6]: https://gizmodo.com/a-brief-introduction-to-infinity-5809689
[7]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[8]: https://opensource.com/article/19/2/git-terminology
[9]: https://pypi.org/project/howsit/
