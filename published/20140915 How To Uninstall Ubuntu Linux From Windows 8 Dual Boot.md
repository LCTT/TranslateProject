从Windows双启动中卸载Ubuntu Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Guide_Uninstall_Ubuntu_Windows_dual_Boot.jpeg)

我在过去已经多次涉及到[在UEFI模式下安装Ubuntu 14.04与Windows 8/8.1双启动][1]的话题。 但是要怎么从**Windows双启动中卸载Ubuntu呢**？下面我们将看到的教程适用于任意的Linux操作系统，如Ubuntu，Linux Mint，Elementary OS或其它任意Linux发行版。

如果你认为[在双启动模式下安装Ubuntu与Windows 8共存][2]是件难事，而从Windows双启动中移除Ubuntu将是很简单的，你的想法并不是完全错误的。如果你有个Windows安装介质的话，从Windows双启动中卸载Linux将是轻而易举的。

这个教程将教你如何在有**Windows 8/8.1安装介质**的情况下将Linux从Windows 8或Windows 8.1双启动中完全移除。

### 将Ubuntu从Windows 8双启动中安全卸载 ###

你有没有Windows 8安装介质以及是否已经安装了Windows 8.1在你系统上这都不重要。它同样工作得很好。但是我不能说在Windows 7上也一样。如果你身边有Windows安装盘，让我们开始从Windows双启动中移除Ubuntu的进程吧。

从双启动中删除Linux分为两部分。第一部分是删除Linux安装的所在分区。第二部分是修复Windows启动引导，因为简单地将Linux分区删除会引起[“Grub rescue”错误][3]。

### 第一部分：在Windows下删除Linux分区 ###

**第一步：**

登录Windows。按下 **Windows+R** 然后在其中运行 diskmgmt.msc 命令。它将会打开Windows磁盘管理工具。 

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Disk_Mgmt.jpg)

**第二步：**

在你安装了Linux之后，就能很容易地从大小上分辨出Linux分区。另一个分辨Linux分区的提示是找没有文件系统以及驱动器卷标的分区。Windows分区通常用卷标进行标记，比如C，D，E等等，而且通常是NTFS或FAT文件系统。

就像你所能看到的，我在这里有三个Linux分区，因为我在安装Ubuntu时单独地创建了根分区(root)，交换分区(swap)和家目录(home)。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot.jpg)

**Step 3:**
**第三步：**

选择Linux分区，右键点击并选择 **删除卷** 选项。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_1.jpg)

如果出现了警告，在这里选择是即可。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_2.jpg)

**Step 4:**
**第四步：**

被删除的分区会变成一块可用的空闲空间。你可以用它来扩展已有的卷或创建一个新的Windows分区。我会建议你创建一个新的驱动器（或是卷或者分区，随便你怎么叫），因为这样子万一你将来又想将Linux和Winodws双启动时会简单一点。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_From_WIndows_Dual_Boot_3.jpg)

#### 第二部分：修复Windows启动引导 ####

一旦你删除了Linux分区，就是时候修复Windows启动引导了。这里的图片看起来可能不是很清楚，因为相对于Windows来说[在Ubuntu下对登录画面进行截图][4]要简单的多。我用手机相机拍下了这些照片。

**第一步：**

**插入Windows 8安装介质并重启**你的电脑。在启动的时候按下F10或F12进入BIOS/UEFI，选择**从可移除介质启动(boot from removable disk)**。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_1.jpg)

**第二步：**

选择修复你的计算机(repair your computer)：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_3.jpg)

**第三步：**

在这里选择疑难解答(Troubleshoot)：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_2.jpg)

**第四步：**

在疑难解答页面，选择高级选项(Advanced options)：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_4.jpg)

**第五步：**

找到这里的命令提示符(command prompt)：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_6.jpg)

**第六步：**

在命令行中输入下列命令来修复Windows启动引导：

    bootrec.exe /fixmbr

正常情况下，它是立即生效的，你甚至都不用等。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_5.jpg)

**第七步：**

一旦完成了这一步，重启你的电脑，这次从硬盘正常启动。你应该能够启动进入Windows。如果你仍然看到Grub rescue错误，试试下面的步骤。

**第八步：如果第六步中的方法不起作用**

如果第六步中的命令不起作用，试试高级疑难解答中的自动修复选项。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_8.jpg)

它会花点时间查找问题然后修复它。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Uninstall_Linux_Windows_Dualboot_7.jpg)

现在如果你重启的话，你应该能够正常进入Windows，不再看到任何的Grub rescue错误提示。

我希望这个指南能够帮助你**将Ubuntu从Windows 8双启动中完全移除**。欢迎提出任何问题与建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/uninstall-ubuntu-linux-windows-dual-boot/

作者：[Abhishek][a]
译者：[alim0x](https://github.com/alim0x)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://linux.cn/article-3178-1.html
[2]:http://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[3]:http://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[4]:http://itsfoss.com/screenshot-login-screen-ubuntu-linux/
