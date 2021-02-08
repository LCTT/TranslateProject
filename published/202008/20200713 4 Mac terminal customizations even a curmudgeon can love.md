[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12536-1.html)
[#]: subject: (4 Mac terminal customizations even a curmudgeon can love)
[#]: via: (https://opensource.com/article/20/7/mac-terminal)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

凯蒂阿姨的自定义 Mac 终端
======

> 开源意味着我可以在任何终端上找到熟悉的 Linux。

![](https://img.linux.net.cn/data/attachment/album/202008/21/002323xqslvqnnmdz487dq.jpg)

十年前，我开始了我的第一份工作，它要求我使用 Linux 作为我的笔记本电脑的操作系统。如果我愿意的话，我可以使用各种 Linux 发行版，包括 Gentoo，但由于我过去曾短暂地使用过Ubuntu，所以我选择了 Ubuntu Lucid Lynx 10.04。

我的 [Konsole][2] 终端使用的是 [Zenburn][3] 主题，有一个类似于这样的 Bash 提示符：

```
machinename ~/path/to/folder $
```

现在，我使用 Mac，具体来说是 macOS Catalina，我使用 [iTerm2][4] 与 [Zenburn 主题][5]，zsh 提示符是这样的：

```
machinename ~/path/to/folder
$
```

我想，十年来几乎相同的提示符，我已经赢得了*老古板*的称号，不过这只是标志着，我的喜好和习惯与现在耍酷的孩子们不一样而已。

仿佛是为了证明我的古板观点，我想改变我的终端和我的旧终端一样。在 Mac 上获得一个看起来和感觉像 Lucid Lynx 的设置并不简单，而且我很花了一些时间。

我最近最大的改变是从 Bash 转移到 zsh，并迁移了我的 [Bash 魔改][6]。但这只是其中一个重大的转变。我学到了许多新式的经验，现在我把这些经验赠送给你，亲爱的读者。

### Coreutils 对选项的顺序更宽容

从 Ubuntu 转移到 macOS 并没有太大的转变，直到我开始觉得我失去了 Unix 范。我试着运行一些基本的操作，比如删除文件夹，但却被告知我错误地调用了 `rm`。

事实证明，GNU 风格的实用程序可能看起来 BSD 风格的差不多，但最大的可用性差异之一是*参数顺序*。未命名参数的排列顺序并不一致。例如：`rm`。

下面是我们熟悉的 GNU 风格的删除目录的命令：

```
$ rm path/to/folder -rf
```

这与同一命令的 BSD 风格版本形成鲜明对比：

```
$ rm path/to/folder -rf
rm: path/to/folder: is a directory
rm: -rf: No such file or directory
```

我通过 [Homebrew][8] 安装 [Coreutils][7] 解决了这个问题。这将 GNU 实用程序引入到了 macOS，并使我不必为那些已经深深扎根于我的肌肉记忆中的命令记住选项顺序，从而对选项顺序更加宽容。

### 强大的 iTerm2

我不知道有哪个操作系统的资深用户会对默认终端满意。在 macOS 这块土地上，我选择了 [iTerm2][4]，它允许我比基本的操作系统终端应用更灵活。我最喜欢的 iTerm 强大功能之一是能够使用 `Command+D` 和 `Command+Shift+D` 来垂直和水平分割窗格。还有很多技巧需要学习，但仅是简单的分割窗格就值得用 iTerm2 换掉默认终端。

### 上下文感知的插件

即使是一个古板的用户也会自定义终端提示，其中一个原因是为了获得一些情境感知。我喜欢终端给我提供上下文，并回答所有想到的问题。不仅仅是我在哪个文件夹里，而是：我在什么机器上？这是个 Git 仓库吗？如果是，我在哪个分支？我是在 Python 虚拟环境中吗？

这些问题的答案最终都归结为一类称之为“上下文感知插件”的终端扩展。

对于当前的 Git 分支，我使用了这个 [parse_git_branch()][9] 方法（如果你使用的是 [Oh My Zsh][10]，也有类似的插件）。对于 Python 来说，virtualenv 会自动给提示符加前缀。Oh My Zsh 有如此多的[插件][11]，你一定能找到改善你生活的东西。

至于我的本地机？我就直接用 `PS1` 格式，因为我喜欢这样的基本信息，而且 macOS 并没有*真正*让你给机器起个名字。

### 多行提示符也不错

观察力强的读者可能会注意到，十年来我的提示符有一个变化，就是现在它是两行。这是最近的一个变化，我慢慢学会了喜欢，因为我前面提到的所有这些插件都让我的提示符变得很长很长。你在文件系统中导航不能太深，要不你试图做任何基本的事情都会输入换行。随之而来的是偶尔的重绘问题和可读性问题。

我收到的关于解决这个问题的建议大多围绕着“哦，你在用 zsh？用 [Powerlevel10k][12] 吧！”这对于像我这样不固步自封的人来说是不错的，但我能够从这些主题中学习到一些，并从中获取一点技巧。

我所做的是在我的提示符中的最后一个 `$` 前加一个 `$'\n'`，这样我的上下文信息 —— 当前机器、当前文件夹、当前 GitHub 分支、当前 virtualenv 等等 —— 都可以在一行中出现，然后我的命令就可以顺利输入了。

我发现唯一的问题是学会在哪里*看*。我习惯于让我的眼睛从行的中心开始，因为以前我的提示符就是从那里开始的。我正在慢慢学会向左看提示符，但这是一个缓慢的过程。我有十几年的眼睛习惯要撤销。

### 使用适合你的方法

如果你喜欢某种风格或工具，那么你的这种偏好是绝对有效的。你可以尝试其他的东西，但千万不要认为你必须使用最新和最伟大的，只是为了像很酷的孩子一样。你的风格和喜好可以随着时间的推移而改变，但千万不要被迫做出对你来说不舒服的改变。

*等下一次，凯蒂阿姨再给你吐槽一下 IDE。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mac-terminal

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://konsole.kde.org/
[3]: https://github.com/brson/zenburn-konsole
[4]: https://www.iterm2.com/
[5]: https://gist.github.com/fooforge/3373215
[6]: https://opensource.com/article/20/1/bash-scripts-aliases
[7]: https://formulae.brew.sh/formula/coreutils
[8]: https://opensource.com/article/20/6/homebrew-mac
[9]: https://gist.github.com/kevinchappell/09ca3805a9531b818579
[10]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
[11]: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
[12]: https://github.com/romkatv/powerlevel10k
