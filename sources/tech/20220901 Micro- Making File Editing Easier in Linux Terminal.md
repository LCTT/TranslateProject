[#]: subject: "Micro: Making File Editing Easier in Linux Terminal"
[#]: via: "https://itsfoss.com/micro-editor-linux/"
[#]: author: "sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Micro: Making File Editing Easier in Linux Terminal
======

While [modern open source code editors][1] have taken the programming world by storm, Linux command line is still ruled by a selected set of text editors. Popular [command line editors][2] like [Vim][3] and Emacs are also infamous for their weird keyboard shortcuts.

There are several jokes about those weird keyboard shortcuts in the programming world. [Exiting Vim][4] is perhaps the most common of them all. Here’s an example.

![vim shortcut linux humor][5]

**[Micro is a modern terminal-based text editor][6]** that attempts to take the pain of keyboard shortcuts and provide popular shortcuts as well as mouse supports.

Micro is made with [the GO Programming Language][7]. It’s actively being developed by [Zachary Yedidia][8] and many other open source enthusiasts are contributing to it.

According to [Micro’s GitHub project][9] documentation,

> Micro aims to be easy to use and intuitive, while also taking advantage of the full capabilities of modern terminals.

And that’s true. You’re probably wondering what’s special about this one, there are plenty of other terminal-based text editors out there. The answer is that Micro is so easy to use that the learning curve is almost flat, you don’t need to learn anything new, and it has some very interesting features.

### Features

![Micro editor interface][10]

Some of the main highlights of the Micro editor are:

* Support for universal keyboard shortcuts (Ctrl-S, Ctrl-C, Ctrl-V, Ctrl-Z etc.)
* Syntax highlighting ( for over 130 languages)
* Color scheme and True Color support
* Search and Replace feature
* Common editor features such as Undo and Redo, Unicode support, Line numbering, Soft wrapping etc.
* Copy and Paste from the system clipboard
* Configurable
* Simple auto-completion.
* Splits and tabs
* Good Mouse Support such as drag to select, double click to select a word, triple-click to select by line etc.
* Plug-in support and a built-in plugin manager to automatically install, remove, and update plugins.
* Macros
* Cross Platform

### Installation

Micro is available in the repositories of all major distributions. In Ubuntu, you can install it with:

```
sudo apt install micro
```

This will install `xclip` as a dependency for clipboard functionality.

Additionally, you can download the pre-built binary from the link below:

[Download Micro][11]

Once you download it, extract the file and you’ll find the binary file inside it. Copy this binary file to your /bin directory. And then, you can run it in the terminal using the command “micro”.

For clipboard support, you need `xclip` and `xsel`  packages. In Ubuntu and other Ubuntu based Linux distributions, you can use the following command to install it:

```
sudo apt install xclip
```

For detailed information on configuring Micro, [see here][12].

![Micro Terminal Text Editor split view with multiple files opened][13]

### Essential commands and shortcuts

| Function | Command | 
| :- | :- |
| Open a File in Micro | micro [FILENAME] | 
| To List Available Plug-Ins | micro -plugin available | 
| To Install a  Plug-In | micro -plugin install [PLUGIN] | 
| To Remove a Plug-In | micro -plugin remove [PLUGIN] | 
| To Execute a Command inside Micro | Ctrl + E | 
| To Split open a file Horizontally through command | hsplit [FILENAME] | 
| To Split open a file Vertically through command | vsplit [FILENAME] | 
| To get Help inside Micro Editor | Ctrl + G | 
| To Save a File | Ctrl + S | 
| To Copy Text Inside Micro | Ctrl + C | 
| To Paste Text Inside Micro | Ctrl + V | 
| To Close Micro Editor | Ctrl + Q | 
| To Move Through Available Commands | TAB (Shift + Tab for reverse direction) |

[Download Micro Editor Quick Cheat Sheet][14]

[Download][15]

### Thoughts about Micro?

I think that Micro’s a pretty good tool for text editing. Though it’s not feature-rich like Vim or other mature text editors, it can easily replace tools like Nano for occasional file editing in the terminal.

If you often have to edit files in the terminal but you don’t feel too comfortable with Vim, give it a try and tell us about your experience.

--------------------------------------------------------------------------------

via: https://itsfoss.com/micro-editor-linux/

作者：[sreenath][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[2]: https://itsfoss.com/command-line-text-editors-linux/
[3]: https://www.vim.org/
[4]: https://itsfoss.com/how-to-exit-vim/
[5]: https://itsfoss.com/wp-content/uploads/2022/08/vim-shortcut-linux-humor.jpeg
[6]: https://micro-editor.github.io/
[7]: https://golang.org/
[8]: https://github.com/zyedidia
[9]: https://github.com/zyedidia/micro
[10]: https://itsfoss.com/wp-content/uploads/2022/08/emmabuntus.jpg
[11]: https://github.com/zyedidia/micro/releases
[12]: https://github.com/zyedidia/micro#configuration
[13]: https://itsfoss.com/wp-content/uploads/2022/08/micro-terminal-text-editor-split-view-with-multiple-files-opened.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/micro-command-line-text-editor-cheat-sheet.pdf
[15]: https://itsfoss.com/wp-content/uploads/2022/08/micro-command-line-text-editor-cheat-sheet.pdf
