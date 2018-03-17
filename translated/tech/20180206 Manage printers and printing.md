Linux 中如何打印和管理打印机
======


### Linux 中的打印

虽然现在大量的沟通都是电子化和无纸化的，但是在我们的公司中还有大量的材料需要打印。银行结算单、公用事业帐单、财务和其它报告、以及收益结算单等一些东西还是需要打印的。本教程将介绍在 Linux 中如何使用 CUPS 去打印。

CUPS，是通用 Unix 打印系统（Common UNIX Printing System）的首字母缩写，它是 Linux 中的打印机和打印任务的管理者。早期计算机上的打印机一般是在特定的字符集和字体大小下打印文本文件行。现在的图形打印机可以打印各种字体和大小的文本和图形。尽管如此，现在你所使用的一些命令，在它们以前的历史上仍旧使用的是古老的行打印守护进程（LPD）技术。

本教程将帮你了解 Linux 服务器专业考试（LPIC-1）的第 108 号主题的 108.4 目标。这个目标的权重为 2。

#### 前提条件

为了更好地学习本系列教程，你需要具备基本的 Linux 知识，和使用 Linux 系统实践本教程中的命令的能力，你应该熟悉 GNU 和 UNIX® 命令的使用。有时不同版本的程序输出可能会不同，因此，你的结果可能与本教程中的示例有所不同。

本教程中的示例使用的是 Fedora 27 的系统。

### 有关打印的一些历史

这一小部分历史并不是 LPI 目标的，但它有助于你理解这个目标的相关环境。

早期的计算机大都使用行打印机。这些都是击打式打印机，一段时间以来，它们使用固定间距的字符和单一的字体来打印文本行。为提升整个系统性能，早期的主机都对慢速的外围设备如读卡器、卡片穿孔机、和运行其它工作的行打印进行交叉工作。因此就产生了在行上或者假脱机上的同步外围操作，这一术语目前在谈到计算机打印时仍然在使用。

在 UNIX 和 Linux 系统上，打印初始化使用的是 BSD（Berkeley Software Distribution）打印子系统，它是由一个作为服务器运行的行打印守护程序（LPD）组成，而客户端命令如 `lpr` 是用于提交打印作业。这个协议后来被 IETF 标准化为 RFC 1179 —— **行打印机守护协议**。

系统也有一个打印守护程序。它的功能与BSD 的 LPD 守护程序类似，但是它们的命令集不一样。你在后面会经常看到完成相同的任务使用不同选项的两个命令。例如，对于打印文件的命令，`lpr`  是伯克利实现的，而 `lp` 是 System V 实现的。

随着打印机技术的进步，在一个页面上混合出现不同字体成为可能，并且可以将图片像文字一样打印。可变间距字体，以及更多先进的打印技术，比如 kerning 和 ligatures，现在都已经标准化。它们对基本的 lpd/lpr 方法进行了改进设计，比如 LPRng，下一代的 LPR、以及 CUPS。

许多可以打印图形的打印机，使用 Adobe PostScript 语言进行初始化。一个 PostScript 打印机有一个解释器引擎，它可以解释打印任务中的命令并从这些命令中生成最终的页面。PostScript 经常被用做原始文件和打印机之间的中间层，比如一个文本文件或者一个图像文件，以及没有适合 PostScript 功能的特定打印机的最终格式。转换这些特定的打印任务，比如一个 ASCII 文本文件或者一个 JPEG 图像转换为 PostScript，然后再使用过滤器转换 PostScript 到非 PostScript 打印机所需要的最终光栅格式。

现在的便携式文档格式（PDF），它就是基于 PostScript 的，已经替换了传统的原始 PostScript。PDF 设计为与硬件和软件无关，它封装了要打印的页面的完整描述。你可以查看 PDF 文件，同时也可以打印它们。

### 管理打印队列

用户直接打印作业到一个名为打印队列的逻辑实体。在单用户系统中，一个打印队列和一个打印机通常是几乎相同的意思。但是，CUPS 允许系统对最终在一个远程系统上的打印，并不附属打印机到一个队列打印作业上，而是通过使用类，允许将打印作业重定向到该类第一个可用的打印机上。

你可以检查和管理打印队列。对于 CUPS 来说，其中一些命令还是很新的。另外的一些是源于 LPD 的兼容命令，不过现在的一些选项通常是原始 LPD 打印系统选项的有限子集。

你可以使用 CUPS 的 `lpstat` 命令去检查队列，以了解打印系统。一些常见命令如下表 1。

###### 表 1. lpstat 命令的选项
| 选项 | 作用                                                                                                                                                   |
| -a     | 显示打印机状态                                                                                                                     |
| -c     | 显示打印类                                                                                                                                    |
| -p     | 显示打印状态：enabled 或者 disabled.                                                                                                                |
| -s     | 显示默认打印机、打印机和类。相当于 -d -c -v。**注意：为指定多个选项，这些选项必须像值一样分隔开。**|
| -s     | 显示打印机和它们的设备。                                                                                                                       |


你也可以使用 LPD 的 `lpc` 命令，它可以在 /usr/sbin 中找到，使用它的 `status` 选项。如果你不想指定打印机名字，将列出所有的队列。列表 1 展示了命令的一些示例。

###### 列表 1. 显示可用打印队列
```
[ian@atticf27 ~]$ lpstat -d
system default destination: HL-2280DW
[ian@atticf27 ~]$ lpstat -v HL-2280DW
device for HL-2280DW: dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
[ian@atticf27 ~]$ lpstat -s
system default destination: HL-2280DW
members of class anyprint:
    HL-2280DW
    XP-610
device for anyprint: ///dev/null
device for HL-2280DW: dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
device for XP-610: dnssd://EPSON%20XP-610%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-ac18266c48aa
[ian@atticf27 ~]$ lpstat -a XP-610
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT
[ian@atticf27 ~]$ /usr/sbin/lpc status HL-2280DW
HL-2280DW:
    printer is on device 'dnssd' speed -1
    queuing is disabled
    printing is enabled
    no entries
    daemon present

```

这个示例展示了两台打印机 —— HL-2280DW 和 XP-610，和一个类 `anyprint`，它允许打印作业定向到这两台打印机中的第一个可用打印机。

在这个示例中，已经禁用了打印到 HL-2280DW 队列，但是打印是启用的，这样便于打印机脱机维护之前可以完成打印队列中的任务。无论队列是启用还是禁用，都可以使用 `cupsaccept` 和 `cupsreject` 命令来管理它们。你或许可能在 /usr/sbin 中找到这些命令，它们现在都是链接到新的命令上。同样，无论打印是启用还是禁用，你都可以使用 `cupsenable` 和 `cupsdisable` 命令来管理它们。在早期版本的 CUPS 中，这些被称为 `enable` 和 `disable`，它也许会与 bash shell 内置的 `enable` 混淆。列表 2 展示了如何去启用打印机 HL-2280DW 上的队列，不过它的打印还是禁止的。CUPS 的几个命令支持使用一个 `-r` 选项去提供一个动作的理由。这个理由会在你使用 `lpstat` 时显示，但是如果你使用的是 `lpc` 命令则不会显示它。

###### 列表 2. 启用队列和禁用打印
```
[ian@atticf27 ~]$ lpstat -a -p HL-2280DW
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW not accepting requests since Thu 27 Apr 2017 05:52:27 PM EDT -
    Maintenance scheduled
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT
printer HL-2280DW is idle. enabled since Thu 27 Apr 2017 05:52:27 PM EDT
    Maintenance scheduled
[ian@atticf27 ~]$ accept HL-2280DW
[ian@atticf27 ~]$ cupsdisable -r "waiting for toner delivery" HL-2280DW
[ian@atticf27 ~]$ lpstat -p -a
printer anyprint is idle. enabled since Mon 29 Jan 2018 01:17:09 PM EST
printer HL-2280DW disabled since Mon 29 Jan 2018 04:03:50 PM EST -
    waiting for toner delivery
printer XP-610 is idle. enabled since Thu 27 Apr 2017 05:53:59 PM EDT
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW accepting requests since Mon 29 Jan 2018 04:03:50 PM EST
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT

```

注意：用户执行这些任务必须经过授权。它可能要求是 root 用户或者其它的授权用户。在 /etc/cups/cups-files.conf 中可以看到 SystemGroup 的条目，cups-files.conf 的 man 页面有更多授权用户组的信息。

### 管理用户打印作业

现在，你已经知道了一些如何去检查打印队列和类的方法，我将给你展示如何管理打印队列上的作业。你要做的第一件事是，如何找到一个特定打印机或者全部打印机上排队的任意作业。完成上述工作要使用 `lpq` 命令。如果没有指定任何选项，`lpq` 将显示默认打印机上的队列。使用 `-P` 选项和一个打印机名字将指定打印机，或者使用 `-a` 选项去指定所有的打印机，如下面的列表 3 所示。

###### 列表 3. 使用 lpq 检查打印队列
```
[pat@atticf27 ~]$ # As user pat (non-administrator)
[pat@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st unknown 4 unknown 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th unknown 8 unknown 1024 bytes
5th unknown 9 unknown 1024 bytes

[ian@atticf27 ~]$ # As user ian (administrator)
[ian@atticf27 ~]$ lpq -P xp-610
xp-610 is ready
no entries
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 8 .bashrc 1024 bytes
5th ian 9 .bashrc 1024 bytes

```

在这个示例中，共有五个作业，它们是 4、6、7、8、和 9，并且它是名为 HL-2280DW 的打印机的队列，而不是 XP-610 的。在这个示例中使用 `-P` 选项，可简单地显示那个打印机已经准备好，但是没有队列任务。注意，CUPS 的打印机命名，大小写是不敏感的。还要注意的是，用户 ian 提交了同样的作业两次，当一个作业第一次没有打印时，经常能看到用户的这种动作。

一般情况下，你可能查看或者维护你自己的打印作业，但是，root 用户或者其它授权的用户通常会去管理其它打印作业。大多数 CUPS 命令都可以使用一个  `-E`  选项，对 CUPS 服务器与客户端之间的通讯进行加密。

使用 `lprm` 命令从队列中去删除 .bashrc 作业。如果不使用选项，将删除当前的作业。使用 `-` 选项，将删除全部的作业。要么就如列表 4 那样，指定一个要删除的作业列表。

###### 列表 4. 使用 lprm 删除打印作业
```
[[pat@atticf27 ~]$ # As user pat (non-administrator)
[pat@atticf27 ~]$ lprm
lprm: Forbidden

[ian@atticf27 ~]$ # As user ian (administrator)
[ian@atticf27 ~]$ lprm 8
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 9 .bashrc 1024 bytes

```

注意，用户 pat 不能删除队列中的第一个作业，因为它是用户 ian 的。但是，ian 可以删除他自己的 8 号作业。

另外的可以帮你操作打印队列中的作业的命令是 `lp`。使用它可以去修改作业属性，比如打印数量或者优先级。我们假设用户 ian 希望他的作业 9 在用户 pat 的作业之前打印，并且希望打印两份。作业优先级的默认值是 50，它的优先级范围从最低的 1 到最高的 100 之间。用户 ian 可以使用 `-i`、`-n`、以及 `-q` 选项去指定一个要修改的作业，而新的打印数量和优先级可以如下面的列表 5 所示的那样去修改。注意，使用 `-l` 选项的 `lpq` 命令可以提供更详细的输出。

###### 列表 5. 使用 lp 去改变打印数量和优先级
```
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 9 .bashrc 1024 bytes
[ian@atticf27 ~]$ lp -i 9 -q 60 -n 2
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 9 .bashrc 1024 bytes
2nd ian 4 permutation.C 6144 bytes
3rd pat 6 bitlib.h 6144 bytes
4th pat 7 bitlib.C 6144 bytes

```

最后，`lpmove` 命令可以允许一个作业从一个队列移动到另一个队列。例如，我们可能因为打印机 HL-2280DW 现在不能使用，而想去移动一个作业到另外的队列上。你可以指定一个作业编号，比如 9，或者你可以用一个队列名加一个连字符去限定它，比如，HL-2280DW-0。`lpmove` 命令的操作要求一个授权用户。列表 6 展示了如何去从一个队列移动作业到另外的队列，通过打印机和作业 ID 指定第一个，然后指定打印机的所有作业都移动到第二个队列。稍后我们可以去再次检查队列，其中一个作业已经在打印中了。

###### 列表 6. 使用 lpmove 移动作业到另外一个打印队列
```
[ian@atticf27 ~]$ lpmove HL-2280DW-9 anyprint
[ian@atticf27 ~]$ lpmove HL-2280DW xp-610
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
active ian 9 .bashrc 1024 bytes
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
[ian@atticf27 ~]$ # A few minutes later
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
active pat 6 bitlib.h 6144 bytes
1st pat 7 bitlib.C 6144 bytes

```

如果你使用的是打印服务器而不是 CUPS，比如 LPD 或者 LPRng，大多数的队列管理功能是由 `lpc` 命令的子命令来处理的。例如，你可以使用 `lpc topq` 去移动一个作业到队列的顶端。其它的 `lpc` 子命令包括 `disable`、`down`、`enable`、`hold`、`move`、`redirect`、`release`、和 `start`。这些子命令在 CUPS 的兼容命令中没有实现。

#### 打印文件

如何去打印创建的作业？大多数图形界面程序都提供了一个打印方法，通常是 **文件** 菜单下面的选项。这些程序为选择打印机、设置页边距、彩色或者黑白打印、打印数量、选择每张纸打印的页面数（每张纸打印两个页面，通常用于讲义）等等，都提供了图形化的工具。现在，我将为你展示如何使用命令行工具去管理这些功能，然后和图形化实现进行比较。

打印文件最简单的方法是使用 `lpr` 命令，然后提供一个文件名字。这将在默认打印机上打印这个文件。`lp` 命令不仅可以打印文件，也可以修改打印作业。列表 7 展示了使用这个命令的一个简单示例。注意，`lpr` 会静默处理这个作业，但是 `lp` 会显示处理后的作业的 ID。

###### 列表 7. 使用 lpr 和 lp 打印
```
[ian@atticf27 ~]$ echo "Print this text" > printexample.txt
[ian@atticf27 ~]$ lpr printexample.txt
[ian@atticf27 ~]$ lp printexample.txt
request id is HL-2280DW-12 (1 file(s))

```

表 2 展示了 `lpr` 上你可以使用的一些选项。注意， `lp` 的选项和 `lpr` 的很类似，但是名字可能不一样；例如，`-#` 在 `lpr` 上是相当于 `lp` 的 `-n` 选项。查看 man 页面了解更多的信息。

###### 表 2. lpr 的选项

| 选项 | 作用                                                                                          |
| -C, -J, or -T | 设置一个作业名字。                                                                                 |
| -P            | 选择一个指定的打印机。                                                                     |
| -#            | 指定打印数量。注意它与 lp 命令的 -n 有点差别。|
| -m            | 在作业完成时发送电子邮件。                                                                  |
| -l            | 表示打印文件已经为打印做好格式准备。相当于 -o raw。           |
| -o            | 设置一个作业选项。                                                                                |
| -p            | 格式化一个带有阴影标题的文本文件。相关于 -o prettyprint。                          |
| -q            | 暂缓（或排队）最后的打印作业。                                                      |
| -r            | 在文件进入打印池之后，删除文件。                                          |

列表 8 展示了一些选项。我要求打印之后给我发确认电子邮件，那个作业被暂缓执行，并且在打印之后删除文件。

###### 列表 8. 使用 lpr 打印
```
[ian@atticf27 ~]$ lpr -P HL-2280DW -J "Ian's text file" -#2 -m -p -q -r printexample.txt
[[ian@atticf27 ~]$ lpq -l
HL-2280DW is ready


ian: 1st [job 13 localhost]
 2 copies of Ian's text file 1024 bytes
[ian@atticf27 ~]$ ls printexample.txt
ls: cannot access 'printexample.txt': No such file or directory

```

我现在有一个在 HL-2280DW 打印队列上暂缓执行的作业。怎么做到这样？`lp` 命令有一个选项可以暂缓或者投放作业，使用 `-H` 选项是使用各种值。列表 9 展示了如何投放被暂缓的作业。检查 `lp` 命令的 man 页面了解其它选项的信息。

###### 列表 9. 重启一个暂缓的打印作业
```
[ian@atticf27 ~]$ lp -i 13 -H resume

```

并不是所有的可用打印机都支持相同的选项集。使用 `lpoptions` 命令去查看一个打印机的常用选项。添加 `-l` 选项去显示打印机专用的选项。列表 10 展示了两个示例。许多常见的选项涉及到人像/风景打印、页面大小和输出在纸张上的布局。详细信息查看 man 页面。

###### 列表 10. 检查打印机选项
```
[ian@atticf27 ~]$ lpoptions -p HL-2280DW
copies=1 device-uri=dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
finishings=3 job-cancel-after=10800 job-hold-until=no-hold job-priority=50
job-sheets=none,none marker-change-time=1517325288 marker-colors=#000000,#000000
marker-levels=-1,92 marker-names='Black\ Toner\ Cartridge,Drum\ Unit'
marker-types=toner,opc number-up=1 printer-commands=none
printer-info='Brother HL-2280DW' printer-is-accepting-jobs=true
printer-is-shared=true printer-is-temporary=false printer-location
printer-make-and-model='Brother HL-2250DN - CUPS+Gutenprint v5.2.13 Simplified'
printer-state=3 printer-state-change-time=1517325288 printer-state-reasons=none
printer-type=135188 printer-uri-supported=ipp://localhost/printers/HL-2280DW
sides=one-sided

[ian@atticf27 ~]$ lpoptions -l -p xp-610
PageSize/Media Size: *Letter Legal Executive Statement A4
ColorModel/Color Model: *Gray Black
InputSlot/Media Source: *Standard ManualAdj Manual MultiPurposeAdj MultiPurpose
UpperAdj Upper LowerAdj Lower LargeCapacityAdj LargeCapacity
StpQuality/Print Quality: None Draft *Standard High
Resolution/Resolution: *301x300dpi 150dpi 300dpi 600dpi
Duplex/2-Sided Printing: *None DuplexNoTumble DuplexTumble
StpiShrinkOutput/Shrink Page If Necessary to Fit Borders: *Shrink Crop Expand
StpColorCorrection/Color Correction: *None Accurate Bright Hue Uncorrected
Desaturated Threshold Density Raw Predithered
StpBrightness/Brightness: 0 100 200 300 400 500 600 700 800 900 *None 1100
1200 1300 1400 1500 1600 1700 1800 1900 2000 Custom.REAL
StpContrast/Contrast: 0 100 200 300 400 500 600 700 800 900 *None 1100 1200
1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700
2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 Custom.REAL
StpImageType/Image Type: None Text Graphics *TextGraphics Photo LineArt

```

大多数的 GUI 应用程序有一个打印对话框，通常你可以使用 **文件 >打印** 菜单去选择它。图 1 展示了在 GIMP 中的一个示例，GIMP 是一个图像处理程序。

###### 图 1. 在 GIMP 中打印

![Printing from the GIMP][3]

到目前为止，我们所有的命令都是隐式指向到本地的 CUPS 打印服务器上。你也可以通过指定 `-h` 选项和一个端口号（如果不是 CUPS 的默认端口号 631的话）将打印转向到另外一个系统上的服务器。

### CUPS 和 CUPS 服务器

CUPS 打印系统的核心是 `cupsd` 打印服务器，它是一个运行的守护进程。CUPS 配置文件一般位于 /etc/cups/cupsd.conf。/etc/cups 目录也有与 CUPS 相关的其它的配置文件。CUPS 一般在系统初始化期间启动，根据你的发行版不同，它也可能通过位于 /etc/rc.d/init.d 或者 /etc/init.d 目录中的 CUPS 脚本来控制。对于 最新使用 systemd 来初始化的系统，CUPS 服务脚本可能在 /usr/lib/systemd/system/cups.service 中。和大多数使用脚本的服务一样，你可以停止、启动、或者重启守护程序。查看我们的教程：[学习 Linux，101：运行级别、引导目标、关闭、和重启动][4]，了解使用初始化脚本的更多信息。

配置文件 /etc/cups/cupsd.conf 包含管理一些事情的参数，比如访问打印系统、是否允许远程打印、本地打印池文件等等。在一些系统上，一个辅助的部分单独描述打印队列，它一般是由配置工具自动生成的。列表 11 展示了一个默认的 cupsd.conf 文件中的一些条目。注意，注释是以 # 字符开头的。默认值通常以注释的方式显示，并且可以通过删除前面的 # 字符去改变默认值。

###### Listing 11. 默认的 /etc/cups/cupsd.conf 文件的部分内容
```
# Only listen for connections from the local machine.
Listen localhost:631
Listen /var/run/cups/cups.sock

# Show shared printers on the local network.
Browsing On
BrowseLocalProtocols dnssd

# Default authentication type, when authentication is required...
DefaultAuthType Basic

# Web interface setting...
WebInterface Yes

# Set the default printer/job policies...
<Policy default>
 # Job/subscription privacy...
 JobPrivateAccess default
 JobPrivateValues default
 SubscriptionPrivateAccess default
 SubscriptionPrivateValues default

 # Job-related operations must be done by the owner or an administrator...
 <Limit Create-Job Print-Job Print-URI Validate-Job>
 Order deny,allow
 </Limit>

```

能够允许在 cupsd.conf 中使用的文件、目录、和用户配置命令，现在都存储在作为替代的 cups-files.conf 中。这是为了防范某些类型的提权攻击。列表 12 展示了 cups-files.conf 文件中的一些条目。注意，正如在文件层次结构标准（FHS）中所期望的那样，打印池文件默认保存在文件系统的 /var/spool 目录中。查看 man 页面了解 cupsd.conf 和 cups-files.conf 配置文件的更多信息。

###### 列表 12. 默认的 /etc/cups/cups-files.conf 配置文件的部分内容
```
# Location of the file listing all of the local printers...
#Printcap /etc/printcap

# Format of the Printcap file...
#PrintcapFormat bsd
#PrintcapFormat plist
#PrintcapFormat solaris

# Location of all spool files...
#RequestRoot /var/spool/cups

# Location of helper programs...
#ServerBin /usr/lib/cups

# SSL/TLS keychain for the scheduler...
#ServerKeychain ssl

# Location of other configuration files...
#ServerRoot /etc/cups

```

列表 12 引用了 /etc/printcap 文件。这是 LPD 打印服务器的配置文件的名字，并且一些应用程序仍然使用它去确定可用的打印机和它们的属性。它通常是在 CUPS 系统上自动生成的，因此，你可能没有必要去修改它。但是，如果你在诊断用户打印问题，你可能需要去检查它。列表 13 展示了一个示例。

###### 列表 13. 自动生成的 /etc/printcap
```
# This file was automatically generated by cupsd(8) from the
# /etc/cups/printers.conf file. All changes to this file
# will be lost.
HL-2280DW|Brother HL-2280DW:rm=atticf27:rp=HL-2280DW:
anyprint|Any available printer:rm=atticf27:rp=anyprint:
XP-610|EPSON XP-610 Series:rm=atticf27:rp=XP-610:

```

这个文件中的每一行都有一个打印机名字、打印机描述，远程机器（rm）的名字、以及那个远程机器上的远程打印机（rp）。老的 /etc/printcap 文件也描述了打印机的能力。

#### 文件转换过滤器

你可以使用 CUPS 打印许多类型的文件，包括明文的文本文件、PDF、PostScript、和各种格式的图像文件，你只需要提供要打印的文件名，除此之外你再无需向 `lpr` 或 `lp` 命令提供更多的信息。这个神奇的壮举是通过使用过滤器来实现的。实际上，这些年来最流行的过滤器就命名为 magicfilter。

当打印一个文件时，CUPS 使用多用途因特网邮件扩展（MIME）类型去决定合适的转换过滤器。其它的打印包可能使用由 `file` 命令使用的神奇数字机制。关于 `file` 或者 `magic` 的更多信息可以查看它们的 man 页面。

输入文件被过滤器转换成中间层的光栅格式或者 PostScript 格式。一些作业信息，比如打印数量也会被添加进去。数据最终通过一个 bechend 发送到目标打印机。还有一些可以用手动过滤的输入文件的过滤器。你可以通过这些过滤器获得特殊格式的结果，或者去处理一些 CUPS 原生并不支持的文件格式。

#### 添加打印机

CUPS 支持多种打印机，包括：

  * 本地连接的并行口和 USB 口打印机
  * 因特网打印协议（IPP）打印机
  * 远程 LPD 打印机
  * 使用 SAMBA 的 Microsoft® Windows® 打印机 
  * 使用 NCP 的 Novell 打印机
  * HP Jetdirect 打印机



当系统启动或者设备连接时，现在的大多数系统都会尝试自动检测和自动配置本地硬件。同样，许多网络打印机也可以被自动检测到。使用 CUPS 的 web 管理工具（<http://localhost:631> 或者 <http://127.0.0.1:631>）去搜索或添加打印机。许多发行版都包含它们自己的配置工具，比如，在 SUSE 系统上的 YaST。图 2 展示了使用 localhost:631 的 CUPS 界面，图 3 展示了 Fedora 27 上的 GNOME 打印机设置对话框。

###### 图 2. 使用 CUPS 的 web 界面


![Using the CUPS web interface][5]

###### 图 3. Fedora 27 上的打印机设置


![Using printer settings on Fedora 27][6]

你也可以从命令行配置打印机。在配置打印机之前，你需要一些关于打印机和它的连接方式的基本信息。如果是一个远程系统，你还需要一个用户 ID 和密码。

你需要去知道你的打印机使用什么样的驱动程序。不是所有的打印机都支持 Linux，有些打印机在 Linux 上压根就不能使用，或者功能受限。你可以去 OpenPrinting.org（查看相关主题）去查看是否有你的特定的打印机的驱动程序。`lpinfo` 命令也可以帮你识别有效的设备类型和驱动程序。使用 `-v` 选项去列出支持的设备，使用 `-m`  选项去列出驱动程序，如列表 14 所示。

###### 列表 14. 可用的打印机驱动程序
```
[ian@atticf27 ~]$ lpinfo -m | grep -i xp-610
lsb/usr/Epson/epson-inkjet-printer-escpr/Epson-XP-610_Series-epson-escpr-en.ppd.gz
EPSON XP-610 Series, Epson Inkjet Printer Driver (ESC/P-R) for Linux
[ian@atticf27 ~]$ locate "Epson-XP-610_Series-epson-escpr-en.ppd.gz"
/usr/share/ppd/Epson/epson-inkjet-printer-escpr/Epson-XP-610_Series-epson-escpr-en.ppd.gz
[ian@atticf27 ~]$ lpinfo -v
network socket
network ipps
network lpd
network beh
network ipp
network http
network https
direct hp
serial serial:/dev/ttyS0?baud=115200
direct parallel:/dev/lp0
network smb
direct hpfax
network dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
network dnssd://EPSON%20XP-610%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-ac18266c48aa
network lpd://BRN001BA98A1891/BINARY_P1
network lpd://192.168.1.38:515/PASSTHRU

```

Epson-XP-610_Series-epson-escpr-en.ppd.gz 驱动程序在我的系统上位于 /usr/share/ppd/Epson/epson-inkjet-printer-escpr/ 目录中。

如果你找不到驱动程序，你可以到打印机生产商的网站看看，说不上会有专用的驱动程序。例如，在写这篇文章的时候，Brother 就有一个我的 HL-2280DW 打印机的驱动程序，但是，这个驱动程序在 OpenPrinting.org 上还没有列出来。

如果你收集齐了基本信息，你可以如列表 15 所示的那样，使用 `lpadmin` 命令去配置打印机。为此，我将为我的 HL-2280DW 打印机创建另外一个实例，以便于双面打印。

###### 列表 15. 配置一台打印机
```
[ian@atticf27 ~]$ lpinfo -m | grep -i "hl.*2280"
HL2280DW.ppd Brother HL2280DW for CUPS
lsb/usr/HL2280DW.ppd Brother HL2280DW for CUPS
[ian@atticf27 ~]$ lpadmin -p HL-2280DW-duplex -E -m HL2280DW.ppd \
> -v dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/ \
> -D "Brother 1" -o sides=two-sided-long-edge
[ian@atticf27 ~]$ lpstat -a
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW accepting requests since Tue 30 Jan 2018 10:56:10 AM EST
HL-2280DW-duplex accepting requests since Wed 31 Jan 2018 11:41:16 AM EST
HXP-610 accepting requests since Mon 29 Jan 2018 10:34:49 PM EST

```

你可以使用带  `-c` 选项的 `lpadmin` 命令去创建一个仅用于双面打印的新类，而不用为了双面打印去创建一个打印机的副本。

如果你需要删除一台打印机，使用带  `-x`  选项的 `lpadmin` 命令。

列表 16 展示了如何去删除打印机和创建一个替代类。

###### 列表 16. 删除一个打印机和创建一个类
```
[ian@atticf27 ~]$ lpadmin -x HL-2280DW-duplex
[ian@atticf27 ~]$ lpadmin -p HL-2280DW -c duplex -E -D "Duplex printing" -o sides=two-sided-long-edge
[ian@atticf27 ~]$ cupsenable duplex
[ian@atticf27 ~]$ cupsaccept duplex
[ian@atticf27 ~]$ lpstat -a
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
duplex accepting requests since Wed 31 Jan 2018 12:12:05 PM EST
HL-2280DW accepting requests since Wed 31 Jan 2018 11:51:16 AM EST
XP-610 accepting requests since Mon 29 Jan 2018 10:34:49 PM EST

```

你也可以使用 `lpadmin` 或者 `lpoptions` 命令去设置各种打印机选项。详细信息请查看 man 页面。

### 排错

如果你有一个打印问题，尝试下列的提示：

  * 确保 CUPS 服务器正在运行。你可以使用 `lpstat` 命令，如果它不能连接到 cupsd 守护程序，它将会报告一个错误。或者，你可以使用 `ps -ef` 命令在输出中去检查是否有 cupsd。
  * 如果你尝试为打印去排队一个作业，而得到一个错误信息，指示打印机不接受这个作业，你可以使用 `lpstat -a` 或者 `lpc status` 去检查那个打印机可接受的作业。
  * 如果一个队列中的作业没有打印，使用 `lpstat -p` 或 `lpc status` 去检查那个打印机是否接受作业。如前面所讨论的那样，你可能需要将这个作业移动到其它的打印机。
  * 如果这个打印机是远程的，检查它在远程系统上是否存在，并且是可操作的。
  * 检查配置文件，确保特定的用户或者远程系统允许在这个打印机上打印。
  * 确保防火墙允许远程打印请求，是否允许从其它系统到你的系统，或者从你的系统到其它系统的数据包通讯。
  * 验证是否有正确的驱动程序。



正如你所见，打印涉及到你的系统中的几个组件，甚至还有网络。在本教程中，基于篇幅的考虑，我们仅为诊断给你提供了几个着手点。大多数的 CUPS 系统也有实现我们所讨论的命令行功能的图形界面。一般情况下，这个界面是从本地主机使用浏览器指向 631 端口（<http://localhost:631> 或 <http://127.0.0.1:631>）来访问的，如前面的图 2  所示。

你可以通过将 CUPS 运行在前台而不是做为一个守护进程来诊断它的问题。如果有需要，你也可以通过这种方式去测试替代的配置文件。运行 `cupsd -h` 获得更多信息，或者查看 man 页面。

CUPS 也管理一个访问日志和错误日志。你可以在 cupsd.conf 中使用 LogLevel 语句来改变日志级别。默认情况下，日志是保存在 /var/log/cups 目录。它们可以在浏览器界面（<http://localhost:631>）下，从 **Administration** 选项卡中查看。使用不带任何选项的 `cupsctl` 命令可以显示日志选项。也可以编辑 cupsd.conf 或者使用 `cupsctl` 去调整各种日志参数。查看 `cupsctl` 命令的 man 页面了解更多信息。

在 Ubuntu 的 Wiki 页面上的 [调试打印问题][7] 页面也是一个非常好的学习的地方。

它包含了打印和 CUPS 的介绍。

--------------------------------------------------------------------------------

via: https://www.ibm.com/developerworks/library/l-lpic1-108-4/index.html

作者：[Ian Shields][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ibm.com
[1]:http://www.lpi.org
[2]:https://www.ibm.com/developerworks/library/l-lpic1-map/
[3]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/gimp-print.jpg
[4]:https://www.ibm.com/developerworks/library/l-lpic1-101-3/
[5]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/fig-cups-web.jpg
[6]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/fig-settings.jpg
[7]:https://wiki.ubuntu.com/DebuggingPrintingProblems
