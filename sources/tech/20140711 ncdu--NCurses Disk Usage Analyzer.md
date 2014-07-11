hunanchenxingyu translating....
================================================================================
ncdu – NCurses Disk Usage Analyzer
================================================================================
[Ncdu][1] (NCurses Disk Usage)  is a ncurses-based du viewer. It provides a fast and easy-to-use interface through the well-known [du][2] command. It displays percentages of disk usage and also allow you to browse through directories via ncurses library.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-about.png)

### Installation ###

ncdu has been ported to most Linux distros and can be installed via official repos.

Arch / Manajaro and Derivatives:

    sudo pacman -S ncdu

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu.png)

Ubuntu / Debian / Linux Minut and Derivatives:

    sudo apt-get install ncdu

Fedora and Derivatives:

    sudo yum install ncdu

Check [here][3] for other distros.

### Using ncdu ###

Keys:


- up, k         —  Move cursor up
- down, j      – Move cursor down
- right/enter — Open selected directory
- left, <, h   — Open parent directory
- n             — Sort by name (ascending/descending)
- s             — Sort by size (ascending/descending)
- C            – Sort by items (ascending/descending)
- d            – Delete selected file or directory
- t             — Toggle dirs before files when sorting
- g            – Show percentage and/or graph

To use ncdu, Open your terminal and run

    ncdu

this starts scanning the directories.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-scanning.png)

When scanning is done you can easily see the file / directory sizes.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/done-scanning.png)

Delete file confirm:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-delete-confirm.png)

Read the ncdu manual [here][4] or run:

    man ncdu

**Credit**: Ncdu was suggested by two of our readers **BasketCase** and **Sama Vim** in the post [Linux Basics: How To Find Size of Directory Commands][5].
注：上面这个链接已经做成原文

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/ncdu-ncurses-disk-usage-analyzer/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://dev.yorhel.nl/ncdu
[2]:http://www.unixmen.com/linux-basics-find-size-directory-commands/
[3]:http://dev.yorhel.nl/ncdu
[4]:http://dev.yorhel.nl/ncdu/man
[5]:http://www.unixmen.com/linux-basics-find-size-directory-commands/