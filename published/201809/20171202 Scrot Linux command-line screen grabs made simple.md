Scrot：让你在命令行中进行截屏更加简单 
======

>  Scrot 是一个简单、灵活，并且提供了许多选项的 Linux 命令行截屏工具。 

[![Original photo by Rikki Endsley. CC BY-SA 4.0](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A)][1]


Linux 桌面上有许多用于截屏的优秀工具，比如 [Ksnapshot][1] 和 [Shutter][2] 。甚至 GNOME 桌面自带的简易截屏工具也能够很好的工作。但是，如果你很少截屏，或者你使用的 Linux 发行版没有内建截屏工具，或者你使用的是一台资源有限的老电脑，那么你该怎么办呢？

或许你可以转向命令行，使用一个叫做 [Scrot][4] 的实用工具。它能够完成简单的截屏工作，同时它所具有的一些特性也许会让你感到非常惊喜。

### 走近 Scrot

许多 Linux 发行版都会预先安装上 Scrot ，可以输入 `which scrot` 命令来查看系统中是否安装有 Scrot 。如果没有，那么可以使用你的 Linux 发行版的包管理器来安装。如果你想从源代码编译安装，那么也可以从 [GitHub][5] 上下载源代码。

如果要进行截屏，首先打开一个终端窗口，然后输入 `scrot [filename]` ，`[filename]` 是你想要保存的图片文件的名字（比如 `desktop.png`）。如果缺省了该参数，那么 scrot 会自动创建一个名字，比如 `2017-09-24-185009_1687x938_scrot.png` 。（这个名字缺乏了对图片内容的描述，这就是为什么最好在命令中指定一个名字作为参数。）

如果不带任何参数运行 Scrot，那么它将会对整个桌面进行截屏。如果不想这样，那么你也可以对屏幕中的一个小区域进行截图。

### 对单一窗口进行截屏

可以通过输入 `scrot -u [filename]` 命令来对一个窗口进行截屏。

`-u` 选项告诉 Scrot 对当前窗口进行截屏，这通常是我们正在工作的终端窗口，也许不是你想要的。

如果要对桌面上的另一个窗口进行截屏，需要输入 `scrot -s [filename]` 。

`-s` 选项可以让你做下面两件事的其中一件：

*   选择一个打开着的窗口
*   在一个窗口的周围或一片区域画一个矩形进行捕获

你也可以设置一个时延，这样让你能够有时间来选择你想要捕获的窗口。可以通过 `scrot -u -d [num] [filename]` 来设置时延。

`-d` 选项告诉 Scrot 在捕获窗口前先等待一段时间，`[num]` 是需要等待的秒数。指定为 `-d 5` （等待 5 秒）应该能够让你有足够的时间来选择窗口。

### 更多有用的选项

Scrot 还提供了许多额外的特性（绝大多数我从来没有使用过）。下面是我发现的一些有用的选项：

*   `-b` 捕获窗口的边界
*   `-t` 捕获窗口并创建一个缩略图。当你需要把截图张贴到网上的时候，这会非常有用
*   `-c` 当你同时使用了 `-d` 选项的时候，在终端中创建倒计时

如果你想了解 Scrot 的其他选项，可以在终端中输入 `man scrot` 来查看它的手册，或者[在线阅读][6]。然后开始使用 Scrot 进行截屏。

虽然 Scrot 很简单，但它的确能够工作得很好。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/taking-screen-captures-linux-command-line-scrot

作者：[Scott Nesbitt][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A
[2]:https://www.kde.org/applications/graphics/ksnapshot/
[3]:https://launchpad.net/shutter
[4]:https://github.com/dreamer/scrot
[5]:http://manpages.ubuntu.com/manpages/precise/man1/scrot.1.html
[6]:https://github.com/dreamer/scrot
