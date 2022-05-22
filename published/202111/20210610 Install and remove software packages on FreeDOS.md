[#]: subject: (Install and remove software packages on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/freedos-package-manager)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14031-1.html)

在 FreeDOS 上安装和移除软件包
======

> 熟悉 FreeDOS 软件包管理器 FDIMPLES 。

![](https://img.linux.net.cn/data/attachment/album/202111/29/122823yhv0mg03v3mhr0cc.jpg)

在 Linux 上，你可能已经使用过 “软件包管理器” 来安装或移除软件包。例如，在 Debian Linux 上的默认软件包管理器是 `deb` 命令，在 Fedora Linux 上的默认软件包管理器是 `dnf` 命令。 但是你知道 FreeDOS 也有一个软件包管理器吗？

### 安装软件包

FreeDOS 1.3 RC4 发行版包含了很多极好的你可以使用的程序和应用程序。不过，我们不会默认安装其中的全部的程序 —— 我们不想过度地填充你的硬盘驱动器空间，尤其是在一个较老的系统上，可能仅有几百兆字节容量的硬盘驱动器。当你安装 FreeDOS 时，如果你选择 “Plain DOS system” 选项，你将发现你的 FreeDOS 系统是非常小的（大约 20 MB 大小）。

不过，要安装新的软件包很容易。在命令行中运行 `FDIMPLES` 程序。因为 DOS 是 _不区分大小写_ 的，所以，你可以使用大写字母或小写字母来输入这个命令： `fdimples` 。（`fdimples` 与 `FDIMPLES` 或 `FDImples` 等同）

![fdimples][2]

*在 FreeDOS 1.3 RC4 上的 FDIMPLES 软件包管理器（运行在 QEMU 之中）（Jim Hall, [CC-BY SA 4.0][3]）*

FDIMPLES 是 "**F**ree**D**OS **I**nstaller - **M**y **P**ackage **L**ist **E**ditor **S**oftware" 的首字母缩略词，是一个交互式软件包管理器。FDIMPLES 读取安装介质来识别可以安装或移除的软件包。如果你看到一个不同的菜单，它显示 “Installed!” ，但是，不让你安装其它的软件的话，请检查你系统中是否有 FreeDOS 的 CD-ROM 的安装介质。在物理机器上，你将需要将 CD-ROM 插入 CD-ROM 驱动器；在诸如 QEMU 或 VirtualBox 之类的虚拟机器上，你需要将安装 FreeDOS 的 CD-ROM 的安装介质与虚拟机器关联在一起。

![fdimples installed][4]

*如果你仅看到一条 “Installed!” 的信息，检查 CD-ROM 是否已经加载（Jim Hall, [CC-BY SA 4.0][3]）*

让我们假设你想安装一些可以让你听音乐文件或其它声音文件的软件。使用向上箭头和向下箭头按键来导航到菜单中的 **声音工具** 项。这是一个针对声音和音乐程序的 _软件包组_ 。

![fdimples sound][5]

*在 FDIMPLES 中突出显示声音软件包组（Jim Hall, [CC-BY SA 4.0][3]）*

要选择这个组中的所有软件包，在你的键盘上按下空格键。如果你决定安装这个组中的某个软件包，按下 `Tab` 按键来移动到 _软件包列表_ 方框面板，接下来使用空格键来选择每个软件包。

![fdimples sound select][6]

*通过按下空格键来选择一个组中的所有的软件包（Jim Hall, [CC-BY SA 4.0][3]）*

你可以继续选择你想要安装的其它的软件包或软件包组。当你选择好一切的东西后，使用 “Tab” 按键来高亮显示 “OK” 按键，并按下空格键按键。

![fdimples sound select ok][7]

*当你准备好安装时，突出显示 “Ok” 按钮（Jim Hall, [CC-BY SA 4.0][3]）*

`FDIMPLES` 接下来会安装你所选择的所有的软件包。如果你仅选择几个小型的软件包，这可能只需要花费片刻的时间，或者，如果你要求安装很多大型的软件包，它可能会花费数分钟的时间。当 `FDIMPLES` 安装每个软件包时，`FDIMPLES` 会输出安装状态。在安装完后，`FDIMPLES` 退出到命令行之中，以便你可以回去继续工作。

![fdimples sound install done][8]

*当 FDIMPLES 安装软件包时，FDIMPLES 会显示安装过程，并在完成安装后自动地退出（Jim Hall, [CC-BY SA 4.0][3]）*

### 移除软件包

如果你安装了一个软件包，但是后来发现你不想要它了怎么办？在 `FDIMPLES` 中移除软件包也同样容易。

就像安装软件包一样，启动 `FDIMPLES` ，使用箭头键导航到包含你想要移除的软件包的组。例如，如果我想卸载一些我先前安装的音乐播放器软件包，我将导航到 “Sound Tools” 软件包组。

![fdimples sound select][9]

*导航到你想要移除的软件包组（Jim Hall, [CC-BY SA 4.0][3]）*

为一次移除整个软件包组，你可以在你想要移除的软件包组上按下空格键来取消选择它们。但是，在这里让我们假设我只是想移除几个我不需要的软件包，像音频 CD 播放器 “CDP”。（我没有任何的真实的音乐 CD 光盘）。为移除 CDP ，敲击 `Tab` 按键来移动到软件包列表方框面板，接下来使用空格键来取消选择 CDP 软件包。这会在该软件包上移除 “X” 标志。

![fdimples unselect cdp][10]

*取消选择一个软件包来移除它（Jim Hall, [CC-BY SA 4.0][3]）*

你可以继续取消选择你想要移除的其它的软件包或软件包组。当你选择一切的东西后，使用 `Tab` 按键来突出显示 “OK” 按钮，并按下空格键按键。`FDIMPLES` 将移除你取消选择的软件包，然后自动地返回到命令行之中。

![fdimples cdp removed][11]

*FDIMPLES 移除软件包，然后返回到命令行之中（Jim Hall, [CC-BY SA 4.0][3]）*

在 FreeDOS 中。我们包含很多的软件包，遍及各种各样的软件包组。使用 `FDIMPLES` 来安装你需要的软件。请随意实验！如果你决定你不想要保留一个软件包了，你可以移除它，并为其它的软件包来释放所占用的磁盘空间。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-package-manager

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH-
[2]: https://opensource.com/sites/default/files/uploads/fdimples.png
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/fdimples-installed.png 
[5]: https://opensource.com/sites/default/files/uploads/fdimples-sound.png 
[6]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select.png
[7]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select-ok.png
[8]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select-ok-install4.png
[9]: https://opensource.com/sites/default/files/uploads/fdimples-sound-select_0.png
[10]: https://opensource.com/sites/default/files/uploads/fdimples-unselect-cdp.png
[11]: https://opensource.com/sites/default/files/uploads/fdimples-unselect-cdp-removed.png