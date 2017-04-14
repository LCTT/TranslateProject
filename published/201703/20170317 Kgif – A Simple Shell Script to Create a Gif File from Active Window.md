Kgif：一个从活动窗口创建 GIF 的简单脚本
============================================================

[Kgif][2] 是一个简单的 shell 脚本，它可以从活动窗口创建一个 GIF 文件。我觉得这个程序专门是为捕获终端活动设计的，我经常用于这个。

它将窗口的活动捕获为一系列的 PNG 图片，然后组合在一起创建一个GIF 动画。脚本以 0.5 秒的间隔截取活动窗口。如果你觉得这不符合你的要求，你可以根据你的需要修改脚本。

最初它是为了捕获 tty 输出以及创建 github 项目的预览图创建的。

确保你在运行 Kgif 之前已经安装了 scrot 和 ImageMagick 软件包。

推荐阅读：[Peek - 在 Linux 中创建一个 GIF 动画录像机][3]。

什么是 ImageMagick？ImageMagick 是一个命令行工具，用于图像转换和编辑。它支持所有类型的图片格式（超过 200 种），如 PNG、JPEG、JPEG-2000、GIF、TIFF、DPX、EXR、WebP、Postscript、PDF 和 SVG。

什么是 Scrot？Scrot 代表 SCReenshOT，它是一个开源的命令行工具，用于捕获桌面、终端或特定窗口的屏幕截图。

#### 安装依赖

Kgif 需要 scrot 以及 ImageMagick。

对于基于 Debian 的系统：

```
$ sudo apt-get install scrot imagemagick
```

对于基于 RHEL/CentOS 的系统：

```
$ sudo yum install scrot ImageMagick
```

对于 Fedora 系统：

```
$ sudo dnf install scrot ImageMagick
```

对于 openSUSE 系统：

```
$ sudo zypper install scrot ImageMagick
```

对于基于 Arch Linux 的系统：

```
$ sudo pacman -S scrot ImageMagick
```

#### 安装 Kgif 及使用

安装 Kgif 并不困难，因为不需要安装。只需从开发者的 github 页面克隆源文件，你就可以运行 `kgif.sh` 文件来捕获活动窗口了。默认情况下它的延迟为 1 秒，你可以用 `--delay` 选项来修改延迟。最后，按下 `Ctrl + c` 来停止捕获。

```
$ git clone https://github.com/luminousmen/Kgif
$ cd Kgif
$ ./kgif.sh
Setting delay to 1 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

检查系统中是否已存在依赖。

```
$ ./kgif.sh --check
OK: found scrot
OK: found imagemagick
```

设置在 N 秒延迟后开始捕获。

```
$ ./kgif.sh --delay=5

Setting delay to 5 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

它会将文件保存为 `terminal.gif`，并且每次在生成新文件时都会覆盖。因此，我建议你添加 `--filename` 选项将文件保存为不同的文件名。

```
$ ./kgif.sh --delay=5 --filename=2g-test.gif

Setting delay to 5 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

使用 `--noclean` 选项保留 png 截图。

```
$ ./kgif.sh --delay=5 --noclean
```

要了解更多的选项：

```
$ ./kgif.sh --help

usage: ./kgif.sh [--delay] [--filename ] [--gifdelay] [--noclean] [--check] [-h]
  -h, --help                   Show this help, exit
      --check                  Check if all dependencies are installed, exit
      --delay=            Set delay in seconds to specify how long script will wait until start capturing.
      --gifdelay=         Set delay in seconds to specify how fast images appears in gif.
      --filename=   Set file name for output gif.
      --noclean                Set if you don't want to delete source *.png screenshots.
```

默认捕获输出。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test.gif) 
][4]

我感觉默认的捕获非常快，接着我做了一些修改并得到了合适的输出。
[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test-delay-modified.gif) 
][5]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/author/magesh/
[2]:https://github.com/luminousmen/Kgif
[3]:http://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[4]:http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test.gif
[5]:http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test-delay-modified.gif
