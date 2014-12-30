Linux有问必答：如何在Debian下安装闭源软件包
================================================================================
> **提问**: 我需要在Debian下安装特定的闭源设备驱动。然而, 我无法在Debian中找到并安装软件包。如何在Debian下安装闭源软件包? 

Debian是一个拥有[48,000][1]软件包的发行版. 这些软件包被分为三类: main, contrib 和 non-free, 主要是根据许可证要求, 参照[Debian开源软件指南][2] (DFSG)。

main软件仓库包括符合DFSG的开源软件。contrib也包括符合DFSG的开源软件，但是依赖闭源软件来编译或者执行。non-free包括不符合DFSG的、可再分发的闭源软件。main仓库被认为是Debian项目的一部分，但是contrib和non-free不是。后两者只是为了用户的方便而维护和提供。

如果你想一直能够在Debian上安装闭源软件包，你需要添加contrib和non-free软件仓库。这样做,用文本编辑器打开 /etc/apt/sources.list 添加"contrib non-free""到每个源。

下面是适用于 Debian Wheezy的 /etc/apt/sources.list 例子。

    deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free
    deb-src http://ftp.us.debian.org/debian/ wheezy main contrib non-free
    
    deb http://security.debian.org/ wheezy/updates main contrib non-free
    deb-src http://security.debian.org/ wheezy/updates main contrib non-free
    
    # wheezy-updates, 之前叫做 'volatile'
    deb http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free
    deb-src http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free

![](https://farm8.staticflickr.com/7562/16063758036_0ef8fce075_b.jpg)

修改完源后, 运行下面命令去下载contrib和non-free软件仓库的文件索引。

    $ sudo apt-get update

如果你用 aptitude, 运行下面命令。

    $ sudo aptitude update

现在你在Debian上搜索和安装任何闭源软件包。

![](https://farm9.staticflickr.com/8593/16089610915_b638fce55d_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-nonfree-packages-debian.html

译者：[mtunique](https://github.com/mtunique)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://packages.debian.org/stable/allpackages?format=txt.gz
[2]:https://www.debian.org/social_contract.html#guidelines
