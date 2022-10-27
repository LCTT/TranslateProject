[#]: subject: "How to Install Ubuntu Desktop on Raspberry Pi 4"
[#]: via: "https://itsfoss.com/install-ubuntu-desktop-raspberry-pi/"
[#]: author: "Avimanyu Bandyopadhyay https://itsfoss.com/author/avimanyu/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13817-1.html"

如何在树莓派 4 上安装 Ubuntu 桌面系统
======

> 本教程将详细告诉你在树莓派 4 设备上如何安装 Ubuntu 桌面。

![](https://img.linux.net.cn/data/attachment/album/202109/25/084015z4cfiiy8e1ezmmz0.jpg)

革命性的<ruby>树莓派<rt>Raspberry Pi</rt></ruby>是最受欢迎的单板计算机。它拥有基于 Debian 的操作系统，叫做 <ruby>[树莓派操作系统][1]<rt>Raspberry Pi OS</rt></ruby>（原名 Raspbian）。

还有其他几个 [可用于树莓派的操作系统][2]，但几乎所有的都是轻量级的，适合于树莓派设备的小尺寸和低端硬件。

随着标榜 8GB 内存和支持 4K 显示的树莓派 4B 的推出，情况发生了变化。其目的是将树莓派作为常规桌面使用，并在更大程度上成功地做到了这一点。

在 4B 型号之前，你可以 [在树莓派上安装 Ubuntu 服务器][3]，但桌面版本却无法使用。然而，**Ubuntu 现在为树莓派 4 提供了官方的桌面镜像**。

在本教程中，我将展示在树莓派 4 上安装 Ubuntu 桌面的步骤。

首先，快速了解一下运行要求。

### 在树莓派 4 上运行 Ubuntu 的要求

![][4]

以下是你需要的东西：

  1. 一个能够联网的 Linux 或 Windows 系统。
  2. [树莓派镜像工具][5] ：树莓派的官方开源工具，可以在你的 SD 卡上写入发行版镜像。
  3. Micro SD 卡：最低使用 16GB 的存储卡，推荐使用 32GB 的版本。
  4. 一个基于 USB 的 Micro SD 卡读卡器（如果你的电脑没有读卡器）。
  5. 树莓派 4 必备配件，如 HDMI 兼容显示器、[Micro HDMI 连接到标准 HDMI（A/M） 接口的电缆][6]、[电源（建议使用官方适配器）][7]、USB 的有线/无线键盘和鼠标/触摸板。

最好能够提前 [详细阅读树莓派的要求][8] 。

现在，闲话少叙，让我快速带领你完成 SD 卡的镜像准备。

### 为树莓派准备 Ubuntu 桌面镜像

树莓派提供了一个 GUI 应用程序，用于将 ISO 镜像写入 SD 卡中。**这个工具还可以自动下载兼容的操作系统，如 Ubuntu、树莓派操作系统等**。

![下载并将操作系统放入 SD 卡的官方工具][9]

你可以从官方网站上下载这个工具的 Ubuntu、Windows 和 macOS 版本：

- [下载树莓派镜像工具][10]

在 Ubuntu 和其他 Linux 发行版上，你也可以使用 Snap 安装它：

```
sudo snap install rpi-imager
```

安装完毕后，运行该工具。当你看到下面的界面时，选择 “<ruby>选择操作系统<rt>CHOOSE OS</rt></ruby>”：

![镜像工具：选择首选操作系统][11]

在“<ruby>操作系统<rt>Operating System</rt></ruby>”下，选择 “<ruby>其它通用的操作系统<rt>Other general purpose OS</rt></ruby>”：

![镜像工具: 其他通用的操作系统][12]

现在，选择 “Ubuntu”：

![镜像工具：发行版 - Ubuntu][13]

接下来，选择 “Ubuntu Desktop 21.04（RPI 4/400）”，如下图所示。

![镜像工具：发行版 - Ubuntu 21.04][14]

> **注意：**
>
> 如果你没有一个稳定的网络连接，你可以 [从 Ubuntu 的网站上单独下载 Ubuntu 的树莓派镜像][15]。在镜像工具中，在选择操作系统时，从底部选择“<ruby>使用自定义<rt>Use custom</rt></ruby>”选项。你也可以使用 Etcher 将镜像写入到 SD 卡上。

将 Micro SD 卡插入读卡器中，等待它挂载。选择“<ruby>存储设备<rt>Storage</rt></ruby>”下的 “<ruby>选择存储设备<rt>CHOOSE STORAGE</rt></ruby>”：

![镜像工具：选择存储设备（SD 卡）][16]

你应该可以根据存储空间大小，识别你的 Micro SD 卡。这里，我使用的是 32GB 的卡：

![镜像工具：选择 SD 卡][17]

现在点击“<ruby>写入<rt>WRITE</rt></ruby>”：

![镜像工具：镜像写入][18]

如果你已经备份了 SD 卡上的内容或是一张新卡，你可以直接进行：

![镜像工具：镜像写入确认][19]

由于这需要 [sudo][20] 的权限，你必须输入密码。如果你从终端运行 `sudo rpi-imager`，就不会出现这种情况：

![镜像工具：镜像写入授权需要密码][21]

如果你的 SD 卡有点旧，这将需要一些时间。如果它是一个新的高速 SD 卡，就无需很长时间：

![镜像工具：写入镜像][22]

为确保镜像写入成功，我不建议跳过验证：

![镜像工具：验证写入][23]

写入结束后，会有以下确认提示：

![镜像工具：写入成功][24]

现在，从你的系统中安全移除 SD 卡。

### 在树莓派上使用装有 Ubuntu 的 MicroSD 卡

已经成功了一半了。与常规的 Ubuntu 安装不同，无需创建一个临场安装环境。Ubuntu 已经安装在 SD 卡上了，而且几乎可以直接使用了。让我们来看看这里还剩下什么。

#### 第 1 步：将 SD 卡插入树莓派中

对于第一次使用的用户来说，有时会有点困惑，不知道那个卡槽到底在哪里？不用担心。它位于电路板背面的左手边。下面是一个插入卡后的倒置视图。

![树莓派 4B 板倒置，插入 Micro SD 卡][25]

按照这个方向将卡慢慢插入板子下面的卡槽，轻轻地插，直到它不再往前移动。你可能还会听到一点咔嚓声来确认。这意味着它已经完美地插入了。

![树莓派 SD 插槽在板子背面的左侧][26]

当你把它插进去的时候，你可能会注意到在插槽中有两个小针脚调整了自己的位置（如上图所示），但这没关系。一旦插入，卡看起来会有一点突出。这就是它应该有的样子。

![树莓派 SD 卡插入时有一小部分可见][27]

#### 第 2 步：设置树莓派

我无需在这里详细介绍。

保证电源线接头、微型 HDMI 线接头、键盘和鼠标接头（有线/无线）都牢固地连接到树莓派板的相关端口。

确保显示器和电源插头也已正确连接，然后再去打开电源插座。我不建议把适配器插到带电的插座上。参考 [电弧][28]。

确认了以上两个步骤后，你就可以 [打开树莓派设备的电源][29]。

#### 第 3 步：在树莓派上 Ubuntu 桌面的首次运行

当你打开树莓派的电源，你需要在初次运行时进行一些基本配置。你只需按照屏幕上的指示操作即可。

选择你的语言、键盘布局、连接到 WiFi 等：

![选择语言][30]

![选择键盘布局][31]

![选择 WiFi][32]

你可以根据需求选择时区：

![选择时区][33]

然后创建用户和密码：

![输入所需的用户名和密码][34]

之后的步骤将配置一些东西，这个过程需要一些时间：

![完成 Ubuntu 设置][35]

![完成 Ubuntu 设置][36]

系统会重新启动之前需要一些时间，最终，你将会来到 Ubuntu 的登录界面：

![Ubuntu 的登录界面][37]

现在，你可以开始享受树莓派上的 Ubuntu 桌面了：

![树莓派上的 Ubuntu 桌面][38]

### 总结

我注意到**一个暂时的异常情况**。在进行安装时，我的显示器左侧有一个红色的闪烁边界。这种闪烁（也有不同的颜色）在屏幕的随机部分也能注意到。但在重启和第一次启动后，它就消失了。

很高兴能够看到它在树莓派上运行，我非常需要 Ubuntu 开始为树莓派等流行的 ARM 设备提供支持。

希望这个教程对你有所帮助。如果你有问题或建议，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-ubuntu-desktop-raspberry-pi/

作者：[Avimanyu Bandyopadhyay][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[2]: https://itsfoss.com/raspberry-pi-os/
[3]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-desktop-raspberry-pi.png?resize=800%2C450&ssl=1
[5]: https://github.com/raspberrypi/rpi-imager
[6]: https://www.raspberrypi.org/products/micro-hdmi-to-standard-hdmi-a-cable/
[7]: https://www.raspberrypi.org/products/type-c-power-supply/
[8]: https://itsfoss.com/things-you-need-to-get-your-raspberry-pi-working/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-imager-tool.webp?resize=680%2C448&ssl=1
[10]: https://www.raspberrypi.org/software/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-os.webp?resize=681%2C443&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-other-general-purpose-os.webp?resize=679%2C440&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-os-ubuntu.webp?resize=677%2C440&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-os-ubuntu-21-04.webp?resize=677%2C440&ssl=1
[15]: https://ubuntu.com/download/raspberry-pi
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-storage.webp?resize=677%2C438&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-sd-card.webp?resize=790%2C450&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write.webp?resize=676%2C437&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write-confirm.webp?resize=679%2C440&ssl=1
[20]: https://itsfoss.com/add-sudo-user-ubuntu/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write-password.webp?resize=380%2C227&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-writing-image.webp?resize=673%2C438&ssl=1
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-verifying-changes.webp?resize=677%2C440&ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-write-successful.webp?resize=675%2C442&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-inverted-micro-sd-card-inserted.webp?resize=800%2C572&ssl=1
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-sd-slot-left-side-middle-below-board.webp?resize=632%2C324&ssl=1
[27]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-sd-card-inserted.webp?resize=650%2C432&ssl=1
[28]: https://www.electricianatlanta.net/what-is-electrical-arcing-and-why-is-it-dangerous/
[29]: https://itsfoss.com/turn-on-raspberry-pi/
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run.webp?resize=800%2C451&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-2.webp?resize=800%2C600&ssl=1
[32]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-3.webp?resize=800%2C600&ssl=1
[33]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-4.webp?resize=800%2C600&ssl=1
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-5.webp?resize=800%2C600&ssl=1
[35]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-6.webp?resize=800%2C600&ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-7.webp?resize=800%2C600&ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-login-screen.webp?resize=800%2C600&ssl=1
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-21-04-post-setup-desktop.webp?resize=800%2C450&ssl=1
