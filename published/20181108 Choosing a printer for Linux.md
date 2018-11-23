为 Linux 选择打印机
======

> Linux 为打印机提供了广泛的支持。学习如何利用它。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

我们在传闻已久的无纸化社会方面取得了重大进展，但我们仍需要不时打印文件。如果你是 Linux 用户，并有一台没有 Linux 安装盘的打印机，或者你正准备在市场上购买新设备，那么你很幸运。因为大多数 Linux 发行版（以及 MacOS）都使用通用 Unix 打印系统（[CUPS][1]），它包含了当今大多数打印机的驱动程序。这意味着 Linux 为打印机提供了比 Windows 更广泛的支持。

### 选择打印机

如果你需要购买新打印机，了解它是否支持 Linux 的最佳方法是查看包装盒或制造商网站上的文档。你也可以搜索 [Open Printing][2] 数据库。它是检查各种打印机与 Linux 兼容性的绝佳资源。

以下是与 Linux 兼容的佳能打印机的一些 Open Printing 结果。

![](https://opensource.com/sites/default/files/uploads/linux-printer_2-openprinting.png)

下面的截图是 Open Printing 的 Hewlett-Packard LaserJet 4050 的结果 —— 根据数据库，它应该可以“完美”工作。这里列出了建议驱动以及通用说明，让我了解它适用于 CUPS、行式打印守护程序（LPD）、LPRng 等。

![](https://opensource.com/sites/default/files/uploads/linux-printer_3-hplaserjet.png)

在任何情况下，最好在购买打印机之前检查制造商的网站并询问其他 Linux 用户。

### 检查你的连接

有几种方法可以将打印机连接到计算机。如果你的打印机是通过 USB 连接的，那么可以在 Bash 提示符下输入 `lsusb` 来轻松检查连接。

```
$ lsusb
```

该命令返回 “Bus 002 Device 004: ID 03f0:ad2a Hewlett-Packard” —— 这没有太多价值，但可以得知打印机已连接。我可以通过输入以下命令获得有关打印机的更多信息：

```
$ dmesg | grep -i usb
```

结果更加详细。

![](https://opensource.com/sites/default/files/uploads/linux-printer_1-dmesg.png)

如果你尝试将打印机连接到并口（假设你的计算机有并口 —— 如今很少见），你可以使用此命令检查连接：

```
$ dmesg | grep -i parport
```

返回的信息可以帮助我为我的打印机选择正确的驱动程序。我发现，如果我坚持使用流行的名牌打印机，大部分时间我都能获得良好的效果。

### 设置你的打印机软件

Fedora Linux 和 Ubuntu Linux 都包含简单的打印机设置工具。[Fedora][3] 为打印问题的答案维护了一个出色的 wiki。可以在 GUI 中的设置轻松启动这些工具，也可以在命令行上调用 `system-config-printer`。

![](https://opensource.com/sites/default/files/uploads/linux-printer_4-printersetup.png)

HP 支持 Linux 打印的 [HP Linux 成像和打印][4] （HPLIP） 软件可能已安装在你的 Linux 系统上。如果没有，你可以为你的发行版[下载][5]最新版本。打印机制造商 [Epson][6] 和 [Brother][7] 也有带有 Linux 打印机驱动程序和信息的网页。

你最喜欢的 Linux 打印机是什么？请在评论中分享你的意见。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/choosing-printer-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://www.cups.org/
[2]: http://www.openprinting.org/printers
[3]: https://fedoraproject.org/wiki/Printing
[4]: https://developers.hp.com/hp-linux-imaging-and-printing
[5]: https://developers.hp.com/hp-linux-imaging-and-printing/gethplip
[6]: https://epson.com/Support/wa00821
[7]: https://support.brother.com/g/s/id/linux/en/index.html?c=us_ot&lang=en&comple=on&redirect=on
