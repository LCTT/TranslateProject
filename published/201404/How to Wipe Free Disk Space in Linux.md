如何在 Linux 中安全擦除删除的文件
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Wipe-Free-Disk-Space-in-Linux-429965-2.jpg)

**下面的教程将教给所有的 Linux 用户关于如何安全的擦除可用的硬盘驱动器（HDD）、固态硬盘驱动器（SSD）以及 USB 闪存驱动器空间，以使任何人都不能恢复被删除的文件。**

是否有注意到，当你从系统中删除了一个文件，或从回收站中彻底删除后，它就会在文件系统中消失，但是，该文件实际上并未消失，它驻留在你的磁盘驱动器的可用空间中，仍然可以用数据恢复应用程序恢复回来。

这篇教程会提供两种方法。第一种是使用一款名叫 Wipe Free Space 的应用程序，它是由波兰开发者 Bogdan Drozdowski 开发的。第二种方法会使用众所周知的 BleachBit 软件。

虽然 BleachBit 是一款图形应用程序，Wipe Free Spac 是一款命令行软件，但开发者也提供了易用的图形用户界面（GUI），即使初级用户也可以容易使用，用来安全的擦除他们磁盘的可用空间。

> 选编者注：在继续往下阅读之前，最好知道这些应用程序会擦除未被使用的簇和块上的可用空间，也会擦除使用过的块上的所谓“闲置空间”，即删除文件和其他任意数据后可供再次使用的空间。

### 方法 1 - Wipe Free Space & Wipe Free Space GUI ###

从你的 Linux 发布版本的默认软件源仓库中可以很容易的就安装上 Wipe Free Space 命令行应用程序。可以使用基于 RPM 的 Linux 发行版二进制包，也可以直接用源代码来编译安装。

安装完成后，可以从[这儿][1]下载图形用户界面前端程序，保存在 home 目录下，解压缩，然后双击 run.sh （或者在终端窗口下执行 sh run.sh 命令）文件就可以打开。

应用程序打开后，你可以把 wipefreespace 目录的可执行文件路径添加进来，所以点击“浏览”按钮，到 /usr/bin/ 下查找。然后添加要被擦除的文件系统。

确保已经勾选了窗口左边的 "Wipe only with zeros" 选项。如果你需要勾选更多的选项，首先请查看手册来了解怎么使用，因为他们可能会使你的驱动器崩溃。现在，请点击“开始擦除”按钮开始执行。

### 方法 2 - BleachBit ###

这是最容易的方法，建议初级用户使用。从你的 Linux 发布版本的默认软件源仓库中很容易的就可以安装 BleachBit 应用程序。打开它，请确保您在侧边栏上的系统部分选中“可用磁盘空间”选项。点击“清除”按钮开始执行。 

![](http://i1-news.softpedia-static.com/images/news2/How-to-Wipe-Free-Disk-Space-in-Linux-429965-3.jpg)

*BleachBit 的可用空间选项*

整个擦除操作会进行很长时间。在主窗口上你可以看到详细的进度。如果你在这篇教程中遇到问题，别犹豫，在下面发表评论吧。

Wipe Free Space GUI 0.5 下载:

- [Wipe Free Space GUI 0.5 tar.gz][2][binary] [210 KB]
- [Wipe Free Space GUI 0.5 tar.gz][3][sources] [380 KB]


--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Wipe-Free-Disk-Space-in-Linux-429965.shtml

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.softpedia.com/get/System/System-Administration/Wipe-Free-Space-GUI-50722.shtml
[2]:http://sourceforge.net/projects/wipefreespace/files/wipefreespace-gui-java/0.5/WipeFreeSpaceGUI-java-bin-0.5.tar.gz/download
[3]:http://sourceforge.net/projects/wipefreespace/files/wipefreespace-gui-java/0.5/WipeFreeSpaceGUI-java-src-0.5.tar.gz/download