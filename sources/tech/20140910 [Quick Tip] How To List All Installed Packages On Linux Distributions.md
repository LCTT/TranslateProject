2q1w2007翻译中
[Quick Tip] How To List All Installed Packages On Linux Distributions
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/linux-790x536.png)

To list all installed package on a Linux system depends on which distribution you are running and the package management mode used.

In this tutorial, we are going to look at commands on some of the notable and popularly used distros.

**NOTE**: You can pipe the less command OR redirected to a text file using the redirection operator (>). Below are examples

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

Good day.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-list-installed-packages-linux-distributions/

作者：[Enock Seth Nyamador][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/