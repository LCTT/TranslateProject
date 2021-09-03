[#]: subject: "Access your iPhone on Linux with this open source tool"
[#]: via: "https://opensource.com/article/21/8/libimobiledevice-iphone-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13737-1.html"

用这个开源工具在 Linux 上访问你的 iPhone
======

> 通过使用 Libimobiledevice 从 Linux 与 iOS 设备进行通信。

![](https://img.linux.net.cn/data/attachment/album/202108/31/092907bc26qep3ekc73czl.jpg)

iPhone 和 iPad 绝不是开源的，但它们是流行的设备。许多拥有 iOS 备的人恰好也在使用大量的开源软件，包括 Linux。Windows 和 macOS 的用户可以通过使用苹果公司提供的软件与 iOS 设备通信，但苹果公司不支持 Linux 用户。开源程序员早在 2007 年（就在 iPhone 发布一年后）就以 Libimobiledevice（当时叫 libiphone）来拯救了人们，这是一个与 iOS 通信的跨平台解决方案。它可以在 Linux、Android、Arm 系统（如树莓派）、Windows、甚至 macOS 上运行。

Libimobiledevice 是用 C 语言编写的，使用原生协议与 iOS 设备上运行的服务进行通信。它不需要苹果公司的任何库，所以它完全是自由而开源的。

Libimobiledevice 是一个面向对象的 API，它捆绑了许多便于你使用的终端工具。该库支持苹果从最早到其最新的型号的 iOS 设备。这是多年来研究和开发的结果。该项目中的应用包括 `usbmuxd`、`ideviceinstaller`、`idevicerestore`、`ifuse`、`libusbmuxd`、`libplist`、`libirecovery` 和 `libideviceactivation`。

### 在 Linux 上安装 Libimobiledevice

在 Linux 上，你可能已经默认安装了 `libimobiledevice`。你可以通过你的软件包管理器或应用商店找到，或者通过运行项目中包含的一个命令：

```
$ ifuse --help
```

你可以用你的包管理器安装 `libimobiledevice`。例如，在 Fedora 或 CentOS 上：

```
$ sudo dnf install libimobiledevice ifuse usbmuxd
```

在 Debian 和 Ubuntu 上：


```
$ sudo apt install usbmuxd libimobiledevice6 libimobiledevice-utils
```

或者，你可以从源代码 [下载][2] 并安装 `libimobiledevice`。

### 连接你的设备

当你安装了所需的软件包，将你的 iOS 设备连接到你的电脑。

为你的 iOS 设备建立一个目录作为挂载点。

```
$ mkdir ~/iPhone
```

接下来，挂载设备：

```
$ ifuse ~/iPhone
```

你的设备提示你，是否信任你用来访问它的电脑。

![iphone prompts to trust the computer][3]

*图 1：iPhone 提示你要信任该电脑。*

信任问题解决后，你会在桌面上看到新的图标。

![iphone icons appear on desktop][4]

*图 2：iPhone 的新图标出现在桌面上。*

点击 “iPhone” 图标，显示出你的 iPhone 的文件夹结构。

![iphone folder structure displayed][5]

*图 3：显示了 iPhone 的文件夹结构。*

我通常最常访问的文件夹是 `DCIM`，那里存放着我的 iPhone 照片。有时我在写文章时使用这些照片，有时有一些照片我想用 GIMP 等开源应用来增强。可以直接访问这些图片，而不是通过电子邮件把它们发给我自己，这是使用 `libimobiledevice` 工具的好处之一。我可以把这些文件夹中的任何一个复制到我的 Linux 电脑上。我也可以在 iPhone 上创建文件夹并删除它们。

### 发现更多

[Martin Szulecki][6] 是该项目的首席开发者。该项目正在寻找开发者加入他们的 [社区][7]。Libimobiledevice 可以改变你使用外设的方式，而无论你在什么平台上。这是开源的又一次胜利，这意味着它是所有人的胜利。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/libimobiledevice-iphone-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://github.com/libimobiledevice/libimobiledevice/
[3]: https://opensource.com/sites/default/files/1trust_0.png
[4]: https://opensource.com/sites/default/files/2docks.png
[5]: https://opensource.com/sites/default/files/2iphoneicon.png
[6]: https://github.com/FunkyM
[7]: https://libimobiledevice.org/#community
