[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12938-1.html)
[#]: subject: (Make medit your next Linux terminal text editor)
[#]: via: (https://opensource.com/article/20/12/medit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

让 medit 成为你的下一个 Linux 代码编辑器
======

> 这款经典的文本编辑器提供了所有的基本功能和一些让你自定义你的体验的令人兴奋的功能。

![](https://img.linux.net.cn/data/attachment/album/202012/21/103921rqtvtsyvyvy5bsq7.jpg)

有了 [XEDIT][2]、jEdit、NEdit、[gedit][3]，最后还有 [medit][4]。 

在我开始搜索我还没有尝试过的编辑器之前，我还没有听说过 medit，但我很高兴发现了它。如果你正在寻找经典的 gedit 体验（大约是 Gnome 2 上），那么 medit 可能无意间提供了一种出色且现代的近似体验。它也有许多额外的功能，比如可以使用 Python、Lua 或 C 语言编写插件，以及甚至可以将 shell 脚本集成到菜单系统。所有其他常用的功能也都在这里：标签式界面、一个即时的 shell、缩进管理、语法高亮等等。

### 安装 medit

你可以从 [mooedit.sourceforge.net][5] 下载 medit。它确认可以在 Linux 和 Windows 上工作。如果你使用的是 Linux，你也可以在你的仓库中找到它。在 Slackware 上，我从 [slackbuilds.org][6] 安装了它。

![Medit terminal showing examples of Bash script in editor][7]

### 使用 medit

medit 宣称自己是一个“为编程和围绕编程”打造的编辑器，事实上，它的诞生是作为一个名为 GAP（<ruby>[群组、算法、编程][8]<rt>Groups、Algorithms、Programming</rt></ruby>）的更大项目的一部分。它的大部分功能都是针对典型的开发者的期望而开发。例如，在 **Edit** 菜单中，有增加和减少缩进的选项，这对于任何试图以可视方式指示范围的程序员来说都是一个常见的任务（对于 Python 程序员来说也是一个明文要求），还有注释或取消注释文本块的选项。

有些功能对普通用户也很有用。medit 有一个易于使用的标签式界面（既在窗口顶部，也在侧面的弹出式列表中），一个用于快速浏览文件系统的侧面板，在文件中添加书签的功能等等。它还具有针对两种编程语言以及标记语言和 Markdown 的语法高亮显示功能，因此它是可以用于编辑代码和普通文本的编辑器。

### 颜色方案

当编辑没有语法关联的纯文本或像 Asciidoc 这样的格式时，medit 没有预设的高亮方案，编辑器会采用你的系统默认值。我使用的是深色主题，所以 medit 在深灰色背景上显示白色文本。

不过对于语法高亮，文本会根据每个单词在其结构化语言中扮演的角色而变成彩色。一开始，我对 medit 的一些选择有些沮丧，很多颜色在我的深色背景下太暗，无法辨认，而且我觉得所有重要的元素都不够显眼。如果你不喜欢 medit 选择的方案，这个问题的答案在 **Preferences** 中，你可以更改颜色主题。我把我的颜色改成了 Tango，它呈现出一个日光照射的颜色阵列，在我的深色编辑器背景下非常出色，甚至给在 medit 主题下保持白色的元素添加了颜色。

![Medit terminal showing examples of Bash script in editor using Tango color scheme against dark background][9]

### 弹出式 Python 控制台

在 medit 窗口的底部，有一个弹出的终端，用于快速访问 shell。这是一个很好的功能，但坦率地说，在你体验过 Emacs 和 [Kate][10]之后，这感觉很普通。medit 让我惊讶的是它的弹出式 Python 控制台，它从 **Tools** 菜单中启动，并预先导入了 **moo** 和 **gtk** 模块。换句话说，当你启动 medit 的 Python shell 时，你可以查看 medit 构建自身部分的 Python 和 GTK 模块。这是一个很好的功能，也许会给你写插件的灵感（这个弹出终端的是一个用 Python 编写的插件，所以你也可以通过它的代码来了解一个插件是如何编写的）。

### 经典编辑

medit 是一款出色的基于 GTK 的编辑器，它具有所有重要的基本功能和一些诱人的额外功能，可以帮助你扩展应用并使其成为你自己的。因为它接受 C、Python、Lua 和 Bash，所以你可以将它用于这几种用途。如果你正在为你的写作寻找一个有用的编辑器，无论是代码还是 Markdown 或介于两者之间的东西，给 medit 一个机会。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/medit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://linux.cn/article-12930-1.html
[3]: https://linux.cn/article-12933-1.html
[4]: http://mooedit.sourceforge.net/
[5]: https://sourceforge.net/projects/mooedit/files/medit/
[6]: https://slackbuilds.org/repository/14.2/development/medit
[7]: https://opensource.com/sites/default/files/uploads/medit-31_days_medit-opensource.png (Medit terminal showing examples of Bash script in editor)
[8]: https://www.gap-system.org/
[9]: https://opensource.com/sites/default/files/uploads/medit-tango-colour-31_days_medit-opensource.png (Medit terminal showing examples of Bash script in editor using Tango color scheme against dark background)
[10]: https://opensource.com/article/20/12/kate-text-editor
