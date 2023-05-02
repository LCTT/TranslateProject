[#]: subject: "Lock your camera to a specific USB port in OBS"
[#]: via: "https://opensource.com/article/22/1/cameras-usb-ports-obs"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 OBS 中将摄像头锁定到特定的 USB 端口
======
为了使复杂的摄像头设置标准化，你可以对 Linux 文件系统中摄像头的位置分配施加一些特殊规则。
![使用笔记本电脑的人][1]

如果在 Linux 上用多个摄像头 [使用 OBS 进行直播][2]，你可能会注意到摄像头会在开机时按照它们被检测到的顺序加载。通常情况下你可能不会太在意，但如果你有一个永久的直播设置和复杂的 OBS 模板，你需要知道物理世界中哪个摄像头将会显示在虚拟世界的哪个屏幕上。换句话说，你不希望今天将一个设备分配为“摄像头 A”，而明天它却成为“摄像头 B”。

为了使复杂的摄像头设置标准化，你可以对 Linux 文件系统中摄像头的位置分配施加一些特殊规则。

### udev 子系统

在 Linux 上处理硬件外设的系统称为 udev。它检测和管理你接入计算机的所有设备。你可能没有意识到它的存在，因为它不会吸引太多注意力。尽管当你插入 USB 闪存驱动器以在桌面上打开它或连接打印机时，你肯定与它互动过。

### 硬件检测

假设你有两个 USB 摄像头：一个在电脑左侧，另一个在右侧。左侧摄像头拍摄近景，右侧摄像头拍摄远景，并且在直播过程中你需要切换两个摄像头。在 OBS 中，你将每个摄像头添加到 **<ruby>源<rt>Sources</rt></ruby>** 面板中，并直观地将它们命名为 **camLEFT** 和 **camRIGHT**。

设想一种最坏的场景，你有两个 _相同的_ 摄像头：它们是同一品牌和同一型号。这是最坏的情况，因为当两个硬件设备完全相同时，它们几乎不可能有任何独特的 ID，以便你的电脑能够将它们区分开来。

不过，这个难题有解决办法，只需要一些简单的终端命令进行一些调查。

#### 1. 获取厂商和产品 ID

首先，将一个摄像头插入你想要它分配到的 USB 端口。然后输入以下命令：

```
$ lsusb
Bus 006 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
Bus 005 Device 003: ID 03f0:3817 Hewlett-Packard LaserJet P2015 series
Bus 003 Device 006: ID 045e:0779 Microsoft Corp. LifeCam HD-3000
Bus 003 Device 002: ID 8087:0025 Intel Corp. 
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 046d:c216 Logitech, Inc. Dual Action Gamepad
Bus 001 Device 002: ID 048d:5702 Integrated Technology Express, Inc. 
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
[...]

```

你通常可以专门搜索字符串 `cam` 以缩小结果范围，因为大多数（但不是所有）摄像头都会报告为摄像头。

```
$ lsusb | grep -i cam
Bus 003 Device 006: ID 045e:0779 Microsoft Corp. LifeCam HD-3000

```

这里有很多信息。ID 被列为 `045e:0779`。第一个数字是供应商 ID，第二个数字是产品 ID。把它们写下来，因为稍后你会需要它们。

#### 2. 获取 USB 标识符

你还获取了摄像头的设备路径：总线 3，设备 6。在 Linux中有一句话：“一切皆文件”，实际上，USB 设备被描述为以 `/dev/bus/usb/` 开始，以总线（本例中为 003）和设备（本例中为 006）结尾的文件路径。查看 `lsusb` 输出中的总线和设备号。它们告诉你该摄像头位于 `/dev/bus/usb/003/006`。

你可以使用 `udevadm` 命令获取此 USB 设备的内核代号：

```
$ sudo udevadm info --attribute-walk /dev/bus/usb/003/006 | grep "KERNEL="

   KERNEL=="3-6.2.1"

```

这个例子中的内核 USB 标识符是 `3-6.2.1`。把你系统中的标识符记下来，因为之后也会用到它。

#### 3. 为每个摄像头重复该过程

将另一个摄像头（如果你有多个摄像头，则为每个摄像头）连接到要分配给它的 USB 端口。这与你用于另一个摄像头的 USB 端口是不同的！

重复该过程，获取供应商和产品 ID（如果摄像头是相同的品牌和型号，则应与第一个摄像头相同）以及内核 USB 标识符。

```
$ lsusb | grep -i cam
Bus 001 Device 004: ID 045e:0779 Microsoft Corp. LifeCam HD-3000
$ sudo udevadm info --attribute-walk dev/bus/usb/001/004 | grep "KERNEL="

   KERNEL=="1-6"

```

在这个例子中，我已经确定我的摄像头连接到了 1-6 和 3-6.2.1（第一个是我的机器上的 USB 端口，另一个是插在我的机器上的显示器插口的集线器，这就是为什么一个比另一个更复杂的原因）。

### 编写一个 udev 规则

你已经有了所需的一切，因此现在可以编写一个规则，告诉 udev 在特定的 USB 端口找到一个摄像头时给它一个一致的标识符。

创建并打开一个名为 `/etc/udev/rules.d/50-camera.conf` 的文件，并输入这两个规则，使用适合你自己系统的厂商和产品 ID 和内核标识符：

```
SUBSYSTEM=="usb", KERNEL=="1-6", ATTR{idVendor}=="045e", ATTR{idProduct}=="0779", SYMLINK+="video100"

SUBSYSTEM=="usb", KERNEL=="3-6.2.1", ATTR{idVendor}=="045e", ATTR{idProduct}=="0779", SYMLINK+="video101"

```

这些规则告诉 udev，当在特定的 USB 位置找到与特定供应商和产品 ID 匹配的设备时，创建一个名为 `video100` 和 `video101` 的符号链接（有时也称为“别名”）。符号链接大多是任意的。我使用大数值数字，这样它们就容易被发现，并且数字不能与现有设备冲突。如果实际上有超过 101 个摄像头连接到计算机上，请使用 `video200` 和 `video201` 以确保安全（记得联系我！我很想了解 _那个_ 项目）。

### 重启

重新启动计算机。你现在可以让摄像头保持连接，但实际上这并不重要。一旦 udev 加载了规则，它就会遵循这些规则，无论设备是否在启动期间附加或稍后插入。

许多人说 Linux 从不需要重启，但是 udev 在引导期间加载其规则，而且此外，你想保证你的 udev 规则在重新启动时也起作用。

计算机重新启动后，请查看摄像头注册的 `/dev/video` 目录：

```
$ ls -1 /dev/video*
/dev/video0
/dev/video1
/dev/video100
/dev/video101
/dev/video2
/dev/video3

```

正如你所看到的，在 `video100` 和 `video101` 有条目。今天，这些是指向 `/dev/video2` 和 `/dev/video3` 的符号链接，但明天它们可能是指向 `/dev/video1` 和 `/dev/video2` 或任何其他基于 Linux 检测和分配文件的组合。

![两个摄像头角度][3]

(Photo by [Jeff Siepman][4])

你可以在 OBS 中使用这些符号链接，这样 camLEFT 始终是 camLEFT，camRIGHT 始终是 camRIGHT。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/cameras-usb-ports-obs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/life/15/12/real-time-linux-video-editing-with-obs-studio
[3]: https://opensource.com/sites/default/files/uploads/obs-udev.jpg (Two camera angles)
[4]: https://unsplash.com/@jeffsiepman?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
