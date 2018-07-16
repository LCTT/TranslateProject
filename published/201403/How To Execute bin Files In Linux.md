如何在 Linux 下执行 bin 文件
================================================================================

嗨，各位 **Linux** 极客们，

在这篇简短教程中，我会指导你们如何在你的 Linux 机器上安装 **.bin** 文件。并不是一些可怕的终端命令，我保证！但是我同样会展示如何在终端上操作 。

###什么是 .bin 文件？

.bin 文件是在 Linux 和类 Unix 操作系统上的自执行文件。在执行 .bin 文件之前，你需要给它执行权限。这可以通过命令行或者 gui 完成。如果你喜欢用命令行那么打开一个新的终端并运行如下的命令来给予文件执行权限。

    chmod +x filename.bin

接着用下面的命令执行。

    ./filename.bin

确保你在运行上面的命令的时候是超级用户。

那又如何从 gui 来完成呢？进入 .bin 文件的目录并点击鼠标右键，接着如下图所示进入属性。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec1.png)

选择 **Permissions** 并勾选 **Allow executing file as a program** 。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec2.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec3.png)

双击文件后它就会执行。这样就完成了。

-------------------------------------------------------------------------------- 

via: http://www.unixmen.com/execute-bin-files-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
