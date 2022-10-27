[#]: subject: (Cast your Android device with a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/android-raspberry-pi)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13314-1.html)

将你的安卓手机屏幕投射到 Linux
======

> 使用 Scrcpy 可以把你的手机屏幕变成一个“应用”，与在树莓派或任何其他基于 Linux 的设备上的应用一起运行。

![](https://img.linux.net.cn/data/attachment/album/202104/20/162346alpbh85xz26xcb5h.jpg)

要远离我们日常使用的电子产品是很难的。在熙熙攘攘的现代生活中，我想确保我不会错过手机屏幕上弹出的来自朋友和家人的重要信息。我也很忙，不希望迷失在令人分心的事情中，但是拿起手机并且回复信息往往会使我分心。

更糟糕的是，有很多的设备。幸运地是，大多数的设备（从功能强大的笔记本电脑到甚至不起眼的树莓派）都可以运行 Linux。因为它们运行的是 Linux，所以我为一种设置找到的解决方案几乎都适用于其他设备。

### 普遍适用

我想要一种无论我使用什么屏幕，都能统一我生活中不同来源的数据的方法。

我决定通过把手机屏幕复制到电脑上来解决这个问题。本质上，我把手机变成了一个“应用”，可以和我所有的其他程序运行在一起。这有助于我将注意力集中在桌面上，防止我走神，并使我更容易回复紧急通知。

听起来有吸引力吗？你也可以这样做。

### 设置 Scrcpy

[Scrcpy][2] 俗称屏幕复制（Screen Copy），是一个开源的屏幕镜像工具，它可以在 Linux、Windows 或者 macOS 上显示和控制安卓设备。安卓设备和计算机之间的通信主要是通过 USB 连接和<ruby>安卓调试桥<rt>Android Debug Bridge</rt></ruby>（ADB）。它使用 TCP/IP，且不需要 root 权限访问。

Scrcpy 的设置和配置非常简单。如果你正在运行 Fedora，你可以从 COPR 仓库安装它：

```
$ sudo dnf copr enable zeno/scrcpy
$ sudo dnf install scrcpy -y
```

在 Debian 或者 Ubuntu 上：

```
$ sudo apt install scrcpy
```

你也可以自己编译 Scrcpy。即使是在树莓派上，按照 [Scrcpy 的 GitHub 主页][3] 上的说明来构建也不需要很长时间。

### 设置手机

Scrcpy 安装好后，你必须启用 USB 调试并授权每个设备（你的树莓派、笔记本电脑或者工作站）为受信任的控制器。

打开安卓上的“设置”应用程序。如果“开发者选项”没有被激活，按照安卓的 [说明来解锁它][4]。

接下来，启用“USB 调试”。

![Enable USB Debugging option][5]

然后通过 USB 将手机连接到你的树莓派或者笔记本电脑（或者你正在使用的任何设备），如果可以选择的话，将模式设置为 [PTP][7]。如果你的手机不能使用 PTP，将你的手机设置为用于传输文件的模式（而不是，作为一个<ruby>叠接<rt>tethering</rt></ruby>或者 MIDI 设备）。

你的手机可能会提示你授权你的电脑，这是通过它的 RSA 指纹进行识别的。你只需要在你第一次连接的时候操作即可，在之后你的手机会识别并信任你的计算机。

使用 `lsusb` 命令确认设置：

```
$ lsusb
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 011 Device 004: ID 046d:c21d Logitech, Inc. F310 Gamepad
Bus 005 Device 005: ID 0951:1666 Kingston Technology DataTraveler G4
Bus 005 Device 004: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 004 Device 001: ID 18d1:4ee6 Google Inc. Nexus/Pixel Device (PTP + debug)
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

然后执行 `scrcpy` 以默认设置运行。

![Scrcpy running on a Raspberry Pi][8]

性能和响应能力取决于你使用什么设备来控制你的手机。在树莓派派上，一些动画可能会变慢，甚至有时候会响应滞后。Scrcpy 提供了一个简单的解决办法：降低 Scrcpy 显示图像的位速率和分辨率使得你的计算机能够容易显示动画。使用以下命令来实现：

```
$ scrcpy --bit-rate 1M --max-size 800
```

尝试不同的值来找到一个适合你的值。为了使键入更方便，在选定一个命令之后，可以考虑 [创建自己的 Bash 别名][9]。

### 剪断连线

Scrcpy 开始运行后，你甚至可以通过 WiFi 连接你的手机和计算机。Scrcpy 安装过程也会安装 `adb`，它是一个与安卓设备通信的命令。Scrcpy 也可以使用这个命令与你的设备通信，`adb` 可以通过 TCP/IP 连接。

![Scrcpy running on a computer][10]

要尝试的话，请确保你的手机通过 WiFi 连在与你的计算机所使用的相同的无线网络上。依然不要断开你的手机与 USB 的连接！

接下来，通过手机中的“设置”，选择“关于手机”来获取你手机的 IP 地址。查看“状态”选项来获得你的地址。它通常是 192.168 或者 10 开头。

或者，你也可以使用 `adb` 来获得你手机的IP地址：

```
$ adb shell ip route | awk '{print $9}'

To connect to your device over WiFi, you must enable TCP/IP connections. This, you must do through the adb command:
$ adb tcpip 5555
Now you can disconnect your mobile from USB.
Whenever you want to connect over WiFi, first connect to the mobile with the command adb connect. For instance, assuming my mobile's IP address is 10.1.1.22, the command is:
$ adb connect 10.1.1.22:5555
```

连接好之后，你就可以像往常一样运行 Scrcpy 了。

### 远程控制

Scrcpy 很容易使用。你可以在终端或者 [一个图形界面应用][11] 中尝试它。

你是否在使用其它的屏幕镜像工具？如果有的话，请在评论中告诉我们吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/android-raspberry-pi

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[ShuyRoy](https://github.com/ShuyRoy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://github.com/Genymobile/scrcpy
[3]: https://github.com/Genymobile/scrcpy/blob/master/BUILD.md
[4]: https://developer.android.com/studio/debug/dev-options
[5]: https://opensource.com/sites/default/files/uploads/usb-debugging.jpg (Enable USB Debugging option)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://en.wikipedia.org/wiki/Picture_Transfer_Protocol
[8]: https://opensource.com/sites/default/files/uploads/scrcpy-pi.jpg (Scrcpy running on a Raspberry Pi)
[9]: https://opensource.com/article/19/7/bash-aliases
[10]: https://opensource.com/sites/default/files/uploads/ssur-desktop.png (Scrcpy running on a computer)
[11]: https://opensource.com/article/19/9/mirror-android-screen-guiscrcpy
