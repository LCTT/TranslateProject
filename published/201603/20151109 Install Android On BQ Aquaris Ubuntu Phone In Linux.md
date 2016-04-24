在 Linux 上将 BQ Aquaris Ubuntu 手机刷成 Android 系统
================================================================================
![How to install Android on Ubuntu Phone](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-on-Ubuntu-Phone.jpg)

如果你正好拥有全球第一支运行 Ubuntu 的手机并且希望将 **BQ Aquaris E4.5 自带的 Ubuntu 系统换成 Android **，那这篇文章能帮你点小忙。

有一万种理由来解释为什么要将 Ubuntu 换成主流 Android OS。其中最主要的一个，就是这个系统本身仍然处于非常早期的阶段，针对的目标用户仍然是开发者和爱好者。不管你的理由是什么，要谢谢 BQ 提供的工具，让我们能非常轻松地在 BQ Aquaris 上安装 Android OS。

下面让我们一起看下在 BQ Aquaris 上安装 Android 需要做哪些事情。

### 前提条件 ###

- 可用的因特网连接，用来下载 Android 出厂固件以及安装刷机工具。
- USB 数据线
- 运行 Linux 的电脑

本文是基于 Ubuntu 15.10 操作的。但是这些步骤应该也可以应用于其他大多数 Linux 发行版。

### 将 BQ Aquaris E4.5 上的 Ubuntu 换成 Android ###

#### 第一步：下载 Android 固件 ####

首先是下载可以在 BQ Aquaris E4.5 上运行的 Android 固件。幸运的是我们可以在 BQ 的技术支持网站找到。可以从下面的链接直接下载，差不多 650 MB：

- [下载为 BQ Aquaris E4.5 制作的 Android][1]

是的，这个版本还支持 OTA 自动升级。目前，固件版本是 2.0.1，基于 Android Lolipop 开发。过一段时间，应该就会放出基于 Marshmallow 的新版本，上边的链接可能就无效了。

我建议去[ bq 的技术支持网站][2]下载最新的固件。

下载完成后解压。在解压后的目录里，找到一个名字是 **MT6582\_Android\_scatter.txt** 的文件。后面将要用到它。

#### 第二步：下载刷机工具 ####

BQ 已经提供了自己的刷机工具，Herramienta MTK Flash Tool，可以轻松地给设备安装 Andriod 或者 Ubuntu 系统。你可以从下面的链接下载工具：

- [下载 MTK Flash Tool][3]

考虑到刷机工具在以后可能会升级，你总是可以从 [BQ 技术支持网站][4]上找到最新的版本。

下载完后解压。之后应该可以在目录里找到一个叫 **flash_tool** 的可执行文件。我们稍后会用到。

#### 第三步：移除冲突的软件包（可选） ####

如果你正在用最新版本的 Ubuntu 或 基于 Ubuntu 的 Linux 发行版，稍后可能会碰到 “BROM ERROR : S\_UNDEFINED\_ERROR (1001)” 错误。

要避免这个错误，你需要卸载有冲突的软件包。可以使用下面的命令：

    sudo apt-get remove modemmanager

用下面的命令重启 udev 服务：

    sudo service udev restart

检查一下内核模块 cdc_acm 可能存在的副作用，运行下面的命令：

    lsmod | grep cdc_acm

如果上面命令输出是空，你将需要重新加载一下这个内核模块：

    sudo modprobe cdc_acm

#### 第四步：准备刷入 Android ####

切换到下载好并解压完成的刷机工具目录（第二步）。请使用命令行来完成，这是因为将要用到 root 权限。

假设你保存在下载目录里，使用下面的命令切换目录（为那些不懂如何在命令行下切换目录的朋友考虑）。

    cd ~/Downloads/SP_Flash*

然后使用下面的命令以 root 权限启动刷机工具：

    sudo ./flash_tool

然后你会看到一个像下面的窗口界面。不用在意 Download Agent 区域，它将会被自动填入。只要关心 Scatter-loading 区域。

![Replace Ubuntu with Android](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-bq-aquaris-Ubuntu-1.jpeg)

还记得之前第一步里提到的 **MT6582\_Android\_scatter.txt** 文件吗？这个文本文件就在你第一步中下载的 Android 固件解压后的目录里。点击 Scatter-loading（上图中）然后选中 MT6582\_Android\_scatter.txt 文件。

之后，你将看到类似下面图片里的一些绿色线条：

![Install-Android-bq-aquaris-Ubuntu-2](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-bq-aquaris-Ubuntu-2.jpeg)

#### 第五步：刷入 Android ####

已经差不多了。把你的手机关机，然后通过 USB 线连接到电脑上。

在下拉列表里选择 Firmware Upgrade，然后点击那个大的 Download 按钮。

![flash Android with Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-bq-aquaris-Ubuntu.jpeg)

如果一切顺利，你应该可以在工具下方的状态栏里看到刷机状态：

![Replace Ubuntu with Android](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-bq-aquaris-Ubuntu-3.jpeg)

当所有过程都完成后，你将看到一个类似这样的提示：

![Successfully flashed Android on bq qauaris Ubuntu Phone](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Install-Android-bq-aquaris-Ubuntu-4.jpeg)

将手机从电脑上移除然后开机。你应该看到屏幕上显示白色并在中间和底部有 AQUARIS 文字，还应该有 “powered by Android” 字样。差不多需要差不多十分钟，你才可以设置和开始使用 Android。

注意：如果中间出了什么问题，同时按下电源、音量加、音量减按键可以进入 fast boot 模式。然后再次关机并连接电脑。重复升级固件的过程。应该可以。

### 总结 ###

要感谢厂商提供的工具，让我们可以轻松地 **在  BQ Ubuntu 手机上刷 Android**。当然，你可以使用相同的步骤将 Android 替换回 Ubuntu。只是下载的时候选 Ubuntu 固件而不是 Android。

希望这篇文章可以帮你将你的 bq 手机上的 Ubuntu 刷成 Android。如果有什么问题或建议，可以在下面留言区里讨论。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-android-ubuntu-phone/

作者：[Abhishek][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://storage.googleapis.com/otas/2014/Smartphones/Aquaris_E4.5_L/2.0.1_20150623-1900_bq-FW.zip
[2]:http://www.bq.com/gb/support/aquaris-e4-5
[3]:https://storage.googleapis.com/otas/2014/Smartphones/Aquaris_E4.5/Ubuntu/Web%20version/Web%20version/SP_Flash_Tool_exe_linux_v5.1424.00.zip
[4]:http://www.bq.com/gb/support/aquaris-e4-5-ubuntu-edition
