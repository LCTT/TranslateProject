Vim is your new IDE
================================================================================
**Kill all the GUIs. Mouse is your enemy. Keyboard is your only friend.**

What happens when you combine Vim with the terminal multiplexer Tmux? You have the perfect coding environment. Here are some recommendations I've collected in the past years. Now I can happily fire up my working environment running Vim, some local servers and tests, in no time.

### Programming Tmux ###

- [Tmux Crash Course][1] is nice introduction on how to start using Tmux.
- [My tmux.conf dotfile][2] has a customized statusbar and an improved color scheme to optimize readability. And a must have: **remap the prefix** from `Ctrl+b` to `Ctrl+a`.
- [Bootstrap your IDE][3] is as easy as writing a simple bash script. This is an example on how you can write a `.sh` file to run own environment programmatically.

### Vim Plugins ###

- [Vundle][4], the plugin manager for Vim, allows you to keep track of all your plugins in your `.vimrc`. Install, update and delete all your script with a single keystroke. Uh, did I tell you that you can also **search** for plugins directly from VIM? This extension is a must have.
- [Syntastic][5] checks that your syntax is correct. It's an indispensable tool to avoid stupid errors while writing code. It really **speeds up** your coding.
- [Supertab][6] Supertab is a vim plugin which allows you to use `<Tab>` for all your insert completion needs. It searches for all the strings in the current context, and suggests to the user all the matching ones. Speed is not the only benefit from the plugin, it helps avoiding a lot of misspelled names when writing code. Check out the section **User contribution** in this list for an alternative to `Supertab`.
- [Ack][7] is a replacement for 99% of the uses of grep. It's nicely integrated with Vim so the user can search through his/her project files, and the results are shown in a split window. Check out the section **User contribution** in this list for an alternative to `Ack`.
- [CtrlP][8] is an extremely fast full path fuzzy file, buffer, mru, tag... finder for Vim. Written in `VimL`.
- [NERDTree][9] allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard. It also allows you to perform simple filesystem operations.
- [Sparkup][10] lets you write HTML code faster. Write HTML in a **CSS-like syntax**, and let Sparkup handle the **expansion to full HTML** code. Check out the section **User contribution** in this list for an alternative to `Sparkup`.

### Extra tips ###

- [Vimux][11] allows you to interact with Tmux from Vim. Run tests, build scripts and tasks without leaving Vim.
- [Auto installing Vundle][12] adding some lines of `VimL` to `.vimrc` config file. Every time you run Vim from a new environment, it will install Vundle and all the related Bundles. This is extremely useful when you are copying your Vim config file to a fresh installation, or to a new server.
- [A success story][13] of a developer who said goodbye to his trusty **MacBook Pro** and started coding on an iPad + Linode, in da cloud.

### Users contribution ###

- [YouCompleteMe][14], suggested by the nice redditor hnasarat. It take some extra effort to install, but provides an incredibly powerful semantic completions for many language (C, Ruby, Python, PHP and more).
- [Ag][15], suggested by *gckjk* (Reddit knows it better!). It's `ack` on steroids. 3 to 5 times faster, it ignores file patterns from your `.gitignore` and `.hgignore` (even `.agignore` if you have special needs).
- [Emmet][16], suggested by *damnated*, another nice redditor. An alternative to `Sparkup`, but with a nice plus, it's super easy and fast to wrap strings with tags. Check out the video for an example.
- [Unite][17], suggested by basetta, is an alternative to some of the plugins I listed. You can do file searching (like `CtrlP`), content searching (using `ack` or `ag`), move around the yank history and switch between buffers. All integrated in a single plugin.

--------------------------------------------------------------------------------

via: http://devcharm.com/pages/18-vim-is-your-new-ide

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://robots.thoughtbot.com/a-tmux-crash-course
[2]:https://github.com/vrde/dotfiles/blob/master/.tmux.conf
[3]:https://gist.github.com/vrde/7398199
[4]:https://github.com/gmarik/vundle
[5]:https://github.com/scrooloose/syntastic
[6]:https://github.com/ervandew/supertab
[7]:https://github.com/mileszs/ack.vim
[8]:http://kien.github.io/ctrlp.vim/
[9]:https://github.com/scrooloose/nerdtree
[10]:https://github.com/rstacruz/sparkup
[11]:https://github.com/benmills/vimux
[12]:http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
[13]:http://www.linuxjournal.com/content/swap-your-laptop-ipad-linode
[14]:https://github.com/Valloric/YouCompleteMe
[15]:https://github.com/ggreer/the_silver_searcher
[16]:http://mattn.github.io/emmet-vim/
[17]:https://github.com/Shougo/unite.vim