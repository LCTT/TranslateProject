findmnt-寻找挂载的文件系统
================================================================================
命令findmnt用来查找在Linux下已经被挂载的文件系统。该命令会从/etc/fstab、/etc/mtab或者/proc/self/mountinfo中寻找指定的文件系统。

### 如何安装findmnt ###

findmnt命令来自于util-linux-ng软件包，这个包现在改名为util-linux。该软件包中还包括其他一些工具，比如hwclock等。从kernel.org ftp页面[下载util-linux][1]以安装findmnt。

### 如何在Fedora下安装findmnt ###

Fedora用户可以通过下面的命令安装该软件包：

    $ sudo yum install util-linux-ng

### Findmnt默认选项 ###

如果没有提供特定的挂载点或者设备，该命令默认会以优美的树形结构列出所有已经被挂载的文件系统。

    $ findmnt

![findmnt default](http://linoxide.com/wp-content/uploads/2014/03/findmnt-default.png)

### Findmnt轮询模式 ###

findmnt可以被用来监控/proc/self/mountinfo文件的变化。轮询模式可以通过下面的命令进行调用：

    $ findmnt -p

或者

    $ findmnt --poll

/proc/self/mountinfo文件的任何变化会自动的在终端中进行更新。一开始你不会发现终端中的输出有任何变化，如果此时你拔掉U盘再插入，变化就会出现在终端中。

![findmnt poll](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll.png)

轮询停止的时间可以通过**--timeout**或者**--first-only**选项进行限制。

### 超时选项 ###

该选项可以与--pool一起使用来限制轮询模式的时间。**超时单位是毫秒**。超过此时间后，findmnt不会再监控/proc/self/mountinfo文件的变化。

    $ findmnt --poll --timeout 6000

![findmnt poll timeout](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll-timeout.png)

### First-only选项 ###

first-only选项只会监控/proc/self/mountinfo文件的第一次变化，之后该命令退出轮询模式。第一次变化会出现在终端中，并且返回到提示符。使用此选项在终端中输入：

    $ findmnt --poll --first-only

![findmnt poll first-only](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll-first-only.png)

### 模仿df输出的选项 ###

findmnt命令也可以用来模仿df命令的输出。你可以参考如下的命令使用findmnt和选项**--df**。

    $ findmnt --df

或者

    $ findmnt -D

它会返回和**df -h**命令几乎相同的输出。

    $ df -h

![findmnt imitate df](http://linoxide.com/wp-content/uploads/2014/03/findmnt-imitate-df.png)

### Findmnt list选项 ###

如果你不喜欢默认的树形输出，你可以使用**--list**或者**-l**选项。它会以列的形式进行输出。

    $ findmnt --list

执行此命令的输出如下：

![findmnt list](http://linoxide.com/wp-content/uploads/2014/03/findmnt-list.png)

### Findmnt Evaluate 选项 ###

求值选项会转换所有的标签(比如LABEL，UUID，PARTUUID或者PARTLABEL)成真实的设备名称。该选项可以结合**--fstab**选项来打印所有在/etc/fstab中包含的文件系统。**--fstab**选项的输出是列的形式，因此当使用**--fstab**的时候无需使用**--list**选项。

    $ findmnt --fstab --evaluate

当这两个选项像如下一样结合使用的时候，输出如下：

![findmnt fstab evaluate](http://linoxide.com/wp-content/uploads/2014/03/findmnt-fstab-evaluate.png)

### Findmnt type 选项 ###

该选项允许你限制打印出的文件系统。多个文件系统可以使用逗号分割进行指定。在这个实例中，该命令会搜索ext4,ext3和vfat文件系统。

    $ findmnt -t ext4,ext3,vfat

![findmnt types](http://linoxide.com/wp-content/uploads/2014/03/findmnt-types.png)

### 结语 ###

你可以按照你的需要尝试不同的findmnt选项。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/powerful-findmnt-command/

译者：[zzlyzq](https://github.com/zzlyzq) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:ftp://ftp.kernel.org/pub/linux/utils/util-linux/
