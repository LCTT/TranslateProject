[#]: collector: (lujun9972)
[#]: translator: (summer2233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12415-1.html)
[#]: subject: (Back up your phone's storage with this Linux utility)
[#]: via: (https://opensource.com/article/20/7/gphoto2-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Linux 实用程序 gPhoto2 备份手机存储
======

> 尽情地拍照吧，gphoto2 能够方便、快速地将照片从你的设备传输到 Linux 计算机上。

![](https://img.linux.net.cn/data/attachment/album/202007/14/170729pzljppapojy44ro4.jpg)

移动设备的最大缺点之一就是其将数据从设备传输到计算机很困难。移动设备在这一缺点上有着悠久的历史。早期的移动设备，如 Pilot 和掌上电脑 PDA 设备，需要使用特殊的同步软件来传输数据（你必须小心翼翼地做这件事，因为你的设备可能会因为电池耗尽而导致数据永久丢失）；旧版 iPod 只提供特定平台的界面。现代移动设备默认将你的数据发送到在线帐户，以便你可以在计算机上再次下载。

好消息——如果你正在运行 Linux，你可以使用 `gphoto2` 命令与移动设备进行连接。`gphoto2` 最初是作为一种与数码相机通信的方式而开发的，那时的数码相机只有传统的相机功能，现在的 `gphoto2` 可以和许多不同种类的移动设备通讯。别让这个名字骗了你，它可以处理所有类型的文件，而不仅仅是照片。更棒的是，它可以编写脚本、很灵活、并且比大多数 GUI 界面功能强大得多。

如果你曾经为在计算机和移动设备之间同步数据而苦恼，请了解一下 `gphoto2`。

### 安装 gPhoto2

很可能你的 Linux 系统已经安装了 libgphoto2，因为它是与移动设备连接的一个关键库，但你可能还需要安装命令 `gphoto2`，该命令可能在你的存储库中。

在 Fedora 或 RHEL 上：

```
$ sudo dnf install gphoto2
```

在 Debian 或 Ubuntu 上：

```
$ sudo apt install gphoto2
```

### 验证兼容性

若要确认你的移动设备是否受支持，请使用 `--list-cameras`，通过管道传输到 `less`：

```
$ gPhoto2 --list-cameras | less
```

或者你可以通过管道把它传送到 `grep` 来搜索一个词。例如，如果你有三星 Galaxy，则使用 `grep`，并通过选项 `-i` 关闭区分大小写：

```
$ gphoto2 --list-cameras | grep -i galaxy
  "Samsung Galaxy models (MTP)"
  "Samsung Galaxy models (MTP+ADB)"
  "Samsung Galaxy models Kies mode"
```

这证实了三星 Galaxy 设备支持通过 MTP 连接和通过 ADB 连接 MTP。

如果你没有在列表中找到自己的移动设备，你仍然可以尝试使用 `gphoto2`，可能你的设备在列表中使用了不同的称呼。

### 查找移动设备

要使用 gPhoto2，首先必须将移动设备插入计算机，设置为 MTP 模式，并且授予计算机与它交互的权限。这通常需要在你的移动设备上操作，往往是在屏幕上按下一个按钮，以允许其文件系统被刚刚连接的计算机访问。

![Screenshot of allow access message][2]

如果你不授权电脑访问移动设备，那么 gPhoto2 可以检测到你的移动设备，但它不能与之交互。

要确保计算机检测到你连接的移动设备，请使用 `--auto-detect` 选项：

```
$ gphoto2 --auto-detect
Model                       Port
---------------------------------------
Samsung Galaxy models (MTP) usb:002,010
```

如果你的移动设备没有被检测到，请先检查数据线，然后检查你的设备是否配置为通过 MTP、ADB 或其它 gPhoto2 支持的协议连接，如 `--list-cameras` 所示。

### 查询你的设备支持的特性

对于现代设备，通常有过多的潜在功能，但并非所有移动设备都支持这些功能。你可以用 `--abilities` 选项来确定自己的移动设备支持哪些功能。我觉得结果看起来直观。

```
$ gphoto2 --abilities
Abilities for camera            : Samsung Galaxy models (MTP)
Serial port support             : no
USB support                     : yes
Capture choices                 : Capture not supported by driver
Configuration support           : no
Delete selected files on camera : yes
Delete all files on camera      : no
File preview (thumbnail) support: no
File upload support             : yes
```

如果只连接一个设备，那么不需要指定查询的设备。但是，如果连接了多个 gPhoto2 可以与之交互的设备，则可以通过端口、相机型号或 usbid 指定设备。

### 与你的移动设备交互

如果你的设备支持拍摄功能，则可以从计算机调用你的摄像头来获取媒体。例如，要拍摄照片：

```
$ gphoto2 --capture-image
```

要拍摄照片并立即将其传输到连接的计算机：

```
$ gphoto2 --capture-image-and-download
```

你也可以录制视频和声音。如果连接了多个拍摄设备，可以按端口、相机型号或 usbid 指定要使用的设备：

```
$ gphoto2 --camera "Samsung Galaxy models (MTP)" \
--capture-image-and-download
```

### 文件和文件夹

要想更加智能地管理移动设备上的文件，你需要了解 gPhoto2 连接的文件系统的结构。

你可以使用 `--get-folders` 选项查看可用文件夹：

```
$ gphoto2 --list-folders
There are 2 folders in folder '/'.                                            
 - store_00010001
 - store_00020002
There are 0 folders in folder '/store_00010001'.
There are 0 folders in folder '/store_00020002'.
```

每个文件夹代表设备上的一个存储单元。在本例中，`store_00010001` 是内部存储器，`store_00020002` 是 SD 卡，这可能与你的设备的结构不同。

### 获取文件

现在你知道了设备的文件夹布局，就可以从设备获取照片了。你可以使用许多不同的选项，具体取决于你想从设备中获取什么。

如果你知道绝对路径，则可以获取指定的文件：

```
$ gphoto2 --get-file IMG_0001.jpg --folder /store_00010001/myphotos
```

你可以同时获得所有的文件：

```
$ gphoto2 --get-all-files --folder /store_00010001/myfiles
```

你可以只获取音频文件：

```
gphoto2 --get-all-audio-data --folder /store_00010001/mysounds
```

gPhoto2 还有其他的选择，其中大多数取决于你连接的设备和使用协议是否支持。

### 上传文件

现在你知道了潜在的目标文件夹，就可以将文件从计算机上传到你的设备。例如，假设有一个名为 `example.epub` 的文件在当前目录中，你可以使用 `--upload-file` 选项和 `--folder` 选项将文件发送到设备并指定要上传到的目录：

```
$ gphoto2 --upload file example.epub \
--folder store_00010001
```

如果你希望将多个文件上传到同一个位置，你可以在设备上创建一个目录：


```
$ gphoto2 --mkdir books \
--folder store_00010001
$ gphoto2 --upload-file *.epub \
--folder store_00010001/books
```

### 列出文件

若要查看设备上的文件，请使用 `--list-files` 选项：

```
$ gphoto2 --list-files --folder /store_00010001
There is 1 file in folder '/store_00010001'
#1     example.epub 17713 KB application/x-unknown
$ gphoto2 --list-files --folder /store_00010001/books
There is 1 file in folder '/store_00010001'
#1    example0.epub 17713 KB application/x-unknown
#2    example1.epub 12264 KB application/x-unknown
[...]
```

### 探索你的使用方式

gPhoto2 的大部分功能取决于你的设备，因此不同用户的体验可能不尽相同。在 `gphoto2 --help` 中列出了许多操作供你探索。使用gPhoto2，再也不用费劲把文件从你的设备传输到电脑上了！

这些开源图片库能够帮助你组织文件，并让的图片看起来很棒。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/gphoto2-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[summer2233](https://github.com/summer2233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://opensource.com/sites/default/files/uploads/gphoto2-mtp-allow.jpg (Screenshot of allow access message)
