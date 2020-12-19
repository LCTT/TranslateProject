[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get the most out of the Vi text editor)
[#]: via: (https://opensource.com/article/20/12/vi-text-editor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Get the most out of the Vi text editor
======
Vi is the quintessential Unix text editor. Get to know it—or any of its
incarnations, Vim, Neovim, gVim, nvi, or Elvis, for Linux, macOS,
Windows, or BSD.
![Business woman on laptop sitting in front of window][1]

Whether you know it as Vim, Neovim, gVim, nvi, or even Elvis, the quintessential Unix editor is easily Vi. Included in probably every Linux and BSD distribution, Vi is a lightweight and minimalist text editor that many users love for its simple and succinct keyboard shortcuts and dual-mode design.

The original Vi editor was an application written by Bill Joy, creator of the [C shell][2]. Modern incarnations of Vi have [added many features][3], including multiple levels of undo, better navigation while in insert mode, line folding, syntax highlighting, plugin support, and much more. Vim is regarded as the most popular modern implementation, and most people actually mean Vim when they refer to Vi.

All incarnations hearken back to the same goal, though, so this article looks at Vi in a generic sense. The implementation on your computer may differ slightly, but you can still benefit from editing text the Vi way.

### Install Vi

If you're running Linux, macOS, or BSD, then you already have the `vi` command installed. If you're on Windows, you can [download Vim and gVim][4].

![gVim][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

On [NetBSD][7], nvi is a common alternative to Vi, while Slackware provides [Elvis][8] (and Vim), and the popular [Neovim][9] fork aims to help users extend Vim with [Lua][10].

### Launch Vi

Start Vi or Vim with the `vi` command in a terminal. If a `.vimrc` file is not found on your system, then Vim starts in Vi-compatibility mode (this can also be forced with the `-C` option). If you want to use gVim to have a graphical user interface (GUI), you can start it from your desktop's application menu.

If you're a new user just learning Vi, using a graphical user interface can be a nice way to provide yourself a buffer between how you might _expect_ a text editor to behave and how Vi was designed to behave. The GUI version has a menu bar, some mouse integration, a toolbar, and other features to help you find the basic functions you probably take for granted in a typical text editor but don't know how to do in Vi yet.

### How to use Vi

Probably the easiest way to learn Vi is with `vimtutor`, an interactive tutorial packaged with Vim. To start the tutorial, launch `vimtutor` and read through the instructions, trying each exercise. As the tutorial says, getting good with Vi is less about memorizing what key does what and more about establishing muscle memory to invoke common actions as you type.

#### Escape

One of the first things you learn about Vi is the importance of the **Esc** key. **Esc** is what activates _command mode_, and it doesn't take long to learn that whenever you're in doubt in Vi, just press **Esc**. Any key you press while in command mode is not entered into the text document you're working on; instead, it is interpreted by Vi as a command. For instance, to move your cursor left, you press the **H** key on your keyboard. If you're in _insert_ mode, then pressing **H** types the letter H, just as you'd expect. But in _command_ mode, pressing **H** moves left, **L** moves right, **J** moves down, and **K** moves up.

The separation between command mode and insert mode is a sharp contrast to the way any other text editor works, and for that reason, it's probably Vi's most significant differentiator. Interestingly, though, it's theoretically not so different from the way you probably already work. After all, when you take your hands off the keyboard to select text with a mouse, you're essentially placing yourself into a kind of command mode. With Vi, instead of moving your hands off the keyboard to move the mouse and press function keys or Ctrl, you put the _editor_ into a special mode of operation, such that it reassigns your key presses to commands instead of text input.

#### Extend Vi

Before Vim version 8.0, Vi was very much "just" a text editor. There were plugins for it, but installing them was a manual process that many users never thought to do. Luckily, Vim version 8 and higher offer support for plugin management, making it trivial to install and load plugins.

Installing plugins for Vim can be done with the `vim-plug` function. For instance, to install the Vi file browser [NERDTree][11]:


```
`:PlugInstall NERDTree`
```

You can also update plugins:


```
`:PlugUpdate NERDTree`
```

For more information on installing plugins and themes, both with `vim-plug` and manually, read my article [_How to install Vim plugins_][12].

### Vi as default

Vi isn't just popular; it's a [POSIX][13] standard. It's an application every sysadmin should know how to use, even if they don't intend to use it on an everyday basis. It's also a fast and simple editor, so once you get good at it, it may be the editor you've long been searching for.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/vi-text-editor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/8/tcsh
[3]: https://vimhelp.org/vi_diff.txt.html#vi-differences
[4]: https://www.vim.org/download.php
[5]: https://opensource.com/sites/default/files/uploads/gvim.jpg (gVim)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[8]: https://github.com/mbert/elvis
[9]: http://neovim.io
[10]: https://opensource.com/article/20/2/lua-cheat-sheet
[11]: https://www.vim.org/scripts/script.php?script_id=1658
[12]: https://opensource.com/article/20/2/how-install-vim-plugins
[13]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
