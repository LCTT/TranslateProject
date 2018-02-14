如何更改 Linux 控制台上的字体
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/font-size_0.png?itok=d97vmyYa)

我尝试尽可能的保持心灵祥和，然而总有一些事情让我意难平，比如控制台字体太小了。记住我的话，朋友，有一天你的眼睛会退化，无法再看清你编码时用的那些细小字体，到那时你就后悔莫及了。

幸好，Linux 死忠们，你可以更改控制台的字体。按照 Linux 一贯的尿性，不断变化的 Linux 环境使得这个问题变得不太简单明了，而 Linux 上也没有字体管理这么个东西，这使得我们很容易就被搞晕了。本文，我将会向你展示，我找到的更改字体的最简方法。

### Linux 控制台是个什么鬼？

首先让我们来澄清一下我们说的到底是个什么东西。当我提到 Linux 控制台，我指的是 TTY1-6，即你从图形环境用 `Ctrl-Alt-F1` 到 `F6` 切换到的虚拟终端。按下 `Ctrl+Alt+F7` 会切回图形环境。(不过这些热键已经不再通用，你的 Linux 发行版可能有不同的键映射。你的 TTY 的数量也可能不同，你图形环境会话也可能不在 `F7`。比如，Fedora 的默认图形会话是 `F2`，它只有一个额外的终端在 `F1`。) 我觉得能同时拥有 X 会话和终端会话实在是太酷了。

Linux 控制台是内核的一部分，而且并不运行在 X 会话中。它和你在没有图形环境的<ruby>无头<rt>headless</rt></ruby>服务器中用的控制台是一样的。我称呼在图形会话中的 X 终端为终端，而将控制台和 X 终端统称为终端模拟器。

但这还没完。Linux 终端从早期的 ANSI 时代开始已经经历了长久的发展，多亏了 Linux framebuffer，它现在支持 Unicode 并且对图形也有了有限的一些支持。而且出现了很多在控制台下运行的[多媒体应用][4]，这些我们在以后的文章中会提到。

### 控制台截屏

获取控制台截屏的最简单方法是让控制台跑在虚拟机内部。然后你可以在宿主系统上使用中意的截屏软件来抓取。不过借助 [fbcat][1] 和 [fbgrab][2] 你也可以直接在控制台上截屏。`fbcat` 会创建一个可移植的像素映射格式（PPM）的图像； 这是一个高度可移植的未压缩图像格式，可以在所有的操作系统上读取，当然你也可以把它转换成任何喜欢的其他格式。`fbgrab` 则是 `fbcat` 的一个封装脚本，用来生成一个 PNG 文件。很多人写过多个版本的 `fbgrab`。每个版本的选项都有限而且只能创建截取全屏。

`fbcat` 的执行需要 root 权限，而且它的输出需要重定向到文件中。你无需指定文件扩展名，只需要输入文件名就行了：

```
$ sudo fbcat > Pictures/myfile
```

在 GIMP 中裁剪后，就得到了图 1。

![](https：//www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_10.png？itok=bHOxrZk9)

*图 1 ： 裁剪后查看*

如果能在左边空白处有一点填充就好了，如果有读者知道如何实现请在留言框中告诉我。

`fbgrab` 还有一些选项，你可以通过 `man fbgrab` 来查看，这些选项包括对另一个控制台进行截屏，以及延时截屏等。在下面的例子中可以看到，`fbgrab` 截屏跟 `fbcat` 截屏类似，只是你无需明确进行输出重定性了：

```
$ sudo fbgrab Pictures/myOtherfile
```

### 查找字体

就我所知，除了查看字体存储目录 `/usr/share/consolefonts/`（Debian 等），`/lib/kbd/consolefonts/` （Fedora），`/usr/share/kbd/consolefonts` （openSUSE）外没有其他方法可以列出已安装的字体了。

### 更改字体

可读字体不是什么新概念。我们应该尊重以前的经验！可读性是很重要的。可配置性也很重要，然而现如今却不怎么看重了。

在 Debian/Ubuntu 等系统上，可以运行 `sudo dpkg-reconfigure console-setup` 来设置控制台字体，然后在控制台运行 `setupcon` 命令来让变更生效。`setupcon` 属于 `console-setup` 软件包中的一部分。若你的 Linux 发行版中不包含该工具，可以在 [openSUSE][3] 中下载到它。

你也可以直接编辑 `/etc/default/console-setup` 文件。下面这个例子中设置字体为 32 点大小的 Terminus Bold 字体，这是我的最爱，并且严格限制控制台宽度为 80 列。

```
ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
SCREEN_WIDTH="80"
```

这里的 `FONTFACE` 和 `FONTSIZE` 的值来自于字体的文件名 `TerminusBold32x16.psf.gz`。是的，你需要反转 `FONTSIZE` 中值的顺序。计算机就是这么搞笑。然后再运行 `setupcon` 来让新配置生效。可以使用 `showconsolefont` 来查看当前所用字体的所有字符集。要查看完整的选项说明请参考 `man console-setup`。

### Systemd

Systemd 与 `console-setup` 不太一样，除了字体之外，你无需安装任何东西。你只需要编辑 `/etc/vconsole.conf` 然后重启就行了。我在 Fedora 和 openSUSE 系统中安装了一些额外的大字号的 Terminus 字体包，因为默认安装的字体最大只有 16 点而我想要的是 32 点。然后将 `/etc/vconsole.conf` 的内容修改为：

```
KEYMAP="us"
FONT="ter-v32b"
```

下周我们还将学习一些更加酷的控制台小技巧，以及一些在控制台上运行的[多媒体应用][4]。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/how-change-your-linux-console-fonts

作者：[Carla Schroder][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:http://jwilk.net/software/fbcat
[2]:https://github.com/jwilk/fbcat/blob/master/fbgrab
[3]:https://software.opensuse.org/package/console-setup
[4]:https://linux.cn/article-9320-1.html