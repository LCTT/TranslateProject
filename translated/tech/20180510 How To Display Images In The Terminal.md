如何在终端中显示图片
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/fim-2-720x340.png)

Linux 上有许多 GUI 图片浏览器。但我尚未听说或使用过任何在终端中显示图片的应用程序。幸运的是，我刚刚发现了一个可用于在终端中显示图像的名叫 **FIM** 的图像查看器。FIM 引起了我的注意，是因为与大多数 GUI 图片浏览器相比，它非常轻巧。毫不迟疑，让我们来看看它能做什么。

### 使用 FIM 在终端中显示图像

**FIM** 意即 **F**bi **IM**proved。对于那些不知道的人，**Fbi** 是指 Linux 中的 **f**rame **b**uffer **i**mageviewer。它使用系统的帧缓冲器直接从命令行显示图像。默认情况下，它能用终端显示 bmp、gif、jpeg、PhotoCD、png、ppm、tiff 和 xwd。对于其他格式，它会尝试使用 ImageMagick 的转换。

FIM 基于 Fbi，它是一款高度可高度定制及脚本化的图像浏览器，非常适合使用 Vim 文本编辑器或 Mutt 等软件的用户。它会以全屏显示图像，并可通过键盘快捷键控制（如调整大小、翻转、缩放）。与 Fbi 不同的是，FIM 是通用的：它可以打开许多文件格式，并且可以在以下视频模式下显示图片：

* 使用 Linux framebuffer 设备，以图形方式呈现
* 在 X / Xorg 下，使用 SDL 库，以图形方式呈现
* 在 X / Xorg 下，使用 Imlib2 库，以图形方式呈现。
* 在任何文本控制台中使用 AAlib 库呈现为 ASCII 字符画

FIM 是完全免费且开源的。

### 安装 FIM

基于 DEB 的系统，如 Ubuntu、Linux Mint， 可从默认的仓库中获取 FIM 图像查看器。因此，你可以使用如下命令安装fbi：

```
$ sudo apt-get install fim
```

如果它在你使用的 Linux 发行版的仓库中不包含 FIM，则可以下载源代码进行编译和安装，如下所示。

```
wget http://download.savannah.nongnu.org/releases/fbi-improved/fim-0.6-trunk.tar.gz
wget http://download.savannah.nongnu.org/releases/fbi-improved/fim-0.6-trunk.tar.gz.sig
gpg --search 'dezperado autistici org'
＃按照屏幕上的说明，从密钥服务器导入密钥
gpg --verify fim-0.6-trunk.tar.gz.sig
```

```
tar xzf fim-0.6-trunk.tar.gz
cd fim-0.6-trunk
./configure --help=short
＃阅读./configure --help=short 的输出：你可以在 ./configure 中添加选项
./configure
make
su -c“make install”
```

### FIM用法

安装完成后，您可以使用以下命令以“自动缩放”显示的图像：

```
$ fim -a dog.jpg
```

这里是我的 Ubuntu 主机的示例输出。

![][1]

正如你在上面的屏幕截图中看到的，FIM 没有使用任何外部 GUI 图片浏览器。相反，它使用我们系统的帧缓冲器来显示图像。

如果当前目录中有多个 .jpg 文件，可以使用通配符打开所有文件，如下所示。

```
$ fim -a * .jpg
```

要打开目录中的所有图像，例如 `Pictures`，请运行：

```
$ fim Pictures/
```

我们也可以在文件夹及其子文件夹中递归地打开图像，然后像下面那样对列表进行排序。

```
$ fim -R Pictures/ --sort
```

要以 ASCII 格式渲染图像，可以使用 `-t` 标志。

```
$ fim -t dog.jpg
```

要退出 Fim，请按 `ESC` 或 `q`。

#### 键盘快捷键

您可以使用各种键盘快捷键来管理图像。例如，要加载下一张图像和之前的图像，请按下 `PgUp` / `PgDown` 键。成倍放大或缩小，请使用 `+` / `-` 键。以下是用于在FIM中控制图像的常用按键。

* `PageUp` / `Down`：上一张/下一张图片
* `+` / `-` ：放大/缩小
* `a`：自动缩放
* `w`：自适应宽度
* `h`：自适应高度
* `j` / `k`：平移/向上
* `f` / `m`：翻转/镜像
* `r` / `R`：旋转（顺时针/逆时针）
* `ESC` / `q`：退出

有关完整详细信息，请参阅手册页。

```
$ man fim
```

那么，就是这样。希望这对你有所帮助。后续还会介绍更多的优秀工具。敬请关注！

干杯!

-------------------------------------------------- ------------------------------

via: https://www.ostechnix.com/how-to-display-images-in-the-terminal/

作者：[SK] [A]
选题：[lujun9972](https://github.com/lujun9972)
译者：[KevinSJ](https://github.com/KevinSJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/wp-content/uploads/2018/05/fim-1.png
