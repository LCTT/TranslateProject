戴文的Linux内核专题：28 编译与安装
================================================================================
![](http://www.linux.org/attachments/slide-jpg.762/.jpg)

你好！在花费了大量的时间在配置你需要的内核后，你现在可以编译它了。源代码是纯文本形式的C代码。这对人来可读但是对机器可不是这样。编译会将代码转换成计算机可理解的一种称之为二进制码的形式(1是 [开]，0 是 [关])。编译同样会将所有内核代码文件变成一个内核的文件。

为了编译内核，在内核源代码相同目录下，在终端内输入"make"。这会花费一些时间。完成之后，必须通过"make modules"来编译模块。为了从一开始就简化编译过程，输入"make; make modules"。这会先编译接着是模块，而不用用户再回来输入"make modules"。

![](http://www.linux.org/attachments/compiling_01-png.763/.jpg)

警告：在你安装一个内核时，备份所有的重要数据，确保有一份/boot目录备份在FAT32的存储卡上。这可以在如果安装失败后帮助修复系统。FAT32不会存储权限，因此它更容易被用作live盘来还原数据。记住设置原始文件权限和可执行位。

一旦编译已经成功完成，我们可以安装内核到本地系统中(我会马上解释如何在其他系统上安装内核[交叉编译])。在相同的终端下，在编译完成后，输入"make install"。这会在/boot目录下存放一些文件。"vmlinuz"(或者其他相似的名字)是内核自身。"initrd"是基于内存的文件系统，它被置于内存中且在启动中使用。"System-map"包含了一张内核符号列表。这些全局变量和函数用于内核代码。"config"	是内核的配置文件。grub.cfg会自动更新。然而，有些bootloder需要手动配置。内核安装器会自动配置Grub，LILO和SysLinux bootloder。像BURG这类bootloder需要手动配置。模块的安装同样需要输入"make modules install"。

![](http://www.linux.org/attachments/compiling_04-png.764/.jpg)

注：内核和模块的安装可以写在一行-“make install && make modules_install”。

![](http://www.linux.org/attachments/compiling_05-png.765/.jpg)

一旦上面的过程完成了，用户可以通过重启系统并在开机后在终端内输入"uname -r"来确保内核已经安装。如果系统无法启动或者uname报告你预期外的版本号，这个问题可能众多问题之一引起。或者是bootloader没有正确设置，特性/配置冲突，编译失败，不正确的安装，或者其他原因。找出问题源头最好的方法是查看系统日志(如果系统已经启动到足以产生日志)。"dmsg"是一个在屏幕上打印内核日志的命令。查看错误、警告或者未预料的结果。如果系统没有启动或者没有足够启动完全来生成日志，使用live linux盘来执行诊断和修复。如果所有的都失败了，再次编译内核并确保你已经用root或者"sudo"安装了内核。

注：最好的修复系统的方式是使用live Linux发行版来移除新的/损坏的内核，接着手动修复Grub文件(或者复制一个备份)。

一些Linux用户也喜欢安装内核文档，但这并不是必要。对于那些想要安装文档的用户，输入这行，这里的version是你的内核版本号 "install -d /usr/share/doc/linux-VERSION && cp -r Documentation/* /usr/share/doc/linux-VERSION"(VERSION 是内核版本号)。很明显，这需要root特权。

要是想编译一个如你目前内核一样特性的内核，输入这条命令"zcat /proc/config.gz > .config"。这个文件可能不存在，如果是这样，你可能需要询问你发行版/内核的开发者这个文件。"zcat"命令解压并写入数据到一个".config"文件中。记住把".config"放到合适的位置。这个文件应该放置在Linux内核目录下，并允许它替换当前的文件。接着，像往常一样编译安装你的内核即可。

交叉编译稍微有点不同。为目标系统配置内核。确保内核配置完后，它是以交叉编译配置的。当交叉编译时，需要熟悉两条术语。"Host"是执行编译的系统，"Target"是接收新内核的系统。确保Host主机系统有合适的编译器。比如，对于ARM系统的交叉编译，用户需要在主机系统上有gcc-arm-linux-gnueabi。通常来说，开发者可以在他们的包管理器上搜寻或者Google到合适/最好的适合他们需要的交叉编译器。比如用于ARM系统交叉编译的命令是"make ARCH=arm CROSS\_COMPILE=arm-linux-gnueabi-"。"ARCH=arm"指的是目标处理器的类型，"CROSS\_COMPILE"指明了交叉编译器。注意交叉编译器前面缺少了"gcc-"并以连字符结束。这是用户在使用交叉编译器作为参数使用时必须使用的格式。模块可以通过输入"make ARCH=arm CROSS\_COMPILE=arm-linux-gnueabi- modules"来交叉编译。为了在目标系统上安装内核，将内核文件夹复制到目标系统上。一旦文件已在目标系统上并在该目录下打开了终端，输入"make install && make modules_install"。当然你必须是root或者使用"sudo"。

信息：Kernel.org放了一个支持的交叉编译器列表([https://www.kernel.org/pub/tools/crosstool/][1])。

### 安装编译总结: ###

#### 标准: ####

    make && make modules && make install && make modules_install

#### 做一个更新的版本或者重整你的内核: ####

    zcat /proc/config.gz > .config &&  make && make modules && make install && make modules_install

#### 交叉编译: ####

    make ARCH={TARGET-ARCHITERCTURE} CROSS_COMPILE={COMPILER}; make ARCH={TARGET-ARCHITERCTURE} CROSS_COMPILE={COMPILER} modules && make install && make modules_install

下篇文章中，我们会讨论加入和激活模块。谢谢！

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-compiling-and-installing.5208/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/tools/crosstool/