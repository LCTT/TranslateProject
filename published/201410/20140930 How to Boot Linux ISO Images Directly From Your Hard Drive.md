直接从硬盘启动Linux ISO镜像
================================================================================
![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/boot-iso-files-directly-from-hard-drive-in-grub2.png)

Linux的GRUB2启动加载器可以直接从硬盘启动Linux ISO文件，可以启动Live CD的 ISO，而不用烧录到光盘来安装Linux到一个硬盘分区，或从USB驱动启动。

我们在Ubuntu 14.04上实施了该过程——Ubuntu及基于Ubuntu的Linux版本对此支持良好。[其它Linux发行版][1]上的工作原理也类似。

### 获取Linux ISO文件 ###

这一密技需要你的硬盘驱动器上安装有Linux系统，你的计算机必须使用[GRUB2启动加载器][2]，这是大多数Linux系统的标准启动加载器。不好意思，你是不能使用Windows启动加载器来直接启动一个Linux ISO文件的。

下载你想要使用的ISO文件，并放到你的Linux分区中。GRUB2应该支持大多数Linux系统的。如果你想要在live环境中使用它们，而不想将它们安装到硬盘驱动器上，请确认你下载的是各个Linux ISO的“[live CD][3]”版本。很多基于Linux的可启动工具盘也应该可以工作。

### 检查ISO文件内容 ###

你可能需要查看ISO文件的内部来知道那些特定的的文件在哪里。例如，你可以通过使用Ubuntu及其它基于GNOME的桌面环境中的归档管理器/文件管理器这些图形化应用程序来打开ISO文件。在Nautilus文件管理器中，右击ISO文件并选择使用归档管理器打开。

找到内核文件和initrd映像。如果你正在使用Ubuntu ISO文件，你会在casper文件夹中找到这些文件——vmlinuz文件是Linux内核，而initrd文件是initrd映像。后面，你需要知道它们在ISO文件中所处的位置。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x350xvmlinuz-and-initrd-file-locations.png.pagespeed.ic.hB1yMlHMr2.png)

### 检查硬盘分区路径 ###

GRUB使用与Linux不同的“设备命名”方式。在Linux系统中，/dev/sda0是硬盘上的第一个分区——**a**是指第一个硬盘，而**0**是指第一个分区。在GRUB中，与/dev/sda0相对应的是(hd0,1)。**0**指第一个硬盘，而**1**则指它上面的第一个分区。换句话说，在GRUB设备名中，磁盘编号从0开始计数，而分区编号则从1开始计数——是啊，这真是突然令人困惑。例如，(hd3,6)是指第四磁盘上的第六分区。

你可以使用**fdisk -l**命令来查看该信息。在Ubuntu上，打开终端并运行以下命令：

    sudo fdisk -l

你将看到一个Linux设备路径列表，你可以自行将它们转成GRUB设备名。例如，在下面的图片中，我们可以看到有个系统分区是/dev/sda1——那么，对于GRUB而言，它就是(hd0,1)。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x410xfdisk-l-command.png.pagespeed.ic.yW7uP1_G0C.png)

### 创建GRUB2启动条目 ###

添加自定义启动条目的最简单的方式是编辑/etc/grub.d/40_custom脚本，该文件设计用于用户自行添加启动条目。在编辑该文件后，/etc/defaults/grub文件和/etc/grub.d/脚本的内容将合成创建/boot/grub/grub.cfg文件——你不应该手工编辑这个文件。它被设计为通过你在另外的文件中指定的设置自动生成。

你需要以root特权打开/etc/grub.d/40_custom文件来编辑。在Ubuntu上，你可以通过打开终端窗口，并运行以下命令来完成：

    sudo gedit /etc/grub.d/40_custom

放轻松点，你可以用你喜爱的文本编辑打开该文件。例如，你可以替换命令中“gedit”为“nano”，在[Nano文本编辑器][4]中打开它。

除非你已经添加了其它自定义启动条目，否则你应当看到的是一个几乎空的文件。你需要在[注释][5]行下添加一个或多个ISO启动部分。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x300xadd-custom-boot-menu-entries-to-grub.png.pagespeed.ic.uUT-Yls8xf.png)

这里为你展示了怎样来从ISO文件启动Ubuntu或基于Ubuntu的发行版，我们在Ubuntu 14.04下作了测试：

    menuentry "Ubuntu 14.04 ISO" {
    set isofile="/home/name/Downloads/ubuntu-14.04.1-desktop-amd64.iso"
    loopback loop (hd0,1)$isofile
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

自定义启动条目以包含你期望的菜单的条目名称，并指定计算机上该ISO文件的正确路径，以及包含ISO文件的硬盘和分区设备名。如果vmlinuz和initrd文件的名称或路径不同，请为这些文件指定正确的路径。

（如果你的/home/ 目录是一个分区，请忽略/home部分，像这样：**set isofile="/name/Downloads/${isoname}"**)。

**重要说明**：不同的Linux版本要求带有不同启动选项的不同的启动条目，GRUB Live ISO多启动项目提供了[用于不同Linux发行版的菜单条目][6]的各种不同类型。你应当为你想要启动的ISO文件调整这些示例菜单条目。你也可以仅仅从网页搜索你想要启动的Linux发行版的名称和发行编号，并附带关键词“在GRUB中从ISO启动”，以获取更多信息。

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x392xadd-a-linux-iso-file-to-grub-boot-loader.png.pagespeed.ic.2FR0nOtugC.png)

如果你想要添加更多ISO启动选项，请为该文件添加额外部分。

完成后保存文件，返回终端窗口并运行以下命令：

    sudo update-grub

![](http://cdn8.howtogeek.com/wp-content/uploads/2014/09/650x249xgenerate-grub.cfg-on-ubuntu.png.pagespeed.ic.5I70sH4ZRs.png)

再次启动计算机时，你将看到ISO启动条目，你可以选择它来启动ISO文件。在启动时，你可能需要按Shift键来显示GRUB菜单。

如果在尝试启动ISO文件时你看见错误信息或黑屏，那么你的启动条目配置肯定配置错误了。即使ISO文件路径和设备名是正确的，ISO文件上的vmlinuz和initrd文件的路径可能是不正确的，或者你启动Linux系统可能需要不同的选项。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/196933/how-to-boot-linux-iso-images-directly-from-your-hard-drive/

作者：[Chris Hoffman][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.howtogeek.com/author/chrishoffman/
[1]:http://www.howtogeek.com/191207/10-of-the-most-popular-linux-distributions-compared/
[2]:http://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/
[3]:http://www.howtogeek.com/172810/take-a-secure-desktop-everywhere-everything-you-need-to-know-about-linux-live-cds-and-usb-drives/
[4]:http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/
[5]:http://www.howtogeek.com/118389/how-to-comment-out-and-uncomment-lines-in-a-configuration-file/
[6]:http://git.marmotte.net/git/glim/tree/grub2
