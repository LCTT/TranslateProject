Vim Editor Modes Explained
#ch-cn translating
============================================================

### On this page

1.  [System and local vimrc][1]
2.  [What compatibility are we talking][2]
3.  [How to enable/disable these modes?][3]
4.  [Other useful details][4]

So far, in our tutorials centered around [Vim][5], we discussed the editor's Modeline feature as well as how Vim's feature-set can be expanded using [plugins][6]. However, as we all know, Vim offers a plethora of in-built features; so taking the discussion further, in this tutorial, we will discuss the available modes in which the editor can be launched.

But before we do that, please note that all the examples, commands, and instructions mentioned in this tutorial have been tested on Ubuntu 14.04, and the Vim version we've used is 7.4.

# Compatible and Nocompatible modes in Vim

To properly understand the aforementioned Vim modes, you'll first have to understand an important aspect of the editor's initialization process.

### System and local vimrc

The aspect in question is: when Vim is launched, a system-level 'vimrc' file is searched by the editor to carry out system-wide default initializations.

This file is usually located at the **$VIM/vimrc** path on your system, but if that's not the case, then you can find the exact location by running the **:version** command inside Vim. For example, in my case, here's the relevant excerpt of the output the command produced:

```
...
...
...
system vimrc file: "$VIM/vimrc"
user vimrc file: "$HOME/.vimrc"
2nd user vimrc file: "~/.vim/vimrc"
user exrc file: "$HOME/.exrc"
fall-back for $VIM: "/usr/share/vim"
...
...
...
```

So the system 'vimrc' file is indeed located at **$VIM/vimrc**, but I checked that the $VIM environment variable isn't set on my machine. So in that case - as you can see in the output above - there's a fall back value for $VIM, which in my case is **/usr/share/vim**. When I tried searching for 'vimrc' at this path, I observed the file is present. So that's my system vimrc, which - as I mentioned earlier - is read when Vim is launched.

After this system vimrc is parsed, the editor looks for a user-specific (or local) 'vimrc' file. The [order of search][7] for the local vimrc is: environment variable VIMINIT, $HOME/.vimrc, environment variable EXINIT, and a file named 'exrc'. Usually, it's the $HOME/.vimrc or ~/.vimrc that exists and is treated as local vimrc.

### What compatibility are we talking

As we're discussing Vim's compatible and nocompatible modes, it's worth knowing what kind of compatibility does these modes enable and disable. For this, one should first be aware that Vim is a short form of **V**i **IM**proved, and as the full name suggests, the editor is an improved version of the Vi editor.

By improved, what is meant is that the feature set that Vim offers is larger than that of Vi. For a better understanding of difference between the two editors, head [here][8].

So while discussing Vim's compatible and nocompatible modes, the compatibility we're talking about is Vim's compatibility with Vi. When run in compatible mode, most of the enhancements and improvements of Vim get disabled. However, keep in mind that in this mode, Vim doesn't simply emulate Vi - the mode basically sets some default options to the way the Vi editor works.

The nocompatible mode - needless to say - makes Vim work without being Vi-compatible, making it all its enhancements/improvements/features available to the user.

### How to enable/disable these modes?

Try running the **:help compatible** command in Vim, and you should see the following syntax:

```
'compatible' 'cp' boolean (default on, off when a |vimrc| or |gvimrc|
 file is found)
```

So the description says the compatible mode is ON by default, but gets turned OFF when a vimrc file is found. But which vimrc are we talking about? The answer is local vimrc. Delve into the details that the **:help compatible** command offers and you'll find the following line, which should make things more clear:

```
Effectively, this means that when a |vimrc| or |gvimrc| file exists, Vim will use the Vim defaults,otherwise it will use the Vi defaults. (Note: This doesn't happen for the system-wide vimrc or gvimrc file, nor for a file given with the |-u| argument).
```

So, what actually happens is, whenever Vim is launched, it first parses the system vimrc file - at this time the compatible mode is ON by default. Now, whenever a user (or local) vimrc is found, the nocompatible mode gets turned on. The **:help compatible-default** command makes it quite clear:

```
When Vim starts, the 'compatible' option is on. This will be used when Vim starts its initializations. But as soon as a user vimrc file is found, or a vimrc file in the current directory, or the "VIMINIT" environment variable is set, it will be set to 'nocompatible'.
```

In case you want to override the default behavior, and turn on the nocompatible mode when the editor starts parsing the system vimrc file, this can be done by adding the following command to that file in the beginning:

```
:set nocompatible
```

### Other useful details

Here are some more useful details about these modes:

```
But there is a side effect of setting or resetting 'compatible' at the moment a .vimrc file is found: Mappings are interpreted the moment they are encountered. This makes a difference when using things like "<CR>". If the mappings depend on a certain value of 'compatible', set or reset it before
giving the mapping.

The above behavior can be overridden in these ways:
- If the "-N" command line argument is given, 'nocompatible' will be used, even when no vimrc file exists.
- If the "-C" command line argument is given, 'compatible' will be used, even when a vimrc file exists.
- If the "-u {vimrc}" argument is used, 'compatible' will be used.
- When the name of the executable ends in "ex", then this works like the "-C" argument was given: 'compatible' will be used, even when a vimrc file exists. This has been done to make Vim behave like "ex", when it is started as "ex".
```

# Conclusion

Agreed, chances are that you may not find yourself in a situation where-in you'll have turn on the Vi-compatible mode of Vim, but that doesn't mean you should be ignorant of the editor's initialization process. After all, you never know when this knowledge might be of your help.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-editor-modes-explained/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[1]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#system-and-local-vimrc
[2]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#what-compatibility-are-we-talking
[3]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#how-to-enabledisable-these-modes
[4]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#other-useful-details
[5]:https://www.howtoforge.com/vim-basics
[6]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[7]:http://vimdoc.sourceforge.net/htmldoc/starting.html#system-vimrc
[8]:http://askubuntu.com/questions/418396/what-is-the-difference-between-vi-and-vim
