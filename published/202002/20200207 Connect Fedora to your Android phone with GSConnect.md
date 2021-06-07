[#]: collector: (lujun9972)
[#]: translator: (chai-yuan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11897-1.html)
[#]: subject: (Connect Fedora to your Android phone with GSConnect)
[#]: via: (https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/)
[#]: author: (Lokesh Krishna https://fedoramagazine.org/author/lowkeyskywalker/)

使用 GSConnect 将 Android 手机连接到 Fedora 系统
======

![][1]

苹果和微软公司都不同程度的提供了桌面产品与移动设备集成。Fedora 提供了类似甚至更高集成度的工具——GSConnect。它可以让你将安卓手机和你的 Fedora 桌面配对并使用。请继续阅读，以了解更多关于它的情况以及它是如何工作的信息。 

### GSConnect 是什么?

GSConnect 是针对 GNOME 桌面定制的 KDE Connect 程序。KDE Connect 可以使你的设备能够互相通信。但是，在 Fedora 默认的 GNOME 桌面上安装它需要安装大量的 KDE 依赖。

GSConnect 是一个 KDE Connect 的完整实现，其以 GNOME shell 的拓展形式出现。安装后，GSConnect 允许你执行以下操作及更多：

* 在计算机上接收电话通知并回复信息
* 用手机操纵你的桌面
* 在不同设备之间分享文件与链接
* 在计算机上查看手机电量
* 让手机响铃以便你能找到它

### 设置 GSConnect 扩展

设置 GSConnect 需要安装两个组件：计算机上的 GSConnect 扩展和 Android 设备上的 KDE Connect 应用。

首先，从 GNOME Shell 扩展网站上安装  [GSConnect][2] 扩展。（Fedora Magazine 有一篇关于[如何安装 GNOME Shell 扩展][3]的文章，可以帮助你完成这一步。）

KDE Connect 应用程序可以在 Google 的 [Play 商店][4]上找到。它也可以在 FOSS Android 应用程序库 [F-Droid][5] 上找到。 

一旦安装了这两个组件，就可以配对两个设备。安装扩展后它在你的系统菜单中显示为“<ruby>移动设备<rt>Mobile Devices</rt></ruby>”。单击它会出现一个下拉菜单，你可以从中访问“<ruby>移动设置<rt>Mobile Settings</rt></ruby>”。

![][6]

你可以在这里用 GSConnect 查看并管理已配对的设备。进入此界面后，需要在 Android 设备上启动应用程序。 

你可以在任意一台设备上进行配对初始化，在这里我们从 Android 设备连接到计算机。点击应用程序上的“刷新”，只要两个设备都在同一个无线网络环境中，你的 Android 设备便可以搜索到你的计算机。现在可以向桌面发送配对请求，并在桌面上接受配对请求以完成配对。

![][7]

### 使用 GSConnect

配对后，你将需要在 Android 设备授予权限，才能使用 GSConnect 上提供的许多功能。单击设备列表中的已配对设备，便可以查看所有可用功能，并根据你的偏好和需要启用或禁用它们。

![][8]

请记住，你还需要在这个 Android 应用程序中授予相应的权限才能使用这些功能。启用权限后，你现在可以访问桌面上的移动联系人，获得消息通知并回复消息，甚至同步桌面和 Android 设备的剪贴板。

### 将你的浏览器与“文件”应用集成

GSConnect 允许你直接从计算机上的文件资源管理器的关联菜单向 Android 设备发送文件。

在 Fedora 的默认 GNOME 桌面上，你需要安装 `nautilus-python` 依赖包，以便在关联菜单中显示配对的设备。安装此命令非常简单，只需要在你的首选终端运行以下命令：

```
$ sudo dnf install nautilus-python
```

完成后，将在“<ruby>文件<rt>Files</rt></ruby>”应用的关联菜单中显示“<ruby>发送到移动设备<rt>Send to Mobile Device</rt></ruby>”选项。

![][9]

同样，为你的浏览器安装相应的 WebExtension，无论是 [Firefox][10] 还是 [Chrome][11] 浏览器，都可以将链接发送到你的 Android 设备。你可以选择直接发送链接以在浏览器中直接打开，或将其作为短信息发送。 

### 运行命令

GSConnect 允许你定义命令，然后可以从远程设备在计算机上运行这些命令。这使得你可以远程截屏，或者从你的 Android 设备锁定和解锁你的桌面。 

![][12]

要使用此功能，可以使用标准的 shell 命令和 GSConnect 提供的 CLI。该项目的 GitHub 存储库（CLI Scripting）中提供了有关此操作的文档。

[KDE UserBase Wiki][13] 有一个命令示例列表。这些例子包括控制桌面的亮度和音量、锁定鼠标和键盘，甚至更改桌面主题。其中一些命令是针对 KDE Plasma 设计的，需要进行修改才能在 GNOME 桌面上运行。

### 探索并享受乐趣

GSConnect 使我们能够享受到极大的便利和舒适。深入研究首选项，查看你可以做的所有事情，灵活的使用这些命令功能发挥创意，并在下面的评论中自由分享你解锁的新方式。 

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/

作者：[Lokesh Krishna][a]
选题：[lujun9972][b]
译者：[chai-yuan](https://github.com/chai-yuan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lowkeyskywalker/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/gsconnect-816x345.jpg
[2]: https://extensions.gnome.org/extension/1319/gsconnect/
[3]: https://fedoramagazine.org/install-gnome-shell-extension/
[4]: https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp
[5]: https://f-droid.org/en/packages/org.kde.kdeconnect_tp/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/01/within-the-menu-1024x576.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/01/pair-request-1024x576.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/01/permissions-1024x576.png
[9]: https://fedoramagazine.org/wp-content/uploads/2020/01/send-to-mobile-2-1024x576.png
[10]: https://addons.mozilla.org/en-US/firefox/addon/gsconnect/
[11]: https://chrome.google.com/webstore/detail/gsconnect/jfnifeihccihocjbfcfhicmmgpjicaec
[12]: https://fedoramagazine.org/wp-content/uploads/2020/01/commands-1024x576.png
[13]: https://userbase.kde.org/KDE_Connect/Tutorials/Useful_commands
[14]: https://unsplash.com/@pathum_danthanarayana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[15]: https://unsplash.com/s/photos/android?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
