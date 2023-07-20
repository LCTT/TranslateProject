[#]: subject: "What is KDE Connect? How Do You Use It? [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/2022/01/kde-connect-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "yjacks"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

什么是 KDE Connect？怎么用？[新手指南]
======
我们将在本文中解释：什么是 KDE Connect？它的主要特性是什么？它应该如何安装？并提供基本的使用指南。

科技日新月异，包括那些软件、硬件，以及不同设备中的不同之处。这个未来是涉及一切无缝集成和不同设备间的工作流的。每天，我们都在接近这样的状态：从一切连接的设备中发送与接受数据。KDE Connect 是 Linux 桌面系统中首屈一指的“传播者”。

### 什么是 KDE Connect？

[KDE Connect][1] 是 KDE 桌面社群开发的。提供 Linux 系统与其他系统，如 Windows、MacOS、Android 及 Linux，的无缝连接。

KDE connect 安装后会使你可以接受手机提醒、发送或接受短信、浏览文件、发送或接受文件，以及其他这样的特性。

此外，KDE Connect 在通过无线网络完成上述特性时使用安全协议以避免安全事故。它是免费和开源的软件，故而，用户只有极小的机会遇上隐藏的问题。因为组合了这些优良特性，因而 KDE Connect 是一个领域内的极佳工具。

下文介绍你如何安装和使用它。

### 安装 KDE Connect

本文将为你展示如何连接 Linux 发行版和 Android 智能手机。Windows 与 Android 的连接也应是如此。

KDE Connect 需要两方都有。你必须在你的 Linux 发行版和你的 Android 智能手机都安装 KDE Connect。
(LCTT 译注：原文为“从 Google Play 安装 KDE Connect。”，但下文同样提到了从 F-droid 安装的方法，故不翻。)

#### 在 Linux 发行版上安装

在你的 Linux 发行版上安装 KDE Connect 很简单。其在所有的主流 Linux 发行版的官方仓库中都可用。如果你在用 Ubuntu，并且想在终端安装，运行如下指令：

```
sudo apt install kdeconnect
```

Fedora：

```
sudo dnf install kdeconnect
```

[Arch Linux][2]：

```
pacman -S kdeconnect
```

或在 Software 中搜索并安装。

参考 [这个页面][3] 来通过其他几种选项为 Windows 和其他 Linux 发行版下载安装。

#### 在 Android 智能手机上安装

在 Android 设备中，在 Google Play 商店中搜索 KDE Connect 并安装。

[Google Play 商店中的 KDE Connect][4]

如果你在使用某个安卓的自由版本，你可以用下面的链接来通过 f-droid 安装。（感谢我们的读者提出这一条）。

[https://f-droid.org/zh_Hans/packages/org.kde.kdeconnect_tp/][5]

### 设置 KDE Connect

KDE 适用于在相同网络中的设备。因此，确保你的 Linux 系统和 Android 设备都连接到了相同的无线网络中。

打开你手机里的 KDE Connect。你应当见到你的 Linux 系统的名称。如果你啥都没暗道，确保你的设备和 Linux 都连接到了相同的网络后刷新。

![Android 中的 KDE Connect 显示连接到了 Linux 系统][6]

打开 Linux 中的 KDE Connect，你应当见到你的手机进入了下图展示的样子。

![配对前的 KDE Connect][7]

现在，点开你手机的名称然后点击**配对**。紧接着你的手机就会收到一个提醒：是否接受配对。选择“接受”。

![KDE Connect 的配对请求][8]

你的手机的图标应当转为 绿 色 ，这表示你的手机和 Linux 系统都已经连接且配对。

![成功配对后的 KDE Connect][9]

默认情况下，程序会开启以下特性：

* 控制多媒体
* 远程输入
* 远程演示
* 搜寻设备
* 分享文件

以下的特性需要你的 Android 设备里的额外权限。因为它们属于比较中心的权限，这意味着你需要手动启用他们。

* 短信发送及接受
* 控制媒体播放器
* 接受电脑的击键到手机
* 同步提醒
* 来电提醒
* 同步连接
* 接受鼠标

对于这些特性，你需要去手动打开选项，并在 Android 手机中授与权限。然后你就可以在 Linux 设备中享受这些服务了。

### 例：同步提醒

我将为你演示同步提醒选项应在何处打开。打开你 Android 手机中的程序，进入**已连接设备**节。打开**同步提醒**并选择**打开设置**。

对 **KDE Connect** 启用通知访问，然后点击**允许**。

![打开同步提醒中][10]

之后将展示你手机上的提醒到你的 Linux 设备。例如，下面的提醒是我在我的测试 Android 设备中收到的。

![手机中的样例提醒][11]

同样的信息也展现在了 Linux 系统中的 KDE Connect。

![来自手机的样例信息在 KDE Connect 中][12]

同样地，在给 KDE Connect 权限后，你可以启动对你可用的其他服务。

### 尾声

我希望这个指南可以帮助你在你的 Linux 系统和手机中设置 KDE Connect。你可以在给与一些主要权限后，轻易地设置几个特性，以使 KDE Connect 应用程序发挥最大优势。配置完成后，你不再需要看你的手机。因为你可以在工作时轻易地在你的台式电脑或笔记本上阅读提示、回消息。

你怎么看待 KDE Connect？发在下面的评论框来让我知道吧。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/kde-connect-guide/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[yjacks](https://github.com/yjacks)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://kdeconnect.kde.org/
[2]: https://www.debugpoint.com/tag/arch-linux
[3]: https://kdeconnect.kde.org/download.html
[4]: https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp&hl=en_IN&gl=US
[5]: https://f-droid.org/en/packages/org.kde.kdeconnect_tp/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-in-Android-Device-showing-connected-Linux-System-1024x656.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-before-pairing-1024x368.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/01/Pairing-Request-for-KDE-Connect-1024x917.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-after-successful-pairing-1024x249.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/Enabling-Notification-Sync-1024x718.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/01/Sample-Notification-in-Mobile-Phone-914x1024.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/01/Sample-Notification-in-KDE-Connect-from-Mobile-Phone.jpg
