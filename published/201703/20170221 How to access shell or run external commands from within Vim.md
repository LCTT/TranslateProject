如何从 Vim 中访问 shell 或者运行外部命令
============================================================

Vim——正如你可能已经了解的那样——是一个包含很多特性的强大的编辑器。我们已经写了好多关于 Vim 的教程，覆盖了 [基本用法][4]、 [插件][5]， 还有一些 [其他的][6] [有用的][7] 特性。鉴于 Vim 提供了多如海洋的特性，我们总能找到一些有用的东西来和我们的读者分享。

在这篇教程中，我们将会重点关注你如何在编辑窗口执行外部的命令，并且访问命令行 shell。

但是在我们开始之前，很有必要提醒一下，在这篇教程中提及到的所有例子、命令行和说明，我们已经在 Ubuntu 14.04 上测试过，我们使用的的 Vim 版本是 7.4 。

### 在 Vim 中执行外部命令

有的时候，你可能需要在 Vim 编辑窗口中执行外部的命令。例如，想象一下这种场景：你已经在 Vim 中打开了一个文件，并做了一些修改，然后等你尝试保存这些修改的时候，Vim 抛出一个错误说你没有足够的权限。

[
 ![在 Vim 中执行命令行](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-perm-error.png) 
][8]

现在，退出当前的 vim 会话，重新使用足够的权限打开文件将意味着你会丢失所做的所有修改，所以，你可能赞同，在大多数情况不是只有一个选择。像这样的情况，在编辑器内部运行外部命令的能力将会派上用场。

稍后我们再回来上面的用例，但是现在，让我们了解下如何在 vim 中运行基本的命令。

假设你在编辑一个文件，希望知道这个文件包含的行数、单词数和字符数。为了达到这个目的，在 vim 的命令行模式下，只需要输入冒号 `:`，接下来一个感叹号 `!`，最后是要执行的命令（这个例子中使用的是 `wc`）和紧接着的文件名（使用  `%` 表示当前文件）。

```
:! wc %
```

这是一个例子：

填入的上面提及的命令行准备执行：

[
 ![命令准备在 vim 中执行](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-count-lines.png) 
][9]

下面是终端上的输出：

[
 ![命令输出](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-wc-output.png) 
][10]

在你看到输出之后，输入回车键，你将会退回到你的 vim 会话中。

你正在编写代码或者脚本，并且希望尽快知道这段代码或者脚本是否包含编译时错误或者语法错误，这个时候，这种特性真的很方便。

继续，如果需求是添加输出到文件中，使用 `:read !` 命令。接下来是一个例子：

```
:read ! wc %
```

`read` 命令会把外部命令的输出作为新的一行插入到编辑的文件中的当前行的下面一行。如果你愿意，你也可以指定一个特定的行号——输出将会添加到特定行之后。

例如，下面的命令将会在文件的第二行之后添加 `wc` 的输出。 

```
:2read ! wc %
```

**注意**： 使用 `$` 在最后一行插入， `0` 在第一行前面插入。 

现在，回到最开始我们讨论的一个用例，下面的命令将会帮助你保存文件而不需要先关闭文件（这将意味着没有保存的内容不会丢失）然后使用 [sudo][11] 命令重新打开。

```
:w ! sudo tee %
```

[
 ![](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-sudo-passwrd.png) 
][12]

### 在 Vim 中访问 shell

除了可以执行单独的命令，你也可以在 vim 中放入自己新创建的 shell。为了达到这种目的，在编辑器中你必须要做的是运行以下的命令：

```
:shell
```

或者：

```
:sh
```

当你执行完了你的 shell 任务，输入 `exit`  —— 这将带你回到原来离开的 Vim 会话中。

### 要谨记的漏洞

虽然在真实世界中，能够访问的 shell 绝对符合它们的用户权限，但是它也可以被用于提权技术。正如我们在早期的一篇文章（在 sudoedit 上）解释的那样，即使你提供给一个用户 `sudo` 的权限只是通过 Vim 编辑一个文件，他们仍可以使用这项技术从编辑器中运行一个新的 shell，而且他们可以做 `root` 用户或者管理员用户可以做的所有内容。

### 总结

能够在 Vim 中运行外部命令在好多场景中（有些场景我们已经在这篇文章中提及了）都是一个很有用的特性。这个功能的学习曲线并不麻烦，所以初学者和有经验的用户都可以好好使用它。

你现在使用这个特性有一段时间了吗？你是否有一些东西想分享呢？请在下面的评论中留下你的想法。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/

作者：[Himanshu Arora][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/
[1]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#execute-external-commands-in-vim
[2]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#access-shell-in-vim
[3]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#the-loophole-to-keep-in-mind
[4]:https://www.howtoforge.com/vim-basics
[5]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[6]:https://www.howtoforge.com/tutorial/vim-modeline-settings/
[7]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[8]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-perm-error.png
[9]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-count-lines.png
[10]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-wc-output.png
[11]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/
[12]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-sudo-passwrd.png
