一些 Linux 小技巧
================================================================================
我已经写过 [Linux 提示和技巧][1] 系列的一篇文章。写这篇文章的目的是让你知道这些小技巧可以有效地管理你的系统/服务器。

![Create Cdrom ISO Image and Monitor Users in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/creating-cdrom-iso-watch-users-in-linux.jpg)

*在Linux中创建 Cdrom ISO 镜像和监控用户*

在这篇文章中，我们将看到如何使用 CD/DVD 驱动器中载入的碟片来创建 ISO 镜像；打开随机手册页学习；看到登录用户的详细情况和查看浏览器内存使用量，而所有这些完全使用本地工具/命令，无需任何第三方应用程序/组件。让我们开始吧……

### 用 CD 碟片创建 ISO 映像 ###

我们经常需要备份/复制 CD/DVD 的内容。如果你是在 Linux 平台上，不需要任何额外的软件。所有需要的是进入 Linux 终端。

要从 CD/DVD 上创建 ISO 镜像，你需要做两件事。第一件事就是需要找到CD/DVD 驱动器的名称。要找到 CD/DVD 驱动器的名称，可以使用以下三种方法。

**1. 从终端/控制台上运行 lsblk 命令（列出块设备）**

    $ lsblk

![Find Block Devices in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Find-Block-Devices.png)

*找块设备*

从上图可以看到，sr0 就是你的 cdrom （即 /dev/sr0 ）。

**2. 要查看有关 CD-ROM 的信息，可以使用以下命令**

    $ less /proc/sys/dev/cdrom/info

![Check Cdrom Information](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Cdrom-Inforamtion.png)

*检查 Cdrom 信息*

从上图可以看到， 设备名称是 sr0 （即 /dev/sr0）。

**3. 使用 [dmesg 命令][2] 也会得到相同的信息，并使用 egrep 来自定义输出。**

命令 ‘dmesg‘ 命令的输出/控制内核缓冲区信息。‘egrep‘ 命令输出匹配到的行。egrep 使用选项 -i 和 -color 时会忽略大小写，并高亮显示匹配的字符串。

    $ dmesg | egrep -i --color 'cdrom|dvd|cd/rw|writer'

![Find Device Information](http://www.tecmint.com/wp-content/uploads/2015/07/Find-Device-Information.png)

*查找设备信息*

从上图可以看到，设备名称是 sr0 （即 /dev/sr0）。

一旦知道 CD/DVD 的名称后，在 Linux 上你可以用下面的命令来创建 ISO 镜像（你看，只需要 cat 即可！）。

    $ cat /dev/sr0 > /path/to/output/folder/iso_name.iso

这里的‘sr0‘是我的 CD/DVD  驱动器的名称。你应该用你的 CD/DVD 名称来代替。这将帮你创建 ISO 镜像并备份 CD/DVD 的内容无需任何第三方应用程序。

![Create ISO Image of CDROM in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Create-ISO-Image-of-CDROM.png)

*创建 CDROM 的 ISO 映像*

### 随机打开一个手册页 ###

如果你是 Linux 新人并想学习使用命令行开关，这个技巧就是给你的。把下面的代码行添加在`〜/ .bashrc`文件的末尾。

    /use/bin/man $(ls /bin | shuf | head -1)

记得把上面一行脚本添加在用户的`.bashrc`文件中，而不是根目录的 .bashrc 文件。所以，当你下次登录本地或远程使用 SSH 时，你会看到一个随机打开的手册页供你阅读。对于想要学习命令行开关的新手，这被证明是有益的。

下面是在终端登录两次分别看到的。

![LoadKeys Man Pages](http://www.tecmint.com/wp-content/uploads/2015/07/LoadKeys-Man-Pages.png)

*LoadKeys 手册页*

![Zgrep Man Pages](http://www.tecmint.com/wp-content/uploads/2015/07/Zgrep-Man-Pages.png)

*Zgrep 手册页*

希望你知道如何退出手册页浏览——如果你已经厌烦了每次都看到手册页，你可以删除你添加到 `.bashrc`文件中的那几行。

### 查看登录用户的状态 ###

了解其他用户正在共享服务器上做什么。

一般情况下，你是共享的 Linux 服务器的用户或管理员的。如果你担心自己服务器的安全并想要查看哪些用户在做什么，你可以使用命令 `w`。

这个命令可以让你知道是否有人在执行恶意代码或篡改服务器，让他停下或使用其他方法。'w' 是查看登录用户状态的首选方式。

要查看登录的用户正在做什么，从终端运行命令“w”，最好是 root 用户。

    # w

![Check Linux User Activity](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Linux-User-Activity.png)

*检查 Linux 用户状态*

### 查看浏览器的内存使用状况 ###

最近有不少谈论关于 Google-chrome 的内存使用量。如要检查浏览器的内存使用情况，只需在地址栏输入 “about:memory”，不要带引号。

我已经在 Google-Chrome 和 Mozilla 的 Firefox 网页浏览器进行了测试。你可以查看任何浏览器，如果它工作得很好，你可能会承认我们在下面的评论。你也可以杀死浏览器进程在 Linux 终端的进程/服务中。

在 Google Chrome 中，在地址栏输入 `about:memory`，你应该得到类似下图的东西。

![Check Chrome Memory Usage](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Chrome-Memory-Usage.png)

*查看 Chrome 内存使用状况*

在Mozilla Firefox浏览器，在地址栏输入 `about:memory`，你应该得到类似下图的东西。

![Check Firefox Memory Usage](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Firefox-Memory-Usage.png)

*查看 Firefox 内存使用状况*

如果你已经了解它是什么，除了这些选项。要检查内存用量，你也可以点击最左边的 ‘Measure‘ 选项。

![Firefox Main Process](http://www.tecmint.com/wp-content/uploads/2015/07/Firefox-Main-Processes.png)

*Firefox 主进程*

它将通过浏览器树形展示进程内存使用量。

目前为止就这样了。希望上述所有的提示将会帮助你。如果你有一个（或多个）技巧，分享给我们，将帮助 Linux 用户更有效地管理他们的 Linux 系统/服务器。

我会很快在这里发帖，到时候敬请关注。请在下面的评论里提供你的宝贵意见。喜欢请分享并帮助我们传播。


--------------------------------------------------------------------------------

via: http://www.tecmint.com/creating-cdrom-iso-image-watch-user-activity-in-linux/

作者：[Avishek Kumar][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/dmesg-commands/
