### 在 Linux 中管理设备

探索 /dev 目录如何使您直接访问到 Linux 中的设备。

![Managing devices in Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png itok=WfAkwbFy "Managing devices in Linux") 

*照片提供：Opensource.com*

Linux 目录结构有很多有趣的功能。这个月我涉及了 /dev 目录一些迷人之处。在继续阅读这篇文章之前，建议你看看我前面的文章。[Linux 文件系统][9]，[一切皆为文件][8]，这两篇文章介绍了一些有趣的 Linux 文件系统概念。请先看看 - 我会等待。

太好了 ！欢迎回来。现在我们可以继续更详尽地探讨 /dev 目录。

### 设备文件

设备文件也称为 [special files][4]。设备文件用来为操作系统和用户提供它们代表的设备接口。所有的 Linux 设备文件位于 /dev 目录，是根 （/） 文件系统的一个组成部分，因为这些设备文件在操作系统启动过程中必须用到。

关于这些设备文件，要记住一件重要的事情，就是它们大多不是设备驱动。更准确地描述来说，它们是对设备驱动程序的门户。数据从应用程序或操作系统传递到设备文件，然后设备文件将它传递给设备驱动程序，驱动再将它发给物理设备。反向数据通道也可以用，从物理设备通过设备驱动程序，再到设备文件，最后到达一个应用程序或其他设备。

让我们以一个可视化的典型命令看看这数据的流程。

 ![dboth-dev-dir_0.png](https://opensource.com/sites/default/files/images/life-uploads/dboth-dev-dir_0.png) 

*图 1：一个典型命令的简单数据流。*

在图 1 中，显示一个简单命令的简化数据流程。从一个 GUI 终端仿真器，例如 Konsole 或 xterm 中发出 **cat /etc/resolv.conf** 命令，从磁盘中读取 resolv.conf 文件，磁盘设备驱动程序处理设备的具体功能，例如在硬盘驱动器上定位文件并读取它。数据通过设备文件传递，然后从命令到设备文件，然后到伪终端 6 的设备驱动，然后在终端会话中显示。

当然， **cat** 命令的输出可以下面的方式被重定向到一个文件， **cat /etc/resolv.conf > /etc/resolv.bak** ，以创建该文件的备份。在这种情况下，图 1 左侧的数据流量将保持不变，而右边的数据流量将通过 /dev/sda2 设备文件，硬盘设备驱动程序，然后到硬盘驱动器本身。

这些设备文件使用标准流 (STD/IO) 和重定向，使得访问 Linux 或 Unix 计算机上的任何一个设备非常容易。只需将数据流定向到设备文件，即可将数据发送到该设备。

### 设备文件类别

设备文件至少可以按两种方式划分。第一种也是最常用的分类是根据与设备相关联的数据流进行划分。比如，tty (teletype) 和串行设备被认为是基于字符的，因为一次传送和处理数据流的一个字符或字节。 块类型设备（如硬盘驱动器）以块为单位传输数据，通常为 256 个字节的倍数。

您可以在终端上以一个非 root 用户，改变当前工作目录（PWD）到 /dev ，并显示长目录列表。 这将显示设备文件列表、文件权限及其主次设备号。 例如，下面的设备文件只是我的 Fedora 24 工作站上 /dev 目录中的几个文件。 它们表示磁盘和 tty 设备类型。 注意输出中每行的最左边的字符。 “b” 代表是块类型设备，“c” 代表字符设备。

```
brw-rw----   1 root disk        8,   0 Nov  7 07:06 sda 
brw-rw----   1 root disk        8,   1 Nov  7 07:06 sda1 
brw-rw----   1 root disk        8,  16 Nov  7 07:06 sdb 
brw-rw----   1 root disk        8,  17 Nov  7 07:06 sdb1 
brw-rw----   1 root disk        8,  18 Nov  7 07:06 sdb2
crw--w----   1 root tty         4,   0 Nov  7 07:06 tty0 
crw--w----   1 root tty         4,   1 Nov  7 07:07 tty1 
crw--w----   1 root tty         4,  10 Nov  7 07:06 tty10 
crw--w----   1 root tty         4,  11 Nov  7 07:06 tty11
```

识别设备文件更详细和更明确的方法是使用设备主要以及次要号。 磁盘设备主设备号为 8，将它们指定为 SCSI 块设备。 请注意，所有 PATA 和 SATA 硬盘驱动器都由 SCSI 子系统管理，因为旧的 ATA 子系统多年前被认为是不可维护的，因为它的代码质量差。 造成的结果是，以前被称为 “hd [a-z]” 的硬盘驱动器现在被称为 “sd [a-z]”。

你大概可以从上面的示例中推出磁盘驱动器次设备号的样式。次设备号 0、 16、 32 等等，直到 240，是整磁盘号。所以主/次 8/16 表示整个磁盘 /dev/sdb ， 8/17 是第一个分区的设备文件，/dev/sdb1。数字 8/34 代表 /dev/sdc2。

The tty device files in the list above are numbered a bit more simply from tty0 through tty63.

在上面列表中的 tty 设备文件编号更简单一些，从 tty0 到 tty63 。

Kernel.org 上的 [Linux Allocated Devices][5] 文件是设备类型和主次编号分配的正式注册表。 它可以帮助您了解所有当前定义的设备的主要/次要号码。

### 趣味设备文件

让我们花几分钟时间，执行几个有趣的实验，演示 Linux 设备文件的强大和灵活性。 大多数 Linux 发行版都有 1 到 7 个虚拟控制台，可用于使用 shell 接口登录到本地控制台会话。 可以使用 Ctrl-Alt-F1（控制台1），Ctrl-Alt-F2（控制台2）等键盘组合键来访问。

请按 Ctrl-Alt-F2 切换到控制台 2。在某些发行版，登录信息包括与此控制台关联的 tty 设备，但大多不包括。它应该是 tty2，因为你是在控制台 2 中。

以非 root 用户身份登录。 然后你可以使用 who am i 命令 — 是的，就是这个命令，带空格 — 来确定哪个 tty 设备连接到这个控制台。

在我们实际执行此实验之前，看看 /dev 中的 tty2 和 tty3 的设备列表。

```
ls -l /dev/tty[23]
```

有大量的 tty 设备，但我们不关心他们中的大多数，只注意 tty2 和 tty3 设备。 作为设备文件，他们没什么特别之处。他们都只是字符类型设备。我们将使用这些设备进行此实验。 tty2 设备连接到虚拟控制台 2，tty3 设备连接到虚拟控制台 3。

按 Ctrl-Alt-F3 切换到控制台 3。再次以同一非 root 用户身份登陆。 现在在控制台 3 上输入以下命令。 

```
echo "Hello world" > /dev/tty2
```

按 Ctrl-Alt-f2 键以返回到控制台 2。字符串 “Hello world”（没有引号）将显示在控制台 2。

该实验也可以使用 GUI 桌面上的终端仿真器来执行。 桌面上的终端会话使用 /dev 中的伪终端设备，如 /dev/pts/1。 使用 Konsole 或 Xterm 打开两个终端会话。 确定它们连接到哪些伪终端，并使用一个向另一个发送消息。

现在继续实验，使用 cat 命令，在不同的终端上显示 /etc/fstab 文件。

另一个有趣的实验是使用 cat 命令将文件直接打印到打印机。 假设您的打印机设备是 /dev/usb/lp0，并且您的打印机可以直接打印 PDF 文件，以下命令将在您的打印机上打印 test.pdf 文件。

```
cat test.pdf > /dev/usb/lp0
```

/dev 目录包含一些非常有趣的设备文件，这些文件是硬件的入口，人们通常不认为这是硬盘驱动器或显示器之类的设备。 例如，系统存储器 RAM 不是通常被认为是“设备”的东西，而 /dev/mem 是通过其可以实现对存储器的直接访问的入口。 下面的例子有一些有趣的结果。

```
dd if=/dev/mem bs=2048 count=100
```

上面的 **dd** 命令提供比简单地使用 **cat** 命令 dump 所有系统的内存提供了更多的控制。 它提供了指定从 /dev/mem 读取多少数据的能力，还允许指定从存储器哪里开始读取数据。 虽然读取了一些内存，但内核响应了以下错误，在 /var/log/messages 中可以找到。

```
Nov 14 14:37:31 david kernel: usercopy: kernel memory exposure attempt detected from ffff9f78c0010000 (dma-kmalloc-512) (2048 bytes)
```

这个错误意味着内核正在通过保护属于其他进程的内存来完成它的工作，这正是它应该工作的方式。 所以，虽然可以使用 /dev/mem 来显示存储在 RAM 内存中的数据，但是访问大多数内存空间是受保护的并且会导致错误。 只可以访问由内核内存管理器分配给运行 **dd** 命令的 BASH shell 的虚拟内存，而不会导致错误。 抱歉，但你不能窥视不属于你的内存，除非你发现了一个可利用的漏洞。

/dev 中还有一些非常有趣的设备文件。 设备文件 null，zero，random 和 urandom 不与任何物理设备相关联。

例如，空设备 /dev/null 可以用作来自 shell 命令或程序的输出重定向的目标，以便它们不显示在终端上。 我经常在我的 BASH 脚本中使用这个，以防止向用户展示可能会让他们感到困惑的输出。 /dev/null 设备可用于产生一个空字符串。 使用如下所示的 dd 命令查看 /dev/null 设备文件的一些输出。

```
# dd if=/dev/null  bs=512 count=500 | od -c     
0+0 records in
0+0 records out
0 bytes copied, 1.5885e-05 s, 0.0 kB/s
0000000
```

注意，因为空字符什么也没有所以确实没有可见的输出。 注意字节数。

/dev/random 和 /dev/urandom 设备也很有趣。 正如他们的名字所暗示的，它们都产生随机输出，而不仅仅是数字，而是任何字节组合。 /dev/urandom 设备产生确定性的随机输出并且非常快。 这意味着输出由算法确定，并使用种子字符串作为起点。 结果，如果原始种子是已知的，则黑客可以再现输出，尽管非常困难，但这是有可能的。 使用命令 **cat /dev/urandom** 可以查看典型输出，使用 Ctrl-c 退出。

/dev/random 设备文件生成非确定性随机输出，但它产生的输出更慢。 该输出不是由依赖于先前数字的算法确定的，而是由击键和鼠标移动而产生的。 这种方法使得复制特定系列的随机数要困难得多。使用 **cat **命令去查看一些来自 /dev/random 设备文件输出。尝试移动鼠标以查看它如何影响输出。

正如其名字所暗示的，/dev/zero 设备文件产生一个无止境的零作为输出。 注意，这些是八进制零，而不是ASCII字符零（0）。 使用如下所示的 **dd** 查看 /dev/zero 设备文件中的一些输出

```
# dd if=/dev/zero  bs=512 count=500 | od -c
0000000  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
500+0 records in
500+0 records out
256000 bytes (256 kB, 250 KiB) copied, 0.00126996 s, 202 MB/s
0764000
```

请注意，此命令的字节数不为零。

### 创建设备文件

在过去，在 /dev 中的设备文件都是在安装时创建的，导致一个目录中有几乎所有的设备文件，尽管大多数文件永远不会用到。 在不常发生的情况，例如需要新的设备文件，或意外删除后需要重新创建设备文件，可以使用 **mknod** 程序手动创建设备文件。 前提是你必须知道设备主要和次要号码。


CentOS 和 RHEL 6、7, 以及 Fedora 的所有版本，追溯到至少 Fedora 15，使用较新的创建设备文件的方法。 所有设备文件都是在引导时创建的。 这是因为 udev 设备管理器在设备添加和删除发生时会进行检测。这可实现在主机启动和运行时的真正的动态即插即用功能。 它还在引导时执行相同的任务，通过在引导过程的早期检测系统上安装的所有设备。 [Linux.com][6] 上有很棒的对 [udev 的描述][7].

回到 /dev 中的文件列表，注意文件的日期和时间。 所有文件都是在上次启动时创建的。 您可以使用 **uptime** 或者 **last** 命令来验证这一点。在上面我的设备列表中，所有这些文件都是在 11 月 7 日上午 7:06 创建的，这是我最后一次启动系统。

当然,  **mknod** 命令仍然可用, 但新的 **MAKEDEV** （是的，所有字母大写，在我看来是违背 Linux 使用小写命令名的原则的) 命令提供了一个更容易的界面，用于创建设备文件，如果需要的话。 在当前版本的 Fedora 或 CentOS 7 中，默认情况下不安装 MAKEDEV 命令; 它安装在 CentOS 6。您可以使用 YUM 或 DNF 来安装 MAKEDEV 包。

### 结论

有趣的是，我需要创建一个设备文件已经很长时间了。 然而，最近我遇到一个有趣的情况，其中一个我常使用的设备文件没有创建，我不得不创建它。 之后该设备再出过问题。所以丢失设备文件的情况仍然可以发生，知道如何处理它可能很重要。


设备文件有无数种，您遇到的设备文件我可能没有涵盖到。 这些信息在所下面引用的资源中有大量的细节信息可用。 关于这些文件的功能和工具，我希望我已经给您一些基本的了解，下一步您自己可以探索更多。

资源

-  [Everything is a file][1], David Both, Opensource.com
- [An introduction to Linux filesystems][2], David Both, Opensource.com
- [Filesystem Hierarchy][10], The Linux Documentation Project
- [Device File][4], Wikipedia
- [Linux Allocated Devices][5], Kernel.org
--------------------------------------------------------------------------------

via: https://opensource.com/article/16/11/managing-devices-linux

作者：[David Both][a]
译者：[erlinux](http://www.itxdm.me)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/life/15/9/everything-is-a-file
[2]:https://opensource.com/life/16/10/introduction-linux-filesystems
[4]:https://en.wikipedia.org/wiki/Device_file
[5]:https://www.kernel.org/doc/Documentation/devices.txt
[6]:https://www.linux.com/
[7]:https://www.linux.com/news/udev-introduction-device-management-modern-linux-system
[8]:https://opensource.com/life/15/9/everything-is-a-file
[9]:https://opensource.com/life/16/10/introduction-linux-filesystems
[10]:http://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/dev.html

