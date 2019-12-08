[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11635-1.html)
[#]: subject: (6 signs you might be a Linux user)
[#]: via: (https://opensource.com/article/19/10/signs-linux-user)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 资深用户的 6 大特征
======

> 如果你是 Linux 资深用户，则可能会有这些共同倾向。

![](https://img.linux.net.cn/data/attachment/album/201912/02/093348ek4jcyvj4wahytwq.jpg)

Linux 用户千差万别，但是我们许多人都有一些相同的习惯。你可能没有本文列出的任何特征，而且如果你是个 Linux 新用户，你可能还不能理解这些特征……

下面是你可能是 Linux 用户的六个特征。

### 1、理所当然，纪元始于 1970 年 1 月 1 日

关于 Unix 计算机时钟为何在重置时总是将其设置回 1970-01-01 的传闻有很多。但有点令人感到乏味的事实是，Unix “纪元”是用于同步的通用且简单的参考点。例如，万圣节在儒略历中是今年的 304 日，但我们通常将该节日称为 “31 号”。我们知道指的是哪个月的 31 号，因为我们有个共同的参考点：我们知道万圣节在 10 月庆祝，而 10 月是一年中的第十个月，并且我们知道前面每一个月包含多少天。没有这些值，虽然我们可以使用传统的计时方法（如月相）来跟踪特殊的季节性事件，但是计算机显然不具备这种能力。

计算机需要确定且明确定义的值，因此将值 `1970-01-01T00:00:00Z` 选择为 Unix 纪元的开始。每当 [POSIX][2] 计算机的时间不准确时，诸如网络时间协议（NTP）之类的服务就可以向其提供自 `1970-01-01T00:00:00Z` 以来的秒数，计算机可以将其转换为人类易于识别的日期。

日期和时间是在计算中要追踪的著名的复杂事物，主要是因为几乎所有标准都有例外。一个月并不总是有 30 天，一年也不总是有 365 天，甚至每年有多少秒钟也往往会有所不同。如果你正在寻找一个有趣而令人沮丧的编程练习，那么请尝试编程一个可靠的日历应用程序！

### 2、输入超过两个字母你就会觉得麻烦

众所周知，最常见的 Unix 命令都超简短。除了 `cd`、`ls` 和 `mv` 之类的命令外，还有一个命令简直不能再短了：`w`（它根据 `/var/run/utmp` 文件显示当前谁登录了）。

一方面，极短的命令似乎很不直观。新用户可能不会猜测到键入 `ls` 会<ruby>列出<rt>list</rt></ruby>目录。但是，一旦学习命令，它们肯定是越短越好。如果你整天都在终端上度过，那么你键入的击键次数越少就意味着你可以有更多的时间来完成工作。

幸运的是，单字母命令并不太多，因此你可以使用大多数字母作为别名。例如，我经常使用 Emacs，以至于我觉得 `emacs` 的输入时间太长，因此通过将下面这行添加到 `.bashrc` 文件中，将其别名为 `e`：

```
alias e='emacs'
```

你也可以临时为命令添加别名。例如，如果你在解决网络问题时发现自己反复运行 [firewall-cmd][3]，则可以为当前会话创建别名：

```
$ alias f='firewall-cmd'
$ f
usage: see firewall-cmd man page
No option specified.
```

只要你打开着终端，你的别名就会一直存在。当终端一旦关闭，它便会被遗忘。

### 3、做任何事都不应该单击两次以上

Linux 用户喜欢效率。尽管并非每个 Linux 用户都总是急于完成工作，但 Linux 桌面中有一些旨在减少完成任务所需的操作数量的惯例。这里有些例子。

* 在 KDE 文件管理器 Dolphin 中，单击即可打开文件或目录。假定如果要选择一个文件，则可以单击并拖动，也可以 `Ctrl + 点击`。这可能会使习惯于双击所有内容的用户感到困惑，但是一旦你尝试了单击操作，通常就无法返回费力的双击操作。
* 在大多数 Linux 桌面上，单击鼠标中键可粘贴剪贴板的最新内容。
* 在许多 Linux 桌面上，可以通过按 `Alt`、`Ctrl` 或 `Shift` 键来修改拖动动作。例如，`Alt + 拖动` 在 KDE 中移动窗口，而 GNOME 中的 `Ctrl + 拖动` 会复制文件而不是移动。

### 4、任何操作你都不会执行三次以上，因为第三次时你已经将它自动化了

请原谅我有点夸张，但是许多 Linux 用户期望他们的计算机比他们更努力地工作。虽然学习如何自动执行常见任务需要花费时间，但在 Linux 上它往往比在其它平台上更容易，因为 Linux 终端和 Linux 操作系统是如此紧密地集成在一起。最容易自动化的是你在终端中已经执行的操作，因为命令只是你在解释器中键入的字符串，而该解释器（终端）不会在乎你是手动键入字符串还是将其指向一个脚本。

例如，如果你发现自己经常将一组文件从一个位置移动到另一个位置，则或许可以将相同的指令序列用作一个脚本，你可以使用单个命令来触发该脚本。假设你每天早上手动执行此操作：

```
$ cd Documents
$ trash reports-latest.txt
$ wget myserver.local/reports/daily/report-latest.txt
$ cp report-latest.txt reports_daily/2019-31-10.log
```

这是一个简单的序列，但是每天重复一次并不是消磨时间的最有效方法。做一点点抽象，你可以使用一个简单的脚本将其自动化：

```
#!/bin/sh

trash $HOME/Documents/reports-latest.txt

wget myserver.local/reports/daily/report-latest.txt \
  -P $HOME/Documents/udpates_daily/`date --iso-8601`.log

cp $HOME/Documents/udpates_daily/`date --iso-8601`.log \
  $HOME/Documents/reports-latest.txt
```

你可以把你的脚本叫做 `get-reports.sh` 并在每天早晨手动启动它，或者甚至可以将其输入到 crontab 中，以便计算机可以执行此任务而无需你进行任何干预。

对于新用户来说，这可能会有点困扰，因为什么和什么是一体的并不总是很明显。例如，如果你经常发现自己打开图像并将其按比例缩小 50％，那么你可能习惯于执行以下操作：

1. 打开你的照片查看器或编辑器
2. 缩放图像
3. 将图像导出为修改后的文件
4. 关闭应用程序

如果你一天要做几次，你可能会对这种重复感到厌倦。但是，由于你是在图形用户界面（GUI）中执行这些操作的，因此你需要知道如何对 GUI 编写脚本以使其自动化。某些应用程序，例如 [GIMP][4]，具有丰富的脚本接口，但是其过程显然不同于仅修改一堆命令并将其存储到文件中那么简单。

再说一次，有时在命令行中有与你在 GUI 中所做的等效的操作。将文档从一种文本格式转换为另一种格式可以使用 [Pandoc][5]，处理图像可以使用 [Image Magick][6]，音乐和视频也可以通过命令行进行编辑和转换，等等。最大的问题是你需要知道要查找什么，通常是学习新的（有时是复杂的）命令。但是，在终端中按比例缩小图像比在 GUI 中显然更简单：

```
#!/bin/sh

convert "${1}" -scale 50% `basename "${1}" .jpg`_50.jpg
```

这些麻烦、重复的任务值得研究。你永远不知道你的工作让计算机做起来是有多么的简单和快捷！

### 5、发行版之间跳来跳去

我在家里是一个热情的 Slackware 用户，而在工作时是一个 RHEL 用户。实际上，这不是事实，我现在在工作时是 Fedora 用户。除了有时候我使用 CentOS，偶尔我还会运行 [Mageia][7]。

![Debian on a PowerPC64 box, image CC BY SA Claudio Miranda][8]

*运行在 PowerPC64 机器上的 Debian*

发行版好不好无关紧要，成为 Linux 用户的极致乐趣之一是可以自由决定运行哪个发行版。乍一看，它们基本相同，令人耳目一新。但是根据你的心情，你可能更喜欢 CentOS 的稳定性而不是 Fedora 的不断更新，或者你可能有一天会真正享受 Mageia 的集中控制中心，然后又对原始的 [Debian][9] 配置文件进行模块化乐在其中，而有时你又会完全转向其他操作系统。

![OpenBSD, image CC BY SA Claudio Miranda][10]

*OpenBSD，不是 Linux 发行版*

关键是，Linux 发行版是激情项目，成为其他人的开源激情的一部分很有趣。

### 6、你对开源充满热情

无论你的经验如何，如果你是 Linux 用户，那么你无疑会对开源充满热情。无论你是每天通过[共创艺术品] [11]还是代码来表达你的热情，还是将其升华到只在自由而自在的环境中完成工作，你都生活并构筑于开源之上。因为有了千千万万个你，所以有了开源社区，社区因你而变得更加丰富。

有太多的东西我没有提到。作为 Linux 用户，还有什么可以出卖你的身份？让我们在评论中知道！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/signs-linux-user

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY (Tux with binary code background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://www.gimp.org/
[5]: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc
[6]: https://opensource.com/article/17/8/imagemagick
[7]: http://mageia.org
[8]: https://opensource.com/sites/default/files/uploads/debian.png (Debian on a PowerPC64 box)
[9]: http://debian.org
[10]: https://opensource.com/sites/default/files/uploads/openbsd.jpg (OpenBSD)
[11]: http://freesvg.org
