[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 10 Vim plugins for programming in multiple languages)
[#]: via: (https://opensource.com/article/19/11/vim-plugins)
[#]: author: (Maxim Burgerhout https://opensource.com/users/wzzrd)

Top 10 Vim plugins for programming in multiple languages
======
Make your life as a programmer or sysadmin a little better with these 10
plugins for Vim.
![OpenStack source code \(Python\) in VIM][1]

I've been a user of the [Vim][2] text editor for about two decades. For a little while, I have been customizing my Vim configuration, only using plugins for the last couple of years.

Recently, when I was redoing my setup (as I do every so often), I decided it was a good opportunity to identify the best Vim plugins for programming in multiple languages and a way to combine those plugins for each language I program in.

I do use certain plugins for specific languages and profiles (e.g., I only install Rocannon in my Ansible profile), and I won't go into those here—that would be a _long_ list. But the 10 Vim plugins described below are my favorites, the ones I use in virtually every profile I have, no matter what programming language I'm using.

### 1\. Volt

My number one pick isn't even a plugin; rather, it replaces plugins like [Vundle][3], so I'm listing it here.

[Volt][4] is a Vim plugin manager that lives outside Vim. You can use it to install plugins and create combinations of plugins called "profiles." You can enable a new profile with a single command: **volt profile set myprofile**. That way, I can do things like enable the [indentpython][5] plugin for just my Python profile. Volt also offers a simple way to do per-plugin configurations. The configuration is shared between profiles, so you can install plugins once and use them in multiple profiles.

Volt is still relatively new and not perfect (e.g., you can have just one configuration file per plugin, no matter how many profiles you are using), but apart from that, I find it extremely handy, extremely fast, and extremely simple.

![Volt plugin][6]

### 2\. Vim-Rainbow

Except for Python, virtually all major programming languages use brackets. Round ones, square ones, and curly ones. Often, they use multiple pairs of brackets, with one pair embedded in another. Figuring out which closing bracket belongs to what opening bracket can become difficult and annoying. I often find myself counting round brackets—especially in complicated Bash scripts—to make sure I got everything right.

Here's the [vim-rainbow][7] plugin to the rescue! It gives every pair of brackets a unique color, so it's easy to identify which brackets belong to each other. It's very useful and very colorful, too.

![vim-rainbow plugin][8]

### 3\. lightline

There are a lot of plugins for Vim, such as [Powerline][9], that put a bar at the bottom of the screen to show you what file you are working on, where you are in the file, what type of file it is, etc. Each of these plugins has advantages and disadvantages, and after briefly weighing them, I chose [lightline][10]. It's relatively small, easy to set up, quite extensible if you are into that kind of thing, and doesn't require any other tooling or plugins.

![Lightline plugin][11]

### 4\. NERDTree

[NERDTree][12] is a classic. In large projects, it can be hard to find the exact name and location of the one file that includes the one line you need to edit. With a quick keystroke (**F7**, in my case, as I bound NERDTree to F7 in my .vimrc configuration file), an explorer window opens in a vertical split, and I can easily browse to the file I want and open it. It's a must for large bodies of code. Or for people that tend to forget filenames, like me.

![NERDTree vim plugin][13]

### 5\. NERD Commenter

All programmers, at some time, write code that introduces a hard-to-debug problem that leads them to decide to comment out or undo the code. This is where [NERD Commenter][14] comes in. Select the code, hit **Leader+cc**, and your code is commented. (The standard Vim Leader key is the **/** character.) Hit **Leader+cn,** and your code is uncommented. NERD Commenter should automatically use the right commenting character for most file types. For example, if you are editing a [BIND zone file][15] and set the file type to bind zone, Vim will correctly use the **;** (semicolon) character to comment lines out.

![NERD Commenter][16]

### 6\. Solarized

I love my Vim colors. Really, I love terminal colors in general. I've been using the [Solarized][17] color scheme for Vim for a long time, and I set up my terminal, dir_colors, and Vim to be consistent.

Every now and then, though, I toggle between light and dark modes, depending on what kind of environment I'm in, the amount of light falling on my screen, and whether I need to put something on a big screen for others to read.

Obviously, you can grab any ol' color scheme you like, but I like the fact that Solarized has light and dark modes, an easy way to switch between the two, and it's not too intrusive. My second choice is [Monokai][18]. The Volt plugin manager makes it easy for me to switch between the two, so I can use Monokai for Python programming and Solarized for Bash.

I'm not including an image for Solarized, because all the other images in this article use Solarized light or dark, so check them out.

### 7\. fzf

When you're looking for a file, sometimes you want a file explorer, and sometimes you just want to ram something on your keyboard that vaguely resembles the filename you are looking for, amirite?

The [fzf][19] (or "fuzzy finder") plugin gives you just that. Hit **:FZF** and start typing. An ever-shortening list will show you files that more or less match what you are looking for. I use this a lot, probably even more than NERDTree these days. A slight downside is that this plugin has an external dependency in the fzf binary, so you'll have to install that, too. It's available for Fedora, Debian and, Arch, but I don't think it exists for EPEL.

![fzf Vim plugin][20]

### 8\. ack

Every once in a while, you want to search for a file that contains a certain line or a certain word. I really like the [ack][21] plugin for this, preferably in combination with **ag**, a command known as "the [silver searcher][22]." This combination is phenomenally fast and covers the vast majority of things I would use **grep** or **vimgrep** for. The downside is you'll need to install either ack or ag for it to work. The good news is that both ag and ack are available for Fedora and EPEL7.

![ack vim plugin][23]

### 9\. gitgutter

The majority of IT folks have worked with [Git][24] and files in Git repositories. The [gitgutter][25] plugin adds a column near your line numbers that shows symbols for changed (**~**), added (**+**), and removed (**-**) lines. This is quite useful for keeping track of what you have changed, and it keeps you focused on the task at hand, like writing a patch to fix one key bug. This plugin has a slight performance gap, and it sometimes takes a quick second for the plugin to catch up with your changes, but it's still quite useful.

![gitgutter vim plugin][26]

### 10\. Tag List

If you are programming in a file of any significant size, it's easy to lose track of where you are, and you might find yourself scrolling up and down looking for a certain function. With the [Tag List][27] plugin, you can just type **:Tlist** and get a vertical split with variables, types, classes, and functions that you can easily jump to. This works for a host of languages, like Java, Python, and any other file type the **ctags** utility works with … which is a lot.

![Tag List vim plugin][28]

So there you are: the 10 plugins for Vim that have made my life as a sysadmin and part-time programmer a little easier and a little better. What Vim plugins you are using? Please share your favorites in the comments.

Vim offers great benefits to writers, regardless of whether they are technically minded or not.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/vim-plugins

作者：[Maxim Burgerhout][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wzzrd
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://www.vim.org/
[3]: https://github.com/VundleVim/Vundle.vim
[4]: https://github.com/vim-volt/volt
[5]: https://github.com/vim-scripts/indentpython.vim
[6]: https://opensource.com/sites/default/files/uploads/vim-volt.gif (Volt plugin)
[7]: http://github.com/frazrepo/vim-rainbow
[8]: https://opensource.com/sites/default/files/uploads/vim-rainbox.png (vim-rainbow plugin)
[9]: https://github.com/powerline/powerline
[10]: http://github.com/itchyny/lightline.vim
[11]: https://opensource.com/sites/default/files/uploads/lightline.png (Lightline plugin)
[12]: http://github.com/scrooloose/nerdtree
[13]: https://opensource.com/sites/default/files/uploads/nerdtree.gif (NERDTree vim plugin)
[14]: http://github.com/scrooloose/nerdcommenter
[15]: https://en.wikipedia.org/wiki/Zone_file#File_format
[16]: https://opensource.com/sites/default/files/uploads/nerdcommenter.gif (NERD Commenter)
[17]: https://github.com/altercation/vim-colors-solarized
[18]: https://github.com/sickill/vim-monokai
[19]: https://github.com/junegunn/fzf.vim
[20]: https://opensource.com/sites/default/files/uploads/fzf.gif (fzf Vim plugin)
[21]: https://github.com/mileszs/ack.vim
[22]: https://github.com/ggreer/the_silver_searcher
[23]: https://opensource.com/sites/default/files/uploads/ack.gif (ack vim plugin)
[24]: https://opensource.com/resources/what-is-git
[25]: https://github.com/airblade/vim-gitgutter
[26]: https://opensource.com/sites/default/files/uploads/gitgutter.png (gitgutter vim plugin)
[27]: https://github.com/vim-scripts/taglist.vim
[28]: https://opensource.com/sites/default/files/uploads/taglist.gif (Tag List vim plugin)
