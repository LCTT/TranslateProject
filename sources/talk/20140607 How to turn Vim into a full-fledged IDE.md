CNprober 翻译中...
How to turn Vim into a full-fledged IDE
================================================================================
If you code a little, you know how handy an Integrated Development Environment (IE) can be. Java, C, Python, they all become a lot more accessible when the IDE software is checking the syntax for you, compiling in the background, or importing the libraries you need. On the other hand, if you are on Linux, you might also know how handy Vim can be when it comes to text editing. So naturally, you would like to get all the features of an IDE from Vim.

In fact, there are quite a few ways to do so. One could think of [c.vim][1] which attempts to transform Vim into a C oriented IDE, or [Eclim][2] which merges Vim into Eclipse. However, I would like to propose you a more generalist approach using only plugins. You do not want to bloat your editor with too many panels or features. Instead, the plugin approach lets you choose what you put into your Vim. As a bonus, the result will not be language-specific, allowing you to code in anything. So here is my **top 10 list of plugins which brings IDE features to Vim**.

### Bonus: Pathogen ###

First of all, we might not all be familiar with plugins for Vim, and how to install them. This is why the first plugin that I recommend is Pathogen, as it will allow you to install other plugins more easily. That way, if you want to install another plugin for Vim not listed here, you will be able to do so easily. The [official page][3] is really well documented, so go visit it to download and install. From there installing the rest of the plugins will be easy.

### 1. SuperTab ###

[![](https://farm6.staticflickr.com/5158/14332189422_34aeb086ed_z.jpg)][4]

The first thing we get used to in an IDE is auto-completion feature. For that, I like the plugin [SuperTab][5] which comes in quite handy, giving "super powers" to the tabulation key.

### 2. Syntastic ###

![](https://farm4.staticflickr.com/3894/14354095583_ce9b112b97_z.jpg)

If you tend to code in more than one language, it is really easy to confuse the syntax at some point. Hopefully, [syntastic][6] will check it for you, and tell you if should put brackets or parentheses for that conditional, or remind you that you forgot a semi-colon somewhere.

### 3. Auto Pairs ###

Another thing that drives most of the coders insane: did I write this last parenthesis or not?! Everyone hates counting with your finger all the parentheses you put so far. To deal with that, I use [Auto Pairs][7], which automatically inserts and formats parentheses and brackets.

### 4. NERD Commenter ###

Then if you are looking for a quick shortcut to comment code, regardless of the programming language, you can turn to [NERD Commenter][8]. Even if you are not a programmer, I really really recommend this plugin as it just so efficient while commenting bash scripts or anything in your system.

### 5. Snipmate ###

Any programmer knows that a good coders codes, but an excellent one reuses. For that, [snipmate][9] will easily insert code snippets into your file and greatly reduce your typing. It comes by default with a lot of snippets for various languages, but you can also easily add yours to the list.

### 6. NERDTree ###

![](https://farm4.staticflickr.com/3899/14332189462_d66b71cf7c_z.jpg)

To manage a big project, it is always a good idea to split the code into different files. Just basic good coding practices. And to keep all this files in mind, [NERDTree][10] is a nice file browser to use straight from Vim.

### 7. MiniBufferExplorer ###

![](https://farm4.staticflickr.com/3904/14332189492_209a3ee2dc_z.jpg)

To complement a file explorer, there is nothing better than a good buffer manager to have more than one file open at any time. [MiniBufferExplorer][11] does the job well and efficiently. It even sets different colors for your buffers as well as easy shortcuts to switch the focus.

### 8. Tag List ###

![](https://farm4.staticflickr.com/3889/14147244138_c04731826a_z.jpg)

When you have more than one file open at any given time, it is easy to forget what you put in them. To prevent that, [Tag List][12] is a code visualizer that will display the different variables and functions written in a nice compact format.

### 9. undotree ###

![](https://farm3.staticflickr.com/2913/14354095453_8bb87a3e31_z.jpg)

For all of us who like to undo, redo, and undo again some modifications to see how the compilation evolves, [undotree][13] is a nice plugin to see your undo and redo edits in a tree. This kind of functionality is clearly not limited to code, so this is a plugin that I like a lot.

### 10. gdbmgr ###

Finally, last but not least, anyone needs a good debugger at some point. If you like gdb, then [gdbmgr][14] is for you as it integrates the famous debugger to Vim.

To conclude, whether you are an insane coder or not, it is always handy to have a few extra functions of Vim at hand at any time. Like I said in the introduction, you do not have to install all these plugins if you do not need them, or you might want to install different ones. But this is definitely a solid basis.

What plugins do you use for Vim? Or how would you complement this top 10? Please let us know in the comments.
--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/turn-vim-full-fledged-ide.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.vim.org/scripts/script.php?script_id=213
[2]:http://eclim.org/
[3]:https://github.com/tpope/vim-pathogen
[4]:https://www.flickr.com/photos/xmodulo/14332189422/
[5]:https://github.com/ervandew/supertab
[6]:https://github.com/scrooloose/syntastic
[7]:https://github.com/jiangmiao/auto-pairs
[8]:https://github.com/scrooloose/nerdcommenter
[9]:https://github.com/garbas/vim-snipmate
[10]:https://github.com/scrooloose/nerdtree
[11]:http://www.vim.org/scripts/script.php?script_id=159
[12]:http://www.vim.org/scripts/script.php?script_id=273
[13]:https://github.com/mbbill/undotree
[14]:http://vim.sourceforge.net/scripts/script.php?script_id=4104