ncdu – 基于Ncurses库的磁盘使用分析器
================================================================================
[Ncdu][1] (NCurses Disk Usage)  是一个基于Ncurses库的du命令浏览器. 它通过众所周知的[du][2]命令，为用户提供一个快速且容易被使用的接口. 它显示磁盘使用的百分比且允许你通过ncurses库去浏览目录.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-about.png)

### 安装 ###

ncdu已经被移植到大多数linux发行版本，可从官方资源库中安装.

Arch / Manajaro and Derivatives:

    sudo pacman -S ncdu

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu.png)

Ubuntu / Debian / Linux Minut and Derivatives:

    sudo apt-get install ncdu

Fedora and Derivatives:

    sudo yum install ncdu

在[这里][3]检查其他的发行版本.

### 使用 ncdu ###

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

为使用ncdu，请打开终端并且运行

    ncdu

开始扫描目录.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-scanning.png)

当扫描完成后，你能够很容易的查看文件/目录的大小.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/done-scanning.png)

确认删除文件:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-delete-confirm.png)

在[这里][4] 阅读ncdu命令手册或运行:

    man ncdu

**荣誉**: 有两位读者**BasketCase**和**Sama Vim**在阅读[Linux Basics: How To Find Size of Directory Commands][5]之后 向我们推荐Ncdu工具.
注：上面这个链接已经做成原文

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/ncdu-ncurses-disk-usage-analyzer/

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://dev.yorhel.nl/ncdu
[2]:http://www.unixmen.com/linux-basics-find-size-directory-commands/
[3]:http://dev.yorhel.nl/ncdu
[4]:http://dev.yorhel.nl/ncdu/man
[5]:http://www.unixmen.com/linux-basics-find-size-directory-commands/