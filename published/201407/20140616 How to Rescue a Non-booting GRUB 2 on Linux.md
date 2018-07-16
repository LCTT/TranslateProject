如何拯救一台GRUB 2启动失败的Linux电脑
================================================================================
![Figure 1: GRUB 2 menu with cool Apollo 17 background.](http://www.linux.com/images/stories/41373/grub-command-shell.jpg)

旧版GRUB我们使用了一段时间了，这个重要的Linux通用引导器的版本已经到了0.97。尽管旧版GRUB有很多的优点，但是它已经有点陈旧了，并且它的开发者也希望添加更多的功能，于是，GRUB 2 时代就要来了。
 
GRUB 2 做了几个明显的改进。它可以从移动存储设备上启动，并且可以通过配置一个选项来进入系统BIOS。相对于将所有的配置都放到一个配置文件`/boot/grub/menu.lst`中 （现在默认是`/boot/grub/grub.cfg `），使用各种脚本来配置会更复杂。你不要直接编辑这个文件，那不是人干的事，太复杂了，我们需要使用其它的脚本来改变。我们卑微的人类可以编辑修改`/etc/default/grub`文件，它主要是控制Grub菜单的外观。我们还可以修改` /etc/grub.d/ `下的脚本，这些脚本用于启动操作系统、控制外部应用程序，如memtest 、os_prober和theming等等 。`./boot/grub/grub.cfg`是由`/etc/default/grub`和`/etc/grub.d/*`生成的。当你修改了某个地方，你必须要运行update-grub命令来生成它。

好消息是，update-grub脚本可以可靠的检测内核、启动文件，并添加所有的操作系统，自动生成你的启动菜单，所以你不必手动的修改他们。

我们还要学习如何解决两个常见的故障。当启动系统时，它会停在grub>提示上，这是一个完整的GRUB 2命令界面，所以不要惊慌。这意味着GRUB 2依旧可以正常启动和加载normal.mod模块（它和其他模块分别位于/boot/grub/[架构]/ 下），但没有找到你的grub.cfg文件。如果你看到grub rescue> 这意味着它无法找到normal.mod，因此它有可能找不到你的启动文件。

这是如何发生的？因为内核可能改变驱动器分区号码的分配，或者您移动了您的硬盘驱动器，或者你手动改变一些分区，也有可能是安装一个新的操作系统或者移动一些文件。在这些情况下你的启动文件仍然存在，但GRUB不能找到他们。所以你可以在GRUB提示符中找到启动文件，设置它们的位置，然后启动您的系统并修复GRUB配置。

### GRUB 2 命令行 ###

GRUB 2 的命令界面和上一代GRUB中的一样强大。你可以用它来找到引导镜像，内核和根文件系统。事实上，它可以让你避开权限和其它访问控制，完全访问本地计算机上的所有文件。有些人可能会认为这是一个安全漏洞，但是你知道古老的UNIX的名言：有物理访问机器权限的人，就是拥有它的人。

当你在` grub > `提示时，你有许多类似命令行界面的功能，如命令历史和tab补全。但是`grub rescue> `模式是受限的，没有命令历史，没有tab补全。

如果你是在一个正常运作的系统上练习，那就当GRUB菜单出现时，可以按下C来打开GRUB命令行界面。你可以通过向上和向下光标键滚动你的菜单条目来停止启动倒计时。在GRUB命令行下做实验是安全的，因为做不了永久的修改，一切都是暂时的。如果你已经看到`grub > `或`grub rescue> `提示符，那就说明你的表现时刻到了。

接下来的几个命令可以在`grub>`和`grub rescue`模式下运行。你应该运行的第一个命令是设置一个分页器，将长的命令分页。如下：

    grub> set pager=1

等号两侧必须不能出现空格。现在让我们做一点探索。输入`ls`来列出的GRUB识别的所有分区：

    grub> ls
    (hd0) (hd0,msdos2) (hd0,msdos1)

msdos是什么？这意味着该系统具有老式的MS-DOS分区表，而不是全新的全局唯一标识符的分区表（GPT）。参见“[在Linux下使用新的GUID分区表，和古老的MBR说再见！][1]”。如果你正在运行的GPT，它会出现(hd0，GPT1)。现在让我们看看，使用ls命令查看你的系统里面有什么文件：

    grub> ls (hd0,1)/
    lost+found/ bin/ boot/ cdrom/ dev/ etc/ home/  lib/
    lib64/ media/ mnt/ opt/ proc/ root/ run/ sbin/ 
    srv/ sys/ tmp/ usr/ var/ vmlinuz vmlinuz.old 
    initrd.img initrd.img.old

太好了，我们已经找到了根文件系统。你可以省略msdos和GPT的标签。如果没有加分区后面的斜杠/，则只会列出分区的信息。你可以用cat命令显示文件系统上的任何文件：

    grub> cat (hd0,1)/etc/issue
    Ubuntu 14.04 LTS \n \l

在一个多引导系统上，通过/etc/issue文件可以知道这是哪个Linux系统。

### 从 grub> 中启动###

下面讲述如何设置启动文件并从`grub >`提示下启动系统。我们已经知道如何从Linux根文件系统(hd0,1)下运行ls命令，你可以一直寻找直到找到你的/boot/grub所在位置。然后运行以下命令，记得使用您自己的根分区，内核和initrd映像等参数：

    grub> set root=(hd0,1)
    grub> linux /boot/vmlinuz-3.13.0-29-generic root=/dev/sda1
    grub> initrd /boot/initrd.img-3.13.0-29-generic
    grub> boot

第一行设置分区的根文件系统。第二行告诉GRUB您想要使用的内核位置。开始输入/boot/vmli，然后使用tab补完填写。输入`root= /dev/sdX`设置根文件系统位置。是的，这似乎是多余的，但如果你忘记了输入，你会得到一个kernel panic。你知道怎么找到正确的分区吗？hd0,1 即 /dev/sda1，hd1,1 即 /dev/sdb1，hd3,2 即 /dev/ sdd2。我想你可以自己推算剩下的了。

第三行设置initrd文件，必须是和内核相同的版本号。

最后一行启动系统。

在一些Linux系统上，内核和initrd是被符号链接到当前的根文件系统的根目录，就像：

    $ ls -l /
    vmlinuz -> boot/vmlinuz-3.13.0-29-generic
    initrd.img -> boot/initrd.img-3.13.0-29-generic

所以，你也可以这样输入命令：

    grub> set root=(hd0,1)
    grub> linux /vmlinuz root=/dev/sda1
    grub> initrd /initrd.img
    grub> boot

### 从grub rescue> 中启动 ###

如果你处在grub rescue> 命令界面下，命令有所不同，你必须要先加载两个模块normal.mod 和 linux.mod。

    grub rescue> set prefix=(hd0,1)/boot/grub
    grub rescue> set root=(hd0,1)
    grub rescue> insmod normal
    grub rescue> normal
    grub rescue> insmod linux
    grub rescue> linux /boot/vmlinuz-3.13.0-29-generic root=/dev/sda1
    grub rescue> initrd /boot/initrd.img-3.13.0-29-generic
    grub rescue> boot

在你加载了这两个模块之后tab补完的功能就可以用了。

### 永久性的修复 ###

当你成功地启动你的系统，运行这些命令来永久修复GRUB：

    # update-grub
    Generating grub configuration file ...
    Found background: /usr/share/images/grub/Apollo_17_The_Last_Moon_Shot_Edit1.tga
    Found background image: /usr/share/images/grub/Apollo_17_The_Last_Moon_Shot_Edit1.tga
    Found linux image: /boot/vmlinuz-3.13.0-29-generic
    Found initrd image: /boot/initrd.img-3.13.0-29-generic
    Found linux image: /boot/vmlinuz-3.13.0-27-generic
    Found initrd image: /boot/initrd.img-3.13.0-27-generic
    Found linux image: /boot/vmlinuz-3.13.0-24-generic
    Found initrd image: /boot/initrd.img-3.13.0-24-generic
    Found memtest86+ image: /boot/memtest86+.elf
    Found memtest86+ image: /boot/memtest86+.bin
    done
    # grub-install /dev/sda
    Installing for i386-pc platform.
    Installation finished. No error reported.

当你运行 `grub-install` 时，记得GRUB是安装到整个硬盘驱动器的主引导扇区而不是到一个具体分区，所以不要加上像/dev/sda1一样的分区号。

### 如果还是不能使用 ###

如果你的系统是如此的倒霉，而且这个方式没有能起作用，那就尝试[超级GRUB2现场救援磁盘][2]吧。[官方GNU GRUB手册][3]也应该有所帮助。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/776643-how-to-rescue-a-non-booting-grub-2-on-linux

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux.com/learn/tutorials/730440-using-the-new-guid-partition-table-in-linux-good-bye-ancient-mbr-
[2]:http://www.supergrubdisk.org/
[3]:https://www.gnu.org/software/grub/manual/grub.html
