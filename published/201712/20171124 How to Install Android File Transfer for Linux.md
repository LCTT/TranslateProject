如何在 Linux 下安装安卓文件传输助手
===============

如果你尝试在 Ubuntu 下连接你的安卓手机，你也许可以试试 Linux 下的安卓文件传输助手。

本质上来说，这个应用是谷歌 macOS 版本的一个克隆。它是用 Qt 编写的，用户界面非常简洁，使得你能轻松在 Ubuntu 和安卓手机之间传输文件和文件夹。

现在，有可能一部分人想知道有什么是这个应用可以做，而 Nautilus（Ubuntu 默认的文件资源管理器）不能做的，答案是没有。

当我将我的 Nexus 5X（记得选择 [媒体传输协议 MTP][7] 选项）连接在 Ubuntu 上时，在 [GVfs][8]（LCTT 译注： GNOME 桌面下的虚拟文件系统）的帮助下，我可以打开、浏览和管理我的手机，就像它是一个普通的 U 盘一样。

[![Nautilus MTP integration with a Nexus 5X](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/browsing-android-mtp-nautilus.jpg)][9] 

但是*一些*用户在使用默认的文件管理器时，在 MTP 的某些功能上会出现问题：比如文件夹没有正确加载，创建新文件夹后此文件夹不存在，或者无法在媒体播放器中使用自己的手机。

这就是要为 Linux 系统用户设计一个安卓文件传输助手应用的原因，将这个应用当做将 MTP 设备安装在 Linux 下的另一种选择。如果你使用 Linux 下的默认应用时一切正常，你也许并不需要尝试使用它 (除非你真的很想尝试新鲜事物)。


![Android File Transfer Linux App](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/android-file-transfer-for-linux-750x662.jpg)

该 app 特点：

*   简洁直观的用户界面
*   支持文件拖放功能（从 Linux 系统到手机）
*   支持批量下载 (从手机到 Linux系统)
*   显示传输进程对话框
*   FUSE 模块支持
*   没有文件大小限制
*   可选命令行工具

### Ubuntu 下安装安卓手机文件助手的步骤

以上就是对这个应用的介绍，下面是如何安装它的具体步骤。

这有一个 [PPA]（个人软件包集）源为 Ubuntu 14.04 LTS、16.04 LTS 和 Ubuntu 17.10 提供可用应用。

为了将这一 PPA 加入你的软件资源列表中，执行这条命令：

```
sudo add-apt-repository ppa:samoilov-lex/aftl-stable
```

接着，为了在 Ubuntu 下安装 Linux版本的安卓文件传输助手，执行：

```
sudo apt-get update && sudo apt install android-file-transfer
```

这样就行了。

你会在你的应用列表中发现这一应用的启动图标。

在你启动这一应用之前，要确保没有其他应用（比如 Nautilus）已经挂载了你的手机。如果其它应用正在使用你的手机，就会显示“无法找到 MTP 设备”。要解决这一问题，将你的手机从 Nautilus（或者任何正在使用你的手机的应用）上移除，然后再重新启动安卓文件传输助手。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/android-file-transfer-app-linux

作者：[JOEY SNEDDON][a]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/app
[3]:http://www.omgubuntu.co.uk/category/download
[4]:https://github.com/whoozle/android-file-transfer-linux
[5]:http://www.omgubuntu.co.uk/2017/11/android-file-transfer-app-linux
[6]:http://android.com/filetransfer?linkid=14270770
[7]:https://en.wikipedia.org/wiki/Media_Transfer_Protocol
[8]:https://en.wikipedia.org/wiki/GVfs
[9]:http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/browsing-android-mtp-nautilus.jpg
[10]:https://launchpad.net/~samoilov-lex/+archive/ubuntu/aftl-stable
