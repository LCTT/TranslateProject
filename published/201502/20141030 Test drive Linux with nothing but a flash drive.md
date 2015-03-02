试试只用U盘加载Linux系统
================================================================================

也许你听过Linux并对它有点好奇，终于想要实际体验一下，但可能不知道从哪儿开始。

很可能你已经在网上搜索过一些信息，然后遇到一些像双系统和虚拟机这样的词汇。它们对你来说也许太专业了，所以你肯定不会仅仅为了尝试一下Linux而牺牲正在使用的操作系统。那我们该怎么办？

如果你手上正好有个U盘的话，那就可以试试做一个USB Linux启动盘。它是一个包含了整个操作系统并可以直接引导开机的U盘。创建它并不需要什么专业技术能力，让我们来看看怎么做，以及如何从USB引导进入Linux系统。

![Penguins gathered together: Linux for the win](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png)
 
### 你需要准备的 ###

除了一台台式机或笔记本电脑外，你还需要：

- 一个空白的U盘-最好容量能有4GB或更多。
- 一个你想尝试的Linux发行版[ISO镜像][1]（一种把所有磁盘内容打包起来的档案文件）。待会再详细介绍。
- 一个叫[Unetbootin][2]的应用程序，它是一个开源的，跨平台的工具，用来创建USB启动盘。运行它并不需要启动Linux。在下面的教程中，我是在MacBook上运行的Unetbootiin（LCTT 译注：它还有 Windows 和 Linux 版本）。

### 开始干活 ###

把U盘插到你电脑的USB端口上，然后启动Unetbootin。然后会要求你输入当前电脑的登录密码。

![Unetbootin main window](http://opensource.com/sites/default/files/images/life-uploads/unetbootin-main.png)

还记得之前提到的ISO镜像文件吗？有两种方式可以获得：要么自己从你想尝试的Linux发行版网站上下载，或者让Unetbootin帮你下载。如果选后者，在窗口顶部点击**选择发行版**，选择你想下载的发行版，然后点击**选择版本**来选择你希望尝试的发行版版本。

![Downloading a Linux distribution](http://opensource.com/sites/default/files/images/life-uploads/unetbootin-download-distro.png)

或者，你也可以自己下载发行版。通常，我想尝试的Linux发行版都没有在列表中。如果选择自己下载，那么点击**磁盘镜像**，然后点击按钮来选择你下载好的.iso文件。

注意到下面的选项**预留每次重新启动后保存文件的空间（仅Ubuntu有效）**吗？如果你尝试的是Ubuntu或它的任一个衍生版（比如Lubuntu或Xubuntu），你可以在U盘上留出几M空间用来保存文件，比如网页书签或你自己创建的文档。当用这个U盘下次启动Ubuntu的时候，你可以继续使用这些文件。

![Ready to create a live USB](http://opensource.com/sites/default/files/images/life-uploads/unetbootin-ready-to-go.png)

在加载好ISO镜像后，点击**确定**。Unetbootin大概需要不到10分钟来创建USB启动盘。

![Creating the live USB](http://opensource.com/sites/default/files/images/life-uploads/unetbootin-creating-disk.png)

### 检验USB启动盘 ###

这个时候，你需要拥抱一下自己内在的极客精神。这不会太难，不过你将需要进入[BIOS][3]去偷看一下你的电脑内部空间。你的电脑的BIOS会加载各种硬件，并控制电脑操作系统的引导或启动。

BIOS通常会按这个顺序搜索操作系统（或者类似的顺序）：硬盘，然后是CD/DVD光驱，然后是外部存储设备。你需要调整这个顺序，让外部存储设备（在这里，指的是你的U盘启动盘）成为BIOS第一个搜索的设备。

要做到这一点，请把U盘插到电脑上再重启电脑。在看到提示信息**Press F2 to enter setup**之后，按它要求的做。在有的电脑上，这个键可能是F10。

在BIOS里，用键盘上的向右方向键切换到**Boot**菜单。然后你将看到你电脑上的驱动器列表。使用键盘上的向下方向键选中名字为**USB HDD**的选项，然后按下**F6**移动这个选项到列表的顶部。

完成后，按下**F10**来保存改动。然后你会从BIOS里被踢出来，然后电脑会自己启动。等一小会，你就会看到一个你正在尝试的Linux发行版的启动菜单。选择**Run without installing**（或者最类似的选项）。

在进入桌面后，你可以连接上无线或有线网络，看看网页，试一试预装的软件。你还可以看看，比如说，你的打印机或扫描仪是否能在你试的这个发行版下正常工作。你要是真的想不开，也可以去摸一下命令行。

### 能干什么 ###

根据你尝试的Linux发行版和你使用的U盘的速度，操作系统可能会需要较长的时间来加载，而且很可能比直接装到硬盘上会慢一点。

还有，你也只能运行Linux发行版里预装好的基本软件。通常会有网页浏览器，一个文字处理软件，一个文本编辑器，一个媒体播放器，一个相片浏览器，以及一套实用工具。这些应该足够给你使用Linux的感觉了。

如果你决定使用Linux，你可以双击安装器从U盘安装到硬盘。

--------------------------------------------------------------------------------

via: https://opensource.com/life/14/10/test-drive-linux-nothing-flash-drive

作者：[Scott Nesbitt][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:http://en.wikipedia.org/wiki/ISO_image
[2]:http://unetbootin.sourceforge.net/
[3]:http://en.wikipedia.org/wiki/BIOS
