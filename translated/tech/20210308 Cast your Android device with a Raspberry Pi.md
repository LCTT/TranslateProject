[#]: subject: (Cast your Android device with a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/android-raspberry-pi)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (RiaXu)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用树莓派投射你的安卓设备
======
使用Scrcpy可以把你的手机屏幕变成一个应用，与在树莓派或任何其他基于Linux的设备上的应用一起运行。
![A person looking at a phone][1]

要远离我们日常使用的电子产品是很难的。在熙熙攘攘的现代生活中，我想确保我不会错过手机屏幕上弹出的来自朋友和家人的重要信息。我很忙而且不希望迷失在令人分心的事情中，但是拿起手机并且恢复信息往往会使我分心。


更糟糕的是，还有很多其他的设备。幸运地是，大多数的设备（从功能强大的笔记本电脑到甚至不起眼的树莓派）都可以运行Linux。因为它们运行Linux，所以我找到的解决方案几乎都适用于其他设备。


### 万全之策

我想要一种无论我使用什么屏幕，都能统一我生活中不同来源的数据的方法。

我决定通过把手机屏幕复制到电脑上来解决这个问题。本质上，我把手机变成了一个应用，可以和其他所有程序运行在一起。这个有助于我将注意力集中在桌面上，防止我走神，并使我更容易回复紧急通知。

听起来有吸引力吗？你也可以这样做。

### 设置Scrcpy

[Scrcpy][2], 通常被称为屏幕复制（Screen Copy），是一个开源屏幕镜像工具，它可以在Linux、Windows或者MacOS上显示和控制安卓设备。安卓设备和计算机之间的通信主要是通过USB连接和安卓调试桥（Android Debug Bridge， ADB）。它使用TCP/IP，且不需要root权限访问。


Scrcpy的设置和配置非常简单。如果你正在运行Fedora，你可以从Copr仓库安装它：


```
$ sudo dnf copr enable zeno/scrcpy
$ sudo dnf install scrcpy -y
```

在Debian或者Ubuntu上：


```
`$ sudo apt install scrcpy`
```

你也可以自己编译Scrcpy。即使是在树莓派上，使用[Scrcpy的Github主页][3]上的说明来构建也不需要很长时间。

### 设置手机

Scrcpy安装好后，你必须启用USB调试并授权每个设备（你的树莓派、笔记本电脑或者工作站）为受信任的控制器。

打开安卓上的**设置**应用程序。如果**开发者选项**没有被激活，按照安卓的[说明来解锁它][4]。

接下来，启用**USB调试**。

![Enable USB Debugging option][5]

(Sudeshna Sur, [CC BY-SA 4.0][6])

然后通过USB将手机连接到你的树莓派或者笔记本电脑（或者你正在使用的任何设备），如果可以选择的话，将模式设置为[PTP][7]。如果你的手机不能使用PTP，将你的手机设置为用于传输文件的模式（而不是，如，作为一个捆绑或者MIDI设备）。

你的手机可能会提示你授权你的电脑，这个是会通过它的RSA指纹进行识别的。你只需要在你第一次连接的时候操作即可，在之后你的手机会识别并信任你的计算机。

使用`lsusb`命令确认设置：


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

然后执行`$scrcpy`在默认设置下运行。

![Scrcpy running on a Raspberry Pi][8]

(Opensource.com, [CC BY-SA 4.0][6])

性能和响应能力取决于你使用什么设备来控制你的手机。在一个派上，一些动画可能会变慢，甚至有时候会响应滞后。Scrcpy提供了一个简单的解决办法：降低scrcpy显示的图像的位速率和分辨率使得你的计算机能够容易显示动画。使用以下命令来实现：


```
`$ scrcpy --bit-rate 1M --max-size 800`
```

尝试不同的值来找到一个适合你的值。为了使键入更方便，在选定一个命令之后，可以考虑[创建自己的Bash别名][9]。

### 冲破束缚

一旦Scrcpy开始运行，你甚至可以通过WIFI连接你的手机和计算机。Scrcpy安装过程也会安装`adb`，它是一个完成安卓设备之间通信的命令。Scrcpy也可以使用这个命令与设备通信，`adb`可以通过TCP/IP连接。

![Scrcpy running on a computer][10]

(Sudeshna Sur, [CC BY-SA 4.0][6])

试试吧，请确保你的手机通过WIFI连在与你的计算机所使用的相同的无线网络上。依然不要断开你的手机与USB的连接！

接下来，通过手机中的**设置**，选择**关于手机**来获取你手机的IP地址。查看**状态**选项来获得你的地址。它通常是192.168或者10开头。

或者，你也可以使用`adb`来获得你手机的IP地址：


```
$ adb shell ip route | awk '{print $9}'

为了通过WIFI连接你的设备，你必须打开TCP/IP连接。也就是说你必须通过adb命令：
$ adb tcpip 5555
现在你可以断开手机和USB的连接了。
任何你想通过WIFI连接的时候，首先需要通过adb命令连接你的手机。例如，假设我的手机IP地址是10.1.1.22，命令如下：
$ adb connect 10.1.1.22:5555
```

连接好之后，你就可以像往常一样运行Scrcpy了。

### 远程控制

Scrcpy很容易使用。你可以在终端或者[一个图形界面应用][11]中尝试它。

你是否在使用另一个屏幕镜像？如果有的话，请在评论中告诉我们吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/android-raspberry-pi

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/ShuyRoy)
校对：[校对者ID](https://github.com/校对者ID)

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
