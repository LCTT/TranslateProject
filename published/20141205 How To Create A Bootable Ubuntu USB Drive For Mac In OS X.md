在 Mac OS X 系统中创建用于 Mac 的 Ubuntu USB 启动盘
================================================================================

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_Ubuntu_USB_Mac_OS_X.jpg)

上个月，在戴尔的服务中心丢失我的笔记本后，我买了一台 Macbook Air 笔记本。买回来后我首先做的一些事就是给机器装上双系统，使 Ubuntu Linux 和 Mac OS X 都可用。随后的文章我会介绍如何在 Macbook 上安装 Linux ,刚开始我们需要学习 **如何在 Mac OS X 系统中创建用于 Mac 的 Ubuntu USB 启动盘**。

在 Ubuntu 系统或 Windows 系统中创建可启动的 USB 是非常容易的，但在 Mac OS X 系统中就没这么简单了。这就是为什么 Ubuntu 的官方指南上，在 Mac 中安装 live Ubuntu 推荐使用光盘安装而不是 USB 的原因。考虑到我的 Macbook Air 既没有 CD 驱动也没有 DVD 驱动，所以我更愿意在 Mac OS X 下创建一个 live USB。

### 在 Mac OS X 下创建可启动 USB 驱动盘###

如前所述，在 Mac OS X 上创建对于像 Ubuntu 或任何其它可引导的操作系统这样的可启动 USB 盘是个比较麻烦的过程。但请别担心，按照下面的步骤一步一步操作就行。让我们就开始创建一个可启动的 USB 盘的操作吧：

#### 步骤 1: 格式化 USB 驱动盘 ####

苹果是以它自定义的标准而闻名的，所以 Mac OS X 系统有自己的文件系统类型就毫不奇怪了，它的文件系统叫做 Mac OS 扩展或 [HFS 插件][1]。因此，您需要做的第一件事就是用 Mac OS 扩展文件系统来格式化您的 USB 驱动盘。

要格式化 USB 盘，请先插入 USB 盘。从 Launchpad（在底部面板上的一个火箭形状的图标）上前往**磁盘工具**应用程序。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Disk_Utility_Mac.jpg)

- 在磁盘工具中，从左手边的面板上选择你的 USB 盘来格式化。
- 点击右边面板的**分区**标签。
- 从下拉菜单中，选择 **1 分区**。
- 给这驱动盘起个您想要的名字。
- 接下来，切换分区格式为**格式化成 Mac OS 扩展 (日志型)**

下面的截屏将会对您有所帮助。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Format_Usb_Mac_4.jpg)

在我们开始真正格式化 USB 盘之前这是唯一一件要做的操作。点击在右边面板的选项按纽，要确保分区的模式是 **GUID 分区表**形式的。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Format_Usb_Mac_2.jpg)

当所有都已经设置完了后，仅仅只需点击**应用**按纽。它会弹出一个要格式化 USB 驱动盘的警告消息，当然是要点击分区按纽来格式化 USB 驱动盘拉。

#### 步骤 2: 下载 Ubuntu ####

当然，您需要下载 Ubuntu 桌面版本的 ISO 镜像文件。链接到[ Ubuntu 官网去下载您喜欢的 Ubuntu 桌面版本系统][2]。因为您使用的是 Macbook Air，我建议您下载 64 位版本中的一款。Ubuntu 14.04 是最新的 LTS 版本，我建议您们使用它。

#### 步骤 3: 把 ISO 格式转成 IMG 格式 ####

您下载的文件是 ISO 格式的，但我们需要它是 IMG 格式的，使用 [hdiutil][3] 命令工具就可以很容易的转换。打开终端，也可以从 Launchpad 或 Spotlight 中打开，然后使用如下的命令就可以把 ISO 格式的转换成 IMG 格式的了:

    hdiutil convert -format UDRW -o ~/Path-to-IMG-file ~/Path-to-ISO-file

通常下载的文件会在 ~/Downloads 目录下。所以在我的系统来，输入的命令是:

    hdiutil convert -format UDRW -o ~/Downloads/ubuntu-14.10-desktop-amd64 ~/Downloads/ubuntu-14.10-desktop-amd64.iso

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/ISO_to_IMG_Convert_Mac_OS_X.jpeg)

您可能已经注意到我并没有新转换出的文件加上 IMG 后缀。这是没问题的，因为后缀只是个标志，重要的是文件类型并不是文件的扩展名。转换出来的文件可能会被 Mac OS X 系统自动加上个 .dmg 后缀。别担心，这是正常的。

#### 步骤 4: 获得 USB 盘的设备号 ####

接下来的事情就是获得 USB 盘的设备号。在终端中运行如下命令：

    diskutil list

 它会列出系统中当前可用的所有‘磁盘’信息。从它的大小上您应该能识别出此 USB 盘。为了避免混淆，我建议您只插入一个 USB 盘。我的示例中，设置号是 2 （一个大小为 8G 的 USB）: /dev/disk2 

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_USB_Mac_OSX.jpeg)

当得到设备号后，运行如下命令：

    diskutil unmountDisk /dev/diskN

这儿的 N 就是前面您得到的 USB 的设备号。所以，我的示例中，上面的命令就变成：

    diskutil unmountDisk /dev/disk2

执行结果应该是：**成功的卸载 disk2 上的所有卷**。

#### 步骤 5: 在 Mac OS X 中创建可启动的 USB 驱动盘####

终于我们只有创建可启动的 USB 盘这最后一步了。我们会使用 [dd 命令][4]，它非常的强大，必须得小心使用。因此，一定要记得您 USB 驱动盘的正确设备号，要不然会使 Mac OS X 系统崩溃。在终端中使用如下命令:

    sudo dd if=/Path-to-IMG-DMG-file of=/dev/rdiskN bs=1m

这儿我们使用 dd (拷贝和转换) 来把 IMG 输入文件 (if) 拷贝和转换到 磁盘 N 中。我希望您还记得在步骤 3 中已经生成的 IMG 文件的存放位置。对我的机器来说，命令如下所示：

    sudo dd if=~/Downloads/ubuntu-14.10-desktop-amd64.dmg of=/dev/rdisk2 bs=1m

我们用超级用户权限（sudo）来运行上面的命令，还需要您输入密码。跟 Linux 中类似，您从键盘中输入密码时，将看不到任何星号或显示的提示，不用担心，这是 Unix 终端的习惯。

甚至在您输入完密码后，**您都不会看到立即的输出，这是正常的**。需要一小会儿时间才会处理完成。

#### 步骤 6: 完成可启动 USB 驱动盘的整个处理过程 ####

一旦 DD 命令处理完成，会弹出一个对话框：**您插入的磁盘在这机器上不可读**。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Bootable_USB_3.png)

别惊慌，一切正常。只是**现在不要点击初始化、忽略或弹出按纽**。回到终端，您会看到最新处理完成的一些信息。我的机器中显示如下：

> 1109+1 records in
> 
> 1109+1 records out
> 
> 1162936320 bytes transferred in 77.611025 secs (14984164 bytes/sec)

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_USB_Mac_OSX_1.jpeg)

现在，在终端中使用如下命令来弹出我们的 USB 驱动盘：

    diskutil eject /dev/diskN

N 当然指的是我们前面使用过的设备号，在我的示例中是 2 ：

    diskutil eject /dev/disk2

一旦弹出，点击前面出现那对话框上的**忽略**按纽。现在您的可启动 USB 磁盘已经创建好了，把它拔下来吧。

#### 步骤 7: 检查您新创建的可启动 USB 盘 ####

一旦您在 Mac OS X 中完成了创建一个 live USB 这么重大的任务，是时候测试您的新成果了。

- 插入可启动 USB 盘，重启系统。
- 在苹果启动的时候，一直按着 option （或 alt）键。
- 这会引导您进入启动时需要访问的可使用磁盘界面。我假设您知道接下来的操作步骤。

对我机器来说它显示了两个 EFI 启动盘：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Ubuntu_boot_USB_Mac_OSX_1.jpeg)

我选择第一个，然后它就会直接进入 Grub 界面：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Ubuntu_boot_USB_Mac_OSX.jpeg)

我希望这篇教程对您想要在 Mac OS X 下创建可启动的 Ubuntu 系统 USB 驱动盘有所帮助。在接下来的一篇文章中您会学到怎么样安装 OS X 和 Ubuntu 双系统。请继续关注。

--------------------------------------------------------------------------------

via: http://itsfoss.com/create-bootable-ubuntu-usb-drive-mac-os/

作者：[Abhishek][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.wikipedia.org/wiki/HFS_Plus
[2]:http://www.ubuntu.com/download/desktop
[3]:https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/hdiutil.1.html
[4]:http://en.wikipedia.org/wiki/Dd_%28Unix%29