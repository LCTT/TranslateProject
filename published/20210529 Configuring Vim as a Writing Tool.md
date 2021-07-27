[#]: subject: (Configuring Vim as a Writing Tool)
[#]: via: (https://news.itsfoss.com/configuring-vim-writing/)
[#]: author: (Theena https://news.itsfoss.com/author/theena/)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13607-1.html)

将 Vim 配置成一个写作工具
======

> 我使用 Vim 来写小说。我是这样配置它的。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/05/Setting-Up-Vim-for-Writing.jpg?w=1200&ssl=1)

在我的第一个专栏中，我谈到了我为什么把 [我的写作工作迁移到了 Vim 上][1] —— 远离了现代写作者们的标准工具，如文字处理器（MS Word 及它的开源替代方案）、文本编辑器（记事本，因为直到去年我一直是 Windows 用户）和云存储技术。如果你是一个写作者，在继续下面的内容前，我建议你先阅读一下 [那篇文章的第一部分][1] 。

基本上可以说，你使用的设备越多，你需要的写作工具就越多，最终你的工作流程就越复杂。这一点对我来说是很贴切的，因为我有四台设备，包括一部安卓手机，一台日常用的运行 Linux 的主力笔记本电脑，还有两台旧的笔记本电脑，其中一台是 Mac，我去户外拍摄时会带着它。

Vim 对于我和我的工作方式来说是一个完美的解决方案；虽然我不会说我的新的工作流程是现代写作者工作的最佳方式，但我可以说的是，对于写作者来说，拥有一个能在我们所有设备上工作的工具非常重要的，并且这个工具要足够强大以满足我们写作者每天从事的不同类型的写作需求。

从这个角度来看，Vim 的主要优势是它是跨平台的 —— 无论在什么设备上，Vim 都能工作。在苹果生态系统中使用 Vim 的情况我就不细说了，但粗略地看一下 [这个应用程序][2] 的评论，我就会知道，总会有人在各种地方使用 Vim，不管他们使用的是什么设备。

现在我们假设你是一个想开始使用 Vim 的写作者。当你安装了它，你该从哪里开始呢？

我在这一部分给你的并不算是教程，而是一系列的建议，包含对一个用于诗歌写作的 `.vimrc` 配置文件的解读。只要有可能，我就会链接到我学习相应内容时用到的 YouTube 上的教程。

对于 Linux 用户来说，系统已经预装了 Vim —— 通过你喜欢的终端模拟器就可以启动它。对于 Windows 和 Mac 用户，你可以从 [Vim 官方网站][3] 下载它。

### 建议

**安装/启用 Vim 后**

  * 通过终端打开 Vim Tutor。（Mac 用户可以用这种方式启动，而 Windows 用户也可以用这种方法启动。[LCTT 译注：原文这里本应该有链接，可能作者忘记添加了。无论如何，在终端中， Linux 中的命令是 `vimtutor`，Windows 在安装目录下找到 `vimtutor.bat` 命令并运行；Mac？应该与 Linux 一样？我没 Mac 呀！]）在这个阶段，你不会使用 Vim 进行任何写作 —— 相反，你要每天花 15 分钟做 Vim 教程。不要多花一分钟或少花一分钟；看看在规定的 15 分钟内，你能在教程中取得多大的进展。你会发现，每天你都会在教程中取得更大的进步。在一个月内，你应该能够利用这些 15 分钟完成整个教程。
  * 成为一个更好的打字员对 Vim 的使用来说有极大的好处。这不是必须的，但我正在重新学习打字，它的副作用是使 Vim 变得更加有用了。我每次都以花 15 分钟练习打字开始，作为进入 Vim 教程前的热身。

在每一天的开始，我分配了 30 分钟的时间做这两项练习进行热身，而每天晚上睡觉前再分配 30 分钟进行练习以让我安定下来。这样的做法帮我快速从旧的工具包过渡到了 Vim，但你的安排可能有所不同。

我再次强调，**除了 Vim Tutor 之外**，上述步骤都是可选的；这完全取决于你个人的动机水平。

现在我们来到了这篇文章的重点：如何配置 Vim ，使它对写作者友好？

### 如何配置用于写作的 .vimrc

在开始之前，我想在这里提醒各位读者，我不是一个技术人员 —— 我是一个小说家 —— 你在下面看到的任何错误都是我自己的；我希望有经验的 Vim 用户能提供反馈，告诉我如何进一步完善我的配置文件。

下面是我的 `.vimrc` 文件。你可以从我的 [GitHub][4] 上下载，并进一步完善它：

```
syntax on

set noerrorbells " 取消 Vim 的错误警告铃声，关闭它以免打扰到我们
set textwidth=100 " 确保每一行不超过 100 字符
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set linebreak
set number
set showmatch
set showbreak=+++
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set spell
set showmatch
set confirm
set ruler
set autochdir
set autowriteall
set undolevels=1000
set backspace=indent,eol,start

" 下面的设置确保按写作者而不是程序员喜欢的方式折行

set wrap
nnoremap <F5> :set linebreak<CR>
nnoremap <C-F5> :set nolinebreak<CR>


call plug#begin('~/.vim/plugged')

"   这是颜色风格插件

Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'

"   这是为了更容易的诗歌写作选择的一些插件

Plug 'dpelle/vim-LanguageTool'
Plug 'ron89/thesaurus_query.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'


"   这一部分是为了更容易地与机器集成，用了 vim-airline 这类插件

Plug 'vim-airline/vim-airline'

"   这一部分外理工作区和会话管理

Plug 'thaerkh/vim-workspace'

"   与上面插件相关, 下面的代码将你的所有的会话文件保存到一个你工作区之外的目录

let g:workspace_session_directory = $HOME . '/.vim/sessions/'


"   与上面插件相关，这是一个 Vim 活动的跟踪器

Plug 'wakatime/vim-wakatime'

"   一个干扰因素：我在这里使用了一些 Emacs 的功能，特别是 org-mode 

Plug 'jceb/vim-orgmode'


"  这是文件格式相关插件

Plug 'plasticboy/vim-markdown'


call plug#end()

colorscheme pacific
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif
```

学习如何安装 Vim 插件时，这个[教程](https://www.youtube.com/watch?v=n9k9scbTuvQ)帮助了我。我使用 Vim Plugged 插件管理器是因为在我看来它是最简单、最优雅的。

![][5]

#### 对于写作者的 .vimrc 选项的整理

  * `syntax on`：这可以确保 Vim 知道我在使用什么语法。做笔记、写这种文章时我主要使用 Markdown；而在写小说的时候，纯文本是我的首选格式。
  * `set noerrorbells`：为了你的精神状态，我强烈建议打开这个选项。
  * `set textwidth=100`：为了便于阅读，没有人愿意横向滚动一个文本文件。
  * `set spell`：如果有拼写错误的话提醒你。
  * `set wrap`：确保文本以写作者而不是程序员的方式进行折行。

你会注意到，我没有花更多时间讨论其他一些基本配置选项，因为我并不觉得那些对写作者来说有多重要。因为我做一些业余的编码工作，所以我的 `.vimrc` 配置反映了这一点。如果你只想在 Vim 上写作，那么上述配置就应该能让你顺利开始。

从这点上来说，你的 `.vimrc` 是一个活的文档，它能生动地反映你想用 Vim 做什么，以及你希望 Vim 如何为你做这些事情。

#### 关于插件的说明

第 43-98 行之间是我对插件的配置。如果你已经学习了关于如何安装 Vim 插件的教程，我强烈推荐你从以下专为写作开发的 Vim 插件开始：

  * `vim-LanguageTool`
  * `thesaurus_query.vim`
  * `vim-pencil`
  * `vim-wordy`
  * `vim-goyo`
  * `vim-markdown`

#### 总结

在这篇文章中，我们简单地[介绍](https://youtu.be/Pq3JMp3stxQ)了写作者可以怎样开始使用 Vim，以及一个在写作工作中需要的 `.vimrc` 入门配置。除了我的 `.vimrc` 之外，我还将在这里链接到我在 GitHub 上发现的其他写作者的 `.vimrc`，它们是我自己配置时的灵感来源。

![][6]

请劳记，这只是一个写作者的 `.vimrc` 的入门配置。你会发现，随着你的需求的发展，Vim 也可以随之发展。因此，投入一些时间学习配置你的 `.vimrc` 是值得的。

在下一篇文章中，我将会检视我在写作时的工作流程的具体细节，这个工作流程中我使用了 Vim 和 Git 及 GitHub。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/configuring-vim-writing/

作者：[Theena][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/theena/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/how-i-started-loving-vim/
[2]: https://apps.apple.com/us/app/ivim/id1266544660
[3]: https://www.vim.org/
[4]: https://github.com/MiragianCycle/dotfiles
[5]: https://i1.wp.com/i.ytimg.com/vi/n9k9scbTuvQ/hqdefault.jpg?w=780&ssl=1
[6]: https://i2.wp.com/i.ytimg.com/vi/Pq3JMp3stxQ/hqdefault.jpg?w=780&ssl=1
