每日Ubuntu技巧 ：让Trusty Tahr变得更好
================================================================================

Ubuntu 14.04 Trusty Tahr 已发布，如果你是其中之一的安装者，你需要做一些事来提升你的使用体验。

对于那些升级，这可能已经做完了，你不必再去做它，除非你没有在Ubuntu 13.10 里做这些。

Ubuntu 并不是完全开箱即用的。有一些可以提升体验的包和工具由于合法问题被Canonical排除在外。

这些包如果没有安装，会使观看电影，播放flash视频和收听MP3文件变得困难。由于法律或者其他原因，Ubuntu的父公司将它们排除在外。

如果你希望做上面这些事情，你必须继续下去来学习如何解决这些问题。

对于已经安装Ubuntu 13.10 并且准备升级的人，[阅读这篇文章][1]，或者点击下面的链接。

当你已经升级或者安装好了Ubuntu 14.04，打开你的命令行，接着运行下面的命令来安装缺失的可以在Ubuntu上更简易地播放媒体文件的包。

    sudo apt-get install ubuntu-restricted-extras

当提示输入密码后，按回车继续。在安装完后，继而测试你的系统。这个包帮助安装Adobe Flash Player，MP3编码器，这样你就可以收听MP3音乐，电影插件来观看合法的DVD电影，和其他有用的事。

因此，无论你何时安装Ubuntu，首先试着安装这个包。这会在你使用Ubuntu时，提升你的一点体验。

这还有一种情况是你想要观看加密的DVD电影。在这种情形下，你需要运行下面的命令。

    sudo apt-get install libavformat-extra-54 libavcodec-extra-54 libdvdread4

接着运行下面的命令，你就完成了。

    sudo /usr/share/doc/libdvdread4/install-css.sh

最后，安装VLC媒体播放器，这是一个在Windows和Linux系统上一个很棒的观看DVD电影的程序。

    sudo apt-get install vlc

希望这对你有帮助。

祝你体验愉快！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-make-ubuntu-14-04-trusty-tahr-perform-better/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-upgrade-to-ubuntu-14-04-trusty-tahr-from-13-10/
