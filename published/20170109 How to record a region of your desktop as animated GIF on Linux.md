如何在 Linux 桌面上使用 Gifine 录制 GIF 动画？
============================================================

不用我说，你也知道 GIF 动画在过去几年发展迅速。人们经常在线上文字交流时使用动画增添趣味，同时这些动画在很多其他地方也显得非常有用。

在技术领域使用动画能够很快的描述出现的问题或者返回的错误。它也能很好的展现出一个软件应用产品的特性。你可以在进行线上座谈会或者在进行公司展示时使用 GIF 动画，当然，你可以在更多的地方用到它。

现在，假设你的电脑桌面上打开了多个应用程序，或者无论出于什么目的，你想制作一个 GIF 动画来记录桌面上一个应用程序窗口的操作过程。你应该怎么做呢？显然，你需要一个工具来完成这件事。

如果你正在寻找了这样一个可以记录桌面上部分区域的工具，并且它可以自动把录屏转化成 GIF 动画； 现在，本教程会介绍一个 Linux 命令行工具来实现你的需求。

开始之前，你必须知道在本教程中所有的例子都是在 Ubuntu 14.04 上测试过的，它的 Bash 版本是 4.3.11(1) 。

### Gifine

这个工具的主页是 [Gifine][5] 。它基于 GTK 工具包，是用 MoonScript 使用 lgi 库编写的。Gifine 不仅能够录屏、创建动画或视频，而且能够用它来把几个小型动画或视频拼接在一起。

引述这个工具的开发者的话：“你可以加载一个视频帧的目录或者选择一个桌面的区域进行录屏。你加载了一些视频帧后，可以连续查看它们，并裁剪掉不需要的部分。最终完成录屏后可以导出为 gif 或者 mp4 文件。” 

### Gifine 下载/安装/配置

在指引你下载和安装 Gifine 之前，应该指出安装这个工具时需要安装的依赖包。

首先需要安装的依赖包是 FFmpeg , 这个软件包是一种记录、转化和流化音频以及视频的跨平台解决方案。使用下列命令安装这个工具;

```
sudo apt-get install ffmpeg
```

接下来是图像处理系统 GraphicsMagick。这个工具的官网说：“它提供了一个稳健且高效的工具和库的集合，支持读写并且可以操作超过 88 种主要的图像格式，比如：DPX、 GIF、 JPEG、 JPEG-2000、 PNG、 PDF、 PNM 以及 TIFF 等。”

通过下面的命令安装：

```
sudo apt-get install graphicsmagick
```

接下来的需要的工具是 XrectSel 。在你移动鼠标选择区域的时候，它会显示矩形区域的坐标位置。我们只能通过源码安装 XrectSel ，你可以从 [这里][6] 下载它。

如果你下载了源码，接下来就可以解压下载的文件，进入解压后的目录中。然后，运行下列命令：

```
./bootstrap
```

如果 `configure` 文件不存在，就需要使用上面的命令

```
./configure --prefix /usr

make

make DESTDIR="$directory" install
```

最后的依赖包是  Gifsicle 。这是一个命令行工具，可以创建、编辑、查看 GIF 图像和动画的属性信息。下载和安装 Gifsicle 相当容易，你只需要运行下列命令：

```
sudo apt-get install gifsicle
```

这些是所有的依赖包。现在，我们开始安装 Gifine 。使用下面的命令完成安装。

```
sudo apt-get install luarocks

sudo luarocks install --server=http://luarocks.org/dev gifine
```

请注意第二个命令可能会返回下列错误：

```
No package 'gobject-introspection-1.0' found
```

你可以用下列命令安装这个包：
```
sudo apt-get install libgirepository1.0-dev
```
然后，再一次运行 'luarocks install' 命令。

### Gifine 使用

完成安装之后可以使用下面的命令运行这个工具：

```
gifine
```

这个应用程序的 UI 是这样的：
[
 ![Gifine UI](https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/gifine-ui.png) 
][7]

这里你可以进行两种操作：录视频帧或者加载视频帧。如果你单击了录制矩形区域（Record rectange）按钮，你的鼠标指针处会变成一个 `+` ，这样便可以在你的屏幕上选择一个矩形区域。一旦你选择了一个区域，录屏就开始了，录制矩形区域（Record rectange）按钮就会变成停止录制（Stop recording）按钮。

[
 ![Gifine screen recording](https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/gifine-stop-rec.png) 
][8]

单击停止录制（Stop recording）完成录屏，会在 Gifine 窗口出现一些按钮。

[
 ![Gifine preview](https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/gifine-post-rec.png) 
][9]

用户界面的上半部分显示已经录制的视频帧，你可以使用它下面的滑块进行逐帧浏览。如果你想要删除第 5 帧之前或第 50 帧之后的所有帧数，你可以使用裁剪左边（Trim left of） 和裁剪右边（Trim rigth of）按钮进行裁剪。也有可以删除特定帧数和减半删除帧数的按钮，当然，你可以重置所有的裁剪操作。

完成了所有的裁剪后，可以使用保存 GIF（Save GIF...） 或保存 MP4（Save MP4...） 按钮将录屏保存为动画或者视频；你会看到可以设置帧延迟、帧率以及循环次数的选项。

记住，“录屏帧不会自动清除。如果你想重新加载，可以在初始屏幕中使用加载目录（load directory）按钮在 '/tmp' 目录中找到它们。“

### 总结

Gifine 的学习曲线并不陡峭 —— 所有的功能都会以按钮、文本的形式体现出来。

对我来说，最大的问题是安装 —— 需要一个个安装它的依赖包，还要处理可能出现的错误，这会困扰很多人。否则，从整体上看，Gifine 绝对称得上是一个不错的工具，如果你正在寻找这样的工具，不妨一试。

已经是 Gifine 用户？到目前为止你得到了什么经验？在评论区告诉我们。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/

作者：[Ansh][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/
[1]:https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/#gifine
[2]:https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/#gifine-downloadinstallationsetup
[3]:https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/#gifine-usage
[4]:https://www.howtoforge.com/tutorial/record-screen-to-animated-gif-on-linux/#conclusion
[5]:https://github.com/leafo/gifine
[6]:https://github.com/lolilolicon/xrectsel
[7]:https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/big/gifine-ui.png
[8]:https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/big/gifine-stop-rec.png
[9]:https://www.howtoforge.com/images/record-screen-to-animated-gif-on-linux/big/gifine-post-rec.png
