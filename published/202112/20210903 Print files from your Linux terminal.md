[#]: subject: "Print files from your Linux terminal"
[#]: via: "https://opensource.com/article/21/9/print-files-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14099-1.html"

从 Linux 终端打印文件
======

> 使用 lpr 命令在终端中打印文件。

![](https://img.linux.net.cn/data/attachment/album/202112/20/135809an6s6bxyg7sjnwyq.jpg)

[在 Linux 上打印很容易][2]，但有时感觉要做很多工作，比如启动应用程序、打开文件、在菜单中找到打印选项，单击确认按钮等等。当你是一个终端用户时，通常希望使用简单的触发器执行复杂的操作。打印很复杂，但没有什么比 `lpr` 命令更简单了。

### 使用 lpr 命令打印

使用 `lpr` 命令在终端打印文件：

```
$ lpr myfile.odt
```

如果失败的话，你需要设置默认打印机或手动指定打印机。

### 设置默认打印机

根据我在 1984 年印刷的 Berkeley 4.2 手册的旧版本中找到的资料，`lpr` 命令会分页并将文件发送到打印机池，后者将数据传输到称为 <ruby>行式打印机<rt>line printer</rt></ruby> 的东西。

![显示 LPR 命令信息的页面][3]

现在，最初的 `lpr` 命令已经无法满足，因为现代计算机可以访问多台打印机，而且是那些比点阵行式打印机复杂得多的打印机。现在有一个称为<ruby>通用 Unix 打印系统<rt>Common Unix Printing System</rt></ruby>（CUPS）子系统，可以跟踪你的计算机可以访问的所有打印机，计算机应该使用哪个驱动程序与每台打印机通信，默认使用哪台打印机等等。 CUPS 捆绑提供的 `lpr.cups` 或 `lpr-cups` 命令通常以符号链接到 `lpr`，允许你首先借助 CUPS 配置从终端打印。

使用 `lpr` 打印文件，你应该首先设置默认打印机。你可以在系统的打印机设置中设置：

![设置默认打印机对话框][4]

或者，你也可以使用 `lpadmin` 命令设置：

```
$ sudo lpadmin -d HP_LaserJet_P2015_Series
$ lpstat -v
device for HP_LaserJet_P2015_Series: ipp://10.0.1.222:631/printers/HP_LaserJet_P2015_Series
```

### 使用环境变量设置

你不能在没有管理员账户的系统上设置默认打印机，因为更改打印机默认设置是一项特权任务。在 `lpr` 借助 CUPS 找到目标打印机前，它会在系统中查询 `PRINTER` [环境变量][5]。

在本例中，`HP_LaserJet_P2015_Series` 是打印机的名称。将 `PRINTER` 设置为该值：

```
$ PRINTER=HP_LaserJet_P2015_Series
$ export PRINTER
```

一旦设置了 `PRINTER` 变量，你就可以打印了：

```
$ lpr myfile.pdf
```

### 获取连接的打印机列表

你可以使用 `lpstat` 命令查看所有连接到系统接受打印任务的打印机：

```
$ lpstat -a
HP_LaserJet_P2015_Series accepting requests since Sun 1 Aug 2021 10:11:02 PM NZST
r1060 accepting requests since Wed 18 Aug 2021 04:43:57 PM NZST
```

### 打印到任意一台打印机

将打印机添加到系统后，并且现在你知道如何识别它们了，你可以打印到其中任何一台，无论你是否设置了默认打印机：

```
$ lpr -P HP_LaserJet_P2015_Series myfile.txt
```

### 如何定义打印机

CUPS 有一个友好的前端页面，可通过 Web 浏览器如 Firefox 访问。虽然它使用 Web 浏览器作为用户界面，但它实际上是在本机（一个称为 `localhost` 的位置）的 631 端口上提供服务。CUPS 管理连接到计算机的打印机，并将其配置存储在 `/etc/cups/priters.conf` 中。

`printers.conf` 文件包含详细描述计算机可以访问的打印设备的定义。不要直接编辑它，但如果你想这样做，你必须先停止 `cupsd` 守护进程。

一个典型的文件定义如下所示：

```
<Printer r1060>
  Info Ricoh 1060
  Location Downstairs
  MakeModel Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.6
  DeviceURI lpd://192.168.4.8
  State Idle
  StateTime 1316011347
  Type 12308
  Filter application/vnd.cups-raw 0 -
  Filter application/vnd.cups-raster 100 rastertogutenprint.5.2
  Accepting Yes
  Shared No
  JobSheets none none
  QuotaPeriod 0
  PageLimit 0
  KLimit 0
  OpPolicy default
  ErrorPolicy stop-printer
</Printer>
```

在本例中，打印机的名称是 `r1060`，即 “Ricoh Aficio 1060”。

`MakeModel` 属性是从 `lpinfo` 命令中提取的，该命令列出了系统上所有可用的打印机驱动程序。假设你知道要打印到 Ricoh Aficio 1060，那么你会发出以下命令：

```
$ lpinfo -m | grep 1060
gutenprint.5.2://brother-hl-1060/expert Brother HL-1060 - CUPS+Gutenprint v5.2.11
gutenprint.5.2://ricoh-afc_1060/expert Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.11
```

它会列出已安装的相关驱动程序。

`MakeModel` 属性是结果的后半部分。在本例中为 `Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.11`。

`DeviceURI` 属性标识打印机在网络上的位置（或物理位置，例如 USB 端口）。在本例中，它是 `lpd://192.168.4.8`，因为我使用 `lpd` 协议将数据发送到一台网络打印机。在我的另一个系统上，我有一个通过 USB 连接的 HP LaserJect 打印机，因此 `DeviceURI` 是 `hp:/usb/HP_LaserJet_P2015_Series?serial=00CNCJM26429`。

### 在终端中打印

将作业发送到打印机是一个简单的过程，只要你了解连接到系统的设备以及如何识别它们。在终端打印非常快速、高效，并且易于编写脚本或作为批处理作业完成。试试看！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/print-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv (Typewriter with hands)
[2]: https://opensource.com/article/21/8/setup-your-printer-linux
[3]: https://opensource.com/sites/default/files/berkeley-1984-lpr.jpeg
[4]: https://opensource.com/sites/default/files/printer-default.jpeg
[5]: https://opensource.com/article/19/8/what-are-environment-variables
