瞬间提升命令行的生产力 100%
============================================================

关于生产力的话题总是让人充满兴趣的。

这里有许多方式提升你的生产力。今天，我共享一些命令行的小技巧，以及让你的人生更轻松的小秘诀。

### TL;DR

在本文中讨论的内容的全部设置及更多的信息，可以查看： [https://github.com/sobolevn/dotfiles][9] 。

### Shell

使用一个好用的，并且稳定的 shell 对你的命令行生产力是非常关键的。这儿有很多选择，我喜欢 `zsh` 和 `oh-my-zsh`。它是非常神奇的，理由如下：

*   自动补完几乎所有的东西
*   大量的插件
*   确实有用且能定制化的“提示符”

你可以通过下列的步骤去安装它：

1.  安装 `zsh`： [https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH][1]
2.  安装 `oh-my-zsh`： [http://ohmyz.sh/][2]
3.  选择对你有用的插件： [https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins][3]

你也可以调整你的设置以 [关闭自动补完的大小写敏感][10] ，或改变你的 [命令行历史的工作方式][11]。

就是这样。你将立马获得 +50% 的生产力提升。现在你可以打开足够多的选项卡（tab）了！（LCTT 译注：指多选项卡的命令行窗口）

### 主题

选择主题也很重要，因为你从头到尾都在看它。它必须是有用且漂亮的。我也喜欢简约的主题，因为它不包含一些视觉噪音和没用的信息。

你的主题将为你展示：

*   当前文件夹
*   当前的版本分支
*   当前版本库状态：干净或脏的（LCTT 译注：指是否有未提交版本库的内容）
*   任何的错误返回码（如果有）（LCTT 译注：Linux 命令如果执行错误，会返回错误码）

我也喜欢我的主题可以在新起的一行输入新命令，这样就有足够的空间去阅读和书写命令了。

我个人使用 [`sobole`][12] 主题。它看起来非常棒，它有两种模式。

亮色的：

 [![sobole.zsh-theme](https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/env-and-user.png)][13] 

以及暗色的：

 [![sobole.zsh-theme](https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/dark-mode.png)][14] 

你得到了另外 +15% 的提升，以及一个看起来很漂亮的主题。

### 语法高亮

对我来说，从我的 shell 中得到足够的可视信息对做出正确的判断是非常重要的。比如 “这个命令有没有拼写错误？” 或者 “这个命令有相应的作用域吗？” 这样的提示。我经常会有拼写错误。

因此， [`zsh-syntax-highlighting`][15] 对我是非常有用的。 它有合适的默认值，当然你可以 [改变任何你想要的设置][16]。

这个步骤可以带给我们额外的 +5% 的提升。

### 文件处理

我在我的目录中经常遍历许多文件，至少看起来很多。我经常做这些事情：

*   来回导航
*   列出文件和目录
*   显示文件内容

我喜欢去使用 [`z`][17] 导航到我已经去过的文件夹。这个工具是非常棒的。 它使用“<ruby>近常<rt>frecency</rt></ruby>” 方法来把你输入的 `.dot TAB` 转换成 `~/dev/shell/config/.dotfiles`。真的很不错！

当你显示文件时，你通常要了解如下几个内容：

*  文件名
*  权限
*  所有者
*  这个文件的 git 版本状态
*  修改日期
*  人类可读形式的文件大小

你也或许希望缺省展示隐藏文件。因此，我使用 [`exa`][18] 来替代标准的 `ls`。为什么呢？因为它缺省启用了很多的东西：

 [![exa](https://raw.githubusercontent.com/ogham/exa/master/screenshots.png)][19] 

要显示文件内容，我使用标准的 `cat`，或者，如果我希望看到语法高亮，我使用一个定制的别名：

```
# exa:
alias la="exa -abghl --git --color=automatic"

# `cat` with beautiful colors. requires: pip install -U Pygments
alias c='pygmentize -O style=borland -f console256 -g'
```

现在，你已经掌握了导航。它使你的生产力提升 +15% 。

### 搜索

当你在应用程序的源代码中搜索时，你不会想在你的搜索结果中缺省包含像 `node_modules` 或 `bower_components` 这样的文件夹。或者，当你想搜索执行的更快更流畅时。

这里有一个比内置的搜索方式更好的替代： [`the_silver_searcher`][20]。

它是用纯 `C` 写成的，并且使用了很多智能化的逻辑让它工作的更快。

在命令行 `history` 中，使用 `ctrl` + `R` 进行 [反向搜索][21] 是非常有用的。但是，你有没有发现你自己甚至不能完全记住一个命令呢？如果有一个工具可以模糊搜索而且用户界面更好呢？

这里确实有这样一个工具。它叫做 `fzf`：

 [![fzf](https://res.cloudinary.com/practicaldev/image/fetch/s--hykHvwjq--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/erts5tffgo5i0rpi8q3r.png)][22] 

它可以被用于任何模糊查询，而不仅是在命令行历史中，但它需要 [一些配置][23]。

你现在有了一个搜索工具，可以额外提升 +15% 的生产力。

### 延伸阅读

更好地使用命令行： [https://dev.to/sobolevn/using-better-clis-6o8][24]。

### 总结

通过这些简单的步骤，你可以显著提升你的命令行的生产力 +100% 以上（数字是估计的）。

这里还有其它的工具和技巧，我将在下一篇文章中介绍。

你喜欢阅读软件开发方面的最新趋势吗？在这里订阅我们的愽客吧 [https://medium.com/wemake-services][25]。

--------------------------------------------------------------------------------

via: https://dev.to/sobolevn/instant-100-command-line-productivity-boost

作者：[Nikita Sobolev][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dev.to/sobolevn
[1]:https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH
[2]:http://ohmyz.sh/
[3]:https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
[4]:https://dev.to/sobolevn
[5]:http://github.com/sobolevn
[6]:https://dev.to/t/commandline
[7]:https://dev.to/t/dotfiles
[8]:https://dev.to/t/productivity
[9]:https://github.com/sobolevn/dotfiles
[10]:https://github.com/sobolevn/dotfiles/blob/master/zshrc#L12
[11]:https://github.com/sobolevn/dotfiles/blob/master/zshrc#L24
[12]:https://github.com/sobolevn/sobole-zsh-theme
[13]:https://res.cloudinary.com/practicaldev/image/fetch/s--Lz_uthoR--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/env-and-user.png
[14]:https://res.cloudinary.com/practicaldev/image/fetch/s--4o6hZwL9--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/dark-mode.png
[15]:https://github.com/zsh-users/zsh-syntax-highlighting
[16]:https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
[17]:https://github.com/rupa/z
[18]:https://github.com/ogham/exa
[19]:https://res.cloudinary.com/practicaldev/image/fetch/s--n_YCO9Hj--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/ogham/exa/master/screenshots.png
[20]:https://github.com/ggreer/the_silver_searcher
[21]:https://unix.stackexchange.com/questions/73498/how-to-cycle-through-reverse-i-search-in-bash
[22]:https://res.cloudinary.com/practicaldev/image/fetch/s--hykHvwjq--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/erts5tffgo5i0rpi8q3r.png
[23]:https://github.com/sobolevn/dotfiles/blob/master/shell/.external#L19
[24]:https://dev.to/sobolevn/using-better-clis-6o8
[25]:https://medium.com/wemake-services
