[#]: subject: "How to set up your printer on Linux"
[#]: via: "https://opensource.com/article/21/8/add-printer-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "fisherue"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13740-1.html"

如何在 Linux 系统设置打印机
======

> 如果系统没有自动检测到你的打印机，这篇文章教你如何在 Linux 系统手动添加打印机。

![](https://img.linux.net.cn/data/attachment/album/202109/01/104541gvvxvriei677o76v.jpg)

即使未来已来，<ruby>电子墨水<rt>e-ink</rt></ruby>和 AR 技术可以现实应用，我们还是会用到打印机的。打印机制造商还不能做到让自己的专利打印机可以与各种计算机完全标准化传递信息，以至于我们需要各种打印机驱动程序，在任何操作系统上都是如此。电子电气工程师协会信息科学与技术处（IEEE-ISTO）下属的打印机工作组（PWG）和开放打印技术组织（OpenPrinting.org）长期合作致力于让人们可以（使用任何型号打印机）轻松打印。带来的便利就是，很多打印机可以不需要用户进行配置就可以自动被识别使用。

如果系统没有自动检测到你的打印机，你可以在这篇文章中找到如何在 Linux 系统手动添加打印机。文中假定你使用的是 GNOME 图形桌面系统，其设置流程同样适用于 KDE 或其他大多数桌面系统。

### 打印机驱动程序

在你尝试用打印机打印文件时，要先确认你的 Linux 系统上是不是已经安装了更新的打印机驱动程序。

可以尝试安装的打印机驱动程序有三大类：

  * 作为安装包提供的，捆绑在你的 Linux 系统上的开源 [Gutenprint 驱动程序][2] 
  * 打印机制造商提供的专用驱动程序
  * 第三方开发提供的打印机驱动程序

开源打印机驱动程序库可以驱动 700 多种打印机，值得安装，这里面可能就有你的打印机的驱动，说不定可以自动设置好你的打印机（，你就可以使用它了）。

### 安装开源驱动程序包（库）

有些 Linux 发行版已经预装了开源打印机驱动程序包，如果没有，你可以用包管理器来安装。比如说，在 Fedora、CentOS、Magela 等类似发行版的 Linux 系统上，执行下面命令来安装：

```
$ sudo dnf install gutenprint
```

惠普（HP）系列的打印机，还需要安装惠普的 Linux 图形及打印系统软件包（HPLIP）。如在 Debian、Linux Mint 等类似的系统上，可以使用下面的命令：

```
$ sudo apt install hplip
```

### 安装制造商提供的驱动程序

很多时候因为打印机制造商使用了非标准的接口协议，这种情况开源打印机驱动程序就不能驱动打印机。另外的情况就是，开源驱动程序可以驱动打印机工作，但是会缺少供应商特有的某些性能。这些情况，你需要访问制造商的网站，找到适合你的打印机型号的 Linux 平台驱动。安装过程各异，仔细阅读安装指南逐步安装。

如果你的打印机根本不被厂商支持，你或许也只能尝试第三方提供的该型号打印机的驱动软件了。这类第三方驱动程序不是开源的，但大多数打印机的专用驱动程序也不是。如果你需要额外花费从供应商那里获取帮助服务才能安装好驱动并使用你的打印机，那是很心疼，或者你索性把这台打印机扔掉，至少你知道下次再也不会购买这个品牌的打印机了。

### 通用打印驱动系统（CUPS）

<ruby>通用打印驱动系统<rt>Common Unix Printing System</rt></ruby>（CUPS）是由 Easy Software Products 公司于 1997 年开发的，2007 年被苹果公司收购。这是 Linux 平台打印的开源基础软件包，大多数现代发行版都为它提供了一个定制化的界面。得益于 CUPS 技术，你可以发现通过 USB 接口连接到电脑的打印机，甚至连接在同一网络的共享打印机。

一旦你安装了需要的驱动程序包，你就能手工添加你的打印机了。首先，把打印机连接到运行的电脑上，并打开打印机电源。然后从“活动”屏幕或者应用列表中找到并打开“打印机”设置。

![printer settings][4]

基于你已经安装的驱动包，你的 Linux 系统有可能自动检测识别到你的打印机型号，不需要额外的设置就可以使用你的打印机了。

![printer settings][5]

一旦你在列表中找到你的打印机型号，设置使用这个驱动，恭喜你就可以在 Linux 系统上用它打印了。

（如果你的打印机没有被自动识别，）你需要自行添加打印机。在“打印机”设置界面，点击右上角的解锁按钮，输入管理用户密码，按钮转换成“添加打印机”按钮。

然后点击这个“添加打印机”按钮，电脑会搜索已经连接的本地打印机型号并匹配相应驱动程序。如果要添加网络共享打印机，在搜索框输入打印机或者其服务器机的 IP 地址。

![searching for a printer][6]

选中你想添加的打印机型号，点击“添加”按钮把打印机驱动加入系统，就可以使用它了。

### 在 Linux 系统上打印

在 Linux 系统上打印很容易，不管你是在使用本地打印机还是网络打印机。如果你计划购买打印机，建议查看开放打印技术组织的（可支持打印机）数据库（[OpenPrinting.org][7]），看看你想购买的打印机是不是有相应的开源驱动程序。如果你已经拥有一台打印机，你现在也知道怎样在你的 Linux 系统上使用你的打印机了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/add-printer-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[fisherue](https://github.com/fisherue)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/happy-printer.png?itok=9J44YaDs "printing on Linux"
[2]: http://gimp-print.sourceforge.net/
[3]: https://www.turboprint.info/
[4]: https://opensource.com/sites/default/files/system-settings-printer_0.png "printer settings"
[5]: https://opensource.com/sites/default/files/settings-printer.png "printer settings"
[6]: https://opensource.com/sites/default/files/printer-search.png "searching for a printer"
[7]: http://www.openprinting.org/printers/

