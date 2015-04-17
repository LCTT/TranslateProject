Linux有问必答：如何在Linux命令行中刻录ISO或NRG镜像到DVD
================================================================================
> **问题**：我需要在Linux机器上使用DVD刻录机刻录一个镜像文件（.iso或.nrg）到DVD，有没有一个既快捷又简易的方法，最好是使用命令行工具？

最常见的两种镜像文件格式是ISO（.iso为文件扩展名）和NRG（.nrg为文件扩展名）。ISO格式是一个由ISO（国际标准组织）创立的全球标准，因此被大多数操作系统所支持，它提供了很高的便携性。另一方面，NRG格式是由Nero AG开发的私有格式，Nero AG是一个很流行的磁盘镜像和刻录软件公司。

下面来解答怎样从Linux命令行刻录.iso或.nrg镜像到DVD。

### 刻录.ISO镜像文件到DVD 

要刻录.iso镜像文件到DVD，我们将使用**growisofs**这个工具：

     # growisofs -dvd-compat -speed=4 -Z /dev/dvd1=WindowsXPProfessionalSP3Original.iso 

在上面的命令行中，“-dvd-compat”选项提供了与DVD-ROM/-Video的最大介质兼容性。在一次写入式 DVD+R 或 DVD-R 上下文中，导致不可添加记录（关闭磁盘）。

“-Z /dev/dvd1=filename.iso”选项表示我们刻录.iso文件到设备选单（/dev/dvd1）中选择的介质中。

“-speed=N”参数指定了DVD刻录机的刻录速度，这与驱动自身的能力直接相关。“-speed=8”将以8x刻录，“-speed=16”将以16x刻录，以此类推。没有该参数，growisofs将默认以最低速刻录，在这里是4x。你可以根据你刻录机的可用速度和磁盘类型选择合适的刻录速度。

你可以根据[此教程][2]找出你的DVD刻录机的设备名称和它所支持的写入速度。

![](https://farm3.staticflickr.com/2947/15510172352_5c09c2f495_z.jpg)

刻录进程完成后，磁盘会自动弹出。

### 把NRG镜像转换为ISO格式 ###

由于ISO被广为采用，刻录.iso镜像到CD/DVD就非常简单。但是，要刻录一个.nrg镜像则首先需要将它转换为.iso格式。

把一个.nrg镜像文件转换到.iso格式，你可以使用nrg2iso这个工具。它是一个开源程序，用来将Nero Burning Rom创建的镜像转换到标准的.iso（ISO9660）文件。

在Debian及其衍生版上安装**nrg2iso**：

    # aptitude install nrg2iso

在基于Red Hat的发行版上安装**nrg2iso**：

    # yum install nrg2iso 

在CentOS/RHEL上，你需要先启用[Repoforge仓库][1]，再通过**yum**安装。

安装完nrg2iso包后，使用以下命令来将.nrg镜像转换到.iso格式：

    # nrg2iso filename.nrg filename.iso 

![](https://farm3.staticflickr.com/2945/15507409981_99eddd2577_z.jpg)

转换完成后，在当前目录中会出现一个.iso文件：

![](https://farm4.staticflickr.com/3945/15323823510_c933d7710f_z.jpg)


###检查已刻录介质的完整性###

关于这一点，你可以通过将刻录的DVD的校验和与原始.iso文件的md5校验和进行对比，以检查所刻录介质的完整性。如果两者相同，你就可以放心了，因为刻录成功了。

然而，当你使用nrg2iso来将.nrg镜像转换为.iso格式后，你需要明白一点，nrg2iso创建的.iso文件的大小不是2048的倍数（通常，.iso文件的大小是它的倍数）。因此，常规的校验和对比，该.iso文件和刻录介质的内容不一样。

另一方面，如果你已经刻录了一个不是由.nrg文件转换而来的.iso镜像，你可以使用以下命令来检查记录到DVD中的数据的完整性。替换“/dev/dvd1”为你的设备名。

    # md5sum filename.iso; dd if=/dev/dvd1 bs=2048 count=$(($(stat -c "%s" filename.iso) / 2048)) | md5sum 

命令的第一部分计算.iso文件的md5校验和，而第二部分则读取/dev/dvd1中的磁盘内容，然后通过管道输出给md5sum工具。“bs=2048”表示dd命令将使用2048字节块为单位检查，因为原始iso文件以2048为单位划分。

![](https://farm3.staticflickr.com/2949/15487396726_bcf47d536f_z.jpg)

如果两个md5校验和的值相同，这就意味着刻录的介质是有效的。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/burn-iso-nrg-image-dvd-command-line.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[2]:http://linux.cn/article-4081-1.html
