ncdu – 基于ncurses库的磁盘使用分析器
================================================================================
[Ncdu][1] (NCurses Disk Usage)  是一个基于Ncurses库的du命令的界面。它通过大家熟知的[du][2]命令，为用户提供一个快速且容易被使用的界面。它可以显示磁盘使用的百分比，且允许你使用ncurses库的方式在目录之间导航。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-about.png)

### 安装 ###

ncdu已经被移植到大多数linux发行版本，可从官方资源库中安装.

Arch / Manajaro 及其衍生版:

    sudo pacman -S ncdu

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu.png)

Ubuntu / Debian / Linux Minut 及其衍生版:

    sudo apt-get install ncdu

Fedora  及其衍生版:

    sudo yum install ncdu

在[这里][3]可以找到其他的发行版。

### 使用 ncdu ###

键盘操作:


- up, k         — 向上移动光标
- down, j      – 向下移动光标
- right/enter — 打开选定的目录
- left, <, h   — 打开父目录
- n             — 按文件名排序（升序/降序）
- s             — 按文件大小排序（升序/降序）
- C            – 按项目数排序（升序/降序）
- d            – 删除选定的文件或目录
- t             — 排序时将目录放在文件前面
- g            – 以图形方式显示百分比

为使用ncdu，请打开终端并且运行

    ncdu

开始扫描目录.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-scanning.png)

当扫描完成后，你能够很容易的看到文件/目录的大小.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/done-scanning.png)

确认删除文件:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/ncdu-delete-confirm.png)

在[这里][4] 阅读ncdu命令手册或运行:

    man ncdu

**荣誉**: 有两位读者**BasketCase**和**Sama Vim**在阅读“[Linux基础：如何在命令行中查看目录的大小][5]”之后 向我们推荐了这个Ncdu工具。


Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/ncdu-ncurses-disk-usage-analyzer/

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://dev.yorhel.nl/ncdu
[2]:http://www.unixmen.com/linux-basics-find-size-directory-commands/
[3]:http://dev.yorhel.nl/ncdu
[4]:http://dev.yorhel.nl/ncdu/man
[5]:http://linux.cn/article-3473-1.html