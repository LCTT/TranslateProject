MultiWriter：同时将 ISO 镜像并发写入 20 个  USB 启动盘
================================================================================
**我的问题是如何把一个Linux ISO 文件烧录到 17 个  USB 启动盘？**

精通代码的人会写一个 bash 脚本来自动化处理，而大部分的人会使用像 USB 启动盘创建器这样的图形用户界面工具来把 ISO 文件一个、一个的烧录到驱动盘中。但剩下的还有一些人也许会很快得出结论，两种方法都不太理想。

### 问题 > 解决 ###

![GNOME MultiWriter in action](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/gnome-multi-writer.jpg)

*GNOME MultiWriter 在运行当中*

Richard Hughes，一个 GNOME 开发者，也面临着类似的困境。他要创建一批预装操作系统的 USB 启动盘，需要一个足够简单的工具，使得像他父亲这样的用户也能使用。

他的反应是开发**品牌性的新应用程序**，使上面的两种方法合二为一，创造出易用的一款工具。

它的名字就叫 “[GNOME MultiWriter][1]”，可以同时把单个的 ISO 或 IMG 文件写入多个 USB 驱动盘。

它不支持个性化自定义或命令行执行的功能，使用它就可以省掉浪费一下午的时间来对相同的操作的重复动作。

您需要的就是这一款应用程序、一个 ISO 镜像文件、一些拇指驱动盘以用许多空 USB 接口。

### 用例和安装 ###

![The app can be installed on Ubuntu](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/mutli-writer-on-ubuntu.jpg)

*该应用程序可以在 Ubuntu 上安装*

这款应用程序的定义使用场景很不错，正适合使用于预装正要发布的操作系统或 live 映像的 USB 启动盘上。

那就是说，任何人想要创建一个单独可启动的 USB 启动盘的话，也是一样的适用 - 因我用 Ubuntu 的内置磁盘创建工具来创建可引导的映像从来没有一次成功过的，所以这方案对我来说是个好消息！

它的开发者 Hughes 说它**最高能支持20个 USB 启动盘**，每个盘的大小在 1GB 到 32GB之间。

GNOME MultiWriter 也有不好的地方（到现在为止）就是它还没有一个完结、稳定的成品。它是能工作，但在早期的时候，还没有可安装的二进制版本或可添加到你庞大软件源的 PPA。

如果您知道通常的 configure/make 的操作流程的话，可以获取其源码并随时都可以编译运行。在 Ubuntu14.10 系统上，你可能还需要首先安装以下软件包：

    sudo apt-get install gnome-common yelp-tools libcanberra-gtk3-dev libudisks2-dev gobject-introspection

如果您可以运行起来，已经玩转的话，给我们分享下您的感受！

此项目托管在 GitHub 上，盼望对其提出问题缺陷和发起 pull 请求，在上面也可以找到压缩包下载，进行手动安装。

- [Github 上的 GNOME MultiWriter][1]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/01/gnome-multiwriter-iso-usb-utility

作者：[Joey-Elijah Sneddon][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://github.com/hughsie/gnome-multi-writer/
