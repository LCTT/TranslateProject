新OpenSUSE的树莓派镜像
===============================

大家好！请注意，所有的openSUSE的fans们都应该读读这篇重要的文章。你有树莓派吗？你想试试openSUSE吗？你对树莓派和openSUSE很狂热吗？想不想看看它们在一起？真让人激动，ARM版的openSUSE针对树莓派平台发布了一个新的基于ARM v6的[安装镜像][1]。这个新的openSUSE镜像是内核3.6版本，带有轻量级的X11/icewm(ice 窗口管理器)，压缩后仅有82MB。

不用谢我，应该谢Bernhard Wiedeman。如此酷的penSUSE镜像是他使用一个openSUSE的替代镜像自动构建的。还有，你知道它最有趣的地方是什么？Bernhard Wiedeman在一个早上只用3个小时就创建建立了它，真强啊!

如果你对这个Bernhard用来构建基于ARM v6的树莓派镜像写的自动化脚本感兴趣，你可以在[这里][2]找到。这个脚本让每个人都有机会简单的构建自己的镜像，然后分享给全世界其它的openSUSE极客们。Bernhard Wiedeman为我们写了一篇在3分钟内从头构建一个镜像的博客。是的，3分钟！并且每件事都做的尽善尽美。Bernhard Wiedeman的树莓派在55秒内启动成功。你的呢？多少时间完成启动？你能在评论中分享给我们吗？我们会非常开心的听到来自其它用户的体验。

当然，没有什么事情是完美的，剩余的尚未解决的问题还在解决中.下面已经列出了这些剩余的问题。

- 安装文件key初始化不可靠
- 构建脚本没有出错处理

这个新的image相对于之前的image有什么优势?

- 很容的改变镜像大小，因为root分区放到了最后
- 压缩后镜像文件非常小
- 可重复构建镜像，因此更容易定制
- ARM v6带有浮点计算支持，因此更快
- 有超过5200个来自openSUSE:Factory:ARM的成功构建的包
- 举个例子，你可以使用zypper安装xauth twm xorg-x11-server xinit这些包来建立一个轻量级的图形环境，  之后使用startx启动它。

好了伙计们，这可不是PiSUSE去娱乐的时间，我的意思是快去试试在你的树莓派上安装openSUSE，不要喝太多的啤酒。openSUSE的伙计们快乐！

Source: [openSUSE Lizards][3]

via: http://www.unixmen.com/new-opensuse-raspberry-pi-image/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf01]:http://linux.cn/space/flsf01
[wxy]:http://linux.cn/space/wxy

[1]:http://www.zq1.de/~bernhard/linux/opensuse/raspberrypi-opensuse-20130907.img.xz
[2]:https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:RaspberryPi/altimagebuild
[3]:https://lizards.opensuse.org/2013/09/07/new-raspberry-pi-image/

