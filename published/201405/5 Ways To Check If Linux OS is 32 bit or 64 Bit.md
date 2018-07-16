五种方法检测你的 Linux 是32位还是64位 
================================================================================
有的时候 Linux 新手们在下载软件的时候十分困惑，因为下载页面常常同时提供32位和64位版本的软件。所以弄清楚你的操作系统是32位的还是64位的十分重要，因为你在做很多事情的时候都需要这个信息。在这篇文章里，我们会讨论五种检测你的Linux系统是32位还是64位的方法。

### 检测你的 Linux 是32位还是64位的 ###

请注意文中的这些方法是在 Ubuntu 13.10 平台测试.

#### 1. 执行‘uname -a’ 命令 ####

最常见的一个测试方法是运行  [uname command][1]  命令。

例如，在我的系统里，它显示了以下信息：

    $ uname -a
     Linux ubuntu 3.11.0-12-generic #19-Ubuntu SMP Wed Oct 9 16:12:00 UTC 2013 i686 athlon i686 GNU/Linux

那个高亮的 **i686** (or 有时候会是i386) 说明操作系统是32位的，但是如果显示的是 **x86_64**，那就说明这个操作系统是64位的。

#### 2.运行 ‘uname -m’ 命令 ####

上面的命令内涵太多了，可以用这个参数直指人心：‘uname -m’ 。

例如，在我的系统里，它显示了以下信息： 

    $ uname -m
     i686

这说明我的 Ubuntu Linux 系统是32位的，如果输出显示的是x86\_64，就说明系统是64位的。

#### 3.使用 file 命令####

尽管这样做纯粹是炫耀技巧，但是仍然不失为一种达到目的的方法。使用这个方法，需要你运行 file 命令并带上 **/sbin/init** 作为参数。 

举个例子:

    $ file /sbin/init
     /sbin/init: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.24, BuildID[sha1]=0xc0d86a25a7abb14cad4a65a1f7d03605bcbd41f6, stripped

高亮的 **32-bit** 说明这是一个32位的操作系统,如果显示为 **64-bit** 则说明操作系统是64位的

#### 4. 使用 arch 命令 ####

另外一个可以选择的方法是使用 arch 命令，这个命令用于输出机器的硬件名称。

这里有一个示例:

    $ arch
     i686

在这里你可以看到输出的是 i686, 这说明这是一个32位操作系统，对于64位的操作系统，输出的应该是x86_64。

#### 5. 通过系统设置的方法 ####

如果你使用的是 Ubuntu 12.04 或更高, 你可以很简单地在** All Settings -> Details**里查看你的系统结构。

![details](http://mylinuxbook.com/wp-content/uploads/2014/04/details.png)

这样你就可以看到系统类型(32-bit)在这里清晰地显示出来。

你还知道别的方法来检测操作系统是32位还是64位的吗？在下面回复与我们分享吧。

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/5-ways-to-check-if-linux-is-32-bit-or-64-bit/

译者：[crowner](https://github.com/crowner) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/linux-uname-command/
