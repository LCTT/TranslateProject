[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13012-1.html)
[#]: subject: (Printing from the Linux command line)
[#]: via: (https://www.networkworld.com/article/3373502/printing-from-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

从 Linux 命令行进行打印
======

> 在 Linux 命令行进行打印的内容比单单一个 `lp` 命令多得多，让我们来看一些可用选项。

![Sherry \(CC BY 2.0\)][1]

Linux 命令行打印很容易。你可以使用 `lp` 命令来请求打印，并使用 `lpq` 命令来查看队列中有哪些打印作业，但是当你要双面打印或使用纵向模式时，这些会变得有些复杂。你可能还需要做很多其他事情，例如打印多份文档副本或取消打印作业。让我们来看看一些选项，当你从命令行打印时，如何让你的打印输出看起来如你所愿。

### 显示打印机配置

要从命令行查看打印机设置，请使用 `lpoptions` 命令。 输出应如下所示：

```
$ lpoptions
copies=1 device-uri=dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/ finishings=3 job-cancel-after=10800 job-hold-until=no-hold job-priority=50 job-sheets=none,none marker-change-time=1553023232 marker-colors=#000000,#00FFFF,#FF00FF,#FFFF00 marker-levels=18,62,62,63 marker-names='Black\ Cartridge\ HP\ CC530A,Cyan\ Cartridge\ HP\ CC531A,Magenta\ Cartridge\ HP\ CC533A,Yellow\ Cartridge\ HP\ CC532A' marker-types=toner,toner,toner,toner number-up=1 printer-commands=none printer-info='HP Color LaserJet CP2025dn (F47468)' printer-is-accepting-jobs=true printer-is-shared=true printer-is-temporary=false printer-location printer-make-and-model='HP Color LaserJet cp2025dn pcl3, hpcups 3.18.7' printer-state=3 printer-state-change-time=1553023232 printer-state-reasons=none printer-type=167964 printer-uri-supported=ipp://localhost/printers/Color-LaserJet-CP2025dn sides=one-sided
```

如果将其空格转换为回车符，输出可能会更人性化，请注意列出了多少设置选项。

注意：在下面的输出中，一些行被重新链接，以使输出更具可读性。

```
$ lpoptions | tr " " '\n'
copies=1
device-uri=dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/
finishings=3
job-cancel-after=10800
job-hold-until=no-hold
job-priority=50
job-sheets=none,none
marker-change-time=1553023232
marker-colors=#000000,#00FFFF,#FF00FF,#FFFF00
marker-levels=18,62,62,63
marker-names='Black\ Cartridge\ HP\ CC530A,
Cyan\ Cartridge\ HP\ CC531A,
Magenta\ Cartridge\ HP\ CC533A,
Yellow\ Cartridge\ HP\ CC532A'
marker-types=toner,toner,toner,toner
number-up=1
printer-commands=none
printer-info='HP Color LaserJet CP2025dn (F47468)'
printer-is-accepting-jobs=true
printer-is-shared=true
printer-is-temporary=false
printer-location
printer-make-and-model='HP Color LaserJet cp2025dn pcl3, hpcups 3.18.7'
printer-state=3
printer-state-change-time=1553023232
printer-state-reasons=none
printer-type=167964
printer-uri-supported=ipp://localhost/printers/Color-LaserJet-CP2025dn
sides=one-sided
```

使用 `-v` 选项时，`lpinfo` 命令将列出驱动程序和相关信息：

```
$ lpinfo -v
network ipp
network https
network socket
network beh
direct hp
network lpd
file cups-brf:/
network ipps
network http
direct hpfax
network dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/ <== printer
network socket://192.168.0.23 <== printer IP
```

`lpoptions` 命令将显示默认打印机的设置。使用 `-p` 选项指定其中一个可用打印机代号：

```
$ lpoptions -p LaserJet
```

`lpstat -p` 命令显示打印机的状态，而 `lpstat -p -d` 列出可用打印机列表。

```
$ lpstat -p -d
printer Color-LaserJet-CP2025dn is idle. enabled since Tue 19 Mar 2019 05:07:45 PM EDT
system default destination: Color-LaserJet-CP2025dn
```

### 非常有用的命令

要在默认打印机上打印文档，只需使用 `lp` 命令，后跟要打印的文件名即可。 如果文件名包含空格（在 Linux 系统上很少见），请将该名称放在引号中或开始输入文件名并按 `Tab` 键调用空格的转义标志（如下面的第二个示例所示）。

```
$ lp "never leave home angry"
$ lp never\ leave\ home\ angry
```

`lpq` 命令显示打印队列：

```
$ lpq
Color-LaserJet-CP2025dn is ready and printing
Rank Owner Job File(s) Total Size
active shs 234 agenda 2048 bytes
```

使用 `-n` 选项时，`lp` 命令可用来指定所需打印输出的份数：

```
$ lp -n 11 agenda
```

要取消打印作业，可以使用 `cancel` 或 `lprm` 命令。如果没来得及执行，则可能会看到以下信息：

```
$ cancel 229
cancel: cancel-job failed: Job #229 is already completed - can't cancel.
```

### 双面打印

要以双面模式打印，你可以在 `lp` 命令中使用 `sides` 选项，该选项不但表示了在纸张的正反面进行打印，还表示了从纸张的哪个边开始打印。这个设置代表了你期望以双面纵向文档的正常方式打印。

```
$ lp -o sides=two-sided-long-edge Notes.pdf
```

如果要所有文档以双面模式打印，则可以使用 `lpoptions` 命令更改 `sides` 设置以修改 `lp` 的设置。

```
$ lpoptions -o sides=two-sided-short-edge
```

要恢复为单面打印，可以使用如下命令：

```
$ lpoptions -o sides=one-sided
```

#### 横向打印

要以横向模式打印，可以在 `lp` 命令中使用 `landscape` 选项。

```
$ lp -o landscape penguin.jpg
```

### CUPS（Unix 通用打印系统）

Linux 系统上使用的打印系统是基于标准的开源打印系统，称为 **CUPS**，原意是<ruby>Unix 通用打印系统<rt>Common Unix Printing System</rt></ruby>。 它允许计算机充当打印服务器。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3373502/printing-from-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/printouts-paper-100791390-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
