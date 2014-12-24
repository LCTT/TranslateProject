Linux FAQs with Answers--How to install non-free packages on Debian
================================================================================
> **Question**: I need to install some proprietary device driver on Debian, which is part of a non-free package. However, I cannot find and install the package in my Debian box. How can I install non-free packages on Debian? 

The Debian project is distributed as a collection of packages, [48,000][1] of them, as of Debian Wheezy. These packages are categorized into three areas: main, contrib and non-free, mainly based on licensing requirements, e.g., [Debian Free Software Guidelines][2] (DFSG).

The main area contains free software that complies with DFSG. The contrib area contains free software that complies with DFSG, but relies on non-free software for compilation or execution. Finally, the non-free area contains non-free packages that are not compliant with DFSG but redistributable. The main repository is considered a part of Debian, but neither contrib or non-free repository is. The latter two are maintained and provided only as a convenience to users.

If you want to install a non-free package maintained by Debian, you need to enable contrib and non-free repositories. To do so, open /etc/apt/sources.list with a text editor, and append "contrib non-free" to each source.

The following is an example of /etc/apt/sources.list for Debian Wheezy.

    deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free
    deb-src http://ftp.us.debian.org/debian/ wheezy main contrib non-free
    
    deb http://security.debian.org/ wheezy/updates main contrib non-free
    deb-src http://security.debian.org/ wheezy/updates main contrib non-free
    
    # wheezy-updates, previously known as 'volatile'
    deb http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free
    deb-src http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free

![](https://farm8.staticflickr.com/7562/16063758036_0ef8fce075_b.jpg)

After modifying sources of packages, run the following command to download package index files for contrib and non-free repositories.

    $ sudo apt-get update

If you are using aptitude, run the following instead.

    $ sudo aptitude update

Now you are ready to search and install any non-free package on Debian.

![](https://farm9.staticflickr.com/8593/16089610915_b638fce55d_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-nonfree-packages-debian.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://packages.debian.org/stable/allpackages?format=txt.gz
[2]:https://www.debian.org/social_contract.html#guidelines