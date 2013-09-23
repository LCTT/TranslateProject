new OpenSUSE树莓派image
===============================

大家好!注意,所有的openSUSE的fans们应该读这篇重要的文章.你有树莓派吗?你想试试openSUSE?你对树莓派和openSUSE很狂热?你想看看它们在一起?ARM版的open
SUSE操作系统针对树莓派平台有一个新的ARMv6-based images(映像文件).这是内核3.6版本新的openSUSE image,轻量级的X11/icewm(ice 窗口管理器)和仅有82MB压缩包.

这不要谢我,应该谢Bernhard Wiedeman. 如此酷的penSUSE image是他使用一个image自动构建的.还有,你知道它最有趣的地方?Bernhard Wiedeman在一个早上用3个小时建立了它,技术高超的家伙!

如果你对这个Bernhard为构建树莓派armv6基础image写的自动化脚本感兴趣,你可以在这里[here][1]找到.这个脚本给每个人机会很简单的构建自己的images分享给全世界其余的openSUSE极客.Bernhard Wiedeman为我们写了一篇在3分钟从头构建一个image的博客.是的,3分钟,并且每件事都用尽可能完美的途径.Bernhard Wiedeman的树莓派在55秒内启动成功.你的呢?多少时间完成启动?你能在评论中分享给我们吗?我们会非常开心的听到来自其它用户的经历.

当然,没有什么完美的,剩余的开放问题将自动处理.下面已经列出了这些剩余的问题.

- the repo key is initially untrusted(安装文件key初始化不可靠)
- build scripts have no error handling(构建脚本没有出错处理)

这个新的image相对于之前的image有什么优势?

- 更简单的改变大小因为root分区是最后一个
- 压缩的image 文件非常小
- 可重复构建image,因此更容易定制
- armv6 浮点支持,因此更快
- 我们有超过5200个来自openSUSE:Factory:ARM成功构建的包
- 举个例子,你可一使用zypper安装一个轻量级图形环境 xauth twm xorg-x11-server xinit 之后使用startx开启它.

好了伙计们,PiSUSE快乐时间,我的意思是快去试试在你的树莓派上安装openSUSE,不要喝啤酒. openSUSE伙计们快乐!
Source: [openSUSE Lizards][2]

via: http://www.unixmen.com/new-opensuse-raspberry-pi-image/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:RaspberryPi/altimagebuild
[2]:https://lizards.opensuse.org/2013/09/07/new-raspberry-pi-image/

