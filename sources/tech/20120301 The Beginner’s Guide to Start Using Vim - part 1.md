Tarnslating by Yinr

The Beginner’s Guide to Start Using Vim
============================================================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/03/vim-beginner-guide-featured.jpg "The Beginner's Guide to Start Using Vims") 


This article is part of the [VIM User Guide][12] series:

*   The Beginner’s Guide to Start Using Vim
*   [Vim Keyboard Shortcuts Cheatsheet][3]
*   [5 Vim Tips and Tricks for Experienced Users][4]
*   [3 Useful VIM Editor Tips and Tricks for Advanced Users][5]

Choosing a text editor is a very important decision for a programmer. This is partly because of the plethora of variables: graphical/non-graphical interfaces, different shortcuts, language specializations, plugins, customizations, etc. My advice is not to try to search for the best one. Instead, choose the one that corresponds best to your habits and your tasks. If you want to work in a group, it’s generally best to select the same editor as your co-worker. That way, if you have a problem, you will be able to find some help.

It is exactly for that reason that I started using Vim a few years ago. Traditionally, Vim is placed in conflict with the legendary Emacs. I confess that I know very little about Emacs, but what you have to know about these two text editors is that they can both be fully customized, and very confusing at first. This tutorial will not explain everything about Vim but will try to give you the basics to use it correctly in the first place, and then present a few tips that will (I hope) allow you to learn on your own.

Vim comes from “VI iMproved”. Vi is a non-graphical text editor widely distributed in Unix systems. It comes by default with Linux. Vim is an enhancement of this original editor. However, unlke Vi, Vim is not installed by default on every distribution.

### Installation

To install Vim on Ubuntu, use the command:

```
sudo apt-get install vim
```

If you are already interested in some plugins, use the command:

```
sudo apt-cache search vim
```

This will give you a long list of packages related to Vim. Among them are some for various programming languages, addon managers, etc.

For this tutorial, I will be using the latest version of Vim (7.3.154) on Ubuntu. You can use any other version though.

### Warming Up

Type the command `vim` in a terminal. You should see a nice welcome screen.

 ![vim-welcome](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-welcome.jpg "vim-welcome") 

And if you’ve never used Vi or Vim before, it is very likely that you don’t even know how to exit… Yes, it’s true. **None of the shortcuts you normally use will work in Vim**.

First of all, to use any menu-type function like save or exit, your command should begin with a colon (:). Saving is `:w` and quitting is `:q`. If you want to quit a file without saving, use the force quit command `:q!`. A cool thing with Vim is that you don’t have to type commands separately. In other words, if you want to save and then quit, you can directly use `:wq`.

So for now, quit Vim and open it on a sample text file. Simply add the name of the text file that you want to edit after the command:

```
vim [text file name]
```

 ![vim-file](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-file.jpg "vim-file") 

By default, when you open a text file, you are in visual mode. It is quite specific to Vim and confusing at the beginning. Vim is composed mainly of two modes: visual and editing. The visual mode is for viewing a text and using some commands. To go into editing mode, just press `i` to insert and `a` to add some text. To go back into the visual mode and access all the menu-type functions, press the “Escape” key. The difference between insertion and addition is simply whether you want the text you type to appear before or after the cursor in visual mode. To understand this fully, you should really try it yourself. My advice is: add at the end of lines, and insert in other cases.

To move the cursor within a text, whether you are in visual or editing mode, you can generally use the keyboard arrows. A real purist would tell you to use the keys _h_ for left, _j_for down, _k_ for up, and _l_ for right.

Now that you are warmed up and know how to control Vim at a basic level, let’s go to the core.

### A few basic commands

Now that you master the transformation from visual to editing mode, here are a few commands that you can use in visual mode:

*   _x_: to delete a character
*   _u_: to undo an action (the equivalent of Ctrl+z)
*   _dd_: to delete a line
*   _dw_: to delete a word
*   _yy_: to copy a line
*   _yw_: to copy a word
*   _p_: to paste the previously deleted or copied line or word
*   _e _: to move to the next word (faster than just moving with the arrow keys)
*   _r_: to replace a letter (press _r_, then the new letter)

And of course, there are more, but this is enough for now. If you master all of them, you will already be very fluent with Vim.

As a side note for those who always want more, you can type a number before any of these commands and the command will be executed that number of times. For example, _5x_ will delete five characters in a row, while _3p_ will paste three times.

### Advanced Commands

Finally, as a bonus and an appetizer for your own research, here are a few advanced and very useful commands:

*   _/searched_word _: to search for a word within the text
*   _:sp name_of_a_text_file_: will split the screen in half horizontally, showing the new text file in the other half. To shift the focus from the right to the left window, use the shortcut Ctrl+w

 ![vim-sp](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-sp.jpg "vim-sp") 

*   _:vsp name_of_a_text_file_: same as before, but splits the screen vertically
*   Ctrl+Shift+C and Ctrl+Shift+V: to copy and paste text in a terminal
*   _:! name_of_a_command_: to launch a command external to Vim, directly into your shell. For example, `:! ls` will display the files within the directory you are currently working in, without quitting the editor

 ![vim-ls](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-ls.jpg "vim-ls") 

### Conclusion

I think you now have every tool you need to start using Vim. You can go even further by installing the various plugins, editing the _.vimrc_ file, or even using the interactive tutor by typing the command _vimtutor_.

If you have any other commands that you would like to share about Vim, please let us know in the comments.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/start-with-vim-linux/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/adrienbrochard/
[2]:https://www.maketecheasier.com/start-with-vim-linux/#comments
[3]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[4]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F&text=The+Beginner%26%238217%3Bs+Guide+to+Start+Using+Vim
[9]:mailto:?subject=The%20Beginner%E2%80%99s%20Guide%20to%20Start%20Using%20Vim&body=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F
[10]:https://www.maketecheasier.com/turn-dropbox-into-a-blogging-tool-with-scriptogram/
[11]:https://www.maketecheasier.com/4-sms-back-up-applications-to-keep-your-messages-safe-android/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
