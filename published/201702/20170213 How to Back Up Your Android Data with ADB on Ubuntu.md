如何在 Ubuntu 上使用 ADB 备份 Android 数据
============================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/android-backup-ubuntu.jpg "How to Back Up Your Android Data with ADB on Ubuntus")

备份 Android 系统上的应用数据、文本信息等等是非常乏味的，有时还很昂贵。电子市场的许多应用都承诺可以备份数据，但效果不佳或者需要付昂贵费用。你是否知道有一种更好的方法可以来做这件事，并且在你的电脑上就可以完成？

Android 自带一套开发工具。有许多种开发工具，但人们最为感兴趣的项目是 ADB（或者叫做 <ruby>Android 调试桥<rt> Android Debug Bridge</rt></ruby>）。它允许用户通过命令行直接访问任何 Android 设备。有了这个工具，一切皆有可能 - 包括备份整个 Android 设备。在这篇文章中，将讨论如何在 Ubuntu 系统上完成这件事。

**注**：这篇教程是针对 Ubuntu Linux 系统的。不过， ADB 在 Windows 系统和 Mac 上也是可用的，也可以在这些平台上对 Android 数据进行备份。[下载针对 Windows 和 Mac 的 ADB 版本。][10]

### 安装 ADB 并启用 USB 调试

打开一个终端窗口，然后输入下面的命令来安装 ADB，它将与 Android 进行会话。

```
sudo apt install adb
```

 ![adb-install-adb-ubuntu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-install-adb-ubuntu.jpg "adb-install-adb-ubuntu")

在系统上安装好 ADB 工具以后，需要在 Android 内部启动调试。首先打开 Android 的<ruby>设置<rt>Settings</rt></ruby>区域。然后一直滚动到底部找到“<ruby>关于手机<rt>About Phone</rt></ruby>”并点击。这将打开“<ruby>电话状态<rt>Phone status</rt></ruby>”页。在这一页面上再次滚动到底部，找到“<ruby>版本号<rt>Build number</rt></ruby>”并点击七次，从而启动开发者模式。

 ![adb-about-phone](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-about-phone.jpg "adb-about-phone")

为了进入<ruby>开发者设置<rt>Developer Settings</rt></ruby>，按设备上的返回键返回上一页面。在“设置”中将会出现一个新的选项：“<ruby>开发者选项<rt>Developer options</rt></ruby>”。点击它进入开发者设置区域。滚动页面直到看到 “<ruby>Android 调试<rt>Android debugging</rt></ruby>”（或它的一些其他名称），点击它启用设置。

### 备份

使用 ADB 创建一个备份就如同运行一个命令一样简单。首先，用一根与 Android 设备匹配的 USB 线将 Android 设备连接到电脑上。然后打开终端运行下面的命令：

```
adb start-server
```

这将启动 ADB 服务器。运行这个命令时，要快速解锁 Android 设备，因为 ADB 将强制出现一个确认窗口，必须选择接受后才可继续。

 ![adb-all-usb-debugging](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-all-usb-debugging.jpg "adb-all-usb-debugging")

要启动备份进程，打开终端，然后执行下面的备份命令。该命令将读取 Android 上的文本信息以及其他应用数据，然后存入加密文件中。

```
adb backup -apk -shared -all -f backup-file.adb
```

 ![adb-full-backup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-full-backup.jpg "adb-full-backup")

当运行备份命令时，Android 会在启动备份进程前提示用户查看 Android 并设置加密文件的密码。请输入一个强壮而容易记住的密码。然后，点击“备份我的数据”按钮。备份过程将会花费一定时间。备份完成以后，在目录 `/home/username/` 中会出现一个叫做 `backup-file.adb` 的文件。

### 恢复备份

要恢复备份，首先启用 ADB 服务器（像上面提到的一样），然后运行下面这个命令来还原备份数据：


```
adb restore backup-file.adb
```

 ![adb-full-restore](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/adb-full-restore.jpg "adb-full-restore")

再次转到 Android， 因为 ADB 将提示用户输入密码。这次，不是创建一个密码，而是需要输入之前创建的那个密码。在点击 “<ruby>恢复我的数据<rt>restore my data</rt></ruby>” 以后，恢复进程就开始了。耐心点，因为这可能需要一定时间。

### 结论

没有多少 Android 用户知道这样备份数据，但是 ADB 的确很强大。利用它甚至可以获得对设备的 root 访问。事实上，利用这个工具还可以做很多的事情，需要更多的文章来讨论它。

你还知道 ADB 可以用来干什么吗？请在下面的评论区告知我们！


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/back-up-android-data-adb-ubuntu/

作者：[Derrik Diener][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/back-up-android-data-adb-ubuntu/#comments
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F&text=How+to+Back+Up+Your+Android+Data+with+ADB+on+Ubuntu
[6]:mailto:?subject=How%20to%20Back%20Up%20Your%20Android%20Data%20with%20ADB%20on%20Ubuntu&body=https%3A%2F%2Fwww.maketecheasier.com%2Fback-up-android-data-adb-ubuntu%2F
[7]:https://www.maketecheasier.com/download-appx-files-from-windows-store/
[8]:https://www.maketecheasier.com/airy-youtube-video-downloader-2/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:https://developer.android.com/studio/command-line/adb.html
