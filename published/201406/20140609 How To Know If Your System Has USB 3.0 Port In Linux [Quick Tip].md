[小白技巧]如何在Linux中知道你的系统是否有USB 3.0 端口
================================================================================

近来的大多数的新计算机都有了USB 3.0接口了。但是**你怎么知道你的计算机有没有USB 3.0接口**？这篇短文中，我们会告诉如何在Linux下知道你的系统上有USB 3还是USB3接口。

### 在Linux终端中检测是否有USB 3.0 端口 ###

打开一个终端,并使用下面的命令:

    lsusb

这个命令会显示你系统下USB的总线信息。检查一下结果，如果你看到像“3.0 root hub”字样，这意味着你系统有USB 3.0。比如，在我的电脑上，它这样显示：

![How to find if system has USB 3.0 in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/Know_Usb3_Ubuntu_Linux.jpeg)

这个技巧在所有的Linux系统上，像Ubuntu，Linux Mint，Fedora等等都有效。现在当你知道你有USB 3.0 端口之后，**如何辨别哪个口是USB 3.0,哪个是USB 2.0。

### 辨别哪个口是USB 3.0 ###

通常USB 3.0 口被标记为SS（“Super Speed”的缩写）。如果你的系统制造商没有标记SS或者USB 3,那么你可以检查端口的内部通常是蓝色的。

![find usb 3.0 port](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/usb3.0port.jpg)

我希望这个快捷提示能够帮助你知道你系统是否有USB 3.0 并可以分辨出USB 3.0 口

--------------------------------------------------------------------------------

via: http://itsfoss.com/find-usb-3-port-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
