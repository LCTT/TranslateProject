Vim中的持久撤消
============================================================

阅读文本大约需要俩分钟。

*这篇文章介绍了源自我即将推出书籍中的章节：快速从WTF 到 OMG*

正如您在 “撤销/重做” 章节中看到的那样，涉及到这些功能时，Vim 就会变的非常强大。然而，因为 Vim 需要些配置，还有些功能我没有提到。

在 Vim 中像其他文本编辑器一样，你可以在当前会话中执行 “撤销/重做” 。当一旦会话关闭，则你需要重新打开一个新文章，运行撤销将不再有效 - 因为你已经处于初始状态。

**Vim 支持永久撤销，这意味着甚至你可以从以前的会话  “撤销/重做” **

这的确是一个伟大的功能。这样你就可以把已更改的任意文件回溯历史（状态）。

**它如何工作的？ **Vim 为你编辑的每个文章创建隐藏的文件，它存储撤消历史记录。  现在，配置非常简单。 您只能将此行添加到您的 `.vimrc` 中：

`set undofile `

`" Maintain undo history between sessions`

然后它就可以工作。

然而，Vim会写在同一目录中编辑文件撤消历史文件。一段时间，这会变得凌乱。你肯定也不想那样，这就是为什么，我建议你完成接下来的两个步骤。

首先，为这些 ”撤销历史文件“ 建立一个专门的目录，通过像运行一个命令：

`$ mkdir ~/.vim/undodir`

我的假设是 `〜/ .vim` 是您的 Vim 目录，其中`.vimrc` 。

一旦创建好目录，你只需要添加一行到您的 `.vimrc` 文件中：

`set undodir=~/.vim/undodir`

就这样。 Vim 会全部撤销历史文件存储在该目录中，你就会有完美的持久的撤销工作。

------

 via: [https://jovicailic.org/2017/04/vim-persistent-undo/](https://jovicailic.org/2017/04/vim-persistent-undo/)

作者：JOLE 译者：[erlinux](https://github.com/erlinux/) 校对：[校对者ID](https://github.com/%E6%A0%A1%E5%AF%B9%E8%80%85ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
