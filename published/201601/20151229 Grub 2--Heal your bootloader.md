Grub 2：拯救你的 bootloader
================================================================================

**没有什么事情比 bootloader 坏掉更让气人的了。充分发挥 Grub 2 的作用，让 bootloader 安分工作吧。**

为什么这么说？

- Grub 2 是最受欢迎的 bootloader ，几乎用在所有 Linux 发行版上。
- bootloader 是一个至关重要的软件，但是非常容易损坏。
- Grub 2 是兼具扩展性和灵活性的一款引导加载程序，提供了大量可定制选项。

Grub 2 是一款精彩的功能强大的软件。它不是 bootloader 界的一枝独秀，但却最受欢迎，几乎所有主要的桌面发行版都在使用它。 Grub 的工作有两个。首先，它用一个菜单展示计算机上所有已经安装的操作系统供你选择。其次，当你从启动菜单中选择了一个 Linux 操作系统， Grub 便加载这个 Linux 的内核。

你知道，如果使用 Linux ，你就离不开 bootloader 。然而它却是 Linux 发行版内部最鲜为人知的部分。在这篇文章里，我们将带你熟悉 Grub 2 一些著名的特性，强化你相关技能，使你在 bootloader 跑飞的时候能够自行处理。

Grub 2 最重要的部分是一堆文本文件和两个脚本文件。首先需要了解的是 `/etc/default/grub` 。这是一个文本文件，你可以在里面设置通用配置变量和 Grub 2 菜单（见下方 “常见用户设置” ）的其它特性。

Grub 2 另一个重要的部分是 `/etc/grub.d` 文件夹。定义每个菜单项的所有脚本都放置在这里。这些脚本的名称必须有两位的数字前缀。其目的是，在构建 Grub 2 菜单时定义脚本的执行顺序以及相应菜单项的顺序。文件 `00_header` 首先被读取，负责解析 `/etc/default/grub` 配置文件。然后是 Linux 内核的菜单项，位于 `10_linux` 文件中。这个脚本在默认的 `/boot` 分区为每个内核创建一个正规菜单项和一个恢复菜单项。

紧接着的是为第三方应用所用的脚本，如 `30_os-prober` 和 `40_custom` 。 **os-prober** 脚本为内核和其它分区里的操作系统创建菜单项。它能识别安装的 Linux、 Windows、 BSD 以及 Mac OS X 。 如果你的硬盘布局比较独特，使得 **os-prober** 无法找到已经安装的发行版，你可以在 `40_custom` 文件（见下方 “添加自定义菜单项”）中添加菜单项。

**Grub** 2 不需要你手动维护你的启动选项的配置文件：取而代之的是使用 `grub2-mkconfig` 命令产生 `/boot/grub/grub.cfg` 文件。这个功能会解析 `/etc/grub.d` 目录中的脚本以及 `/etc/default/grub` 设置文件来定义你的设置情况。

###图形化的引导修复###

多亏了 Boot Repair 应用，只需要点击按钮，Grub 2 许许多多的问题都能轻易解决。这个漂亮小巧的应用有一个直观的用户界面，可以扫描并识别多种硬盘布局和分区方案，还能发现并正确识别安装在其中的操作系统。这个应用可以处理传统计算机里的主引导记录（Master Boot Record） (MBR)，也可以处理新型 UEFI 计算机中的 GUID 分区表（GUID Partition Table)（GPT）。

Boot Repair 最简单的使用方式是安装到 Live Ubuntu 会话中。在一个 bootloader 损坏的机器上启动 Ubuntu Live 发行版，先通过添加它的 PPA 版本库来安装 Boot Repair ，命令如下：

    sudo add-apt-repository ppa:yannubuntu/Boot Repair

然后刷新版本库列表：

    sudo apt-get update

安装应用，如下：

    sudo apt-get install -y Boot Repair

安装完毕后就启动应用。在显示它的界面（由一对按键组成）之前将会扫描你的硬盘。根据工具的指示，只需按下 Recommended Repair（推荐的修复）按钮，即可修复大部分坏掉的 bootloader 。修复 bootloader 之后，这个工具会输出一个短小的 URL ，你应该把它记录下来。这个 URL 包含了硬盘详尽的信息：分区信息以及重要的 Grub 2 文件（如 `/etc/default/grub` 和 `/boot/grub/grub.cfg` ）的内容。如果工具不能解决 bootloader 的问题，可以把你这个 URL 共享在你的发行版的论坛上，让其他人可以分析你的硬盘布局以便给你建议。

![](http://www.linuxvoice.com/wp-content/uploads/2015/10/boot-repair-large.jpg)

*Boot Repair 也可以让你定制 Grub 2 的选项。*

### Bootloader 急救 ###

Grub 2 引导问题会让系统处于几种不同状态。屏幕（如你所想，本该显示 bootloader 菜单的地方）所展示的文本会指示出系统的当前状态。如果系统中止于 **grub>** 提示符，表明 Grub 2 模块已经被加载，但是找不到 **grub.cfg** 文件。当前是完全版的 Grub 2 命令行 shell，你可以通过多种方式解决此问题。如果你看到的是 **grub rescue>** 提示符，表明 bootloader 不能找到 Grub 2 模块或者找不到任何引导文件（ boot files ）。然而，如果你的屏幕只显示 ‘GRUB’ 一词，表明 bootloader 找不到通常位于主引导记录（ Master Boot Record ）里的最基本的信息。

你可以通过使用 live CD 或者在 Grub 2 shell 中修正此类错误。如果你够幸运， bootloader 出现了 **grub>** 提示符，你就能获得 Grub 2 shell 的支配权，来帮助你排错。

接下来几个命令工作在 **grub>** 和 **grub rescue>** 提示符下。 **set pager=1** 命令设置显示分页（ pager ），防止文本在屏幕上一滚而过。你还可以使用 **ls** 命令列出 Grub 识别出的所有分区，如下：

    grub> ls
    (hd0) (hd0,msdos5) (hd0,msdos6) (hd1,msdos1)

如你所见，这个命令列出分区的同时一并列出了分区表方案（即 msdos）。

你还可以在每个分区上面使用 **ls** 来查找你的根文件系统：

    grub> ls (hd0,5)/
    lost+found/ var/ etc/ media/ bin/ initrd.gz
    boot/ dev/ home/ selinux/ srv/ tmp/ vmlinuz

你可以不写上分区名的 **msdos** 部分。同样，如果你忘记了尾部的斜杠（ trailing slash ）只输入 `ls (hd0,5)` ，那你将获得分区的信息，比如文件系统类型、总体大小和最后修改时间。如果你有多个分区，可以使用 `cat` 读取 `/etc/issue` 文件中的内容，来确定发行版，格式如 `cat (hd0,5)/etc/issue` 。

假设你在 **(hd0,5)** 中找到根文件系统，请确保它包含 `/boot/grub` 目录，以及你想引导进入的内核镜像，如 **vmlinuz-3.13.0-24-generic** 。此时输入以下命令：

    grub> set root=(hd0,5)
    grub> linux /boot/vmlinuz-3.13.0-24-generic root=/dev/sda5
    grub> initrd /boot/initrd.img-3.13.0-24-generic

第一个命令把 Grub 指向我们想引导进入的发行版所在的分区。接着第二个命令告知 Grub 内核镜像在分区中的位置，以及根文件系统的位置。最后一行设置虚拟文件系统（ initial ramdisk ）文件的位置。你可以使用 tab 补全功能补全内核名字和虚拟文件系统（ initrd: initial ramdisk ）的名字，节省时间和精力。

输入完毕，在下一个 **grub>** 提示符后输入 `boot` ， Grub 将会引导进入指定的操作系统。

如果你在 **grub rescue>** 提示符下，情况会有些许不同。因为 bootloader 未能够找到并加载任何必需的模块，你需要手动添加这些模块：

    grub rescue> set root=(hd0,5)
    grub rescue> insmod (hd0,5)/boot/grub/normal.mod
    grub rescue> normal
    grub> insmod linux

如上所示，跟之前一样，使用 `ls` 命令列出所有分区之后，使用 `set` 命令标记起来。然后添加 **normal** 模块，此模块激活时将会恢复到标准 **grub>** 模式。如果 linux 模块没加载，接下来的命令会进行添加。如果这个模块已经加载，你可以跟之前一样，把引导加载程序指向内核镜像和虚拟文件系统（ initrd ）文件，然后使用 `boot` 启动发行版，完美收官。

一旦成功启动发行版，别忘了为 Grub 重新产生新的配置文件，使用

    grub-mkconfig -o /boot/grub/grub.cfg

命令。你还需要往 MBR 里安装一份 bootloader 的拷贝，使用

    sudo grub2-install /dev/sda

命令。

![](http://www.linuxvoice.com/wp-content/uploads/2015/10/grub2-cfg-large.jpg)

*想要禁用 `/etc/grub.d` 目录下的脚本，你只需移除其可执行位，比如使用 `chmod -x /etc/grub.d/20_memtest86+` 就能将 ‘Memory Test’ 选项从菜单中移除。*

### Grub 2 和 UEFI ###

在支持 UEFI 的机器（最近几年上市的机器大部分都是）调试坏掉的 Grub 2 增加了另一复杂的层次。恢复安装在 UEFI 机器上的 **Grub 2** 的和安装在非 UEFI 机器上的并没多大区别，只是新的固件处理方式不一样，从而导致了很多种恢复结果。

对于基于 UEFI 的系统，不要在 MBR 上安装任何东西。相反，你要在 EFI 系统分区（EFI System Partition）（ ESP ）里安装 Linux EFI bootloader，并且借助工具把它设置为 EFI 的默认启动程序，这个工具对于 Linux 用户是 `efibootmgr` ，对于 window 用户则是 `bcdedit` 。

照目前情况看，在安装任何与 Windows 8 兼容的主流桌面 Linux 发行版前，应该正确安装好 Grub 2。然而，如果 bootloader 损坏，你可以使用 live 发行版修复机器。在启动 live 介质之时，请确保是以 UEFI 模式启动。计算机每个可移动驱动器的启动菜单将会有两个： 一个普通的和一个以 EFI 标记的。使用后者会用到 **/sys/firmware/efi/** 文件中的 EFI 变量。

在 live 环境中，挂载教程前面所提的安装挂掉系统的根文件系统。除此之外，还需要挂载 ESP 分区。假设分区是 **/dev/sda1** ，你可以如下所示挂载：

    sudo mount /dev/sda1 /mnt/boot/efi

接着在 chroot 到安装完毕的发行版前之前，使用 `modprobe efivars` 加载 **efivars** 模块。

在这里， Fedora 用户可以使用如下命令重新安装 bootloader

    yum reinstall grub2-efi shim

但在此之前，需要使用

    grub2-mkconfig -o /boot/grub2/grub.cfg

来产生新的配置文件。 Ubuntu 用户则改用以下命令

    apt-get install --reinstall grub-efi-amd64

一旦 bootloader 正确就位，退出 chroot ，卸载所有分区，重启到 Grub 2 菜单。

### 伙计，我的 Grub 哪去了？ ###

Grub 2 最好的特性是可以随时重新安装。因此，当其它像 Windows 之类的系统用它们自己的 bootloader 替换后，导致 Grub 2 丢失，你可以使用 live 发行版，寥寥数步即可重装 Grub 。假设你在 `/dev/sda5` 安装了一个发行版，若要重装 Grub ，你只需首先使用以下命令为发行版创建一个挂载目录：

    sudo mkdir -p /mnt/distro

然后挂载分区，如下：

    mount /dev/sda5 /mnt/distro

接着就能重装 Grub 了，如下：

    grub2-install --root-directory=/mnt/distro /dev/sda

这个命令会改写 `/dev/sda` 设备上的 MBR 信息，指向当前 Linux 系统，并重写一些 Grub 2 文件，如 **grubenv** 和 **device.map** 。

另一个问题常见于装有多个发行版的计算机上。当你安装了新的 Linux 发行版，它的 bootloader 应当要能找到所有已经安装的发行版。一旦不行，只要引导进入新安装的发行版，并运行

    grub2-mkconfig

在运行这个命令之前，请确保启动菜单中缺失的发行版的 root 分区已经挂载。如果你想添加的发行版有单独的 `/root` 和 `/home` 分区，在运行 `grub2-mkconfig` 之前，只需挂载包含 `/root` 的分区。

虽然 Grub 2 能够找到大部分发行版，但是在 Ubuntu 中尝试添加安装的 Fedora 系统需要额外的一个步骤。如果你以默认设置安装了 Fedora ，则发行版的安装器已经创建了 LVM 分区。此时你需要使用发行版的包管理系统安装 **lvm2** 驱动，如下

    sudo apt-get install lvm2

才能使得 Grub 2 的 `os-prober` 脚本能够找到并将 Fedora 添加进启动菜单。

### 常见用户设置 ###

Grub 2 有很多可配置变量。 这里有一些 `/etc/default/grub` 文件中你最可能会修改到的常见变量。 **GRUB_DEFAULT** 变量指定默认的启动项，可以设置为数字值，比如 0 ，表示第一个菜单项，或者设置为 “saved” ，将指向上一次启动时选中的菜单项。 **GRUB\_TIMEOUT** 变量指定启动默认菜单项之前的停留时间。 **GRUB\_CMDLINE\_LINUX** 列出了要传递给所有 Linux 菜单项的内核命令行参数。

如果 **GRUB\_DISABLE\_RECOVERY** 变量设置为 **true** ，那么将不生成恢复模式菜单项。这些菜单项会以单用户模式启动发行版，这种模式下允许你利用命令行工具修复系统。 **GRUB_GFXMODE** 变量同样有用，它指定了菜单上文本显示的分辨率，它可以设置为你的显卡所支持的任何数值。

![](http://www.linuxvoice.com/wp-content/uploads/2015/10/grub2-cli-large.jpg)

*Grub 2 有个命令行模式，通过在 bootloader 菜单上按 C 进入。*

### 彻底的修复 ###

如果 `grub2-install` 命令不能正常运作，使得你无法引导进入 Linux ，你需要完整地重装以及重新配置 bootloader 。为此目的，需要用到强大的 **chroot** 功能将运行环境从 live CD 环境切换至我们想修复的 Linux 的安装位置。任何拥有 **chroot** 工具的 Linux live CD 都可以实现这个目的。不过需要确保 live 介质的系统架构和硬盘上系统的架构一致。因此当你希望 **chroot** 到 64 位系统，你必须使用 amd64 live 发行版。

启动进入 live 发行版之后，首先需要检查机器上的分区。使用 `fdisk -l` 列出磁盘上所有分区，记录你想修复的 Grub 2 系统所在的分区。

假设我们希望从安装在 `/dev/sda5` 中的发行版中恢复 bootloader 。启动终端使用如下命令挂载分区：

    sudo mount /dev/sda5 /mnt

此时需要绑定（bind）Grub 2 bootloader 需要进入的目录，以便检测其它操作系统：

    $ sudo mount --bind /dev /mnt/dev
    $ sudo mount --bind /dev/pts /mnt/dev/pts
    $ sudo mount --bind /proc /mnt/proc
    $ sudo mount --bind /sys /mnt/sys

此时可以离开 live 环境进入安装在 **/dev/sda5** 分区中的发行版了，通过 **chroot** ：

    $ sudo chroot /mnt /bin/bash

现在可以安装、检测、以及升级 Grub 了，跟之前一样，使用

    sudo grub2-install /dev/sda

命令来重装 bootloader 。因为 **grub2-install** 命令不能创建**grub.cfg** 文件，需要手动创建，如下

    sudo grub-mkconfig -o /boot/grub/grub.cfg

这样应该就可以了。现在你就有了 Grub 2 的一份全新拷贝，罗列了机器上所有的操作系统和发行版。在重启电脑之前，你需要依次退出 chroot 系统，卸载所有分区，如下所示：

    $ exit
    $ sudo umount /mnt/sys
    $ sudo umount /mnt/proc
    $ sudo umount /mnt/dev/pts
    $ sudo umount /mnt/dev
    $ sudo umount /mnt

现在你可以安全地重启电脑了，而它应该会回退到 Grub 2 的控制之中，你已经修好了这个 bootloader。

### 添加自定义菜单项 ###

如果希望往 bootloader 菜单里添加菜单项，你需要在 **40_custom** 文件里添加一个启动段（ boot stanza ）。例如，你可以使用它展示一个菜单项来启动安装在可移动 USB 驱动里的 Linux 发行版。假设你的 USB 驱动器是 **sdb1** ，并且 vmlinuz 内核镜像和虚拟文件系统（ initrd ）都位于根 (/)目录下，在 **40_custom** 文件中添加以下内容：

    menuentry “Linux on USB” {
    	set root=(hd1,1)
    	linux /vmlinuz root=/dev/sdb1 ro quiet splash
    	initrd /initrd.img
    }

相比使用设备和分区名，使用它们的 UUID 可以获得更精确结果，比如

    set root=UUID=54f22dd7-eabe

使用

    sudo blkid

来获得所有已连接的驱动器和分区的 UUID 。你还可以为你磁盘上没被 os-prober 脚本找到的发行版添加菜单项，只要你知道该发行版的安装位置以及其内核和虚拟文件系统（ initrd ）的位置即可。

--------------------------------------------------------------------------------

via: https://www.linuxvoice.com/grub-2-heal-your-bootloader/

作者：[Mayank Sharma][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxvoice.com/author/mayank/
