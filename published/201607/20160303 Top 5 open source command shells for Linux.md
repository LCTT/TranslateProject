Linux 下五个顶级的开源命令行 Shell
===============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/terminal_blue_smoke_command_line_0.jpg?itok=u2mRRqOa)

这个世界上有两种 Linux 用户：敢于冒险的和态度谨慎的。

其中一类用户总是本能的去尝试任何能够戳中其痛点的新选择。他们尝试过不计其数的窗口管理器、系统发行版和几乎所有能找到的桌面插件。

另一类用户找到他们喜欢的东西后，会一直使用下去。他们往往喜欢所使用的系统发行版的默认配置。最先熟练掌握的文本编辑器会成为他们最钟爱的那一个。

作为一个使用桌面版和服务器版十五年之久的 Linux 用户，比起第一类来，我无疑属于第二类用户。我更倾向于使用现成的东西，如此一来，很多时候我就可以通过文档和示例方便地找到我所需要的使用案例。如果我决定选择使用非费标准的东西，这个切换过程一定会基于细致的研究，并且前提是来自好基友的大力推荐。

但这并不意味着我不喜欢尝试新事物并且查漏补失。所以最近一段时间，在我不假思索的使用了 bash shell 多年之后，决定尝试一下另外四个 shell 工具：ksh、tcsh、zsh 和 fish。这四个 shell 都可以通过我所用的 Fedora 系统的默认库轻松安装，并且他们可能已经内置在你所使用的系统发行版当中了。

这里对它们每个选择都稍作介绍，并且阐述下它适合做为你的下一个 Linux 命令行解释器的原因所在。

### bash

首先，我们回顾一下最为熟悉的一个。 [GNU Bash][1]，又名 Bourne Again Shell，它是我这些年使用过的众多 Linux 发行版的默认选择。它最初发布于 1989 年，并且轻松成长为 Linux 世界中使用最广泛的 shell，甚至常见于其他一些类 Unix 系统当中。

Bash 是一个广受赞誉的 shell，当你通过互联网寻找各种事情解决方法所需的文档时，总能够无一例外的发现这些文档都默认你使用的是 bash shell。但 bash 也有一些缺点存在，如果你写过 Bash 脚本就会发现我们写的代码总是得比真正所需要的多那么几行。这并不是说有什么事情是它做不到的，而是说它读写起来并不总是那么直观，至少是不够优雅。

如上所述，基于其巨大的安装量，并且考虑到各类专业和非专业系统管理员已经适应了它的使用方式和独特之处，至少在将来一段时间内，bash 或许会一直存在。

### ksh

[KornShell][4]，或许你对这个名字并不熟悉，但是你一定知道它的调用命令 ksh。这个替代性的 shell 于 80 年代起源于贝尔实验室，由 David Korn 所写。虽然最初是一个专有软件，但是后期版本是在 [Eclipse Public 许可][5]下发布的。

ksh 的拥趸们列出了他们觉得其优越的诸多理由，包括更好的循环语法，清晰的管道退出代码，处理重复命令和关联数组的更简单的方式。它能够模拟 vi 和 emacs 的许多行为，所以如果你是一个重度文本编辑器患者，它值得你一试。最后，我发现它虽然在高级脚本方面拥有不同的体验，但在基本输入方面与 bash 如出一辙。

### tcsh

[tcsh][6] 衍生于 csh（Berkely Unix C shell），并且可以追溯到早期的 Unix 和计算机时代开始。

tcsh 最大的卖点在于它的脚本语言，对于熟悉 C 语言编程的人来说，看起来会非常亲切。tcsh 的脚本编写有人喜欢，有人憎恶。但是它也有其他的技术特色，包括可以为 aliases 添加参数，各种可能迎合你偏好的默认行为，包括 tab 自动完成和将 tab 完成的工作记录下来以备后查。

tcsh 以 [BSD 许可][7]发布。

### zsh

[zsh][8] 是另外一个与 bash 和 ksh 有着相似之处的 shell。诞生于 90 年代初，zsh 支持众多有用的新技术，包括拼写纠正、主题化、可命名的目录快捷键，在多个终端中共享同一个命令历史信息和各种相对于原来的 bash 的轻微调整。

虽然部分需要遵照 GPL 许可，但 zsh 的代码和二进制文件可以在一个类似 MIT 许可证的许可下进行分发； 你可以在  [actual license][9] 中查看细节。

### fish

之前我访问了 [fish][10] 的主页，当看到 “好了，这是一个为 90 后而生的命令行 shell” 这条略带调侃的介绍时（fish 完成于 2005 年），我就意识到我会爱上这个交互友好的 shell 的。

fish 的作者提供了若干切换过来的理由，这些理由有点小幽默并且能戳中笑点，不过还真是那么回事。这些特性包括自动建议（“注意， Netscape Navigator 4.0 来了”，LCTT 译注：NN4 是一个重要版本。），支持“惊人”的 256 色 VGA 调色，不过也有真正有用的特性，包括根据你机器上的 man 页面自动补全命令，清除脚本和基于 web 界面的配置方式。

fish 的许可主要基于 GPLv2，但有些部分是在其他许可下的。你可以查看资源库来了解[完整信息][11]。

***

如果你想要寻找关于每个选择确切不同之处的详尽纲要，[这个网站][12]应该可以帮到你。

我的立场到底是怎样的呢？好吧，最终我应该还是会重新投入 bash 的怀抱，因为对于大多数时间都在使用命令行交互的人来说，切换过程对于编写高级的脚本能带来的好处微乎其微，并且我已经习惯于使用 bash 了。

但是我很庆幸做出了敞开大门并且尝试新选择的决定。我知道门外还有许许多多其他的东西。你尝试过哪些 shell，更中意哪一个？请在评论里告诉我们。

---

via: https://opensource.com/business/16/3/top-linux-shells

作者：[Jason Baker][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker

[1]: https://www.gnu.org/software/bash/
[2]: http://mywiki.wooledge.org/BashPitfalls
[3]: http://www.gnu.org/licenses/gpl.html
[4]: http://www.kornshell.org/
[5]: https://www.eclipse.org/legal/epl-v10.html
[6]: http://www.tcsh.org/Welcome
[7]: https://en.wikipedia.org/wiki/BSD_licenses
[8]: http://www.zsh.org/
[9]: https://sourceforge.net/p/zsh/code/ci/master/tree/LICENCE
[10]: https://fishshell.com/
[11]: https://github.com/fish-shell/fish-shell/blob/master/COPYING
[12]: http://hyperpolyglot.org/unix-shells

