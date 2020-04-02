[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to level up your Vim skills)
[#]: via: (https://opensource.com/article/20/3/vim-skills)
[#]: author: (Detlef Johnson https://opensource.com/users/deckart)

提升你的 Vim 技能的 5 个方法
======

> 通过一些有趣的技巧使你的文本编辑器更上一层楼。

![Computer keyboard typing][1]

Vim 是最受欢迎的文本编辑器之一，因此绝对值得花时间学习如何使用它。如果你使用这个无处不在的 [Vi(m)][2] 命令行文本编辑器来做的只是打开文件、输入和编辑一些文本、保存编辑的文件并退出程序，那么你还有很大的提示空间、。

在某些情况下你会发现，使用 Vim 非常方便的的场景几乎总是涉及到运行远程 Shell 操作的任务。如果你时不时地使用  ssh，比如

```
$ ssh user@hostname.provider.com
```

并在虚拟专用服务器（VPS）或本地虚拟化容器中工作，那么就可以从这些强大的 Vim 技能中受益匪浅。

### 将 Vim 设置为默认的文本编辑器

几乎在所有现代 Linux（或 BSD）发行版中，都可以在终端仿真器的 shell 命令提示符下使用 Vim。在用户 shell 程序中将 Vim 定义为默认编辑器后，即可使用熟悉的 Vim 键绑定来浏览内置的实用程序，例如 `man`。我将说明如何使用 Bash 和 Z shell（zsh）来实现此目的，zsh 现在是 macOS 用户的默认shell（自 Catalina 起）。

#### 在 Bash 中将 Vim 设置为默认

Bash 通过点文件的组合来管理设置。将首选编辑器添加到主目录中的 `.bashrc` 文件中是最常见的，但也可以将其添加到 `.bash_profile` 中。（请阅读 [GNU Bash 文档][3]了解不同之处）。

通过在 `~/.bashrc` 中添加以下内容，将 Vim 设置为默认编辑器：

```
# set default editor to Vim
export EDITOR=vim
```

以 `#` 开头的行是可选的注释，这是提醒自己该命令的功能的好方法。

#### 在 zsh 中将 Vim 设置为默认

zsh 是一种越来越流行的终端模拟器，尤其是自苹果的基于 FreeBSD 的 Darwin 系统最近从 Bash 切换到 zsh 以来。

zsh 点文件与 Bash 的文件相当，因此你可以在 `~/.zshrc` 或 `~/.zprofile` 之间进行选择。有关何时使用哪一个的详细信息，请参见 [zsh文档][4]。

将其设置为默认：

```
# set default editor to Vim
export EDITOR=vim
```

### 优化 Vim 配置

Vim 很像终端仿真器外壳，它使用点文件来设置个人偏好。如果发现该模式，则可能已经猜到它是 `~/.vimrc`。

你可能要更改的第一个设置是将对旧 Vi 兼容模式切换为“关”。由于 Vim 是 Vi 的超集，因此 Vi 中的所有功能都可用，并在 Vim 中进行了很大的改进，你可以获得许多高级功能。最新版本（8.2）允许你在拆分的窗口中打开终端运行一个子进程 shell 程序。

顺便说一句，关闭旧版兼容性似乎没有做什么事情（[事实上，可能不是][5]）。当遇到一个 `.vimrc` 文件时，Vim 会自动将该模式切换为关闭。但有时将其明确关闭仍然很重要。缩写 `nocp` 是 `nocompatible` 的同义词，也可以使用它。[条条大道通罗马][6]，切换首选项有很多方式。

在 `.vimrc` 语法中， 以 `"` 开头的行是注释（就像 `.bashrc` 文件中的 `#` 一样），这些注释可以帮助你记住诸如为何选择一个隐秘的设置名称之类的内容。

要关闭 Vi 兼容性，请将以下内容添加到 `~/.vimrc` 文件中：

```
" ensure that legacy compatibility mode is off
" documentation: <http://vimdoc.sourceforge.net/htmldoc/options.html\#'compatible>'
set nocp
```

### Understand modes

The notion of Vim's "modes" is very important to learn about, especially the difference between the very distinct `Normal` and `Insert` modes. Confusion about modes is what trips up most new users. Modes aren't unique to Vim, nor were they introduced by Vi. Command mode is so old that it predates the invention of [copy and paste][7] functionality in the 1970s.

#### Important modes

Vim depends on different modes to define keyboard-stroke behavior. The important modes to know are:

  * `Normal mode`: Default mode used primarily for navigation and opening files
  * `Insert mode` (includes Replace): Where Vim allows for text input to an open file
  * `Visual mode`: Where Vim acts similar to mouse-based input, such as copying, editing, replacing, and more
  * `Command mode` (including Line, Ex command, and Last-line mode): A powerful way to do more in Vim



Each mode has a great deal to explore. Use [Vimtutor][8] (`$ vimtutor`) to interactively learn about movement, modes, and running Ex commands in "Last Line" mode. Some indispensable productivity operators include:

`:E` | Opens explorer for locating files and directories
---|---
`.` | Repeats the last edit action
`;` | Repeats the last motion or movement forward
`,` | Repeats the last motion or movement backward
`/` | Searches document forward
`?` | Searches document backward
``* | Finds next occurrence of the word under the cursor
`#` | Finds the previous occurrence of the word under the cursor
`~` | Toggles case
`%` | Toggles between opening and closing `()`, `[]`, and `{}`; highly useful for coding
`z=` | Makes spelling suggestions

### Play Vim like a piano

While it's important to commit Vim's operator "language" to memory, the challenge to gaining mastery is to learn to think like a musician and combine operators and movements into "key chords in harmony" so that you can play Vim like a piano. That's where the power of text manipulation with Vim rivals that of the other notable command-line editor, Emacs. (While one of these editors will wear down your `Esc` key, using the other will wear down your `Ctrl` key.)

When describing key chords, it's conventional in Vim to designate the `Ctrl` key using the capital letter C, followed by a hyphen (`C-`). It's not universal, but I will follow that convention from here onward and clarify when there is any potential for confusion.

If you type long lines in Vim, you'll want to set it to wrap your text. To start personalizing Vim for the way you work, think about that setting: How would you like Vim to handle text wrapping by default when it starts? On or off? I like it turned off and leave it out of the runtime commands file. When I want text to wrap, I simply set it in command-line mode with `:set wrap`.

There's nothing wrong with having Vim set to wrap text by default. It's simply a matter of preference—which can change over time. The same goes for handling paste, code language indent syntax, and the `Tab` key (tabs or spaces? and how many spaces then? Dive into these options [here][9]). All these options for default behavior are entirely configurable and changeable in real time as you work with command-line mode operations.

You will find many suggestions for setting Vim defaults in community forums, on Vim wikis, and in articles (like this one). Setting preferences for your personal computing environment should be fairly familiar to you, and Vim is no different. I highly recommend that you start by making very small changes to your settings, and make additional changes slowly so that you can easily revert settings. This way, you might avoid the use of plugins for years—or entirely.

### Splits, tabs, and terminals in Vim 8.2

There are two ways to split your working files into different views: they can appear side-by-side, or you can switch between them with full (window) screens using application tabs. These changes to your application window are initiated from command-line mode, which requires a colon (`:`) to call up the prompt.

Each window split can host a file for editing, and you can arrange tabs to switch between additional files as much as you like. There is limited screen space for splits, so tabs are handy when you want to split more screens. How you decide to work is purely a matter of preference. To split a window horizontally, use `:sp`, and use `:vs` for vertical splits.

As of [Vim 8.2][10], you can open a terminal shell sub-process in a vertical split with `:vert term` to run operations on the command line right alongside your code. You need to type `exit` to close your terminal process, just like you would end a shell session, but you close splits and tabs the same way you would close any ordinary Vim window, with `:q`.

To initialize a tab, use a special edit command: `:tabedit`, which automatically switches you to the new open tab. If you give the command a file name as an argument, that file will open for editing. If you neglect to give it a file name as an argument, the command-line mode edit `:e filename.txt` works just like it would in any ordinary Vim window. Navigate tabs with the next (`:tabn`) and previous (`:tabp`) commands.

To use splits, you need to know how to navigate among them using the key-chord combination `C-w` plus a movement key in the direction you want to move, such as left (`h`), down (`j`), up (`k`), or right (`l`). When you want to learn more key chords specific to splits and tabs, read the `:help split` and `:help tabpage` for the Vim manual entries.

### Get help

While the Vim manual is referenced in Vimtutor, opening Vim help with `:help` will let you spend time with the editor on your own and get more productive without wholly relying on articles like this one. Experience is key to Vim mastery. The experience contributes to your overall computing intuition since so much of what has gone into Vim is drawn from the Unix universe.

Have fun exploring the beauty of Vim, and share any questions you have in the comments.

Want to become a master of text editing in the terminal, and beyond? These tips for getting started...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/vim-skills

作者：[Detlef Johnson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/deckart
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
[4]: http://zsh.sourceforge.net/Intro/intro_3.html
[5]: http://vimdoc.sourceforge.net/htmldoc/starting.html#compatible-default
[6]: https://en.wikipedia.org/wiki/There%27s_more_than_one_way_to_do_it
[7]: https://www.npr.org/2020/02/22/808404858/remembering-the-pioneer-behind-your-computers-cut-copy-and-paste-functions
[8]: http://www2.geog.ucl.ac.uk/~plewis/teaching/unix/vimtutor
[9]: https://opensource.com/article/18/9/vi-editor-productivity-powerhouse
[10]: https://www.vim.org/vim-8.2-released.php
