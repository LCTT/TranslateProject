如何使用 Cream 提高 Vim 的用户友好性
============================================================

> Cream 附加包通过把一个更加熟悉的“面孔”置于 Vim 文本编辑器之上，同时保留 Vim 的功能，使其更加容易使用

![How to make Vim user-friendly with Cream](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/osdc_edu_rightmix_520.png?itok=SCsog_qv "How to make Vim user-friendly with Cream")

图片来自 : opensource.com

大约 10 年前，我既使用 Emacs 进行文本编辑，也使用 Vim 进行文本编辑。说到底，我的确是一个热衷于 Emacs 的家伙。尽管 Emacs 在我的心里占据了很重要的地位，但我知道， Vim 也不赖。

一些人，或者像我一样的人，在技术方面有些笨手笨脚。多年来，我和一些 Linux 新手交流，了解到他们想使用 Vim，但是却失望的发现， Vim 编辑器和他们在其它操作系统上使用过的编辑器不一样。

但是，当我把 Cream 介绍给他们以后，他们的失望就变成了满意。Cream 是 Vim 的一个附加包，它使得 Vim 更加容易使用。Cream 让这些 Linux 新手变成了 Vim 的坚决拥护者和忠心用户。

让我们来看一看 Cream 是什么以及它是如何让 Vim 变得更加容易使用的。

### Cream 的安装

在安装 Cream 之前，你需要先在你的电脑上安装好 Vim 和 GVim 的 GUI 组件。我发现最容易完成这件事的方法是使用 Linux 版本的包管理器。

安装好 Vim 以后，便可[下载 Cream 的安装程序][2]，或者你也可以再次使用 Linux 发行版的包管理器进行安装。

安装好 Cream 以后，你可以从应用菜单选择它（比如，**Applications**->**Cream**）或者在程序启动器中输入 `Cream`，从而启动 Cream 。

![Cream’s main window](https://opensource.com/sites/default/files/resize/cream-main-window-520x336.png "Cream’s main window")

### Cream 的使用

如果你之前已经使用过 Gvim，那么你会注意到， Cream 几乎没改变该编辑器的外观和感觉。最大的不同是 Cream 的菜单栏和工具栏，它们取代了 Gvim 陈旧的菜单栏和工具栏，新的菜单栏和工具栏的外观和功能分组看起来和其它编辑器的一样。

Cream 的菜单栏对用户隐藏了更多的技术选项，比如指定一个编译器的能力，以及运行 `make`  命令的能力。当你通过使用 Cream 更加熟悉 Vim 以后，你只需要从 **Setting**->**Preferences**->**Behavior** 选择选项，就可以更容易地访问这些特性。有了这些选项，你可以（如果你想）体验到一个兼有 Cream 和传统 Vim 二者优点的强大编辑器。

Cream 并不是仅由菜单驱动。尽管编辑器的功能仅有单击或双击两种方式，但是你也可以使用常见的键盘快捷键来执行操作，比如 `CTRL-O`（打开一个文件），`CTRL-C`（复制文本）。你不需要在几种模式之间切换，也不需要记住一些很难记住的命令。

Cream 开始运行以后，打开一个文件，或者新建一个文件，然后就可以开始输入了。几个我向他们介绍过 Cream 的人说，虽然 Cream 保留了 Vim 的许多典型风格，但是 Cream 使用起来更加舒服。

![Cream add-on for VIM in action](https://opensource.com/sites/default/files/cream-in-action.png "Cream add-on for VIM in action")

并不是说 Cream 是 Vim 的简化版，远远不是。事实上， Cream 保留了 Vim 的全部特性，同时，它还有[一系列其他有用的特性][7]。我发现的 Cream 的一些有用的特性包括：

*   一个标签式界面
*   语法高亮（特别是针对 Markdown、LaTeX 和 HTML）
*   自动修正拼写错误
*   字数统计
*   内建文件浏览器

Cream 本身也有许多附加包，可以给编辑器增加一些新的特性。这些特性包括文本加密、清理电子邮件内容，甚至还有一个使用教程。老实说，我还没有发现哪一个附加包是真正有用的，不过你的感受可能会有所不同。

我曾听过一些 Vi/Vim 的狂热分子谴责 Cream “降低”（这是他们的原话）了 Vi/Vim 编辑器的水准。的确，Cream 并不是为他们设计的。它是为那些想快速使用 Vim ，同时保留他们曾经使用过的编辑器的外观和感觉的人准备的。在这种情况下， Cream 是值得赞赏的，它使得 Vim 更加容易使用，更加广泛的被人们使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/5/stir-bit-cream-make-vim-friendlier

作者：[Scott Nesbitt][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/article/17/5/stir-bit-cream-make-vim-friendlier?rate=sPQVOnwWoNwyyQX4wV2SZ_7Ly_KXd_Gu9pBu16LRyhU
[2]:http://cream.sourceforge.net/download.html
[3]:http://cream.sourceforge.net/featurelist.html
[4]:https://opensource.com/user/14925/feed
[5]:https://opensource.com/article/17/5/stir-bit-cream-make-vim-friendlier#comments
[6]:https://opensource.com/users/scottnesbitt
[7]:http://cream.sourceforge.net/featurelist.html
