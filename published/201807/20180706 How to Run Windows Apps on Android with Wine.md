如何在 Android 上借助 Wine 来运行 Windows Apps
======

![](https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-featured-image.jpg)

Wine（一种 Linux 上的程序，不是你喝的葡萄酒）是在类 Unix 操作系统上运行 Windows 程序的一个自由开源的兼容层。创建于 1993 年，借助它你可以在 Linux 和 macOS 操作系统上运行很多 Windows 程序，虽然有时可能还需要做一些小修改。现在，Wine 项目已经发布了 3.0 版本，这个版本兼容 Android 设备。

在本文中，我们将向你展示，在你的 Android 设备上如何借助 Wine 来运行 Windows Apps。

**相关阅读** : [如何使用 Winepak 在 Linux 上轻松安装 Windows 游戏][1]

### 在 Wine 上你可以运行什么？

Wine 只是一个兼容层，而不是一个全功能的仿真器，因此，你需要一个 x86 的 Android 设备才能完全发挥出它的优势。但是，大多数消费者手中的 Android 设备都是基于 ARM 的。

因为大多数人使用的是基于 ARM 的 Android 设备，所以有一个限制，只有适配在 Windows RT 上运行的那些 App 才能够使用 Wine 在基于 ARM 的 Android 上运行。但是随着发展，能够在 ARM 设备上运行的 App 数量越来越多。你可以在 XDA 开发者论坛上的这个 [帖子][2] 中找到兼容的这些 App 的清单。

在 ARM 上能够运行的一些 App 的例子如下：

  * [Keepass Portable][3]： 一个密码钱包
  * [Paint.NET][4]： 一个图像处理程序
  * [SumatraPDF][5]： 一个 PDF 文档阅读器，也能够阅读一些其它的文档类型
  * [Audacity][6]： 一个数字录音和编辑程序

也有一些再度流行的开源游戏，比如，[Doom][7] 和 [Quake 2][8]，以及它们的开源克隆，比如 [OpenTTD][9] 和《运输大亨》的一个版本。

随着 Wine 在 Android 上越来越普及，能够在基于 ARM 的 Android 设备上的 Wine 中运行的程序越来越多。Wine 项目致力于在 ARM 上使用 QEMU 去仿真 x86 的 CPU 指令，在该项目完成后，能够在 Android 上运行的 App 将会迅速增加。

### 安装 Wine

在安装 Wine 之前，你首先需要去确保你的设备的设置 “允许从 Play 商店之外的其它源下载和安装 APK”。对于本文的用途，你需要去许可你的设备从未知源下载 App。

1、 打开你手机上的设置，然后选择安全选项。

![wine-android-security][10]

2、 向下拉并点击 “Unknown Sources” 的开关。

![wine-android-unknown-sources][11]

3、 接受风险警告。

![wine-android-unknown-sources-warning][12]

4、 打开 [Wine 安装站点][13]，并点选列表中的第一个选择框。下载将自动开始。

![wine-android-download-button][14]

5、 下载完成后，从下载目录中打开它，或者下拉通知菜单并点击这里的已完成的下载。

6、 开始安装程序。它将提示你它需要访问和记录音频，并去修改、删除、和读取你的 SD 卡。你也可为程序中使用的一些 App 授予访问音频的权利。

![wine-android-app-access][15]

7、 安装完成后，点击程序图标去打开它。

![wine-android-icon-small][16]

当你打开 Wine 后，它模仿的是 Windows 7 的桌面。

![wine-android-desktop][17]

Wine 有一个缺点是，你得有一个外接键盘去进行输入。如果你在一个小屏幕上运行它，并且触摸非常小的按钮很困难，你也可以使用一个外接鼠标。

你可以通过触摸 “开始” 按钮去打开两个菜单 —— “控制面板”和“运行”。

![wine-android-start-button][18]

### 使用 Wine 来工作

当你触摸 “控制面板” 后你将看到三个选项 —— 添加/删除程序、游戏控制器、和 Internet 设定。

使用 “运行”，你可以打开一个对话框去运行命令。例如，通过输入 `iexplore` 来启动 “Internet Explorer”。

![wine-android-run][19]

### 在 Wine 中安装程序

1、 在你的 Android 设备上下载应用程序（或通过云来同步）。一定要记住下载的程序保存的位置。

2、 打开 Wine 命令提示符窗口。

3、 输入程序的位置路径。如果你把下载的文件保存在 SD 卡上，输入：

```
cd sdcard/Download/[filename.exe]
```

4、 在 Android 上运行 Wine 中的文件，只需要简单地输入 EXE 文件的名字即可。

如果这个支持 ARM 的文件是兼容的，它将会运行。如果不兼容，你将看到一大堆错误信息。在这种情况下，在 Android 上的 Wine 中安装的 Windows 软件可能会损坏或丢失。

这个在 Android 上使用的新版本的 Wine 仍然有许多问题。它并不能在所有的 Android 设备上正常工作。它可以在我的 Galaxy S6 Edge 上运行的很好，但是在我的 Galaxy Tab 4 上却不能运行。许多游戏也不能正常运行，因为图形驱动还不支持 Direct3D。因为触摸屏还不是全扩展的，所以你需要一个外接的键盘和鼠标才能很轻松地操作它。

即便是在早期阶段的发布版本中存在这样那样的问题，但是这种技术还是值得深思的。当然了，你要想在你的 Android 智能手机上运行 Windows 程序而不出问题，可能还需要等待一些时日。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/run-windows-apps-android-with-wine/

作者：[Tracey Rosenberger][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/traceyrosenberger/
[1]:https://www.maketecheasier.com/winepak-install-windows-games-linux/ "How to Easily Install Windows Games on Linux with Winepak"
[2]:https://forum.xda-developers.com/showthread.php?t=2092348
[3]:http://downloads.sourceforge.net/keepass/KeePass-2.20.1.zip
[4]:http://forum.xda-developers.com/showthread.php?t=2411497
[5]:http://forum.xda-developers.com/showthread.php?t=2098594
[6]:http://forum.xda-developers.com/showthread.php?t=2103779
[7]:http://forum.xda-developers.com/showthread.php?t=2175449
[8]:http://forum.xda-developers.com/attachment.php?attachmentid=1640830&amp;amp;d=1358070370
[9]:http://forum.xda-developers.com/showpost.php?p=36674868&amp;amp;postcount=151
[10]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-security.png "wine-android-security"
[11]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-unknown-sources.jpg "wine-android-unknown-sources"
[12]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-unknown-sources-warning.png "wine-android-unknown-sources-warning"
[13]:https://dl.winehq.org/wine-builds/android/
[14]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-download-button.png "wine-android-download-button"
[15]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-app-access.jpg "wine-android-app-access"
[16]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-icon-small.jpg "wine-android-icon-small"
[17]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-desktop.png "wine-android-desktop"
[18]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-start-button.png "wine-android-start-button"
[19]:https://www.maketecheasier.com/assets/uploads/2018/07/Wine-Android-Run.png "wine-android-run"
