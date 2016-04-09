怎么在Linux发行版下列出所有安装了的包
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/linux-790x536.png)

列出所有安装了的包的方法取决于你用什么发行版以及包管理器。

在这个教程里，我们将提供主流发行版的命令。

**注意**: 你可以用管道筛选或者用重定向符（>）来把结果重定向到一个文件。例子如下。

    example | less

----------

    example > installed_packages.txt

### Red Hat/Fedora Core/CentOS Linux: ###

    rpm -qa

### FreeBSD / OpenBSD: ###

    pkg_info

### Arch Linux: ###

    pacman -Qq

### Ubuntu / Debian / Linux Mint: ###

    dpkg --get-selections

----------

    dpkg --list

----------

    dpkg -l

祝你一天好心情。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-list-installed-packages-linux-distributions/

作者：[Enock Seth Nyamador][a]
译者：[2q1w2007](https://github.com/2q1w2007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/