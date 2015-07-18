Linux有问必答：如何为在Linux中安装兄弟牌打印机
================================================================================
> **提问**: 我有一台兄弟牌HL-2270DW激光打印机，我想从我的Linux机器上打印文档。我该如何在我的电脑上安装合适的驱动并使用它？

兄弟牌以买得起的[紧凑型激光打印机][1]而闻名。你可以用低于200美元的价格得到高质量的WiFi/双工激光打印机，而且价格还在下降。最棒的是，它们还提供良好的Linux支持，因此你可以在Linux中下载并安装它们的打印机驱动。我在一年前买了台[HL-2270DW][2]，我对它的性能和可靠性都很满意。

下面是如何在Linux中安装和配置兄弟打印机驱动。本篇教程中，我会演示安装HL-2270DW激光打印机的USB驱动。

首先通过USB线连接你的打印机到Linux上。

### 准备 ###

在准备阶段，进入[兄弟官方支持网站][3]，输入你的型号（比如：HL-2270DW）搜索你的兄弟打印机型号。

![](https://farm1.staticflickr.com/301/18970034829_6f3a48d817_c.jpg)

进入下面页面后，选择你的Linux平台。对于Debian、Ubuntu或者其他衍生版，选择“Linux (deb)”。对于Fedora、CentOS或者RHEL选择“Linux (rpm)”。

![](https://farm1.staticflickr.com/380/18535558583_cb43240f8a_c.jpg)

下一页，你会找到你打印机的LPR驱动和CUPS包装器驱动。前者是命令行驱动，后者允许你通过网页管理和配置你的打印机。尤其是基于CUPS的图形界面对（本地、远程）打印机维护非常有用。建议你安装这两个驱动。点击“Driver Install Tool”下载安装文件。

![](https://farm1.staticflickr.com/329/19130013736_1850b0d61e_c.jpg)

运行安装文件之前，你需要在64位的Linux系统上做另外一件事情。

因为兄弟打印机驱动是为32位的Linux系统开发的，因此你需要按照下面的方法安装32位的库。

在早期的Debian(6.0或者更早期)或者Ubuntu（11.04或者更早期），安装下面的包。

    $ sudo apt-get install ia32-libs

对于已经引入多架构的新的Debian或者Ubuntu而言，你可以安装下面的包：

    $ sudo apt-get install lib32z1 lib32ncurses5

上面的包代替了ia32-libs包。或者你只需要安装：

    $ sudo apt-get install lib32stdc++6

如果你使用的是基于Red Hat的Linux，你可以安装：

    $ sudo yum install glibc.i686 

### 驱动安装 ###

现在解压下载的驱动文件。

    $ gunzip linux-brprinter-installer-2.0.0-1.gz

接下来像下面这样运行安装文件。

    $ sudo sh ./linux-brprinter-installer-2.0.0-1

你会被要求输入打印机的型号。输入你打印机的型号，比如“HL-2270DW”。

![](https://farm1.staticflickr.com/292/18535599323_1a94f6dae5_b.jpg)

同意GPL协议之后，接受接下来的任何默认问题。

![](https://farm1.staticflickr.com/526/19130014316_5835939501_b.jpg)

现在LPR/CUPS打印机驱动已经安装好了。接下来要配置你的打印机了。

### 打印机配置 ###

我接下来就要通过基于CUPS的网页管理和配置兄弟打印机了。

首先验证CUPS守护进程已经启动。

    $ sudo netstat -nap | grep 631

打开一个浏览器输入 http://localhost:631 。你会看到下面的打印机管理界面。

![](https://farm1.staticflickr.com/324/18968588688_202086fc72_c.jpg)

进入“Administration”选项卡，点击打印机选项下的“Manage Printers”。

![](https://farm1.staticflickr.com/484/18533632074_0526cccb86_c.jpg)

你一定在下面的页面中看到了你的打印机（HL-2270DW）。点击打印机名。

在下拉菜单“Administration”中，选择“Set As Server Default”。这会设置你的打印机位系统默认打印机。

![](https://farm1.staticflickr.com/472/19150412212_b37987c359_c.jpg)

当被要求验证时，输入你的Linux登录信息。

![](https://farm1.staticflickr.com/511/18968590168_807e807f73_c.jpg)

现在基础配置已经基本完成了。为了测试打印，打开任何文档浏览程序（比如：PDF浏览器）并打印。你会看到“HL-2270DW”被列出并被作为默认的打印机设置。

![](https://farm4.staticflickr.com/3872/18970034679_6d41d75bf9_c.jpg)

打印机应该可以工作了。你可以通过CUPS的网页看到打印机状态和管理打印机任务。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-brother-printer-linux.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/brother_printers
[2]:http://xmodulo.com/go/hl_2270dw
[3]:http://support.brother.com/
