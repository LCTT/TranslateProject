如何装载/卸载 Linux 内核模块
===============

> 找到并装载内核模块以解决外设问题。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82)

本文来自 Manning 出版的 [Linux in Action][1] 的第 15 章。

Linux 使用内核模块管理硬件外设。 我们来看看它是如何工作的。

运行中的 Linux 内核是您不希望被破坏的东西之一。毕竟，内核是驱动计算机所做的一切工作的软件。考虑到在一个运行的系统上必须同时管理诸多细节，最好能让内核尽可能的减少分心，专心的完成它的工作。但是，如果对计算环境进行任何微小的更改都需要重启整个系统，那么插入一个新的网络摄像头或打印机就可能会严重影响您的工作流程。每次添加设备时都必须重新启动，以使系统识别它，这效率很低。

为了在稳定性和可用性之间达成有效的平衡，Linux 将内核隔离，但是允许您通过可加载内核模块 (LKM) 实时添加特定的功能。如下图所示，您可以将模块视为软件的一部分，它告诉内核在哪里找到一个设备以及如何使用它。反过来，内核使设备对用户和进程可用，并监视其操作。

![Kernel modules][3]

*内核模块充当设备和 Linux 内核之间的转换器。*

虽然你可以自己编写模块来完全按照你喜欢的方式来支持一个设备，但是为什么要这样做呢？Linux 模块库已经非常强大，通常不需要自己去实现一个模块。 而绝大多数时候，Linux 会自动加载新设备的模块，而您甚至不知道它。

不过，有时候，出于某种原因，它本身并不会自动进行。（你肯定不想让那个招聘经理不耐烦地一直等待你的笑脸加入视频面试。）为了帮助你解决问题，你需要更多地了解内核模块，特别是，如何找到运行你的外设的实际模块，然后如何手动激活它。

### 查找内核模块

按照公认的约定，内核模块是位于 `/lib/modules/` 目录下的具有 .ko（内核对象）扩展名的文件。 然而，在你找到这些文件之前，你还需要选择一下。因为在引导时你需要从版本列表中选择其一加载，所以支持您选择的特定软件（包括内核模块）必须存在某处。 那么，`/lib/modules/` 就是其中之一。 你会发现目录里充满了每个可用的 Linux 内核版本的模块; 例如：

```
$ ls /lib/modules
4.4.0-101-generic
4.4.0-103-generic
4.4.0-104-generic
```

在我的电脑上，运行的内核是版本号最高的版本（4.4.0-104-generic），但不能保证这对你来说是一样的（内核经常更新）。 如果您将要在一个运行的系统上使用模块完成一些工作的话，你需要确保您找到正确的目录树。

好消息：有一个可靠的窍门。相对于通过名称来识别目录，并希望能够找到正确的目录，你可以使用始终指向使用的内核名称的系统变量。 您可以使用 `uname -r`（ `-r` 从系统信息中指定通常显示的内核版本号）来调用该变量：


```
$ uname -r
4.4.0-104-generic
```

通过这些信息，您可以使用称为命令替换的过程将 `uname` 并入您的文件系统引用中。 例如，要导航到正确的目录，您需要将其添加到 `/lib/modules` 。 要告诉 Linux “uname” 不是一个文件系统中的位置，请将 `uname` 部分用反引号括起来，如下所示：

```
$ ls /lib/modules/`uname -r`
build   modules.alias        modules.dep      modules.softdep
initrd  modules.alias.bin    modules.dep.bin  modules.symbols
kernel  modules.builtin      modules.devname  modules.symbols.bin
misc    modules.builtin.bin  modules.order    vdso

```

你可以在 `kernel/` 目录下的子目录中找到大部分模块。 花几分钟时间浏览这些目录，了解事物的排列方式和可用内容。 这些文件名通常会让你知道它们是什么。

```
$ ls /lib/modules/`uname -r`/kernel
arch  crypto  drivers  fs  kernel  lib  mm 
net  sound  ubuntu  virt  zfs
```

这是查找内核模块的一种方法；实际上，这是一种快速的方式。 但这不是唯一的方法。 如果你想获得完整的集合，你可以使用 `lsmod` 列出所有当前加载的模块以及一些基本信息。 这个截断输出的第一列（在这里列出的太多了）是模块名称，后面是文件大小和数量，然后是每个模块的名称：

```
$ lsmod
[...]
vboxdrv          454656  3 vboxnetadp,vboxnetflt,vboxpci
rt2x00usb        24576  1 rt2800usb
rt2800lib        94208  1 rt2800usb
[...]
```

到底有多少？好吧，我们再运行一次 `lsmod ` ，但是这一次将输出管道输送到 `wc -l` 看一下一共多少行:

```
$ lsmod | wc -l
113
```

这是已加载的模块。 总共有多少个？ 运行 `modprobe -c` 并计算这些行将给我们这个数字：

```
$ modprobe -c | wc -l
33350
```

有 33,350 个可用模块！？ 看起来好像有人多年来一直在努力为我们提供软件来驱动我们的物理设备。

注意：在某些系统中，您可能会遇到自定义的模块，这些模块要么在 `/etc/modules` 文件中使用独特的条目进行引用，要么在 `/etc/modules-load.d/` 下的配置文件中。这些模块很可能是本地开发项目的产物，可能涉及前沿实验。不管怎样，知道你看到的是什么总是好的。

这就是如何找到模块的方法。 如果出于某种原因，它不会自行加载，您的下一个工作就是弄清楚如何手动加载未激活的模块。

### 手动加载内核模块

在加载内核模块之前，逻辑上您必须确认它存在。在这之前，你需要知道它叫什么。要做到这一点，有时需要兼有魔法和运气以及在线文档作者的辛勤工作的帮助。

我将通过描述一段时间前遇到的问题来说明这个过程。在一个晴朗的日子里，出于某种原因，笔记本电脑上的 WiFi 接口停止工作了。就这样。也许是软件升级把它搞砸了。谁知道呢？我运行了 `lshw -c network` ，得到了这个非常奇怪的信息:

```
network UNCLAIMED
    AR9485 Wireless Network Adapter
```

Linux 识别到了接口（Atheros AR9485），但将其列为未声明。 那么，正如他们所说的那样，“当情况变得严峻时，就会在互联网上进行艰难的搜索。” 我搜索了一下 atheros ar9 linux 模块，在浏览了一页又一页五年前甚至是十年前的页面后，它们建议我自己写个模块或者放弃吧，然后我终于发现（最起码 Ubuntu 16.04）有一个可以工作的模块。 它的名字是 ath9k 。

是的! 这场战斗胜券在握！向内核添加模块比听起来容易得多。 要仔细检查它是否可用，可以针对模块的目录树运行 `find`，指定 `-type f` 来告诉 Linux 您正在查找文件，然后将字符串 `ath9k` 和星号一起添加以包含所有以你的字符串打头的文件：

```
$ find /lib/modules/$(uname -r) -type f -name ath9k*
/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_common.ko
/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k.ko
/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_htc.ko
/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_hw.ko
```

再一步，加载模块：

```
# modprobe ath9k
```

就是这样。无启动，没烦恼。

这里还有一个示例，向您展示如何使用已经崩溃的运行模块。曾经有一段时间，我使用罗技网络摄像头和一个特定的软件会使摄像头在下次系统启动前无法被任何其他程序访问。有时我需要在不同的应用程序中打开相机，但没有时间关机重新启动。（我运行了很多应用程序，在引导之后将它们全部准备好需要一些时间。）

由于这个模块可能是运行的，所以使用 `lsmod` 来搜索 video 这个词应该给我一个关于相关模块名称的提示。 实际上，它比提示更好：用 video 这个词描述的唯一模块是 uvcvideo（如下所示）：

```
$ lsmod | grep video
uvcvideo               90112  0
videobuf2_vmalloc      16384  1 uvcvideo
videobuf2_v4l2         28672  1 uvcvideo
videobuf2_core         36864  2 uvcvideo,videobuf2_v4l2
videodev              176128  4 uvcvideo,v4l2_common,videobuf2_core,videobuf2_v4l2
media                  24576  2 uvcvideo,videodev
```

有可能是我自己的操作导致了崩溃，我想我可以挖掘更深一点，看看我能否以正确的方式解决问题。但结果你知道的；有时你不关心理论，只想让设备工作。 所以我用 `rmmod` 杀死了 `uvcvideo` 模块，然后用 `modprobe`  重新启动它，一切都好：

```
# rmmod uvcvideo
# modprobe uvcvideo
```

再一次：不重新启动。没有其他的后续影响。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-load-or-unload-linux-kernel-module

作者：[David Clinton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dbclinton
[1]:https://www.manning.com/books/linux-in-action?a_aid=bootstrap-it&amp;a_bid=4ca15fc9&amp;chan=opensource
[2]:/file/397906
[3]:https://opensource.com/sites/default/files/uploads/kernels.png "Kernel modules"
