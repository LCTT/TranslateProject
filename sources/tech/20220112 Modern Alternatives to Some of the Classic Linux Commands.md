[#]: subject: "Modern Alternatives to Some of the Classic Linux Commands"
[#]: via: "https://itsfoss.com/legacy-linux-commands-alternatives/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Modern Alternatives to Some of the Classic Linux Commands
======

When you [start learning Linux][1], you begin with a standard set of Linux commands that have been in existence since the UNIX days. As you grow old as a Linux user, you keep on mastering the same set of standard commands.

But these standard, legacy commands were created several decades ago and while they do their intended jobs, their functionalities could be improved and the structure could be simplified.

This is why there exists ‘alternative’ tools that enhance the legacy UNIX/Linux commands. In this article, I am going to list some new CLI tools that you could use in place of the good old classic Linux commands.

Please note that you should not rely too much on these alternatives, specially if you manage (or plan to manage) numerous Linux servers. The legacy Linux commands are found on all Linux distributions, all Linux servers. These modern replacements are more likely to be not available on remote servers.

In your individual capacity, you can always explore these new tools that could help you in being more efficient.

Sounds all good? Let’s see if you can find your next favorite CLI tool here.

### HTTPie: Alternative to wget and curl

When it comes to [downloading files in terminal][2], wget and curl are the two of the most common tools. Interestingly, not all distributions have curl, wget installed by default.

HTTPie does the same job but in a more human-friendly way. You have colorized, formatted output which makes it easier to understand and debug.

![][3]

### Bat: Alternative to cat

The cat command is perhaps one of the first command you learn. It does the job for viewing the contents of small text files.

But [bat command][4] takes it to the next level by adding features like syntax highlighting and Git integration. Pagination option is also available.

![][5]

### ncdu: Alternative to du command

The [du command in Linux][6] is used for checking the size of a directory. It’s not very straightforward command and it certainly doesn’t give a very good default output.

Compared to that, ncdu is a lot better than providing the relevant information at the first glance.

![][7]

There are other features here such as showing the disk usage in graphs, sort the display and even delete directories interactively.

It is based on ncurses and hence the ‘nc’ is added to ‘du’. A similar CLI tool is [gdu][8] which is a du replacement written in Go which gives it a performance boost.

### Htop: Alternative to top command

The top command in works as the task manager in Linux terminal. It is a good tool for looking at running processes and resource consumption but [understanding and using the top command][9] could be complicated.

[Htop][10] on the other hand has a pretty, colorful output and a more intuitive interface than the top command. You can scroll vertically and horizontally, configure the displayed information graphically etc. You can kill processes interactively right from the output screen of htop.

![][11]

### fd: Alternative to the find command

The find command is one of the most powerful and most used Linux commands. It’s impossible to imagine that a sysadmin could survive without using the find command.

But the find command has a strange structure and it could be slow if you do a large set of find operations.

A better and faster alternative is [fd command][12]. Written in Rust, fd is simpler and faster than its legacy competitor.

![][13]

### exa: Alternative to ls command

The [exa CLI tool][14] adds a few features while listing directory contents. It has better defaults and uses colors to distinguish file types and metadata. exa can also display a file’s extended attributes, as well as standard filesystem information such as the inode, the number of blocks, and a file’s various dates and times.

You can use the tree view to see directory structure. It also has built-in Git support to see what files have changed, committed and staged etc.

![][15]

### Duf: Alternative to the df command

The [df command in Linux][16] is used for checking disk space. While it works most of the time, an easier and better alternative is [duf][17], a tool written in Go.

It gives you an overview of all the devices mounted which is easy to understand. You also have the ability to specify a directory/file name and check free space for that mount point.

With duf, you can sort the output, list indoe information and even save the output in JSON format.

![][18]

### Tldr: Alternative to man command

I know the purist says that there is no alternative to the [man pages in Linux][19]. But man pages could be too detailed and complicated at times to read and understand.

Enter tldr. TLDR is the popular Internet jargon for ‘to long didn’t read’. And that’s the idea behind the creation of tldr. If you find man pages too long to read, [tldr simplifies][20] that by providing practical examples of the command.

![][21]

### Neovim: Alternative to Vim

I hope I am not committing a blasphemy here but a better Vim is not Emacs, it’s [Neovim][22].

Years ago, Vim came up as an improvement to the legacy Vi editor. A few years back, Neovim came up with the idea to extend Vim as an IDE.

It adds modern terminal features such as cursor styling, focus events, bracketed paste etc. with a built-in terminal emulator. The best thing is that you don’t need to unlearn Vim to start using Neovim.

### Your choice?

Again, these alternative commands should not be considered as a drop-in replacement, specially if you manage numerous Linux systems. You may not find and install them on all the systems. They are good only if you have full control on your Linux machine(s).

Keeping that aside, did you find some good alternative command line tools in this list? Which one is it? Also, do you know some other tools that could ‘replace’ the legacy UNIX commands? Why not share it with us in the comment section?

--------------------------------------------------------------------------------

via: https://itsfoss.com/legacy-linux-commands-alternatives/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://academy.itsfoss.com/
[2]: https://itsfoss.com/download-files-from-linux-terminal/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/httpie-screenshot.jpg?resize=800%2C399&ssl=1
[4]: https://github.com/sharkdp/bat
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/bat-command-example.png?resize=656%2C450&ssl=1
[6]: https://linuxhandbook.com/find-directory-size-du-command/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2022/01/ncdu-command-example-800x448.png?resize=800%2C448&ssl=1
[8]: https://itsfoss.com/gdu/
[9]: https://linuxhandbook.com/top-command/
[10]: https://htop.dev/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2022/01/htop-example-800x453.webp?resize=800%2C453&ssl=1
[12]: https://github.com/sharkdp/fd
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/fd-command.webp?resize=800%2C514&ssl=1
[14]: https://itsfoss.com/exa/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_exa_all_flags.webp?resize=800%2C600&ssl=1
[16]: https://linuxhandbook.com/df-command/
[17]: https://itsfoss.com/duf-disk-usage/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-screenshot.jpg?resize=800%2C481&ssl=1
[19]: https://itsfoss.com/linux-man-page-guide/
[20]: https://itsfoss.com/tldr-linux-man-pages-simplified/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/tldr-example-800x594.png?resize=800%2C594&ssl=1
[22]: https://neovim.io/
