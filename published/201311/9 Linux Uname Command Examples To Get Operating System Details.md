九个uname命令获取Linux系统详情的实例
================================================================================

当你在控制台模式下，无法通过“鼠标右键 > 关于”获取操作系统的信息。这时，在Linux下，你可以使用**uname**命令，帮助你完成这些工作。 Uname是**unix name**的缩写。在控制台中实际使用的时候只需键入**uname**。

当你输入uname不带参数时，它仅仅显示你的操作系统的名字。

    # uname

    Linux

也许这还不能满足你的需要。所以你需要加上一些参数，来使uname显示你所需要的信息。

以下是uname参数的列表:

### 1. 内核名称 ###

你可以用**-s**参数，显示内核名称。（译注：可以在其他的类Unix系统上运行这个命令看看，比如mac就会显示Darwin）

    # uname -s

    Linux

输出信息会跟uname不带参数时输出的一样。

### 2. 内核发行版 ###

如果你想知道你正在使用哪个内核发行版（指不同的内核打包版本），就可以用**-r**参数

    # uname -r

    2.6.18-371.1.2.el5

### 3. 内核版本 ###

除一些内核信息外，用**-v**参数uname也能获取更详细的内核版本信息（译注：不是版本号，是指该内核建立的时间和CPU架构等）。

    # uname -v

    #1 SMP Tue Oct 22 12:57:43 EDT 2013

### 4. 节点名 ###

参数 -n 会提供给你节点的主机名。举例来说，如果你的主机名是“dev-machine”，**-n**参数就会把主机名打印出来。

    # uname -n

    dev-machine

对于RedHat和CentOS用户来说，你也可以通过**/etc/redhat_release**文件来查看：

    # cat /etc/redhat_release

    CentOS release 5.10 (Final)

如果不是基于RedHat的发行版，你可以查看**/etc/issue**文件.类似如下：

    # cat /etc/issue

    Linux Mint Olivia \n \l:

### 5.硬件名称 ###

如果你想知道用的是哪类机器，你可以尝试**-m**参数。它将告诉你关于硬件的信息。

    # uname -m

    i686

i686表明了你用的是32位的操作系统，如果是X86_64则表明你用的是64位的系统。

### 6. 硬件平台 ###

与硬件名称类似，-i参数会显示你的硬件平台（译注：硬件名称i686是属于硬件平台i386系列的）。

    # uname -i

    i386

同样，i386意味这是正在运行一个32位的系统，如果输出的是X86_64则说明你正在运行一个64位的系统。

### 7. 处理器类型 ###

你可以用**-p**参数查看处理器类型。如果uname无法识别，它会显示 ‘unknown’ 作为输出。

    # uname -p

    i686

### 8. 操作系统 ###

uname也可以透露你正在运行的操作系统信息，用**-o**参数可以实现这个目的。

    # uname -o

    GNU/Linux

### 9. 所有信息  ###

有一个参数可以展示所有的信息！这就是**-a**参数，它会显示所有信息。如果**-i和-p**输出为unknown则默认会被省略。

    # uname -a

    Linux dev-machine 2.6.18-371.1.2.el5 #1 SMP Tue Oct 22 12:57:43 EDT 2013 i686 i686 i386 GNU/Linux

以上就是关于uname命令的使用。请敬请期待更多的命令！

谢谢阅读！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/uname-command/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
