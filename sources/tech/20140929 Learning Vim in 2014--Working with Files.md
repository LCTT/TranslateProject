Translating by haimingfg

Learning Vim in 2014: Working with Files
================================================================================
As a software developer, you shouldn't have to spend time thinking about how to get to the code you want to edit. One of the messiest parts of my transition to using Vim full time was its way of dealing with files. Coming to Vim after primarily using Eclipse and Sublime Text, it frustrated me that Vim doesn't bundle a persistent file system viewer, and the built-in ways of opening and switching files always felt extremely painful.

At this point I appreciate the depth of Vim's file management features. I've put together a system that works for me even better than more visual editors once did. Because it's purely keyboard based, it allows me to move through my code much faster. That took some time though, and involves several plugins. But the first step was me understanding Vim's built in options for dealing with files. This post will be looking at the most important structures Vim provides you for file management, with a quick peek at some of the more advanced features you can get through plugins.

### The Basics: Opening a new file ###

One of the biggest obstacles to learning Vim is its lack of visual affordances. Unlike modern GUI based editors, there is no obvious way to do anything when you open a new instance of Vim in the terminal. Everything is done through keyboard commands, and while that ends up being more efficient for experienced users, new Vim users will find themselves looking up even basic commands routinely. So lets start with the basics.

The command to open a new file in Vim is **:e <filename>. :e** opens up a new buffer with the contents of the file inside. If the file doesn't exist yet it opens up an empty buffer and will write to the file location you specify once you make changes and save. Buffers are Vim's term for a "block of text stored in memory". That text can be associated with an existing file or not, but there will be one buffer for each file you have open.

After you open a file and make changes, you can save the contents of the buffer back to the file with the write command **:w**. If the buffer is not yet associated with a file or you want to save to a different location, you can save to a specific file with **:w <filename>**. You may need to add a ! and use **:w! <filename>** if you're overwriting an existing file. 

This is the survival level knowledge for dealing with Vim files. Plenty of developers get by with just these commands, and its technically all you need. But Vim offers a lot more for those who dig a bit deeper.

### Buffer Management ###

Moving beyond the basics, let's talk some more about buffers. Vim handles open files a bit differently than other editors. Rather than leaving all open files visible as tabs, or only allowing you to have one file open at a time, Vim allows you to have multiple buffers open. Some of these may be visible while others are not. You can view a list of all open buffers at any time with **:ls**. This shows each open buffer, along with their buffer number. You can then switch to a specific buffer with the **:b <buffer-number>** command, or move in order along the list with the **:bnext** and **:bprevious** commands. (these can be shortened to **:bn** and **:bp** respectively). 

While these commands are the fundamental Vim solutions for managing buffers, I've found that they don't map well to my own way of thinking about files. I don't want to care about the order of buffers, I just want to go to the file I'm thinking about, or maybe to the file I was just in before the current one. So while its important to understand Vim's underlying buffer model, I wouldn't necessarily recommend its builtin commands as your main file management strategy. There are more powerful options available.

![](http://benmccormick.org/content/images/2014/Jul/skitch.jpeg)

### Splits ###

One of the best parts of managing files in Vim is its splits. With Vim, you can split your current window into 2 windows at any time, and then resize and arrange them into any configuration you like. Its not unusual for me to have 6 files open at a given time, each with its own small split of the window.

You can open a new split with **:sp <filename>** or **:vs <filename>**, for horizontal and vertical splits respectively. There are keyword commands you can use to then resize the windows the way you want them, but to be honest this is the one Vim task I prefer to do with my mouse. A mouse gives me more precision without having to guess the number of columns I want or fiddle back and forth between 2 widths. 

After you create some splits, you can switch back and forth between them with **ctrl-w [h|j|k|l]**. This is a bit clunky though, and it's important for common operations to be efficient and easy. If you use splits heavily, I would personally recommend aliasing these commands to **ctrl-h** **ctrl-j** etc in your .vimrc using this snippet. 

    nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split  
    nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split  
    nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split  
    nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split  

### The jumplist ###

Splits solve the problem of viewing multiple related files at a time, but we still haven't seen a satisfactory solution for moving quickly between open and hidden files. The jumplist is one tool you can use for that.

The jumplist is one of those Vim features that can appear weird or even useless at first. Vim keeps track of every motion command and file switch you make as you're editing files. Every time you "jump" from one place to another in a split, Vim adds an entry to the jumplist. While this may initially seem like a small thing, it becomes powerful when you're switching files a lot, or moving around in a large file. Instead of having to remember your place, or worry about what file you were in, you can instead retrace your footsteps quickly using some quick key commands. **Ctrl-o** allows you to jump back to your last jump location. Repeating it multiple times allows you to quickly jump back to the last file or code chunk you were working on, without having to keep the details of where that code is in your head. You can then move back up the chain with **ctrl-i**. This turns out to be immensely powerful when you're moving around in code quickly, debugging a problem in multiple files or flipping back and forth between 2 files. Instead of typing file names or remembering buffer numbers, you can just move up and down the existing path. It's not the answer to everything, but like other Vim concepts, it's a small focused tool that adds to the overall power of the editor without trying to do everything.

### Plugins ###

So let's be real, if you're coming to Vim from something like Sublime Text or Atom, there's a good chance all of this looks a bit arcane, scary, and inefficient. "Why would I want to type the full path to open a file when Sublime has fuzzy finding?" "How can I get a view of a project's structure without a sidebar to show the directory tree?" Legitimate questions. The good news is that Vim has solutions. They're just not baked into the Vim core. I'll touch more on Vim configuration and plugins in later posts, but for now here's a pointer to 3 helpful plugins that you can use to get Sublime-like file management. 

- [CtrlP][1] is a fuzzy finding file search similar to Sublime's "Go to Anything" bar. It's lightning fast and pretty configurable. I use it as my main way of opening new files. With it I only need to know part of the file name and don't need to memorize my project's directory structure.
- [The NERDTree][2] is a "file navigation drawer" plugin that replicates the side file navigation that many editors have. I actually rarely use it, as fuzzy search always seems faster to me. But it can be useful coming into a project, when you're trying to learn the project structure and see what's available. NERDTree is immensely configurable, and also replaces Vim's built in directory tools when installed.
- [Ack.vim][3] is a code search plugin for Vim that allows you to search across your project for text expressions. It acts as a light wrapper around Ack or Ag, [2 great code search tools][4], and allows you to quickly jump to any occurrence of a search term in your project.

Between it's core and its plugin ecosystem, Vim offers enough tools to allow you to craft your workflow anyway you want. File management is a key part of a good software development system, and it's worth experimenting to get it right.

Start with the basics for long enough to understand them, and then start adding tools on top until you find a comfortable workflow. It will all be worth it when you're able to seamlessly move to the code you want to work on without the mental overhead of figuring out how to get there.

### More Resources ###

- [Seamlessly Navigate Vim & Tmux Splits][5] This is a must read for anyone who wants to use vim with [tmux][6]. It presents an easy system for treating Vim and Tmux splits as equals, and moving between them easily.
- [Using Tab Pages][7] One file management feature I didn't cover, since it's poorly named and a bit confusing to use, is Vim's "tab" feature. This post on the Vim wiki gives a good overview of how you can use "tab pages" to have multiple views of your current workspace
- [Vimcasts: The edit command][8] Vimcasts in general is a great resource for anyone learning Vim, but this screenshot does a good job of covering the file opening basics mentioned above, with some suggestions on improving the builtin workflow

### Subscribe ###

This was the third in a series of posts on learning Vim in a modern way. If you enjoyed the post consider subscribing to the [feed][8] or joining my [mailing list][10]. I'll be continuing with [a post on Vim configuration next week][11] after a brief JavaScript interlude later this week. You should also checkout the first 2 posts in this series, on [the basics of using Vim][12], and [the language of Vim and Vi][13]. 

--------------------------------------------------------------------------------

via: http://benmccormick.org/2014/07/07/learning-vim-in-2014-working-with-files/

作者：[Ben McCormick][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://benmccormick.org/2014/07/07/learning-vim-in-2014-working-with-files/
[1]:https://github.com/kien/ctrlp.vim
[2]:https://github.com/scrooloose/nerdtree
[3]:https://github.com/mileszs/ack.vim
[4]:http://benmccormick.org/2013/11/25/a-look-at-ack/
[5]:http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
[6]:http://tmux.sourceforge.net/
[7]:http://vim.wikia.com/wiki/Using_tab_pages
[8]:http://vimcasts.org/episodes/the-edit-command/
[9]:http://feedpress.me/benmccormick
[10]:http://eepurl.com/WFYon
[11]:http://benmccormick.org/2014/07/14/learning-vim-in-2014-configuring-vim/
[12]:http://benmccormick.org/2014/06/30/learning-vim-in-2014-the-basics/
[13]:http://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language/
