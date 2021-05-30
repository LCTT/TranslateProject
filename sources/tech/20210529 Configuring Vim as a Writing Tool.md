[#]: subject: (Configuring Vim as a Writing Tool)
[#]: via: (https://news.itsfoss.com/configuring-vim-writing/)
[#]: author: (Theena https://news.itsfoss.com/author/theena/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Configuring Vim as a Writing Tool
======

In my first column I spoke about why I moved [my writing to Vim][1] – away from the standard tools of modern writers such as word processors (MS Word and their open source equivalents), text editors (Notepad since I’ve been a Windows user until last year), and cloud based storage technology. If you are a writer, I urge you to [read that part 1][1] before continuing here.

Essentially, I argued that the more devices you use, the more writing tools you’ll need, the more complex the workflow eventually becomes. This is pertinent because I have four devices, including an Android phone, a main daily driver laptop running Linux, and a couple of older laptops, including a Mac, I take when I go outdoors for shoots.

Vim was the perfect solution for me, and how I work; while I won’t argue that my new workflow is the best way for writers to work in the modern world, I will argue that it is important for writers to have a tool that works across all our devices, and is powerful enough to meet the needs for the different kinds of writing that we writers engage in everyday.

Vim’s main benefit from this perspective, therefore, is that it is cross-platform – no matter what device you are on, Vim will work. I won’t speak extensively about using Vim in the Apple ecosystem, but a cursory glance at the reviews for [this app][2] tells me that somewhere someone needs Vim no matter what device they are using.

Now let’s say you are a writer who wants to start using Vim. Where do you start once you’ve installed it?

This part of the article isn’t necessarily a tutorial but a series of recommendations, including an examination of a .vimrc configuration file for prose writing. Wherever possible I will link to the respective YouTube tutorial that I learnt from.

Linux users already have Vim pre-installed – launch it via the terminal emulator of choice. For Windows and Mac users, you can download it from the [official site][3].

### Recommendations

**Post Vim Installation/Launch**

  * Open Vim Tutor via terminal. (Mac users can launch it this way, while Windows users can launch it using this method. You will not be using Vim to do any writing during this phase – instead you will spend 15 minutes everyday doing the Vim Tutorial. Don’t spend a minute longer or shorter; see how much progress you can make inside the tutorial within the allotted 15 minutes. You will find that every day, you progress that much deeper into the tutorial. Inside a month, you should be able to complete the entire tutorial within those 15 minutes.
  * Becoming a better typist has immense benefits for Vim usage. This is optional, but I am relearning to type from scratch and it is having the side effect of making Vim even more useful. I began spending 15 minutes everyday on this site as a warm up before I went into the Vim Tutorial.



I allocated 30 minutes at the start of every day for both these exercises to warm up, and 30 minutes every evening to cool down before I went to bed. This may have contributed to my quick transition from my old tool kit to Vim, but your mileage may vary.

Once again, let me stress that the above steps _**other than Vim Tutor**_ is optional; it all depends on your individual motivation levels.

We now come to the meat of this article: How do you configure Vim to be writer-friendly?

### How to configure .vimrc for writing

_Before I begin, I’d like to remind readers here that I am not a tech person – I am a novelist – and that any errors you see in the below are my own; I would love for feedback from experienced Vim users on how to refine my configuration file even further._

Below is my .vimrc file. You can clone mine from my [GitHub][4] and refine it further.

```
syntax on

set noerrorbells "This removes vim's default error bell, turning it off so that it doesn't annoy us
set textwidth=100 "Ensures that each line is not longer than 100 columns
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

" The next two settings ensure that line breaks and wrap work how writers, not
" coders, prefer it

set wrap
nnoremap <F5> :set linebreak<CR>
nnoremap <C-F5> :set nolinebreak<CR>


call plug#begin('~/.vim/plugged')

"   This is for color themes

Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'

"   This is a selection of plugins to make prose writing easier.

Plug 'dpelle/vim-LanguageTool'
Plug 'ron89/thesaurus_query.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'


" This section are nice-to-haves for easier integration with machine, using vim-airline and such.

Plug 'vim-airline/vim-airline'

"This section deals with workspace and session management

Plug 'thaerkh/vim-workspace'

"Related to above, the following code saves all session files in a single directory outside your
"workspace

let g:workspace_session_directory = $HOME . '/.vim/sessions/'


"Related to above, this is a activity tracker for vim

Plug 'wakatime/vim-wakatime'

" A disturbance in the force: we are using some emacs functionality here, org-mode specifically

Plug 'jceb/vim-orgmode'



"  This is for language-specific plugins

Plug 'plasticboy/vim-markdown'


 call plug#end()

colorscheme pacific
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif
```

Learn how to install Vim Plugin. This tutorial helped me. I use Vim Plugged because it was the simplest and most elegant in my view.

![][5]

#### .vimrc housekeeping for writers

  * `syntax on` : this ensures that vim acknowledges what syntax I am using. I primarily use markdown for most note-taking and writing articles such as this one; while plain-text is my preferred method when working on my fiction.
  * `set noerrorbells` : for the sake of your sanity, I highly recommend turning this on
  * `set textwidth=100` : For ease of reading because no one wants to be horizontal scrolling a text document
  * `set spell“
  * `set wrap` : ensures text wraps like how writers, not coders, would want it. You will notice that I haven’t spent much time discussing some of the other basic configuration, but I don’t feel those are salient for writers. I do some hobbyist coding so my .vimrc is a reflection of that. If all you want to do is to write on Vim, then the above configuration ought to get you started.



From that point, your .vimrc is a living document of what you want to do with Vim, and how you want Vim to do that for you.

#### A note on plug-ins

Plug-ins are specified between lines 43-98. Assuming you’ve followed the tutorial on how to install vim plug-ins, I highly recommend the following vim writing-specific plug-ins to get started:

  * `vim-LanguageTool`
  * `thesaurus_query.vim`
  * `vim-pencil`
  * `vim-wordy`
  * `vim-goyo`
  * `vim-markdown`



#### Conclusion

In this article, we gently introduced how writers can get started on vim, including a basic primer on configuring .vimrc for writing. In addition to mine, I am going to link here to the .vimrc of other writers that I found on GitHub, and have used as inspiration for my own.

![][6]

Remember that this is just a starter kit of a .vimrc for writers. As your needs evolve, you will find that Vim can evolve with it. Therefore, learning to configure your .vimrc is worth investing some time in.

In the next article, I will be examining specifics of my writing workflow, using Vim and Git and GitHub.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/configuring-vim-writing/

作者：[Theena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/theena/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/how-i-started-loving-vim/
[2]: https://apps.apple.com/us/app/ivim/id1266544660
[3]: https://www.vim.org/
[4]: https://github.com/MiragianCycle/dotfiles
[5]: https://i1.wp.com/i.ytimg.com/vi/n9k9scbTuvQ/hqdefault.jpg?w=780&ssl=1
[6]: https://i2.wp.com/i.ytimg.com/vi/Pq3JMp3stxQ/hqdefault.jpg?w=780&ssl=1
