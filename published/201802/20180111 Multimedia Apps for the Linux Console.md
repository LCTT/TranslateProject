Linux 终端下的多媒体应用
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/multimedia.jpg?itok=v-XrnKRB)

> Linux 终端是支持多媒体的，所以你可以在终端里听音乐，看电影，看图片，甚至是阅读 PDF。

在我的上一篇文章里，我们了解到 Linux 终端是可以支持多媒体的。是的，这是真的！你可以使用 Mplayer、fbi 和 fbgs 来实现不打开 X 会话就听音乐、看电影、看照片，甚至阅读 PDF。此外，你还可以通过 CMatrix 来体验黑客帝国（Matrix）风格的屏幕保护。

不过你可能需要对系统进行一些修改才能达到前面这些目的。下文的操作都是在 Ubuntu 16.04 上进行的。

### MPlayer

你可能会比较熟悉功能丰富的 MPlayer。它支持几乎所有格式的视频与音频，并且能在绝大部分现有的平台上运行，像 Linux、Android、Windows、Mac、Kindle、OS/2 甚至是 AmigaOS。不过，要在你的终端运行 MPlayer 可能需要多做一点工作，这些工作与你使用的 Linux 发行版有关。来，我们先试着播放一个视频：

```
$ mplayer [视频文件名]
```

如果上面的命令正常执行了，那么很好，接下来你可以把时间放在了解 MPlayer 的常用选项上了，譬如设定视频大小等。但是，有些 Linux 发行版在对<ruby>帧缓冲<rt>framebuffer</rt></ruby>的处理方式上与早期的不同，那么你就需要进行一些额外的设置才能让其正常工作了。下面是在最近的 Ubuntu 发行版上需要做的一些操作。

首先，将你自己添加到 `video` 用户组。

其次，确认 `/etc/modprobe.d/blacklist-framebuffer.conf` 文件中包含这样一行：`#blacklist vesafb`。这一行应该默认被注释掉了，如果不是的话，那就手动把它注释掉。此外的其他模块行需要确认没有被注释，这样设置才能保证其他那些模块不会被载入。注：如果你想要更深入的利用<ruby>帧缓冲<rt>framebuffer</rt></ruby>，这些针对你的显卡的模块可以使你获得更好的性能。

然后，在 `/etc/initramfs-tools/modules` 的结尾增加两个模块：`vesafb` 和 `fbcon`，并且更新 iniramfs 镜像：

```
$ sudo nano /etc/initramfs-tools/modules
 # List of modules that you want to include in your initramfs.
 # They will be loaded at boot time in the order below.
 fbcon
 vesafb

$ sudo update-initramfs -u
```

[fbcon][1] 是 Linux <ruby>帧缓冲<rt>framebuffer</rt></ruby>终端，它运行在<ruby>帧缓冲<rt>framebuffer</rt></ruby>之上并为其增加图形功能。而它需要一个<ruby>帧缓冲<rt>framebuffer</rt></ruby>设备，这则是由 `vesafb` 模块来提供的。

接下来，你需要修改你的 GRUB2 配置。在 `/etc/default/grub` 中你将会看到类似下面的一行：

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

它也可能还会有一些别的参数，不用管它，在其后加上 `vga=789`：

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash vga=789"
```

重启之后进入你的终端（`Ctrl+Alt+F1`）（LCTT 译注：在某些发行版中 `Ctrl+Alt+F1` 默认为图形界面，可以尝试 `Ctrl+Alt+F2`），然后就可以尝试播放一个视频了。下面的命令指定了 `fbdev2` 为视频输出设备，虽然我还没弄明白如何去选择用哪个输入设备，但是我用它成功过。默认的视频大小是 320x240，在此我给缩放到了 960：

```
$ mplayer -vo fbdev2 -vf scale -zoom -xy 960 AlienSong_mp4.mov
```

来看图 1。粗糙的画面是由于我原视频的质量不高，而不是 MPlayer 的显示问题。

![图 1 播放视频](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-1_3.jpg?itok=PtSoKepn)

MPlayer 可以播放 CD、DVD 以及网络视频流，并且还有一系列的回放选项，这些将作为作业留给大家自己去发现。

### fbi 图片查看器

`fbi` 是一个帧缓冲图片查看器。在大部分的 Linux 发行版中，它被包含在 [fbida][2] 包里。它原生支持一些常见的图片格式，而如果你安装了 `convert`（来自于 Image Magick），那么它还能借此打开一些其他格式。最简单的用法是用来查看一个图片文件：

```
$ fbi 文件名
```

你可以使用方向键来在大图片中移动视野，使用 `+` 和 `-` 来缩放，或者使用 `r` 或 `l` 来向右或向左旋转 90 度。`Escape` 键则可以关闭查看的图片。此外，你还可以给 `fbi` 一个文件列表来实现幻灯播放：

```
$ fbi --list 文件列表.txt
```

`fbi` 还支持自动缩放。还可以使用 `-a` 选项来控制缩放比例。`--autoup` 和 `--autodown` 则是用于告知 `fbi` 只进行放大或者缩小。要调整图片切换时淡入淡出的时间则可以使用 `--blend [时间]` 来指定一个以毫秒为单位的时间长度。使用 `k` 和 `j` 键则可以切换文件列表中的上一张或下一张图片。

`fbi` 还提供了命令来为你浏览过的文件创建文件列表，或者将你的命令导出到文件中，以及一系列其它很棒的选项。你可以通过 `man fbi` 来查阅完整的选项列表。

### CMatrix 终端屏保

<ruby>黑客帝国<rt>The Matrix</rt></ruby>屏保仍然是我非常喜欢的屏保之一（如图 2），仅次于<ruby>弹跳牛<rt>bouncing cow</rt></ruby>。[CMatrix][3] 可以在终端运行。要运行它只需输入 `cmatrix`，然后可以用 `Ctrl+C` 来停止运行。执行 `cmatrix -s` 则会启动屏保模式，这样的话，按任意键都会直接退出。`-C` 参数可以设定颜色，譬如绿色（`green`）、红色（`red`）、蓝色（`blue`）、黄色（`yellow`）、白色（`white`）、紫色（`magenta`）、青色（`cyan`）或者黑色（`black`）。

![图 2 黑客帝国屏保](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-2_0.jpg?itok=E3f26R7w)

CMatrix 还支持异步按键，这意味着你可以在它运行的时候改变设置选项。

`-B` 设置全部使用粗体，而 `-b`（LCTT 译注：原文误为 `-B`）则可以设置部分字体加粗。

### fbgs PDF 阅读器

看起来，PDF 文档是普遍流行且无法避免的，而且 PDF 比它之前的功能好了很多，譬如超链接、复制粘贴以及更好的文本搜索功能等。`fbgs` 是 `fbida` 包中提供的一个 PDF 阅读器。它可以设置页面大小、分辨率、指定页码以及绝大部分 `fbi` 所提供的选项，当然除了一些在 `man fbgs` 中列举出来的不可用选项。我主要用到的选项是页面大小，你可以选择 `-l`、`xl` 或者 `xxl`：

```
$ fbgs -xl annoyingpdf.pdf
```

欢迎通过 Linux 基金会与 edX 免费提供的[“Linux 入门”][4]课程学习更多 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/multimedia-apps-linux-console

作者：[Carla Schroder][a]
译者：[Yinr](https://github.com/Yinr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.mjmwired.net/kernel/Documentation/fb/fbcon.txt
[2]:https://www.kraxel.org/blog/linux/fbida/
[3]:http://www.asty.org/cmatrix/
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
