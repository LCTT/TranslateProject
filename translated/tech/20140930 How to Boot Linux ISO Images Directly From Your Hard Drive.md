直接从硬盘启动Linux ISO镜像
================================================================================
![](data:image/png;base64,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)

Linux的GRUB2启动加载器可以直接从硬盘启动Linux ISO文件，可以启动Live CD，甚至可以不用烧录到磁盘来安装Linux到另外一个硬盘分区或从USB驱动启动。

我们在Ubuntu 14.04上实施了该过程——Ubuntu及基于Ubuntu的Linux版本对此支持良好。[其它Linux发行版][1]上的工作原理也类似。

### 获取Linux ISO文件 ###

这一密技需要你的硬盘驱动器上安装有Linux系统，你的计算机必须使用[GRUB2启动加载器][2]，这是大多数Linux系统的标准启动加载器。不好意思，你是不能使用Windows启动加载器来直接启动一个Linux ISO文件的。

下载你想要使用的ISO文件，并放到你的Linux分区中。GRUB2应该支持大多数Linux系统的。如果你想要在live环境中使用它们，而不想将它们安装到硬盘驱动器上，请确认你下载的是各个Linux ISO的“[live CD][3]”版本。很多基于Linux的可启动工具盘也应该可以工作。

### 检查ISO文件内容 ###

你可能需要检查ISO文件来明确确定指定的文件在哪里。例如，你可以通过使用Ubuntu及其它基于GNOME的桌面环境中的归档管理器/File Roller文件管理器这些图形化应用程序来打开ISO文件来完成此项工作。在Nautilus文件管理器中，右击ISO文件并选择使用归档管理器打开。

定位内核文件和initrd映像。如果你正在使用Ubuntu ISO文件，你会在卡斯帕文件夹中找到这些文件——vmlinuz文件时Linux内核，而initrd文件是initrd映像。后面，你需要知道它们在ISO文件中所处的位置。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x350xvmlinuz-and-initrd-file-locations.png.pagespeed.ic.hB1yMlHMr2.png)

### 检查硬盘分区路径 ###

GRUB使用与Linux不同的“设备命名”结构。在Linux系统中，/dev/sda0是硬盘上的第一个分区——**a**是指第一个硬盘，而**0**是指第一个分区。在GRUB中，与/dev/sda0相对应的是(hd0,1)。**0**指第一个硬盘，而**1**则指它上面的第一个分区。换句话说，在GRUB设备名中，磁盘编号从0开始计数，而分区编号则从1开始计数——是啊，这真是突然令人困惑。例如，(hd3,6)是指第四磁盘上的第六分区。

你可以使用**fdisk -l**命令来查看该信息。在Ubuntu上，打开终端并运行以下命令：

    sudo fdisk -l

你将看到一个Linux设备路径列表，你可以自行将它们转成GRUB设备名。例如，在下面的图片中，我们可以看到有个系统分区是/dev/sda1——那么，对于GRUB而言，它就是(hd0,1)。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x410xfdisk-l-command.png.pagespeed.ic.yW7uP1_G0C.png)

### 创建GRUB2启动条目 ###

添加自定义启动条目的最简单的方式是编辑/etc/grub.d/40_custom脚本，该文件设计用于用户自行添加启动条目。在编辑该文件后，/etc/defaults/grub文件和/etc/grub.d/脚本的内容将合成创建/boot/grub/grub.cfg文件——你不应该手工编辑该文件。它设计用于通过你在其它文件指定的设置自动生成。

你需要以root特权打开/etc/grub.d/40_custom文件来编辑。在Ubuntu上，你可以通过打开终端窗口，并运行以下命令来完成：

    sudo gedit /etc/grub.d/40_custom

放轻松点，你可以用你喜爱的文本编辑打开该文件。例如，你可以替换命令中“gedit”为“nano”，在[Nano文本编辑器][4]中打开它。

除非你已经添加了其它自定义启动条目，否则你应当看到的是一个几乎空的文件。你需要在[注释][5]行下添加一个或多个ISO启动部分。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x300xadd-custom-boot-menu-entries-to-grub.png.pagespeed.ic.uUT-Yls8xf.png)

这里为你展示了怎样来从ISO文件启动Ubuntu或基于Ubuntu的发行版，我们在Ubuntu 14.04下作了测试：

    menuentry “Ubuntu 14.04 ISO” {
    set isofile=”/home/name/Downloads/ubuntu-14.04.1-desktop-amd64.iso”
    loopback loop (hd0,1)$isofile
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

自定义启动条目以包含你期望的菜单的条目名称，计算机上到ISO文件的正确路径，以及包含ISO文件的硬盘和分区设备名。如果vmlinuz和initrd文件的名称或路径不同，请为这些文件指定正确的路径。

（如果你有一个独立的/home/分区，忽略/home位，像这样：**set isofile=”/name/Downloads/${isoname}”**)。

**重要说明**：不同的Linux版本要求带有不同启动选项的不同的启动条目，GRUB Live ISO多启动项目提供了[用于不同Linux发行版的菜单条目][6]的各种不同类型。你应当可以为你想要启动的ISO文件调整这些示例菜单条目。你也可以仅仅从网页搜索你想要启动的Linux发行版的名称和发行编号，并附带关键词“在GRUB中从ISO启动”，以获取更多信息。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x392xadd-a-linux-iso-file-to-grub-boot-loader.png.pagespeed.ic.2FR0nOtugC.png)

如果你想要添加更多ISO启动选项，请为该文件添加额外章节。

完成后保存文件，返回终端窗口并运行以下命令：

    sudo update-grub

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x249xgenerate-grub.cfg-on-ubuntu.png.pagespeed.ic.5I70sH4ZRs.png)

再次启动计算机时，你将看到ISO启动条目，你可以选择它来启动ISO文件。在启动时，你可能需要按Shift键来显示GRUB菜单。

如果在尝试启动ISO文件时你看见错误信息或黑屏，那么你的启动条目配置不管怎么说配置错误了。即使ISO文件路径和设备名是正确的，ISO文件上的vmlinuz和initrd文件的路径可能是不正确的，或者你启动Linux系统可能需要不同的选项。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/196933/how-to-boot-linux-iso-images-directly-from-your-hard-drive/

作者：[Chris Hoffman][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.howtogeek.com/author/chrishoffman/
[1]:http://www.howtogeek.com/191207/10-of-the-most-popular-linux-distributions-compared/
[2]:http://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/
[3]:http://www.howtogeek.com/172810/take-a-secure-desktop-everywhere-everything-you-need-to-know-about-linux-live-cds-and-usb-drives/
[4]:http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/
[5]:http://www.howtogeek.com/118389/how-to-comment-out-and-uncomment-lines-in-a-configuration-file/
[6]:http://git.marmotte.net/git/glim/tree/grub2
