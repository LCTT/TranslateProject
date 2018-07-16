什么是Unix以及它为什么这么重要？
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/02/ken-thompson-and-dennis-richie-at-pdp-11.jpg)

大多数操作系统可以被划分到两个不同的家族。除了微软的基于Windows NT的操作系统外，几乎所有其他的都可以追溯到Unix。

Linux，Mac OS X，Android，iOS，Chrome OS，PlayStaion 4上运行的Orbis OS，运行在路由器上的各种固件，所有这些操作系统通常都被称为“类Unix”操作系统。

### Unix的设计现在都还在应用 ###

Unix在20世纪60年代中晚期诞生于AT&T的贝尔实验室中。最初发布的Unix中的一些重要设计因素到如今都还在使用。

其中一个设计是“Unix哲学”，建立小的模块化的应用，只做一件事情并把它做好。如果你对Linux终端很熟悉的话，应该对这个不陌生－系统提供了大量的应用，可以通过[管道或其他特性][1]形成不同的组合来完成更复杂的任务。甚至图形界面程序也经常会在后台调用更简单的应用去做比较耗时的任务。这种模式也让[建立终端脚本][2]更为简单，通过文本把一些简单工具结合起来去做复杂的事情。

Unix还设计了一个单一的文件系统，程序可以通过它互相通讯。这也是[为什么在Linux里说“一切都是文件”][3]－包括硬件设备文件，和提供系统信息及其他数据的特殊文件。这也是为什么只有Windows系统中才有磁盘盘符，这是从DOS继承过来的－在其他操作系统中，所有文件都是一个单一目录结构中的一部分。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/02/unix-bell-labs.jpg)

### 那些从Unix派生出的系统 ###

类似任何可以往前追溯40年的历史，Unix的历史和它的派生系统一片混乱。为了简单，我们把Unix的派生系统大致分成两组。

一组Unix派生系统是学术界开发的。

首先是BSD（伯克利软件发布版），一个开源的类Unix操作系统。BSD如今还存在于FreeBSD，NetBSD和OpenBSD等系统中。NeXTStep基于最初版的BSD开发，苹果的Mac OS X基于NeXTStep，iOS基于Mac OS X。许多其他操作系统，包括运行在PlayStation 4上的Orbis OS，也源于各种BSD操作系统。

Richard Stallman建立GNU项目的目的是为了反对AT&T的Unix软件协议条款日渐严格的限制。MINIX是一个类Unix操作系统，为教育目的而实现的，而Linux则是受到了MINIX的启发。[我们今天所熟悉的Linux其实应该叫GNU/Linux][4]，因为它是由Linux内核和大量GNU应用组成的。GNU/Linux不是直接从BSD继承下来的，但是它继承了Unix的设计而且根植于学术界。如今许多操作系统，包括Android，Chrome OS，Steam OS，以及数量巨大的在各种设备上使用的嵌入式操作系统，都基于Linux。

另一组是商用的Unix操作系统。AT&T UNIX，SCO UnixWare，Sun Microsystem Solaris，HP-UX，IBM AIX，SGI IRIX－许多大型企业都希望建立并授权自己版本的Unix。它们如今并不常见，但其中一些仍然存在。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/02/history-of-unix.png)

图片致谢: [Wikimedia Commons][5]

### DOS和Windows NT的崛起 ###

许多人希望Unix能够成为工业标准操作系统，但是DOS和“IBM PC兼容”计算机却最终人气爆发而普及开来。微软的DOS也成为众多DOS系统中最成功的一个。DOS完全没有参照Unix，这也是[为什么Windows使用反斜杠划分文件路径，而其他所有系统都使用正斜杠][6]。这个决定是在早期的DOS系统中做出的，而之后的Windows版本继承了这一设定，就像BSD，Linux，Mac OS X，和其他类Unix操作系统继承了许多Unix设计因素一样。

Windows 3.1，Windows 95，Windows 98，和 Windows ME都是建立在DOS的基础上。当时微软已经在开发一个更现代更稳定的操作系统，叫做Windows NT－意思是“Windows新技术”。Windows NT最终通过Windows XP应用到普通计算机用户中，但是之前它都只用于针对企业用户的Windows 2000和Windows NT。

如今所有微软的操作系统都基于Windows NT内核。Windows 7，Windows 8，Windows RT，Windows Phone 8，Windows Server，以及Xbox One上的操作系统都在使用Windows NT内核。不像其他大多数操作系统那样，Windows NT没有被开发成一个类Unix操作系统。

当然，微软也不是完全从零开始的。为了维护DOS和旧版本Windows软件的兼容性，Windows NT继承了许多DOS里的设定，比如磁盘盘符，反斜杠区分文件路径，正斜杠作为命令行参数开关。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/02/windows-2000-professional-built-on-nt-technology.jpg)

### 为什么它影响很大 ###

不知道你有没有看过Mac OS X终端或是文件系统，有没有注意到它们和Linux是如此相似，而又和Windows是如此不同？好吧，原因是－Mac OS X和Linux两个都是类Unix操作系统。

了解了这点历史，就可以帮助你理解什么是“类Unix”操作系统，以及为什么这么多操作系统看起来都差不多，而Windows却那么与众不同。这也可以解释为什么Linux极客对Mac OS X上的终端会感觉如此熟悉，而[Windows 7上的Command Prompt和PowerShell][7]相对于其他命令行环境显得格格不入。

这只是一点快速掠过的历史，帮助了解是如何发展到今天的，而不用陷入到细节中。如果你想了解更多，可以找到许多关于Unix历史的整本的书籍。

图片致谢: [Peter Hamer on Flickr][8], [Takuya Oikawa on Flickr][9], [CJ Sorg on Flickr][10]

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/182649/htg-explains-what-is-unix/

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/110150/become-a-linux-terminal-power-user-with-these-8-tricks/
[2]:http://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/
[3]:http://www.howtogeek.com/117939/htg-explains-what-everything-is-a-file-means-on-linux/
[4]:http://www.howtogeek.com/139287/the-great-debate-is-it-linux-or-gnulinux/
[5]:http://en.wikipedia.org/wiki/File:Unix_history.svg
[6]:http://www.howtogeek.com/181774/why-windows-uses-backslashes-and-everything-else-uses-forward-slashes/
[7]:http://www.howtogeek.com/163127/how-powershell-differs-from-the-windows-command-prompt/
[8]:http://www.flickr.com/photos/peter-hamer/2876612463/
[9]:http://www.flickr.com/photos/takuyaoikawa/2060554607/
[10]:http://www.flickr.com/photos/cjsorg/2726088549/
