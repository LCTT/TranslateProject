如何在终端下截取一个完整长度的网页截图
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Screenshot-790x526.png)


与其记笔记或是把看到的内容发送给其他人，我们更经常通过截屏来帮助我们记忆。
但是通常情况下，如果一个网页超出了屏幕高度，我们就得用多张截图去截取其全部内容。

对于 Linux，你将会有一个更好的解决方案：使用一个 GNOME 的应用来截取某个链接的整个页面。
这个应用叫做 **gnome-web-photo**，这篇文章将介绍如何安装和使用它。

在 Ubuntu 和 Debian 的分支下：

    $ sudo apt-get install gnome-web-photo

在 Fedora 下：

    $ sudo yum install gnome-web-photo

但是对于 CentOS 和其他 RedHat 分支的用户，请注意 `gnome-web-photo` 依赖 GTK+ 3.0 这个软件包。
也就是说 `gnome-web-photo` 是和 **CentOS/RHEL 6 自带的 GNOME 2 不相兼容的**。

要为一个网页截图：

    $ gnome-web-photo -t 0 --mode=photo http://www.unixmen.com output.png

上面这条命令将为 Unixmen 的主页截取一个完整长度的截图，并保存在当前工作目录下。

输出样例：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/output2.png) 

**-t** 这个参数可以设置生成截图的超时时间。**-t 0** 则表示禁用超时参数。

**通过** gnome-web-photo，你可以用下面的命令为一个网页生成一个缩略图：（默认大小是 **256×256**，但是可以通过 “**-s**” 来指定缩略图的大小）

    $ gnome-web-photo -t 0 -s 128 --mode=thumbnail http://www.unixmen.com output.png

输出样例：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/output.png)

如果你想将网页截取成一个可供打印的多页 PDF 文档，你可以输入下面的命令：

    $ gnome-web-photo -t 0 --mode=print http://www.unixmen.com output.pdf

注意这个应用并不支持 **.jpg** 格式。

这个应用应该对各类用户都有所帮助。我经常对网页进行缩略图和完整长度的截图，希望对你也有所帮助。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/take-full-length-screenshots-websites-via-terminal/

译者：[VizV](https://github.com/vizv) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
