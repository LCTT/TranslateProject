Emacs 系列（一）：抛掉一切，投入 Emacs 和 Org 模式的怀抱
======

我必须承认，在使用了几十年的 vim 后， 我被 [Emacs][1] 吸引了。

长期以来，我一直对如何组织安排事情感到沮丧。我也有用过 [GTD][2] 和 [ZTD][3] 之类的方法，但是像邮件或是大型文件这样的事务真的很难来组织安排。

我一直在用 Asana 处理任务，用 Evernote 做笔记，用 Thunderbird 处理邮件，把 ikiwiki 和其他的一些项目组合作为个人知识库，而且还在电脑的归档了各种文件。当我的新工作需要将 Slack 也加入进来时，我终于忍无可忍了。

许多 TODO 管理工具与电子邮件集成的很差。当你想做“提醒我在一周内回复这个邮件”之类的事时，很多时候是不可能的，因为这个工具不能以一种能够轻松回复的方式存储邮件。而这个问题在 Slack 上更为严重。

就在那时，我偶然发现了 [Carsten Dominik 在 Google Talk 上关于 Org 模式的讲话][4]。Carsten 是 Org 模式的作者，即便是这个讲话已经有 10 年了，但它仍然很具有参考价值。

我之前有用过 [Org 模式][5]，但是每次我都没有真正的深入研究它，
因为我当时的反应是“一个大纲编辑器？但我需要的是待办事项列表”。我就这么错过了它。但实际上 Org 模式就是我所需要的。

### 什么是 Emacs？什么是 Org 模式？

Emacs 最初是一个文本编辑器，现在依然是一个文本编辑器，而且这种传统无疑贯穿始终。但是说 Emacs 是个编辑器是很不公平的。

Emacs 更像一个平台或是工具包。你不仅可以用它来编辑源代码，而且配置 Emacs 本身也是编程，里面有很多模式。就像编写一个 Firefox 插件一样简单，只要几行代码，然后，模式里的操作就改变了。

Org 模式也一样。确实，它是一个大纲编辑器，但它真正所包含的不止如此。它是一个信息组织平台。它的网站上写着，“你可以用纯文本来记录你的生活：你可以用 Org 模式来记笔记，处理待办事项，规划项目和使用快速有效的纯文本系统编写文档。”

### 捕获

如果你读过基于 GTD 的生产力指南，那么他们强调的一件事就是毫不费力地获取项目。这个想法是，当某件事突然出现在你的脑海里时，把它迅速输入一个受信任的系统，这样你就可以继续做你正在做的事情。Org 模式有一个专门的捕获系统。我可以在 Emacs 的任何地方按下 `C-c c` 键，它就会空出一个位置来记录我的笔记。最关键的是，自动嵌入到笔记中的链接可以链接到我按下 `C-c c` 键时正在编辑的那一行。如果我正在编辑文件，它会链回到那个文件和我所在的行。如果我正在浏览邮件，它就会链回到那封邮件（通过邮件的 Message-Id，这样它就可以在任何一个文件夹中找到邮件）。聊天时也一样，甚至是当你在另一个 Org 模式中也可也这样。

这样我就可以做一个笔记，它会提醒我在一周内回复某封邮件，当我点击这个笔记中的链接时，它会在我的邮件阅读器中弹出这封邮件 —— 即使我随后将它从收件箱中存档。

没错，这正是我要找的！

### 工具套件

一旦你开始使用 Org 模式，很快你就会想将所有的事情都集成到里面。有可以从网络上捕获内容的浏览器插件，也有多个 Emacs 邮件或新闻阅读器与之集成，ERC（IRC 客户端）也不错。所以我将自己从 Thunderbird 和 mairix + mutt （用于邮件归档）换到了 mu4e，从 xchat + slack 换到了 ERC。

你可能不明白，我喜欢这些基于 Emacs 的工具，而不是具有相同功能的单独的工具。

一个小花絮：我又在使用离线 IMAP 了！我甚至在很久以前就用过 GNUS。

### 用一个 Emacs 进程来管理

我以前也经常使用 Emacs，那时，Emacs 是一个“大”的程序（现在显示电源状态的小程序占用的内存要比 Emacs 多）。当时存在在启动时间过长的问题，但是现在已经有连接到一个正在运行的 Emacs 进程的解决方法。

我喜欢用 Mod-p（一个 [xmonad][6] 中 [dzen][7] 菜单栏的快捷方式，但是在大多数传统的桌面环境中该功能的快捷键是 `Alt-F2`）来启动程序（LCTT 译注：xmonad 是一种平铺桌面；dzen 是 X11 窗口下管理消息、提醒和菜单的程序）。这个设置在不运行多个<ruby>[emacs 们](https://www.emacswiki.org/emacs/Emacsen)<rt>emacsen</rt></ruby>时很方便，因为这样就不会在试图捕获另一个打开的文件时出问题。这中方法很简单：创建一个叫 `em` 的脚本并将它放到我自己的环境变量中。就像这样：

```
#!/bin/bash exec emacsclient -c -a "" "$@"
```

如果没有 emacs 进程存在的话，就会创建一个新的 emacs 进程，否则的话就直接使用已存在的进程。这样做还有一个好处：`-nw` 之类的参数工作的很好，它实际上就像在 shell 提示符下输入 `emacs` 一样。它很适合用于设置 `EDITOR` 环境变量。

### 下一篇

接下来我将讨论我的使用情况，并展示以下的配置：

  * Org 模式，包括计算机之间的同步、捕获、日程和待办事项、文件、链接、关键字和标记、各种导出（幻灯片）等。
  * mu4e，用于电子邮件，包括多个账户，bbdb 集成
  * ERC，用于 IRC 和即时通讯

--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9861-emacs-1-ditching-a-bunch-of-stuff-and-moving-to-emacs-and-org-mode

作者：[John Goerzen][a]
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://www.gnu.org/software/emacs/
[2]:https://gettingthingsdone.com/
[3]:https://zenhabits.net/zen-to-done-the-simple-productivity-e-book/
[4]:https://www.youtube.com/watch?v=oJTwQvgfgMM
[5]:https://orgmode.org/
[6]:https://wiki.archlinux.org/index.php/Xmonad_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
[7]:http://robm.github.io/dzen/
