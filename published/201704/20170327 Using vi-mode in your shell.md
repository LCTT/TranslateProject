在 shell 中使用 vi 模式
============================================================

> 介绍在命令行编辑中使用 vi 模式。

 ![Using vi-mode at the command line](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_computer_development_programming.png?itok=wMspQJcO "Using vi-mode at the command line") 
 
>图片提供： opensource.com

作为一名大型开源社区的参与者，更确切地说，作为 [Fedora 项目][2]的成员，我有机会与许多人会面并讨论各种有趣的技术主题。我最喜欢的主题是“命令行”或者说 [shell][3]，因为了解人们如何熟练使用 shell 可以让你深入地了解他们的想法，他们喜欢什么样的工作流程，以及某种程度上是什么激发了他们的灵感。许多开发和运维人员在互联网上公开分享他们的“ dot 文件”（他们的 shell 配置文件的常见俚语），这将是一个有趣的协作机会，让每个人都能从对命令行有丰富经验的人中学习提示和技巧并分享快捷方式以及有效率的技巧。

今天我在这里会为你介绍 shell 中的 vi 模式。

在计算和操作系统的庞大生态系统中有[很多 shell][4]。然而，在 Linux 世界中，[bash][5] 已经成为事实上的标准，并在在撰写本文时，它是所有主要 Linux 发行版上的默认 shell。因此，它就是我所说的 shell。需要注意的是，bash 在其他类 UNIX 操作系统上也是一个相当受欢迎的选项，所以它可能跟你用的差别不大（对于 Windows 用户，可以用 [cygwin][6]）。

在探索 shell 时，首先要做的是在其中输入命令并得到输出，如下所示：

```
$ echo "Hello World!"
Hello World!
```

这是常见的练习，可能每个人都做过。没接触过的人和新手可能没有意识到 [bash][7] shell 的默认输入模式是 [Emacs][8] 模式，也就是说命令行中所用的行编辑功能都将使用 [Emacs 风格的“键盘快捷键”][9]。（行编辑功能实际上是由 [GNU Readline][10] 进行的。）

例如，如果你输入了 `echo "Hello Wrld!"`，并意识到你想要快速跳回一个单词（空格分隔）来修改打字错误，而无需按住左箭头键，那么你可以同时按下 `Alt+b`，光标会将向后跳到 `W`。

```
$ echo "Hello Wrld!"
              ^
        Cursor is here.
```

这只是使用提供给 shell 用户的诸多 Emacs 快捷键组合之一完成的。还有其他更多东西，如复制文本、粘贴文本、删除文本以及使用快捷方式来编辑文本。使用复杂的快捷键组合并记住可能看起来很愚蠢，但是在使用较长的命令或从 shell 历史记录中调用一个命令并想再次编辑执行时，它们可能会非常强大。

尽管 Emacs 的键盘绑定都不错，如果你对 Emacs 编辑器熟悉或者发现它们很容易使用也不错，但是仍有一些人觉得 “vi 风格”的键盘绑定更舒服，因为他们经常使用 vi 编辑器（通常是 [vim][11] 或 [nvim][12]）。bash shell（再说一次，通过 GNU Readline）可以为我们提供这个功能。要启用它，需要执行命令 `$ set -o vi`。

就像魔术一样，你现在处于 vi 模式了，现在可以使用 vi 风格的键绑定来轻松地进行编辑，以便复制文本、删除文本、并跳转到文本行中的不同位置。这与 Emacs 模式在功能方面没有太大的不同，但是它在你_如何_与 shell 进行交互执行操作上有一些差别，根据你的喜好这是一个强大的选择。

我们来看看先前的例子，但是在这种情况下一旦你在 shell 中进入 vi 模式，你就处于 INSERT 模式中，这意味着你可以和以前一样输入命令，现在点击 **Esc** 键，你将处于 NORMAL 模式，你可以自由浏览并进行文字修改。

看看先前的例子，如果你输入了 `echo "Hello Wrld!"`，并意识到你想跳回一个单词（再说一次，用空格分隔的单词）来修复那个打字错误，那么你可以点击 `Esc` 从 INSERT 模式变为 NORMAL 模式。然后，您可以输入 `B`（即 `Shift+b`），光标就能像以前那样回到前面了。（有关 vi 模式的更多信息，请参阅[这里][13]。）：

```
$ echo "Hello Wrld!"
              ^
        Cursor is here.
```

现在，对于 vi/vim/nvim 用户来说，你会惊喜地发现你可以一直使用相同的快捷键，而不仅仅是在编辑器中编写代码或文档的时候。如果你从未了解过这些，并且想要了解更多，那么我可能会建议你看看这个[交互式 vim 教程][14]，看看 vi 风格的编辑是否有你所不知道的。

如果你喜欢在此风格下与 shell 交互，那么你可以在主目录中的 `~/.bashrc` 文件底部添加下面的行来持久设置它。

```
set -o vi
```

对于 emacs 模式的用户，希望这可以让你快速并愉快地看到 shell 的“另一面”。在结束之前，我认为每个人都应该使用任意一个让他们更有效率的编辑器和 shell 行编辑模式，如果你使用 vi 模式并且这篇文章给你展开了新的一页，那么恭喜你！现在就变得更有效率吧。

玩得愉快！

--------------------------------------------------------------------------------

作者简介：

Adam Miller 是 Fedora 工程团队成员，专注于 Fedora 发布工程。他的工作包括下一代构建系统、自动化、RPM 包维护和基础架构部署。Adam 在山姆休斯顿州立大学完成了计算机科学学士学位与信息保障与安全科学硕士学位。他是一名红帽认证工程师（Cert＃110-008-810），也是开源社区的活跃成员，并对 Fedora 项目（FAS 帐户名称：maxamillion）贡献有着悠久的历史。


------------------------
via: https://opensource.com/article/17/3/fun-vi-mode-your-shell

作者：[Adam Miller][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/maxamillion
[1]:https://opensource.com/article/17/3/fun-vi-mode-your-shell?rate=5_eAB9UtByHOiZMysPcewU4Zz6hOrLwdcgIpu2Ub4vo
[2]:https://getfedora.org/
[3]:https://opensource.com/business/16/3/top-linux-shells
[4]:https://opensource.com/business/16/3/top-linux-shells
[5]:https://tiswww.case.edu/php/chet/bash/bashtop.html
[6]:http://cygwin.org/
[7]:https://tiswww.case.edu/php/chet/bash/bashtop.html
[8]:https://www.gnu.org/software/emacs/
[9]:https://en.wikipedia.org/wiki/GNU_Readline#Emacs_keyboard_shortcuts
[10]:http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
[11]:http://www.vim.org/
[12]:https://neovim.io/
[13]:https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes
[14]:http://www.openvim.com/tutorial.html
[15]:https://opensource.com/user/10726/feed
[16]:https://opensource.com/article/17/3/fun-vi-mode-your-shell#comments
[17]:https://opensource.com/users/maxamillion
