[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12136-1.html)
[#]: subject: (A handy utility for creating Raspberry Pi SD card images)
[#]: via: (https://opensource.com/article/20/4/raspberry-pi-imager-mac)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

一个方便的用于创建树莓派 SD 卡镜像的程序
======

> 开始在 Mac 上使用 Raspberry Pi Imager。

![Raspberries with pi symbol overlay][1]

有多种购买树莓派的方法，根据你的购买渠道的不同，可能附带或不附带操作系统。要在树莓派上安装操作系统，只需将操作系统镜像 “闪存” 到 SD 卡即可。为了使之尽可能简单，[树莓派基金会][2]推出一个 Raspberry Pi Imager 实用程序，你可以在所有主流平台上下载它。下面就来简单介绍一下这个有用的新工具。

### 安装 Imager

你通常可以在[树莓派下载][3]页面上找到 Raspberry Pi Imager。它有 Mac、Ubuntu 和 Windows 版本。我将下载并演示 Mac 版本。

Mac 的安装包是常规的 DMG 镜像，它会挂载到你的桌面，然后经典的安装界面就会出现：

![Raspberry Pi Imager installer][4]

只需将可爱的树莓图标拖到“应用”文件夹，就可以完成。从启动台中调用它，你会看到一系列简单的按钮和菜单供你选择。真的不能比这更简单了：

![Raspberry Pi Imager home screen][5]

### 可用的镜像和选项

默认选项包含各种树莓派型号的镜像。Raspbian 是首选，它有两个可用的选项，较小的 “Lite” 版本和较大的 “Full” 版本。LibreELEC Kodi 娱乐系统有各种特定于型号的版本。Ubuntu 18 和 19 有适用于不同树莓派型号的 32 位和 64 位版本。有一个 RPi 4 EEPROM 恢复程序，以及使用 FAT32 格式化卡的功能。最后，有一个通用的镜像安装程序选项，稍后我将进行尝试。这个简单而紧凑的程序非常方便。

### 安装一些镜像

我决定使用 16g 的 micro SD 卡。我选择了默认的 Raspbian 镜像，选择已连接的 USB/SD 设备，然后按下 “WRITE” 按钮。这是一个简短的演示：

![Raspberry Pi Imager demo][6]

我没有在此处发布整个操作过程。我认为它是在写入的时候下载了镜像，对于我的无线连接这花费了几分钟。该过程在完成之前要先经过写入，然后经过验证环节。完成后，我弹出设备，并将卡插入到我的树莓派 3 中，然后按照通常的图形 Raspbian 安装向导和桌面环境进行设置。

这对我来说还不够。我每天都会下载许多 Linux，今天我还在寻找更多。我回到了[树莓派下载][3]页面，并下载了 RISC OS 镜像。这个过程几乎一样容易。下载 RISCOSPi.5.24.zip 文件，将其解压缩，然后找到 ro524-1875M.img 文件。在 “Operating System” 按钮中，我选择了 “Use Custom” 并选择了所需的镜像文件。这个过程几乎是相同的。唯一真正的不同是我必须在下载目录中搜寻并选择一个镜像。文件写完后，回到树莓派 3，RISC OS 可以使用了。

### 对 USB C 的抱怨 

顺便说一句，如今有多少人对 USB C 带来的不便感到沮丧？我使用的是只有 USB C 口的 MacBook Pro，我需要不断更换适配器才能完成工作。看看这个：

![USB C adapter][7]

是的，那是一个 USB C 到 USB A 适配器，然后是一个 USB 到 SD 卡读卡器，以及一个 SD 到 micro SD 适配器。我可能可以在网上找到一些东西来简化此过程，但这些都是我手头有的部件，以支持我家五花八门的 Mac、Windows 和 Linux 主机。说到这里就不多说了，但我希望你能从这些疯狂的东西中得到一个笑点。

### 总结

新的 Raspberry Pi Imager 是一种简单有效的工具，可以快速烧录树莓派镜像。[BalenaEtcher][8] 是用于对可移动设备进行烧录的类似工具，但是新的 Raspberry Pi Imager 通过省去了获取那些常见镜像的步骤，使普通树莓派系统安装（如 Raspbian）更加容易。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/raspberry-pi-imager-mac

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://www.raspberrypi.org/
[3]: https://www.raspberrypi.org/downloads/
[4]: https://opensource.com/sites/default/files/uploads/install_1.png (Raspberry Pi Imager installer)
[5]: https://opensource.com/sites/default/files/uploads/screen_2_0.png (Raspberry Pi Imager home screen)
[6]: https://opensource.com/sites/default/files/uploads/demo_3.gif (Raspberry Pi Imager demo)
[7]: https://opensource.com/sites/default/files/uploads/adapter_4.png (USB C adapter)
[8]: https://www.balena.io/etcher/
