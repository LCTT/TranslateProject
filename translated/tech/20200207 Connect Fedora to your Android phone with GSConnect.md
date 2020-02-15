[#]: collector: (lujun9972)
[#]: translator: (chai-yuan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Connect Fedora to your Android phone with GSConnect)
[#]: via: (https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/)
[#]: author: (Lokesh Krishna https://fedoramagazine.org/author/lowkeyskywalker/)

使用GSConnect将Android手机连接到Fedora系统
======

![][1]

苹果和微软公司都提供了集成好的与移动设备交互的应用。Fedora提供了类似的工具——**GSConnect**。它可以让你将你的安卓手机和你的Fedora桌面配对并使用。读下去，来了解更多关于它是什么以及它是如何工作的信息。 

### GSConnect是什么?

GSConnect是基于KDE Connect项目而为GNOME桌面定制的程序。KDE Connect使你的设备相互之间能够进行通信。但是，在Fedora的默认GNOME桌面上安装它需要安装大量的KDE依赖。

GSConnect基于KDE Connect实现，作为GNOME shell的拓展应用。一旦安装，GSConnect允许您执行以下操作：

  * 在电脑上接收电话通知并回复信息
  * 用手机操纵你的桌面
  * 在不同设备之间分享文件与链接
  * 在电脑上查看手机电量
  * 让手机响铃以便你能找到它



### 设置GSConnect扩展

设置GSConnect需要安装两款软件：电脑上的GSConnect扩展和Android设备上的KDE Connect应用。

首先，从GNOME Shell扩展网站[GSConnect][2]安装GSConnect扩展。（Fedora Magazine有一篇关于[如何安装GNOMEShell扩展名][3]的文章，可以帮助你完成这一步。）

KDE Connect应用程序可以在Google的[Play Store][4]上找到。它也可以在FOSS Android应用程序库[F-Droid][5]上找到。 

一旦安装了这两个组件，就可以配对两个设备。安装扩展后再系统菜单中显示“移动设备(Mobile Devices)”。单击它会出现一个下拉菜单，你可以从中访问“移动设置(Mobile Settings)”。

![][6]

在这里，你可以用GSConnect查看并管理配对的设备。进入此界面后，需要在Android设备上启动应用程序。 

配对的初始化可以再任意一台设备上进行，在这里我们从Android设备连接到电脑。点击应用程序上的刷新(refresh)，只要两个设备都在同一个无线网络环境中，你的Android设备便可以搜索到你的电脑。现在可以向桌面发送配对请求，并在桌面上接受配对请求以完成配对。

![][7]

### 使用 GSConnect

配对后，你将需要授予对Android设备的权限，才能使用GSConnect上提供的许多功能。单击设备列表中的配对设备，便可以查看所有可用功能，并根据你的偏好和需要启用或禁用它们。

![][8]

请记住，你还需要在Android应用程序中授予相应的权限才能使用这些功能。启用权限后，你现在可以访问桌面上的移动联系人，获得消息通知并回复消息，甚至同步桌面和Android设备剪贴板。

### 集成在文件系统与浏览器上

GSConnect允许你直接从桌面文件资源管理器向Android设备发送文件。

在Fedora的默认GNOME桌面上，你需要安装_nautilus-python_依赖包，以便在菜单中显示配对的设备。安装它只需要再终端中输入：

```
$ sudo dnf install nautilus-python
```

完成后，将在“文件(Files)”的菜单中显示“发送到移动设备(Send to Mobile Device)”选项。

![][9]

同样，为你的浏览器安装相应的WebExtension，无论是[Firefox][10]还是[Chrome][11]浏览器，都可以将链接发送到你的Android设备。你可以选择直接在浏览器中发送要启动的链接，或将其作为短信息发送。 

### 运行命令

GSConnect允许你定义命令，然后可以从远程设备在电脑上运行这些命令。这使得你可以远程截屏，或者从你的Android设备锁定和解锁你的桌面。 

![][12]

要使用此功能，可以使用标准shell命令和GSConnect公开的CLI。项目的GitHub存储库中提供了有关此操作的文档： _CLI Scripting_。

[KDE UserBase Wiki][13]有一个命令示例列表。这些例子包括控制桌面的亮度和音量，锁定鼠标和键盘，甚至更改桌面主题。其中一些命令是针对KDE Plasma设计的，需要进行修改才能在GNOME桌面上运行。

### 探索并享受乐趣

GSConnect使我们能够享受到极大的便利和舒适。深入研究首选项，查看你可以做的所有事情，灵活的使用这些命令功能。并在下面的评论中自由分享你解锁的新方式。 

* * *

_Photo by [Pathum Danthanarayana][14] on [Unsplash][15]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/

作者：[Lokesh Krishna][a]
选题：[lujun9972][b]
译者：[chai-yuan](https://github.com/chai-yuan)
校对：[校对者ID](https://github.com/校对者ID)

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
