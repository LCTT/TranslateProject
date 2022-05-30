[#]: subject: "Vanilla Vim is fun"
[#]: via: "https://opensource.com/article/21/12/vanilla-vim-config"
[#]: author: "Lukáš Zapletal https://opensource.com/users/lzap"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14326-1.html"

简简单单的 Vim 就很好
======

> 这就是我如何从 35 个 Vim 插件降到只有 6 个的原因。

![](https://img.linux.net.cn/data/attachment/album/202203/04/161603q6mmr6q7kkkd2yky.jpg)

当你用 `—clean` 选项启动 Vim 时，它以 “素” 模式展示 Vim。没有插件、没有配置，一切回到了最初。多年来，我收集了一堆配置语句，其中一些可以追溯到 MS-DOS 或 Windows 3.1 时期。我是这样打算的：从头开始，只用 Fedora 35 中可用的插件，找到一个好的配置起点。我可以在一周的编码生活中生存下来吗？我会找到答案的！

规则是这样的：尽可能少的配置语句，并且只使用 Fedora 35+ 中的插件。顺便说一下，如果你不是 Fedora 用户，也请继续阅读。你可以随时从你的操作系统软件包管理器手动安装或者使用 Vim 插件管理器安装这些插件。

在我开始之前，有一个大问题需要解决：用 Vim 还是 Neovim（Vim 的一个复刻）。好吧，这由你决定。这篇文章中的所有内容应该对两者都适用。然而，我只用 Vim 测试过。当你登录到一个只有 `vi` 可用的服务器时，所有的这些技能都会派上用场。它可以是一个旧的 UNIX 系统、一个安装了最少的软件以提高安全性的 Linux 服务器、一个容器中的交互式 shell，或者一个空间宝贵的嵌入式系统。

闲话少说，下面是我提炼出来的使用 Vim 进行编码的绝对最低限度的东西：

```
# dnf install --allowerasing vim-default-editor \
        vim-enhanced \
        vim-ctrlp \
        vim-airline \
        vim-trailing-whitespace \
        vim-fugitive \
        vim-ale \
        ctags
```

不要担心 `—allowerasing` 选项。在确认之前，只需查看一下安装的东西。这个选项的作用是告诉软件包管理器把现有的 `nano-default-editor` 包替换为 `vim-default-editor`。这是一个小软件包，它在 shell 配置文件中将 `EDITOR` 环境变量设置为 `vim`，如果你想默认使用 Vim（例如，与 `git` 一起使用），这是必须的。这是专门针对 Fedora 的。你不需要在其他发行版或操作系统上这样做，只要确保你的 `EDITOR` shell 变量被正确设置就行。

### 概览

简单介绍一下我认为好的、干净的插件集：

  * **CtrlP**：尽可能小的模糊查找插件（纯 vimscript）
  * **Fugitive**：一个 git 的必备工具
  * **Trailing-whitespace**：显示并修复（删除）尾部的空格
  * **Airline**：一个改进的状态行（纯 vimscript）
  * **Ale**：在你打字时高亮显示错别字或语法错误
  * **Ctags**：不是 Vim 插件，但却是一个非常需要的工具

还有其他的模糊查找插件，如 command-t 或我最喜欢的 `fzf.vim`（非常快）。问题是，`fzf.vim` 不在 Fedora 中，而我想要尽可能少的配置。CtrlP 就可以了，而且配置它更容易，因为它不需要什么依赖。

如果让我选择一个绝对最小的配置，那就是：

```
# cat ~/.vimrc
let mapleader=","
let maplocalleader="_"
filetype plugin indent on
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set exrc
set secure
```

但这可能太极端了，所以这里是一个稍大的配置，下面是我的详细解释：

```
" vim: nowrap sw=2 sts=2 ts=2 et:

" leaders
let mapleader=","
let maplocalleader="_"

" filetype and intent
filetype plugin indent on

" incompatible plugins
if has('syntax') && has('eval')
  packadd! matchit
end

" be SSD friendly (can be dangerous!)
"set directory=/tmp

" move backups away from projects
set backupdir=~/.vimbackup

" fuzzy searching
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>f :CtrlPBufTag<cr>
nnoremap <leader>q :CtrlPQuickfix<cr>
nnoremap <leader>m :CtrlPMRU<cr>

" buffers and quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <leader>w :call ToggleQuickFix()<cr>
nnoremap <leader>d :bd<cr>

" searching ang grepping
nnoremap <leader>g :copen<cr>:Ggrep!<SPACE>
nnoremap K :Ggrep "\b<C-R><C-W>\b"<cr>:cw<cr>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>

" ctags generation
nnoremap <leader>c :!ctags -R .<cr><cr>

" per-project configs
set exrc
set secure
```

### 使用逗号作为引导键

我喜欢把我的 `引导键` 映射成逗号 `,`，而不是默认的反斜杠 `\`。当你的手处于书写位置时，它是 Vim 中最接近的自由键。另外，这个键在大多数键盘布局中都是一样的，而 `\` 在每个型号或布局都不一样。我很少使用 `本地引导键`，但下划线 `_` 看起来很合适。

延伸阅读：

  * 参见 [Vim 参考手册][2] 中的 `:help map-which-keys`。
  * 参见 [Vim Tips Wiki][3] 中的 Vim 中未使用的键。

### 文件类型和关闭语法高亮

接下来是非常重要的 `filetype` 命令。看，Vim 自带“内置电池”，8.2 版本包含 644 种语言的语法高亮，251 个文件类型定义（`ftplugins`），以及 138 种语言的缩进规则。然而，缩进在默认情况下是不启用的，也许是为了给所有人提供一个一致的编辑体验。我喜欢启用它。

一个简单的技巧：如果你正在编辑一个非常大的文件，并且 Vim 感觉很慢，你可能想禁用语法高亮来加快速度。只要输入 `:syn off` 命令即可。

延伸阅读：

  * 参见 [Vim 参考手册][4] 中的 `:help filetype`。
  * 参见 [Vim 参考手册][5] 中的 `:help syntax`。
  * 参见 [Vim 参考手册][6] 中的 `:help indent`。

### Matchit 插件

Vim 甚至额外带有使得一些功能不兼容的插件，其中一个相当有用。它就是 `matchit` 插件，它使按下 `%` 键可以在某些语言中查找匹配的括号。通常情况下，你可以找到一个块的开始或结束（开始和结束括号）或 HTML 匹配标签及类似的。

延伸阅读：

  * 参见 [Vim 参考手册][7] 中的 `:help matchit`。

### 交换文件

我想从我的旧配置中保留的许多设置之一是使用 `/tmp` 进行交换，并在我的家目录的一个单独目录中创建备份，你需要用 `mkdir ~/.vimbackup` 来创建这个目录。重要的是要明白，当你开始编辑时，Vim 会创建一个名为 “交换文件” 的副本，所有未保存的工作都会保存在这个文件中。所以即使停电了，你的交换文件也包含了大部分未保存的工作。我更喜欢使用 `tmpfs`，因为我所有的笔记本电脑和服务器都有 UPS 保护，而且我经常保存。另外，大多数情况下，你会使用到交换文件是当你的 SSH 连接丢失而不是由于停电时。对于大文件来说，交换文件可能相当大，我很珍视我的固态硬盘，所以我决定这样做。如果你不确定，可以删除这句话，使用 `/var/tmp`，这样更安全。

延伸阅读；

  * 参见 [Vim 参考手册][8] 中的 `:help swap-file`。

### 模糊寻找插件

现在，模糊查找是一个我不能没有的插件。在服务器上当你每天需要打开 20 个文件时，使用 `:Ex` 或 `:e` 或 `:tabe` 等命令打开文件是没问题的。而当编码时，我通常需要打开数百个文件。正如我所说，CtrlP 很好地完成了这项工作。它很小，没有依赖性，纯 Vim。它用 `Ctrl + P` 组合键打开，这对我来说有点奇怪。我知道一些著名的编辑器（我记得是 VSCode）使用这个组合键。问题是，这已经是很重要的 Vim 绑定键，我不想覆盖它。所以对我来说，赢家是 `引导键 + 引导键`（逗号按两次）。

`ctrlp_user_command` 只是改变了 CtrlP 获取文件列表的方式。它不使用内置的递归文件列表（glob），而是使用 `git ls-files`，这通常更好，因为它忽略了 `.gitignore` 中的东西，所以像 `node_modules` 或其他可能拖慢列表的不相关目录不会受到影响。

使用 `引导键` + `B`/`T`/`F`/`Q`/`M` 来打开缓冲区、标签、当前文件的标签、快速修复缓冲区和最近使用的文件的列表，非常有用。具体来说，一旦你用 `ctags` 生成了标签列表，这基本上就是数百种编程语言的“去……定义处”，而且不需要插件！这都是 Vim 内置的。现在澄清一下，当我说输入 `引导键 + B` 时，是指按下逗号，然后按 `B` 键，而不是像用 `Control` 或 `Shift` 那样一起按。

延伸阅读：

  * 参见 [Vim 参考手册][9] 中的 `:help Explore`。
  * 参见 [ctrlp.vim GitHub][10]。

### 缓冲区管理

虽然现在 Vim 支持标签，但缓冲区管理是掌握 Vim 的一个重要技能。我通常会有很多缓冲区，我需要经常做 `:bdelete`。那么，`引导键 + D` 似乎是一个不错的选择，可以更快地完成这个任务。我也喜欢关闭 Quickfix 窗口，所以也有 `引导键 + W` 的组合键，我在浏览搜索结果时经常使用这个功能。

延伸阅读：

  * 参见 [Vim 参考手册][11] 中的 `:help buffer-hidden`。

### Ggrep 和 fugitive 插件

说到搜索，它和打开文件一样重要。我希望能够对代码库进行检索。为此，有一个来自 fugitive 插件的很棒的 `:Ggrep` 命令，它使用 `git grep`，忽略了垃圾文件，只搜索 Git 中的内容。由于 `Shift + K` 是 Vim 中的一个自由键，它非常适用于自动检索光标位置的词语。最后，能够使用 `引导键 + G` 输入任意的搜索模式也很好。注意，这将打开一个叫做 Quickfix 的窗口，你可以在这里浏览结果、查看下一个/上一个/最后一个/第一个出现的地方，等等。这个窗口也用于编译器或其他工具的输出，所以要熟悉它。如果你对此感到陌生，我建议进一步阅读文档。

延伸阅读：

  * 参见 [Vim 参考手册][12] 中的 `:help quickfix`。
  * 参见 [vim-fugitive GitHub][13]。

### 用 fugitive 进行搜索、检索

顺便说一下，用 `/` 键搜索是智能和大小写敏感的，这意味着如果所有的搜索字符都是小写的，Vim 的搜索会忽略大小写。默认情况下，它会高亮显示结果，我觉得我已经敲了无数次的 `:noh`（来关闭高亮显示）。这就是为什么我有 `引导键 + S` 来切换高亮显示。我建议以后也多读读手册中关于搜索的内容。

接下来是搜索、检索。fugitive 插件已经为你提供了。使用命令 `:Ggrep pattern` 来进行 `git grep`，结果会进入 Quickfix 窗口。然后简单地使用快速修复命令（`:cn`、`:cp` 等等）浏览结果，或者简单地使用 `:CtrlPQuickfix`（`引导键 + Q`）来直观地滚动它们。CtrlP 的快速修复整合的酷炫之处是，你可以通过输入以匹配文件名或内容来进一步在搜索结果中搜索。

延伸阅读：

  * 参见 [Vim 参考手册][14] 中的 `:help grep`。
  * 参见 [Vim 参考手册][15] 中的 `:help noh`。
  * 参见 [vim-fugitive GitHub][13] 。

### Ctags

`引导键 + C` 可以生成一个 ctags 文件，以便更好地导航，这在处理一个新的代码库或做一个有很多跳转的较长的编码任务时很有用。ctags 支持数百种语言，而 Vim 可以利用所有这些知识来导航。后面会有更多关于如何配置它的内容。注意我已经讨论过 `引导键 + T` 来打开所有标签的模糊搜索，记得吗？这两个是非常相同的。

延伸阅读：

  * 参见 [Vim 参考手册][16] 中的 `:help ctags`。
  * 参见 [Universal Ctags 网站][17]。

### 按键映射

能够通过在项目目录下创建一个 `.vimrc` 文件来覆盖该项目中的任何设置是一个好主意。只要把它放在（全局的） `.gitignore` 中，以确保你不需要在每个项目中编辑成千上万的 `.gitignore` 文件。这样的一个项目的 `.vimrc` 可以是这样的（对于使用 GNU Makefile 的 C/C++ 项目）：

```
" coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" include and autocomplete path
let &path.="/usr/local/include"
" function keys to build and run the project
nnoremap <F9> :wall!<cr>:make!<cr><cr>
nnoremap <F10> :!LD_LIBRARY_PATH=/usr/local/lib ./project<cr><cr>
```

正如你所看到的，我通常将 `F2` 到 `F10` 等键映射到编译、运行、测试和类似的操作。用 `F9` 来调用 `make`，听起来不错。还记得 MS-DOS 上的蓝色 Borland IDE 吗？

如前所述，在全局范围内忽略 `.vimrc` 和（由 `ctags` 生成的）`tags` 是个好主意，所以不需要每次都更新 `.gitignore`：

```
# git config --global core.excludesfile ~/.gitignore
# cat ~/.gitignore
/.vimrc
/tags
/TAGS
```

在我的个人配置中还有几条只与那些非美国键盘布局的人有关（我用捷克语）。我需要用“死键”来输入许多字符（LCTT 译注：“死键”是一种通过将变音符号与后面的字母结合起来打出重音字符的方法。这种方法在历史上被用于机械打字机），这根本不可能，我宁愿输入命令而不是按那些难以按下的组合键。这里有一个解决问题的办法：

```
" CTRL-] is hard on my keyboard layout
map <C-K> <C-]>
" CTRL-^ is hard on my keyboard layout
nnoremap <F1> :b#<cr>
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>
" I hate entering Ex mode by accident
map Q <Nop>
```

延伸阅读：

  * 参见 [Vim 参考手册][18] 中的 `:help map`。

功能键在 Vim 中都是自由的，除了 `F1`，它被绑定在帮助上。我不需要帮助，并不是说我已经会对 Vim 了如指掌，并不是。但如果需要的话，我可以简单地输入 `:help`。而 `F1` 是一个关键的键，离 `Esc` 键如此之近。我喜欢将它用于缓冲区交换（`:b#`），将 `F2`/`F3` 用作下一个/上一个。你越是与缓冲区打交道，你就越需要这个。如果你没有使用过 `Ctrl + ^`，我建议你要习惯于它。哦，你有没有丑陋地输入 `:visual` 进入过 Ex 模式？许多初学者都不知道如何从该模式下退出 Vim。对我来说，这就是打扰，因为我很少使用它。

现在，熟悉 `ctags` 是成功使用 Vim 的一个关键因素。这个工具支持数百种语言，它不小心就为你不想创建标签的文件创建它，因此我建议忽略典型的垃圾目录：

```
# cat ~/.ctags.d/local.ctags
  --recurse=yes
  --exclude=.git
  --exclude=build/
  --exclude=.svn
  --exclude=vendor/*
  --exclude=node_modules/*
  --exclude=public/webpack/*
  --exclude=db/*
  --exclude=log/*
  --exclude=test/*
  --exclude=tests/*
  --exclude=\*.min.\*
  --exclude=\*.swp
  --exclude=\*.bak
  --exclude=\*.pyc
  --exclude=\*.class
  --exclude=\*.cache
```

### Airline 插件

我一定不能忘记 Vim 的 Airline 插件。在 Fedora 的两个插件中，这个插件很轻量级，不需要外部依赖，而且可以开箱即用我所有的字体。你可以定制它，而且还有主题之类的东西。我只是碰巧喜欢它的默认设置。

我必须提到，有两个主要的 Ctags 项目：Exuberant Ctags 和 Universal Ctags。后者是一个更现代的复刻。如果你的发行版有，就用它。如果你在 Fedora 35+ 上，你应该知道你现在用的是 Universal Ctags。

### 总结

作为总结，我的建议是这样的。尽量保持你的 Vim 配置流畅和干净。这将在未来得到回报。在我转换到新配置之后，我不得不重新学习“写入并退出”的命令，因为我总是不小心把它打成 `:Wq`，而我在旧的配置里有一个“小技巧”，让它实际上按我的意思工作。好吧，这个可能真的很有用，并能入选，我希望你能明白我的意思：

```
:command Wq wq
:command WQ wq
```

最后的一个快速技巧是：你可能需要经常改变你的默认 Vim 配置，来找到我在这里向你介绍的和你自己口味之间的舒适区。使用下面的别名，这样你就不需要一直搜索历史。相信我，当一个 Vim 用户在命令历史里搜索 “vim” 时，找不到什么是相关的内容：

```
alias vim-vimrc='vim ~/.vimrc'
```

就是这些了。也许这可以帮助你在没有大量插件的情况下在 Vim 的丰富世界遨游。“简简单单” 的 Vim 也很不错！

要尝试你刚刚读到的内容，请安装软件包并检出这些配置：

```
test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.backup
curl -s https://raw.githubusercontent.com/lzap/vim-lzap/master/.vimrc -o ~/.vimrc
mkdir ~/.vimbackup
```

特别感谢 Marc Deop 和 [Melanie Corr][19] 对本文的审阅。

### 更新

我已经在这种配置下生存下来了！我唯一的纠结是 CtrlP 插件的结果顺序不同。文件的模糊算法与 `fzf.vim` 插件不同，所以我以前用各种搜索词能找到的文件现在找不到了。我最后安装了 Fedora 的 fzf 包以获得更相关的文件搜索，它附带了一个 vim 函数 `FZF`，可以绑定到引导键组合上。请看我的 [GitHub 仓库][20] 中更新后的配置文件。一路走来，我学到了很多东西。有一些键的绑定我已经忘记了，这要感谢许多插件。

这篇文章最初发表在 [作者的网站][21] 上，经许可后重新发表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/vanilla-vim-config

作者：[Lukáš Zapletal][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lzap
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://vimhelp.org/map.txt.html#map-which-keys
[3]: https://vim.fandom.com/wiki/Unused_keys
[4]: https://vimhelp.org/filetype.txt.html
[5]: https://vimhelp.org/syntax.txt.html
[6]: https://vimhelp.org/indent.txt.html
[7]: https://vimhelp.org/usr_05.txt.html#matchit-install
[8]: https://vimhelp.org/recover.txt.html#swap-file
[9]: https://vimhelp.org/pi_netrw.txt.html#netrw-explore
[10]: https://github.com/kien/ctrlp.vim
[11]: https://vimhelp.org/windows.txt.html#buffer-hidden
[12]: https://vimhelp.org/quickfix.txt.html
[13]: https://github.com/tpope/vim-fugitive
[14]: https://vimhelp.org/quickfix.txt.html#grep
[15]: https://vimhelp.org/pattern.txt.html#noh
[16]: https://vimhelp.org/tagsrch.txt.html
[17]: https://ctags.io
[18]: https://vimhelp.org/map.txt.html
[19]: https://opensource.com/users/melanie-corr
[20]: https://github.com/lzap
[21]: https://lukas.zapletalovi.com/2021/11/a-sane-vim-configuration-for-fedora.html
