[#]: subject: "Vanilla Vim is fun"
[#]: via: "https://opensource.com/article/21/12/vanilla-vim-config"
[#]: author: "Lukáš Zapletal https://opensource.com/users/lzap"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Vanilla Vim is fun
======
Here's how I dropped from 35 Vim plugins to just six.
![Person drinking a hot drink at the computer][1]

When you start Vim with the `--clean` option, it shows up in "vanilla" mode. No plugins, no configuration, just back to the roots. I have collected a ton of configuration statements over the years, some of them dating from MS-DOS or Windows 3.1. Here is the deal: I will start from scratch to find a good starting-point configuration with just the plugins available in Fedora 35. Will I survive a week of coding? I'll find out!

Here are the rules: Minimum possible configuration statements and only plugins which ship with Fedora 35+. By the way, if you are not a Fedora user, continue reading. You can always install these plugins from your OS package manager manually or using a Vim plugin manager.

Before I start, there's the elephant in the room: Vim or Neovim (fork of Vim) question. Well, this is up to you. Everything that is in this article should work for both. However, I only tested with Vim. All the skills will come in handy when you log on to a server where only `vi` is available. It can be either an old UNIX system, a Linux server with minimum software installed for better security, an interactive shell in a container, or an embedded system where space is precious.

Without further ado, here is what I distilled to the absolute bare minimum to be effective with Vim for coding:


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

Do not worry about the `--allowerasing` option. Just review the installation transaction before confirming. This option is there to tell the package manager to replace the existing package `nano-default-editor` with `vim-default-editor`. It is a small package that drops shell configuration files to set the EDITOR environment variable to `vim`, and this is a must-have if you want to use Vim (for example, with git). This is a special thing for Fedora. You will not need to do this on other distributions or OSes—just make sure your EDITOR shell variable is correctly set.

### Overview

A quick overview of what I consider a good and clean plugin set:

  * **CtrlP**: Smallest possible fuzzy-finder plugin (pure vimscript)
  * **Fugitive**: A must-have tool for git
  * **Trailing-whitespace**: Shows and fixes, well, trailing whitespace
  * **Airline**: An improved status line (pure vimscript)
  * **Ale**: Highlights typos or syntax errors as you type
  * **Ctags**: Not a Vim plugin but a very much needed tool



There are other fuzzy-finder plugins like command-t or my favorite (very fast) `fzf.vim`. The thing is, `fzf.vim` is not in Fedora, and I want the smallest possible configuration. CtrlP will do just fine, and it is much easier to configure as it requires nothing.

If I were to choose an absolute minimum configuration it would be:


```


# cat ~/.vimrc
let mapleader=","
let maplocalleader="_"
filetype plugin indent on
let g:ctrlp_map = '&lt;leader&gt;&lt;leader&gt;'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set exrc
set secure

```

But that is probably too extreme, so here is a slightly bigger configuration with my detailed explanation below:


```


" vim: nowrap sw=2 sts=2 ts=2 et:

" leaders
let mapleader=","
let maplocalleader="_"

" filetype and intent
filetype plugin indent on

" incompatible plugins
if has('syntax') &amp;&amp; has('eval')
  packadd! matchit
end

" be SSD friendly (can be dangerous!)
"set directory=/tmp

" move backups away from projects
set backupdir=~/.vimbackup

" fuzzy searching
let g:ctrlp_map = '&lt;leader&gt;&lt;leader&gt;'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap &lt;leader&gt;b :CtrlPBuffer&lt;cr&gt;
nnoremap &lt;leader&gt;t :CtrlPTag&lt;cr&gt;
nnoremap &lt;leader&gt;f :CtrlPBufTag&lt;cr&gt;
nnoremap &lt;leader&gt;q :CtrlPQuickfix&lt;cr&gt;
nnoremap &lt;leader&gt;m :CtrlPMRU&lt;cr&gt;

" buffers and quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap &lt;leader&gt;w :call ToggleQuickFix()&lt;cr&gt;
nnoremap &lt;leader&gt;d :bd&lt;cr&gt;

" searching ang grepping
nnoremap &lt;leader&gt;g :copen&lt;cr&gt;:Ggrep!&lt;SPACE&gt;
nnoremap K :Ggrep "\b&lt;C-R&gt;&lt;C-W&gt;\b"&lt;cr&gt;:cw&lt;cr&gt;
nnoremap &lt;leader&gt;s :set hlsearch! hlsearch?&lt;cr&gt;

" ctags generation
nnoremap &lt;leader&gt;c :!ctags -R .&lt;cr&gt;&lt;cr&gt;

" per-project configs
set exrc
set secure

```

### Using a comma for leader key

I like having my leader key mapped to a comma instead of the default backslash. It is the closest free key in Vim when your hands are in writing position. Also, this key is the same in most keyboard layouts while `\` varies per model or layout. I rarely use a local leader but underscore looks like a good fit.

Further reading:

  * See `:help map-which-keys` in the [Vim Reference Manual][2]
  * See the unused keys in Vim on the [Vim Tips Wiki][3]



### Filetype and syntax off

Next up is the very important `filetype` command. See, Vim comes with "batteries included," version 8.2 contains syntax highlighting for 644 languages, 251 filetype definitions (`ftplugins`), and indentation rules for 138 languages. However, indentation is not enabled by default, perhaps to deliver a consistent editing experience for all. I like to enable it.

A quick tip: If you are editing a very large file and Vim feels slow, you may want to disable syntax highlighting to speed things up. Just the type `:syn off` command.

Further reading:

  * See `:help filetype` in the [Vim Reference Manual][4]
  * See `:help syntax` in the [Vim Reference Manual][5]
  * See `:help indent` in the [Vim Reference Manual][6]



### Matchit plugin

Vim even comes with some extra plugins, which makes some features incompatible, one of these is quite useful. It is the `matchit` plugin that makes `%` key find matching parens to work with some languages. Typically, you can find the beginning or end of a block (begin and end) or HTML matching tags and similar.

Further reading:

  * See `:help matchit` in the [Vim Reference Manual][7]



### Swap file

One of the many settings I want to keep from my old config is using `/tmp` for swap and creating backups in a separate directory in my home, which you need to create with `mkdir ~/.vimbackup`. It is important to understand that Vim creates a copy called "swap file" when you start editing, and all the unsaved work gets saved in this file. So even if there is a power outage, your swap contains most of the unsaved work. I prefer using `tmpfs` as all my laptops and servers are protected with UPS, and I save often. Also, most of the time, you use swap files when your SSH connection is lost rather than due to a power outage. Swap files can be quite big for large files and I value my SSD, so I am making the decision here. If you are unsure, remove this statement to use `/var/tmp`, which is safer.

Further reading:

  * See `:help swap-file` in the [Vim Reference Manual][8]



### Fuzzy-finder plugin

Now, the fuzzy finder is a plugin I cannot live without. Opening files using commands like `:Ex` or `:e` or `:tabe` is okay on a server when you need to open like 20 files a day. When coding, I usually need to open hundreds of them. As I said, CtrlP does the job nicely. It is small, with no dependencies—pure Vim. It opens with the **Ctrl**+**P** combination, which is a bit weird to me. I know that some famous editors use it (VSCode, I think). The thing is, these are already important Vim keybindings that I do not want to override. So the winner for me is **leader**+**leader** (comma pressed twice).

The `ctrlp_user_command` just changes how CtrlP is getting the file list. Instead of the built-in recursive file lister (glob) it uses `git ls-files` which is usually better as it ignores things from `.gitignore`, so things like `node_modules` or other irrelevant directories that can slow down the listing are not in the way.

**Leader**+**B**/**T**/**F**/**Q**/**M** to open a list of buffers, tags, tags from the current file, quick fix buffer, and most recently used files is very useful. Specifically, once you generated a `taglist` with `ctags`, this is essentially "Go To Definition" for hundreds of programming languages—no plugins needed! This is all built-in in Vim. Now to put things straight, when I type **leader**+**B**, it means pressing comma and then pressing **B** key, not together like with **Control** or **Shift**.

Further reading:

  * See `:help Explore` in the [Vim Reference Manual][9]
  * See the [ctrlp.vim GitHub][10]



### Buffer management

Although Vim supports tabs these days, buffer management is an important skill for mastering Vim. I usually end up with too many buffers and I need to do `:bdelete` way too often. Well, **leader**+**D** seems like a good option to do that faster. I also like to close the Quickfix window, so there is the **leader**+**W** combination for that too. I use this very often when browsing search results.

Further reading:

  * See `:help buffer-hidden` in the [Vim Reference Manual][11]



### Ggrep and the fugitive plugin

Speaking about searching, it is as important as opening files. I want to be able to grep the codebase. For that, there is the awesome `:Ggrep` command from the fugitive plugin, which uses git grep, which ignores junk files and only searches what's in git. Since **Shift**+**K** is a free key in Vim, it is a great fit for automatically grepping the term under the cursor. And finally, being able to enter arbitrary search patterns using **leader**+**G** is also nice. Note this opens a window called the Quickfix window where you can navigate the results, go to next occurrence, previous, last, first, and more. The same window is used for output from compilators or other tools, so get familiar with it. I suggest further reading in the documentation if this is new to you.

Further reading:

  * See `:help quickfix` in the [Vim Reference Manual][12]
  * See the [vim-fugitive GitHub][13]



### Searching and grepping with fugitive

By the way, searching with `/` key is smart and sensitive, meaning if all characters are lower case, Vim searches ignoring case. By default, it highlights results, and I think I typed `:noh` (turn of highlighting) about a million times. That's why I have **leader**+**S** to toggle this. I suggest reading more about searching in the manual later on too.

Searching and grepping are next. The fugitive plugin has you covered. Use the command `:Ggrep pattern` to do a git grep, and results will go into the Quickfix window. Then simply navigate through the results using quick fix commands (`:cn`, `:cp`, and such) or simply use `:CtrlPQuickfix` (or **leader**+**Q**) to scroll them visually. What is cool about the CtrlP quick fix integration is that you can further search the results by typing to match filenames or content if it makes sense—searching the search results.

Further reading:

  * See `:help grep` in the [Vim Reference Manual][14]
  * See `:help noh` in the [Vim Reference Manual][15]
  * See the [vim-fugitive GitHub][13]



### Ctags

**Leader**+**C** to generate a `ctags` file for better navigation is useful when dealing with a new codebase or doing a longer coding session with lots of jumps around. Ctags supports hundreds of languages, and Vim can use all this knowledge to navigate it. More about how to configure it later. Note I already discussed **leader**+**T** to open fuzzy search for all tags, remember? It is the very same thing.

Further reading:

  * See `:help ctags` in the [Vim Reference Manual][16]
  * See the [Universal Ctags website][17]



### Key mapping

Being able to override any other setting in projects by creating a `.vimrc` file in a project directory is a good idea. Just put it in the (global) `.gitignore` to ensure you don't need to edit thousands of git ignore files in each project. Such a project `.vimrc` could be something like (for C/C++ project with GNU Makefile):


```


" coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" include and autocomplete path
let &amp;path.="/usr/local/include"
" function keys to build and run the project
nnoremap &lt;F9&gt; :wall!&lt;cr&gt;:make!&lt;cr&gt;&lt;cr&gt;
nnoremap &lt;F10&gt; :!LD_LIBRARY_PATH=/usr/local/lib ./project&lt;cr&gt;&lt;cr&gt;

```

As you can see, I typically map **F2**-**F10** keys to compile, run, test, and similar actions. Using **F9** for calling `make` sounds about right. Remember the blue Borland IDE from MS-DOS?

As mentioned earlier, it is a good idea to ignore both `.vimrc` and `tags` (generated by `ctags`) globally so there is no need to update every each `.gitignore`:


```


# git config --global core.excludesfile ~/.gitignore
# cat ~/.gitignore
/.vimrc
/tags
/TAGS

```

A few more statements in my personal config are only relevant for those with non-US keyboard layouts (I am on Czech). I need to use dead keys for many characters, and it is simply not possible, and I'd rather type the command instead of doing those hard-to-reach combinations. Here is a solution to the problem:


```


" CTRL-] is hard on my keyboard layout
map &lt;C-K&gt; &lt;C-]&gt;
" CTRL-^ is hard on my keyboard layout
nnoremap &lt;F1&gt; :b#&lt;cr&gt;
nnoremap &lt;F2&gt; :bp&lt;cr&gt;
nnoremap &lt;F3&gt; :bn&lt;cr&gt;
" I hate entering Ex mode by accident
map Q &lt;Nop&gt;

```

Further reading:

  * See `:help map` in the [Vim Reference Manual][18]



Function keys are all free in Vim, except **F1**, which is bound to help. I don't need help, not that I would already know everything about Vim. Not at all. But I can simply type `:help` if needed. And **F1** is a crucial key, so close to the **Esc** key. I like to use buffer swapping (`:b#`) for that and **F2**-**F3** for next/previous. The more you work with buffers, the more you will need this. If you haven't used **Ctrl**+**^**, I suggest getting used to it. Oh, have you ever entered the Ex mode with the ugly type `:visual`? Many beginners had no idea how to quit Vim from that mode. For me, it is just disturbing as I rarely use it.

Now, getting familiar with `ctags` is a key thing to be successful with Vim. This tool supports hundreds of languages and it can easily create tags for files you do not want to create, therefore I suggest ignoring typical junk directories:


```


# cat ~/.ctags.d/local.ctags
\--recurse=yes
\--exclude=.git
\--exclude=build/
\--exclude=.svn
\--exclude=vendor/*
\--exclude=node_modules/*
\--exclude=public/webpack/*
\--exclude=db/*
\--exclude=log/*
\--exclude=test/*
\--exclude=tests/*
\--exclude=\\*.min.\\*
\--exclude=\\*.swp
\--exclude=\\*.bak
\--exclude=\\*.pyc
\--exclude=\\*.class
\--exclude=\\*.cache

```

### Airline plugin

I must not forget about the Vim airline plugin. Out of the two in Fedora, this one is light, no external dependencies are needed, and it works out of the box with all my fonts. You can customize it, and there are themes and such things. I just happen to like the default setting.

I must mention that there are two main `ctag` projects: Exuberant Ctags and Universal Ctags. The latter is a more modern fork. If your distribution has it, use that. If you are on Fedora 35+, you need to know that you are now on Universal Ctags.

### Wrap up

As I wrap it up, here is what I suggest. Try to keep your Vim configuration slick and clean. It will pay off in the future. After I switched, I had to re-learn the "write and quit" commands because I was typing it as `:Wq` accidentally all the time, and I had a "hack" in the old configuration that actually did what I meant. Okay, this one might be actually useful and make the cut—I hope you get what I mean:


```


:command Wq wq
:command WQ wq

```

Here is a final quick tip: You may need to change your default Vim configuration a lot while finding the sweet spot of what I presented you here and your own taste. Use the following alias, so you don't need to search the history all the time. Trust me, when a Vim user searches history for "vim," nothing is relevant:


```
`alias vim-vimrc='vim ~/.vimrc'`
```

There you have it. Maybe this can help you navigate through the rich world of Vim without a ton of plugins. _Vanilla_ Vim is fun!

To try out what you just read, install the packages and check out the config:


```


test -f ~/.vimrc &amp;&amp; mv ~/.vimrc ~/.vimrc.backup
curl -s <https://raw.githubusercontent.com/lzap/vim-lzap/master/.vimrc> -o ~/.vimrc
mkdir ~/.vimbackup

```

Special thanks to Marc Deop and [Melanie Corr][19] for reviewing this article.

* * *

**Update:**

I've survived! The only struggle I had was the different order of results from the CtrlP plugin. The fuzzy algorithm for files is different from the `fzf.vim` plugin, so files that I used to find using various search terms do not work now. I ended up installing the fzf package from Fedora, which ships with a vim function FZF that can be bound to the leader combination for a more relevant file search. See the updated configuration file in my [GitHub repository][20]. I've learned a lot along the way. There are keybinding which I've already forgotten thanks to many plugins.

* * *

_This article originally appeared on the [author's website][21] and is republished with permission._

Vim offers great benefits to writers, regardless of whether they are technically minded or not.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/vanilla-vim-config

作者：[Lukáš Zapletal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
