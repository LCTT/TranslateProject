Linux基础：如何在命令行中查看目录的大小
=====================================================================

这是写给Liunx新用户的一系列文章中的第一篇，在这系列文章我将会写一些对新用户来说非常好用的**Linux基础命令**。

**注意**：本文的目标读者是仅有小量甚至是没有任何Linux命令行使用经验的读者。

>作为一个Linux的新用户，我怎样可以在命令行终端中查看某个目录的属性？

###要求###

唯一的要求是**du**命令行工具。du基本上是所有Linux发行版本默认提供的工具。用以下的命令来检查你的系统中是否可以使用du命令：

    man du

**du** 命令用于输出文件的空间使用情况。

###使用du###

不带任何参数的运行du命令会显示当前工作目录以及其子目录的文件名和所占用的空间大小(以字节为单位)。

    du

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-overview.png)

使用**-h**参数以对用户友好的方式输出文件大小，即分别以**K, M**和**G**来表示**Kb,Mb**和**Gb**

    du -h
    
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-h.png)

若想查看某个特定目录的文件大小，则在du命令中指定要查看的目录名，如下：

    du -h Mapmaker

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-h-mapmaker.png)

使用 **-c** 参数来查看目录所占用磁盘空间的总大小

    du -ch

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-ch.png)

使用 **-s** 参数只输出指定目录占用空间的大小

    du -sh Mapmaker Sandbox

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-ch.png)

使用 man du 查看du命令更多参数的用法

    man du

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/man-du.png)

知道du命令更多的用法？请分享给我和其他人。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-find-size-directory-commands/

译者：[cvsher](https://github.com/cvsher) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

