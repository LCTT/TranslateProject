[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12942-1.html)
[#]: subject: (Why Java developers love the jEdit text editor)
[#]: via: (https://opensource.com/article/20/12/jedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为什么 Java 开发者喜欢 jEdit 文本编辑器
======

> 这款编辑器打包了 Java 的功能，并提供了大量的插件来简化你的工作流程。

![](https://img.linux.net.cn/data/attachment/album/202012/22/133305j08dxrqx2fmp6s12.jpg)

Java 是一门强大的语言。也许因为它经常被看作是一种“工业级”的工具，你可能不会想到它会成为文本编辑器的基础。毕竟，对于如此能力，文本编辑几乎是太容易了。事实上，在大多数现代编程工具包中，接受文本输入的组件是一个预编程的小部件。使用 Java 工具箱，一个简单的文本编辑器可以用 100 行左右的代码编写出来。那么 [jEdit][2] 能提供什么来证明它的存在价值呢？

嗯，实际上，它有很多功能！jEdit 应用是一个令人耳目一新的提醒，提醒人们 Java 对于日常桌面应用是多么的实用和有用。它巧妙地展示了它的基础技术的活力，并且永远忠于 Java 的永恒承诺，在*所有*的平台上都能运作。

### 安装 jEdit

jEdit 是用 Java 编写的，所以它适用于任何平台。[下载][3]通用安装程序或为所选的操作系统下载自定义安装程序。下载完成后（它很小，因此不会花费很长时间），请运行安装程序。

如果你没有安装 Java，请学习如何在 [Linux][4]、[Mac 或 Windows][5] 上安装 Java。

### 使用 jEdit

在 jEdit 中编辑文本的方式和在任何桌面文本编辑器中编辑文本的方式是一样的。如果你使用过编辑器，那么你基本上已经会使用 jEdit 了。所有常用的键盘快捷键和惯例都适用。也有一些通常针对开发者的功能，如行号、折叠（该部分文本被隐藏，这样你就可以把注意力放在其他部分）和语法高亮。

但是，想象一下，从 [简单的 Vim][6] 到 [复杂的 Emacs][7]的各种文本编辑器中，你会发现 jEdit 与 Emacs 类似。虽然编辑组件和任何典型桌面编辑应用一样，但 jEdit 的附加功能包括插件、可以在编辑会话中实时录制的宏、特定于某些编辑模式的功能、缓冲区选项等。这是一个积极鼓励你把它变成你自己的编辑器。

你可以在三个地方对 jEdit 进行自定义：缓冲区选项、全局选项和插件管理器。

缓冲区选项（在 “Utilities” 菜单中）使你可以调整与当前文档关联的设置。通常，jEdit 会自动检测用于你正在执行的操作的适当模式。例如，编写 XML 会触发 jEdit 的 XML 高亮显示。但是，有时你想覆盖 jEdit 已检测到或未能检测到的内容。你还可以打开“显式折叠”模式，该模式允许你手动定义希望 jEdit 视为可折叠部分的文本。

全局选项（在 “Utilities” 菜单中）提供了数十种首选项，这些首选项被视为 jEdit 的默认值。这包括从外观到自定义快捷方式的所有内容。

插件可以扩展出来 jEdit 的开发者从未想过的功能。插件提供的工作方式对 jEdit 而言并非“常规”，但可能会将繁琐的任务转变为简单甚至有趣的事情。它以其出色的 XML 解析、可停靠的 Sidekick 面板中的 Outline 插件和 XSLT 集成，实际上改变了 XML 工作流程。如果我不是已经使用了 Netbeans 来编写 Java 代码，我想我可以使用 jEdit 来代替。

### 面向程序员的 jEdit

选择哪种文本编辑器取决于你打算在编辑器中做的事。它称自己为“程序员的文本编辑器”，并且我认为它是严肃的 Java 和 XML 开发的有力竞争者。但是，在编辑 Lua 代码和 Bash 脚本时，它的功能不就没有这么强了。例如，与 Emacs 之类相比，jEdit 的代码折叠不那么灵活（我无法在没有附加标记的情况下折叠 Lua 函数）。尽管确实有丰富的插件选择，但我找不到用于 AsciiDoc 和其他非代码格式工作的特别有说服力的东西。

对我来说，jEdit 最吸引人的特点是它是以 Java 为基础。因为它在 JVM 中运行，所以你可以确信能够使用它，而无论你使用的平台是什么，也可以不管你是否有权限在自己的主目录之外安装应用。Java 是一种流行且活跃的语言，因此 jEdit 的功能和插件维护得很好。

如果你是一致性的忠实拥护者、Java 开发人员，或者只是 XML 极客而拼命试图摆脱 oXygen，那么你应该试试 jEdit。它很容易上手，并且探索起来很有趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/jedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: http://jedit.org
[3]: http://www.jedit.org/index.php?page=download
[4]: https://linux.cn/article-11614-1.html
[5]: http://adoptopenjdk.org
[6]: https://opensource.com/article/20/12/vi-text-editor
[7]: https://linux.cn/article-12923-1.html
