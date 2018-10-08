在 VirtualBox 中安装 Android 系统
======

如果你正在开发 Android 应用，也许会遇到小麻烦。诚然，ios 移动开发有 macOS 系统平台为其提供友好便利性， Android 开发仅有支持少部分 Android 系统（其中还包括可穿戴设备系统）的 Android Studio 工具。

毋庸置疑，所有的二进制工具、SDK 工具、开发框架工具以及调试器都会产生大量日志和其他各种文件，使得你的文件系统很混乱。一个有效的解决方法就是在 VirtualBox 中安装 Android 系统，这样还解决了 Android 开发中最为棘手问题之一 —— 设备模拟器。你可以在该虚拟机里测试应用程序，也可以使用 Android 的内部功能。因此，让我们迫不及待的开始吧！

### 准备工作

首先，你需要在你的系统上安装 VirtualBox，可从[这里][1]下载 Windows 版本、macOS 版本或者各种 Linux 版本的 VitualBox。然后，你需要一个能在 x86 平台运行的 Android 镜像，因为 VirtualBox 为虚拟机提供运行 x86 或者 x86\_64（即 AMD64）平台的功能。

虽然大部分 Android 设备都在 ARM 上运行，但我们依然可以从 [Android on x86 项目][2] 中获得帮助。这些优秀的开发者已经将 Android 移植到 x86 平台上运行（包括实体机和虚拟机），我们可以下载最新版本的 Android 7.1。你也可以用之前更为稳定的版本，本文写作时最新稳定版是 Android 6.0。

### 创建 VM 虚拟机

打开 VirtualBox，单击左上角的 “新建” 按钮，在弹出的窗口中选择 “类型：Linux” ，然后根据下载的 ISO 镜像来确定版本，x86 对应 “32-bit”，x86_64 对应 “64-bit”，此处选择 “Linux 2.6 / 3.x / 4.x (64-bit)”。

RAM 大小设置为 2 GB 到你系统能提供的最大内存之间。如果你想模拟真实的使用环境你可以设置 6 GB RAM 和 32 GB ROM。

![][3]

![][4]

创建完成后，你还需要做一些设置，添加更多的处理器核心，提高开机显示内存。在 VM 上打开设置选项，“设置 -> 系统 -> 处理器”，如果硬件条件允许，可以多分配一些处理器。

![][5]

在 “设置 -> 显示 -> 显存大小” 中，你可以分配一大块内存并开启 3D 加速功能。

![][6]

现在我们可以启动 VM 虚拟机了。

### 安装 Android

首次启动 VM 虚拟机，VirtualBox 会提示你需要提供启动媒介，选择之前下载好的Android 镜像。

![][7]

下一步，如果想长时间使用 Android，选择 “Installation” 选项，你也可以选择 Live 模式体验 Android 环境。

![][8]

按回车键。

#### 分区

分区是通过文本界面操作，并没有友好的 GUI 界面，所以每个操作都需要小心对待。例如，在第一屏中还没有创建分区并且只检测到原始（虚拟）硬盘时显示如下。

![][9]

红色字母 `C` 和 `D` 表明 `C` 开头选项可以创建或者修改分区，`D` 开头选项可以检测设备。你可以选择 `D` 开头选项，然后它就会检测硬盘，也可不进行这步操作，因为在启动的时候它会自动检测。

我们选择 `C` 开头选项，在虚拟盘中创建分区。官方不推荐使用 GPT 格式，所以我们选择 “No” 并按回车键。

![][10]

现在你被引导到 fdisk 工具页面。

![][11]

为了简洁起见，我们就只创建一个较大的分区，使用方向键来选择 “New” ，然后选择 “Primary”，按回车键以确认。

![][12]

分区大小系统已经为你计算好了，按回车键确认。

![][13]

这个分区就是 Android 系统所在的分区，所以需要它是可启动的。选择 “Bootable”，然后按回车键（上方表格中 “Flags” 标志下面会出现 “boot” 标志），进一步，选择 “Write” 选项，保存刚才的操作记录并写入分区表。

![][14]

现在你可以选择退出分区工具，然后继续安装过程。

![][15]

#### 文件系统格式化为 EXT4 并安装 Android

在“Choose Partition”分区页面上会出现一个刚刚我们创建的分区，选择它并点击“OK”进入。

![][16]

在下一个菜单中选择 Ext4 作为实际的文件系统，在下一页中选择 “Yes” 然后格式化开始。会提示是否安装 GRUB 引导工具以及是否允许在目录 `/system` 进行读写，都选择 “Yes” 。现在，安装进程开始。

安装完成后，当系统提示可以重启的时候你可以安全地重启系统。在重启之前，你可以先关机，然后在 VitualBox 的 “设置 -> 存储” 中检查 Android iso 镜像是否还连接在虚拟机上，如果在，将它移除。

![][17]

移除安装媒介并保存修改，再去启动 VM 虚拟机。

#### 运行 Android

在 GRUB 引导界面，有调试模式和普通模式的选项。我们选择默认选项，如下图所示。

![][18]

如果一切正常，你将会看到如下界面：

![][19]

如今的 Android 系统使用触摸交互而不是鼠标。不过 Android-x86 平台提供了鼠标操作支持，但开始时可能需要方向键来辅助操作。

![][20]

移动到”let’s go“按钮并按下回车键。选择 “Set up as new” 选项，回车确认。

![][21]

在提示用谷歌账户登陆之前，系统检查更新并检测设备信息。你可以跳过这一步，直接去设置日期和时间、用户名等。

还有一些其他的选项，和让你设置一个新的 Android 设备类似。选择 “I Agree” 选项同意有关更新、服务等的相应的选项，当然谷歌的服务条款是不得不同意的。

![][22]

在这之后，因为它是个虚拟机，所以可能需要添加额外的 email 账户来设置 “On-body detection”，大部分的选项对我们来说都没有多大作用，因此可以选择 ”All Set“。

接下来，它会提示你选择主屏应用，这个根据个人需求选择。现在我们进入了一个虚拟的 Android 系统。

![][23]

如果你需要在 VM 做一些交互测试，有个可触摸屏幕会提供很大的方便，因为那样才更接近真实使用环境。

希望这篇教程会给你带来帮助。

--------------------------------------------------------------------------------

via: https://linuxhint.com/install_android_virtualbox/

作者：[Ranvir Singh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jrglinux](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxhint.com/author/sranvir155/
[1]:https://www.virtualbox.org/wiki/Downloads
[2]:http://www.android-x86.org/
[3]:https://linuxhint.com/wp-content/uploads/2018/08/a.png
[4]:https://linuxhint.com/wp-content/uploads/2018/08/a1.png
[5]:https://linuxhint.com/wp-content/uploads/2018/08/a2.png
[6]:https://linuxhint.com/wp-content/uploads/2018/08/a3.png
[7]:https://linuxhint.com/wp-content/uploads/2018/08/a4.png
[8]:https://linuxhint.com/wp-content/uploads/2018/08/a5.png
[9]:https://linuxhint.com/wp-content/uploads/2018/08/a6.png
[10]:https://linuxhint.com/wp-content/uploads/2018/08/a7.png
[11]:https://linuxhint.com/wp-content/uploads/2018/08/a8.png
[12]:https://linuxhint.com/wp-content/uploads/2018/08/a9.png
[13]:https://linuxhint.com/wp-content/uploads/2018/08/a10.png
[14]:https://linuxhint.com/wp-content/uploads/2018/08/a11.png
[15]:https://linuxhint.com/wp-content/uploads/2018/08/a12.png
[16]:https://linuxhint.com/wp-content/uploads/2018/08/a13.png
[17]:https://linuxhint.com/wp-content/uploads/2018/08/a14.png
[18]:https://linuxhint.com/wp-content/uploads/2018/08/a16.png
[19]:https://linuxhint.com/wp-content/uploads/2018/08/a17.png
[20]:https://linuxhint.com/wp-content/uploads/2018/08/a18.png
[21]:https://linuxhint.com/wp-content/uploads/2018/08/a19.png
[22]:https://linuxhint.com/wp-content/uploads/2018/08/a20.png
[23]:https://linuxhint.com/wp-content/uploads/2018/08/a21.png


