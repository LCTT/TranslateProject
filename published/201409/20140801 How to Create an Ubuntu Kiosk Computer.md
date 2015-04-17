如何创建Ubuntu 信息亭（kiosk）
================================================================================

**Linux发行版可以作为全功能打包，也可以按需分解，它驱动了从市内标示牌到市议会桌面系统在内的所有设备。**

正是这种多样化，几乎可塑的质量，让Linux发行版，包括Ubuntu在内，在众多不同领域如此成功。

### 信息亭和单功能计算机 ###

Ubuntu更为流行的使用之一，是在**信息亭（kiosk）类计算机**中。这些设备趋向于运行功能剥离的，或者功能有限的OS版本，只允许**一个单一应用运行**。

信息亭计算机可以设置提供短时的或者被动的访问，适用于网吧或只能让用户访问特定功能时（如网页浏览器）。

### 构建Ubuntu信息端 ###

但你会怎样来创建这样一台计算机？好吧，不用去Google了。Linux开发者Oli Warner最近发布了两篇文章，介绍了使用Ubuntu 14.04和Google Chrome来创建单一功能的设备。

他的第一篇指南从零开始，使用Ubuntu Server和少量的软件包来创建一个轻量级的X和Openbox的组合，开机启动Chrome。该安装需要最多2GB的磁盘空间和仅仅512MB的内存来运行。

- [从零开始构建信息亭计算机][1]

第二篇教程反其道而行，一步一步介绍了将一个现存的Ubuntu桌面安装转变为一个更轻巧的单一功能的变形版本。

- [将Ubuntu转换成信息亭计算机][2]


两个指南都不是给那些胆小的新手的，而对于大多数中级水平的用户而言却是简单易行的。跟着指南来获得一次实用的安装体验，不要畏首畏尾，大胆去剥离一些深层次的包和进程，或者加固安全吧，特别是如果想要在公共环境中使用时。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/07/create-ubuntu-kiosk

作者：[Joey-Elijah Sneddon][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://thepcspy.com/read/building-a-kiosk-computer-ubuntu-1404-chrome
[2]:http://thepcspy.com/read/converting-ubuntu-desktop-to-kiosk/
