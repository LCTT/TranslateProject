在UEFI模式下安装Ubuntu 14.04与Windows 8/8.1双启动
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Dual_Boot_Windows8_Ubuntu_1404.jpeg)

之前我已经写过关于[如何安装Ubuntu Linux和Windows 7][1]以及8的双启动，但是那些教程不包含那些预装Windows 8的系统。那些较新的预装了Windows 8或Windows 8.1的系统使用了UEFI来替代BIOS。这使得安装双启动变得和之前的常规方法有点不同。在这个教程中，我们将看到**如何在UEFI模式下安装Ubuntu 14.04与Windows 8/8.1双启动**。

这个教程是在一台新买的戴尔灵越 7437（酷睿i7第四代处理器， 256GB SSD，8GB内存以及内置1GB(共享内存) Intel显卡）上演示的。为了使你能够成功安装UEFI下Linux和Windows 8的双启动，我会提到你需要做的所有步骤。如果你已经完成这些步骤中的部分步骤，直接跳到下一步。如果你有个全新的系统，那就更好了。

在这里提到的这些步骤也适用于其它基于Ubuntu的Linux发行版，如Linux Mint，Elementary OS等等。不多说，让我们来看看如何在启用了UEFI安全启动的Windows 8系统上双启动Linux。

### 让 Ubuntu 14.04 和 Windows 8 双启动： ###

要在一个UEFI系统上安装Ubuntu有多方面的前提条件。让我们来一个一个看：

#### 第一步：做个备份 [可选] ####

做个备份总是个不错的选择，防止你把系统弄糟了。网上有众多文章教你如何备份系统。你可以参照[这个教程][2]。

#### 第二步：创建一个Ubuntu的USB启动盘/光盘启动盘 ####

你需要做的下一件事是创建一个USB启动盘或光盘启动盘。我推荐在Windows下使用[Universal USB Installer][3]创建一个Linux OS的USB启动盘。

#### 第三步：为Ubuntu划分一块安装分区 ####

假设你有一个全新的系统，我们要做的第一件事是创建一个分区来安装Linux。我系统中的256GB磁盘出厂时就有若干个分区，但主要是用来备份及其它目的的。主分区是安装了Windows 8.1的C盘，约有220GB。

如果你也像这样只有一个分区，你需要从中分割出一些空间给Linux。如果你有若干空间大小足够的分区，可以使用它们中除C盘外的任意盘，因为安装时会抹掉其中的数据。

要在Windows 8中创建分区，需要使用磁盘管理工具。你可以通过在控制面板中搜索‘磁盘’找到磁盘管理工具。

![](http://itsfoss.com/wp-content/uploads/2014/05/disk_partition.jpeg)

在磁盘管理工具中，右键点击你想划分并缩小的卷。在我的演示中，我选择C盘的卷进行缩小，划分出未分配空间：

![](http://itsfoss.com/wp-content/uploads/2014/05/disk_partition_Windows8.jpeg)

缩小后出现的未分配空间就放在那里好了，不用对其分区和格式化。我们会在安装Ubuntu时用到它。

#### 第四步：在Windows中禁用快速启动 [可选] ####

为了实现快速启动，Windows 8引进了叫做“快速启动”的新特性。尽管不是强制要求，最好还是将其禁用。

打开**控制面板 > 硬件与声音 > 电源选项 > 选择电源按钮的功能 > 更改当前不可用的设置**，取消选中**启用快速启动（推荐）**。

#### 第五步：禁用Windows 8 and 8.1的安全启动（secure boot） ####

这是最重要的步骤。Windows 8新的安全启动（secure boot）原本是针对rootkit病毒的安全特性，但它也阻止了Windows和Linux的双启动。为了实现Windows和Linux的双启动，我们必须在UEFI中禁用安全启动（secure boot）。

可以参见：[如何在 Win8 上禁用 UEFI 安全引导以安装Linux][4]。

#### 第六步：安装Ubuntu，与Windows 8共存 ####

一旦你禁用了安全启动（secure boot），那就是时候安装Ubuntu了。我希望你像第二步中提到的一样创建了一个USB启动盘。插入U盘，然后从U盘启动系统。

要从USB启动，需要在Windows中选择从USB启动的选项。从电脑设置（像UEFI）中选择选项或在点击“重新启动”的时候按住Shift键。

当你用USB启动盘启动后，你会看到试用（try）或者安装（install）Ubuntu的选择，这里要点击“安装”。另外在屏幕上不多的设置选项里面，你可以选择你用的语言。接下来是关于硬盘空间，电源和网络连接等等的一些检查。只需点击**继续**。

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu.jpeg)

安装窗口中你需要注意的是**安装类型（Installation Type）**。选择这里的**其它选项（Something else）**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_1.jpeg)

还记得我们事先划分的未分配空间吗？我们将用它来创建根分区（ / ），交换空间（Swap）以及家目录（Home）。选择空闲（free space）然后点击加号（+）。

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_2.jpeg)

它会给你提供创建Linux分区的选项。我们正在创建根分区 /。10到20GB空间就足够了。选择大小（Size），然后选择Ext 4作为文件系统以及 /（意思是根）作为挂载点（Mount point）。

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_3.png)

点击确定会回到分区界面。下一步我们创建交换空间（Swap）。像之前一样，再次点击加号（+）。这次我们选择作为交换空间（Swap area）。建议的交换空间大小是物理内存的两倍。

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_4.png)

以同样的方式创建家目录（Home）。给它分配最大的空间（实际上是给它分配剩余的所有空间），因为这是你会用来存储音乐，图片以及下载的文件的位置。

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_5.png)

分配好了根分区（ / ），交换空间（Swap）和家目录（Home）之后，点击**现在安装（Install Now）**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Installing_Windows8_Ubuntu_6.jpeg)

好了，你现在基本上以及赢得了这场战役了~露出胜利的微笑吧~接下来你会被要求设置用户名密码等等。基本上你现在只需点击下一步。

一旦安装完成，重新启动电脑，你应该会看到紫色的grub欢迎界面。尽情享受Ubuntu和Windows 8的双启动模式吧。（译注：对于可能出现grub系统选择中没有Windows 8选项或是无法正常启动的情况，可搜索Boot Repair工具的使用）

我希望这份指南能够帮你实现Ubuntu和Windows 8的UEFI模式双启动。虽然这篇文章是为Ubuntu写的，它对其它的Linux OS应该也有所帮助。欢迎提出任何问题与建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[2]:http://www.makeuseof.com/tag/6-safest-ways-to-backup-restore-your-files-in-windows-7-8/
[3]:http://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/
[4]:http://linux.cn/article-3061-1.html
