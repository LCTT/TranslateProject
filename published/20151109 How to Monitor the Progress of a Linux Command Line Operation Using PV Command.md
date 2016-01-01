如何使用 pv 命令监控 linux 命令的执行进度
================================================================================

![](https://www.maketecheasier.com/assets/uploads/2015/11/pv-featured-1.jpg)

如果你是一个 linux 系统管理员，那么毫无疑问你必须花费大量的工作时间在命令行上：安装和卸载软件，监视系统状态，复制、移动、删除文件，查错，等等。很多时候都是你输入一个命令，然后等待很长时间直到执行完成。也有的时候你执行的命令挂起了，而你只能猜测命令执行的实际情况。

通常 linux 命令不提供和进度相关的信息，而这些信息特别重要，尤其当你只有有限的时间时。然而这并不意味着你是无助的——现在有一个命令，pv，它会显示当前在命令行执行的命令的进度信息。在本文我们会讨论它并用几个简单的例子说明其特性。

### PV 命令 ###

[PV][1] 由Andrew Wood 开发，是 Pipe Viewer 的简称，意思是通过管道显示数据处理进度的信息。这些信息包括已经耗费的时间，完成的百分比（通过进度条显示），当前的速度，全部传输的数据，以及估计剩余的时间。

> "要使用 PV，需要配合合适的选项，把它放置在两个进程之间的管道。命令的标准输入将会通过标准输出传进来的，而进度会被输出到标准错误输出。”

上述解释来自该命令的帮助页。

### 下载和安装 ###

Debian 系的操作系统，如 Ubuntu，可以简单的使用下面的命令安装 PV：

    sudo apt-get install pv

如果你使用了其他发行版本，你可以使用各自的包管理软件在你的系统上安装 PV。一旦 PV 安装好了你就可以在各种场合使用它（详见下文）。需要注意的是下面所有例子都使用的是 pv 1.2.0。

### 特性和用法 ###

我们（在 linux 上使用命令行的用户）的大多数使用场景都会用到的命令是从一个 USB 驱动器拷贝电影文件到你的电脑。如果你使用 cp 来完成上面的任务，你会什么情况都不清楚，直到整个复制过程结束或者出错。

然而pv 命令在这种情景下很有帮助。比如：

    pv /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

输出如下：

![pv-copy](https://www.maketecheasier.com/assets/uploads/2015/10/pv-copy.png)

所以，如你所见，这个命令显示了很多和操作有关的有用信息，包括已经传输了的数据量，花费的时间，传输速率，进度条，进度的百分比，以及剩余的时间。

`pv` 命令提供了多种显示选项开关。比如，你可以使用`-p` 来显示百分比，`-t` 来显示时间，`-r` 表示传输速率，`-e` 代表eta（LCTT 译注：估计剩余的时间）。好事是你不必记住某一个选项，因为默认这几个选项都是启用的。但是，如果你只要其中某一个信息，那么可以通过控制这几个选项来完成任务。

这里还有一个`-n` 选项来允许 pv 命令显示整数百分比，在标准错误输出上每行显示一个数字，用来替代通常的可视进度条。下面是一个例子：

    pv -n /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

![pv-numeric](https://www.maketecheasier.com/assets/uploads/2015/10/pv-numeric.png)

这个特殊的选项非常合适某些情境下的需求，如你想把用管道把输出传给[dialog][2] 命令。

接下来还有一个命令行选项，`-L` 可以让你修改 pv 命令的传输速率。举个例子，使用 -L 选项来限制传输速率为2MB/s。

    pv -L 2m /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

![pv-ratelimit](https://www.maketecheasier.com/assets/uploads/2015/10/pv-ratelimit.png)

如上图所见，数据传输速度按照我们的要求被限制了。

另一个pv 可以帮上忙的情景是压缩文件。这里有一个例子可以向你解释如何与压缩软件Gzip 一起工作。

    pv /media/himanshu/1AC2-A8E3/fnf.mkv | gzip > ./Desktop/fnf.log.gz

![pv-gzip](https://www.maketecheasier.com/assets/uploads/2015/10/pv-gzip.png)

### 结论 ###

如上所述，pv 是一个非常有用的小工具，它可以在命令没有按照预期执行的情况下帮你节省你宝贵的时间。而且这些显示的信息还可以用在 shell 脚本里。我强烈的推荐你使用这个命令，它值得你一试。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-progress-linux-command-line-operation/

作者：[Himanshu Arora][a]
译者：[ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:http://linux.die.net/man/1/pv
[2]:http://linux.die.net/man/1/dialog
