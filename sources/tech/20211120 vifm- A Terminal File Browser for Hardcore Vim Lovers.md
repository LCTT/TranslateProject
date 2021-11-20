[#]: subject: "vifm: A Terminal File Browser for Hardcore Vim Lovers"
[#]: via: "https://itsfoss.com/vifm-terminal-file-manger/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

vifm: A Terminal File Browser for Hardcore Vim Lovers
======

_**Brief: Explore a terminal-based file browser application that can be used with the Vim style key bindings.**_

When it comes to navigating through the [Linux directory structure][1] in the command line, people often rely on the [cd command][2].

And nothing wrong with it because you’ll get the cd command on any Linux system you log in.

However, if the system is maintained by you and you want to have a better view of the directories, a file manager does a lot better than the cd or tree command.

Yes, you can get file managers in the terminal as well. They may not be as good as the GUI ones like Nautilus but still better than the plain old commands.

There are several [TUI][3] file browsers and we have covered a few of them on It’s FOSS. Today, we look at vifm.

### What is vifm?

![][4]

[vifm][5] is a command line tool that is a file manager with key bindings for navigation and file system object manipulation that are similar to vim. In case you are wondering what I meant by “file system objects”, they are files, directories, symbolic links, hard links etc.

Along with the very intuitive vim interaction key bindings, below is the set of features that vifm offers you

  * A fast file manager right in your terminal
  * Edit the text file from the file manager itself
  * vifm uses the curses interface
  * vifm is cross platform (can even work on Windows with the help of Cygwin; it should work but I have not tested it)
  * Supports vim style key binding inputs like dd, j, k, h, l etc
  * The [vifm plugin][6] is available to be used inside vim for opening file(s) through vim
  * Auto complete support for the vim commands
  * Support for more than one panes
  * Allows batch rename with [or without] regex



### Installing vifm on Linux

The vifm package isn’t new and therefore is readily available in even the “stable” distributions’ (like Debian) repositories by default.

On Debian and Debian based distros (like Ubuntu, Pop!_OS, Mint etc), you can [use the apt package manager][7] to install vifm:

```

    sudo apt install vifm

```

Use the [pacman package manager][8] to install vifm on [Arch-based Linux distributions][9]:

```

    sudo pacman -S vifm

```

vifm is also available in the Fedora and RHEL repositories; install vifm with the DNF package manager:

```

    sudo dnf install vifm

```

Once you have vifm installed, you can simply type vifm your terminal – like below – and start vifm

```

    vifm

```

### The vifm user interface

When you launch vifm for the first time, by default, it will launch with the overview of the directory that you are currently in. You will also notice, that vifm uses two panes by default.

![The default vifm interface, consisting of a normal view \(hidden files not visible\) and two panes opened by default][10]

If you find yourself confused at the interface, simply try pressing the j key to move the cursor down one row, and press the k key to move the cursor up one row. You can move up one directory by pressing the h key. Just like vim!

If your cursor is currently on a file, pressing the l key will open the file in vim (if not stated otherwise). But if your cursor is on a directory, pressing the l key will navigate in the directory and show you the directory contents.

You can also get details about a file or directory from the file manager by pressing the Ctrl + g key binding.

![A screenshot of how the Ctrl – g key binding shows you a directory/file info][11]

You can press the keys “za” to either show files and directories that are hidden (files and directories with a period at beginning are hidden by default). If these special files and directories are not hidden, pressing za will hide them.

![An example of how it will look when you press the “zo” key binding][12]

You can either permanently show hidden files and directories with the “zo” key binding and never make these items visible with the “zm” key binding.

[][13]

![][14]

#### [nnn: A Blazing Fast Terminal File Browser For Pro Linux Users][13]

### Conclusion

Since it is based on Vim, you can configure it using the vifmrc file. The [vifm wiki][15] has the latest default keybinding cheatsheet located [here][16]. The project is very well documented.

![Vifm default key binding][17]

vifm is an amazing file manager, specially for Vim users because it integrates so well with the Vim ecosystem. It incorporates many vim features and key bindings into a file manager. The default two pane layout makes it more productive.

Do not hesitate to give vifm a try. It really is an amazing command line tool!

--------------------------------------------------------------------------------

via: https://itsfoss.com/vifm-terminal-file-manger/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/linux-directory-structure/
[2]: https://linuxhandbook.com/cd-command-examples/
[3]: https://itsfoss.com/gui-cli-tui/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/vifm-screenshot.png?resize=800%2C309&ssl=1
[5]: https://github.com/vifm/vifm
[6]: https://github.com/vifm/vifm.vim
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://itsfoss.com/pacman-command/
[9]: https://itsfoss.com/arch-based-linux-distros/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_two_panes-1.webp?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_ctrl_g_info.webp?resize=800%2C600&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_toggle_dotfile_visibility.webp?resize=800%2C600&ssl=1
[13]: https://itsfoss.com/nnn-file-browser-linux/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2017/04/nnn-file-browser.jpg?fit=800%2C450&ssl=1
[15]: https://wiki.vifm.info/index.php/Main_Page
[16]: https://vifm.info/cheatsheets.shtml
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/vifm-key-binding-cheatsheet.webp?resize=800%2C561&ssl=1
