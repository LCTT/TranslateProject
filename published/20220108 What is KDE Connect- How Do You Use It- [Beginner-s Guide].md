[#]: subject: "What is KDE Connect? How Do You Use It? [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/2022/01/kde-connect-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "yjacks"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16022-1.html"

什么是 KDE Connect？怎么用？
======

![][0]

> 什么是 KDE Connect？它的主要特性是什么？它应该如何安装？本文提供了基本的使用指南。

科技日新月异。有各种软件、硬件和不同外形的设备。未来，不同设备之间将无缝集成，工作流程会跨越多个设备。每一天，我们都在向跨所有联网设备发送和接收数据的状态迈进。而 KDE Connect 就是引领 Linux 桌面系统向这一天进展的一面旗帜。

### 什么是 KDE Connect？

[KDE Connect][1] 是由 KDE 桌面团队开发的，提供了 Linux 系统与其他系统，如 Windows、MacOS、Android 及 Linux，的无缝连接。

KDE Connect 安装后会使你拥有接收电话的通知、发送或接受短信、浏览文件、发送或接受文件等许多功能。

此外，KDE Connect 在无线网络上遵循安全协议，以防止任何隐私泄露。它是自由开源的软件，出现任何隐患的可能性微乎其微。组合了这些优良特性，KDE Connect 是一款出色的工具。

下文介绍你如何安装和使用它。

### 安装 KDE Connect

本文将为你展示如何在 Linux 发行版和安卓智能手机之间连接。Windows 与安卓的连接也应是如此。

KDE Connect 的设置是一个双向过程。你必须在你的 Linux 发行版和你的安卓智能手机都安装 KDE Connect。

#### 在 Linux 发行版上安装

在你的 Linux 发行版上安装 KDE Connect 很简单。其在所有的主流 Linux 发行版的官方仓库中都可用。如果你在用 Ubuntu，并且想在终端安装，运行如下指令：

```
sudo apt install kdeconnect
```

Fedora：

```
sudo dnf install kdeconnect
```

Arch Linux：

```
pacman -S kdeconnect
```

或在 “<ruby>软件<rt>Software</rt></ruby>” 应用中搜索并安装。

对于 Windows 和其他 Linux 发行版，请参考 [这个页面][3] 的其他几种下载安装方式。

#### 在安卓智能手机上安装

在安卓设备中，在谷歌 Play 商店中搜索 “KDE Connect” 并安装。

> **[谷歌 Play 商店中的 KDE Connect][4]**

如果你在使用某个自由版本的安卓，你可以用下面的链接来通过 F-droid 安装。（感谢我们的读者提出这一条）。

> **[F-droid 商店中的 KDE Connect][5]**

### 设置 KDE Connect

KDE Connect 可以连接相同网络中的设备。因此，确保你的 Linux 系统和安卓设备都连接到了同一个无线网络中。

打开你手机里的 KDE Connect。你应该可以见到你的 Linux 系统的名称。如果没有看到任何内容，确保你的设备和 Linux 都连接到了同一个网络后点击“<ruby>刷新<rt>Refresh</rt></ruby>”。

![安卓中的 KDE Connect 显示连接到了 Linux 系统][6]

打开 Linux 中的 KDE Connect，你应当见到你的手机进入了下图展示的样子。

![配对前的 KDE Connect][7]

现在，点开你手机的名称然后点击 “<ruby>配对<rt>Pair</rt></ruby>”。

紧接着你的手机就会收到一个提醒：是否接受配对。选择 “<ruby>接受<rt>Accept</rt></ruby>”。

![KDE Connect 的配对请求][8]

代表你的手机的图标应当转为绿色 ，这表示你的手机和 Linux 系统都已经连接且配对。

![成功配对后的 KDE Connect][9]

默认情况下，程序会开启以下特性：

* 多媒体控制
* 远程输入
* 远程演示
* 搜寻设备
* 分享文件

以下的特性需要你的安卓设备的额外权限。因为它们与隐私相关，这意味着你需要手动启用它们。

* 短信发送及接收
* 控制媒体播放器
* 手机上接受电脑的键盘输入
* 提醒同步
* 来电提醒
* 联系人同步
* 接受鼠标操作

对于这些特性，你需要去手动打开选项，并在安卓手机中授予权限。然后你就可以在 Linux 设备中享受这些服务了。

### 示例：提醒同步

我将为你演示提醒同步选项应在何处打开。打开你安卓手机中的 KDE Connect 程序，进入 “<ruby>已连接设备<rt>Connected Device</rt></ruby>” 部分。打开 “<ruby>提醒同步<rt>Notification Sync</rt></ruby>” 并选择 “<ruby>打开设置应用<rt>OPEN SETTINGS</rt></ruby>”。

对 KDE Connect 启用通知访问，然后点击 “<ruby>允许<rt>Allow</rt></ruby>”。

![打开同步提醒中][10]

之后将展示你手机上的提醒到你的 Linux 设备。例如，下面的提醒是我在我的测试安卓设备中收到的。

![手机中的样例提醒][11]

同样的信息也展现在了 Linux 系统中的 KDE Connect。

![来自手机的样例信息在 KDE Connect 中][12]

同样地，在给 KDE Connect 权限后，你可以启动对你可用的其他服务。

### 总结

我希望这个指南可以帮助你在你的 Linux 系统和手机中设置 KDE Connect。

你可以在给与一些主要权限后，轻松地设置几个特性，以使 KDE Connect 应用程序发挥最大优势。配置完成后，你不再需要一直看你的手机。因为你可以在工作时轻易地在你的台式电脑或笔记本上阅读提示、回消息。

你觉得 KDE Connect 怎么样？发在下面的评论框来让我知道吧。

*（题图：MJ/5b09a037-14c3-4f62-a15a-dfd9fb2c7b3a）*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/kde-connect-guide/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[yjacks](https://github.com/yjacks)
校对：[wxy](https://github.com/wxy)

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
[0]: https://img.linux.net.cn/data/attachment/album/202307/22/141943rzv64oapavv7aa4o.jpg