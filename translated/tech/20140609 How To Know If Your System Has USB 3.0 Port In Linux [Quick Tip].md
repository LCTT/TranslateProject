如何在Linux中知道你的系统是否有USB 3.0 端口[快速技巧]
================================================================================
Most of the new computers come with USB 3.0 ports these days. But **how can you know if your computer has USB 3.0 port** or not? In this quick tip, we shall see how to find if your system has USB 3 or USB 2 in Linux.

### 在Linux终端中检测是否有USB 3.0 端口 ###

打开一个终端,并使用下面的命令:

    lsusb

这个命令会显示你系统下USB的总线信息。检查一下结果，如果你看到像“3.0 root hub”字样，这意味着你系统有USB 3.0。比如，在我的电脑上，它这样显示：

![How to find if system has USB 3.0 in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/Know_Usb3_Ubuntu_Linux.jpeg)

这个技巧在所有的Linux系统上，像Ubuntu，Linux Mint，Fedora等等都有效。现在当你知道你有USB 3.0 端口之后，**如何辨别哪个口是USB 3.0,哪个是USB 2.0。

### 辨别哪个口是USB 3.0 ###

通常USB 3.0 口被标记为SS（“Super Speed”的缩写）。如果你的系统制造商没有标记SS或者USB 3,那么你可以检查端口的内部通常是颜色的。

![find usb 3.0 port](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/usb3.0port.jpg)

我希望这个快捷提示能够帮助你知道你系统是否有USB 3.0 并可以分辨出USB 3.0 口

--------------------------------------------------------------------------------

via: http://itsfoss.com/find-usb-3-port-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
