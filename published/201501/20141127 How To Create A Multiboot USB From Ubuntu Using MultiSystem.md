如何在Ubuntu上使用MultiSystem创建多启动USB盘
================================================================================

### 介绍 ###

也许还有不少人不知道**MultiSystem**，它是一个用来在Linux系统中创建多启动usb盘的小型的开源软件。使用这个工具，我们可以在USB中创建任意多的可启动Linux发行版。你所需要的只是网络链接（只在MultiSystem安装的时候需要），以及一个足够大的USB盘，这取决于你想在USB盘中放入发行版的数量。

### 在 Ubuntu 14.10/14.04 安装MultiSystem ###

#### 手动安装: ####

[下载 MultiSystem][1]脚本，并解压到任意地方。进入解压的地址，使用下面的命令运行脚本。

    sudo ./install-depot-multisystem.sh

#### 使用 PPA 安装: ####

当然，你也可以用下面的命令来更简单地使用PPA来安装MultiSystem。

    sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
    wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install multisystem

安装完之后，它会自动打开MultiSystem。只要点击关闭按钮退出。

### 安装之后 ###

MultiSystem 安装完成后，可以插入你的USB，并通过Unity Dash或者菜单运行MultiSystem。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Menu_0012.png)

第一次启动时，MultiSystem界面看起来会像下面这样。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_002.png)

选择USB设备，点击**确认**按钮。如果你看到下面的错误窗口，不必担心，它说的是USB设备没有标签。点击OK让MultiSystem自动设置标签。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Error_003.png)

那么，拔出/重新插入USB，再次运行MultiSystem。选择USB盘，再次点击确认。现在，你被要求确认在USB中安装Grub2.点击OK继续。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/gtkdialog_004.png)

最终，你会高兴地看到MultiSystem的界面。现在，时候创建多启动USB盘。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_005.png)

### 使用 ###

MultiSystem非常容易使用。将ISO文件拖入MultiSystem窗口中。如果不行的话，点击底部的**cd 按钮**来选择ISO文件。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_006.png)

现在，MultiSystem会从ISO中拷贝文件，并让USB可启动。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_007.png)

相似地，你可以在你的USB中加入任意多的发行版。我这次加入了两个Linux发行版：CentOS 6.5和Android。

加完ISO文件后，你会在MultiSystem的主窗口中看到可启动的发行版列表了。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_008.png)

就是这样。我们的多启动USB盘就可以使用了。重启系统，并在BIOS中设置USB优先启动。选择你想要安装的发行版并开始安装系统。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/QEMU_009.png)

此外，MultiSystem含有一些其它的选项：

- Grub 设置
- Grub 和 Burg 的bootloader更新
- 下载 LiveCD
- VirtualBox 安装
- 格式化USB盘
- 还有更多选项

这些额外选项可以在MultiSystem的**菜单**标签里面看到。 

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_010.png)

同样，你也可以在Ubuntu中使用QEMU或者Oracle VirtualBox测试多启动USB盘。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_011.png)

MultiSystem工具是我测试到现在最棒和最有用的一款工具。这款工具对那些想要在他们的机器上安装多个系统的人是非常有用的。在你外出的时候，你不必再携带CD/DVD袋了。只要买一个16GB或者32GB的USB就行，并下载所有你想要的系统，随心所欲的安装系统即可。

并且，一个对于Windows系统用户的好消息是它也支持Windows系统。我在Windows 7上测试过，它可以工作！

享受吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/create-multiboot-usb-ubuntu-using-multisystem/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2
[2]:http://liveusb.info/dotclear/