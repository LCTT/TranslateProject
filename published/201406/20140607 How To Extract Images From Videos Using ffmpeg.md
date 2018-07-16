如何使用ffmpeg从视频中提取图片
================================================================================

你曾想过从一个视频文件中提取图片吗？在Linux下就可以，在这个教程中我将使用ffmpeg来从视频中获取图片。

### 什么是ffmpeg？What is ffmpeg? ###

ffmpeg是一个非常有用的命令行程序，它可以用来转码媒体文件。它是领先的多媒体框架FFmpeg的一部分，其有很多功能，比如解码、编码、转码、混流、分离、转化为流、过滤以及播放几乎所有的由人和机器创建的媒体文件。

在这个框架中包含有各种工具，每一个用于完成特定的功能。例如，ffserver能够将多媒体文件转化为用于实时广播的流，ffprobe用于分析多媒体流，ffplay可以当作一个简易的媒体播放器，**ffmpeg**则能够转换多媒体文件格式。

如果你感兴趣，以下列出的是FFmpeg框架中包含的开发者库：

- libavutil是一个包含简化编程功能的库，其中包括随机数生成器，数据结构，数学代码，核心多媒体工具等更多东西。
- libavcodec是一个包含音频/视频解码器和编码器的库。
- libavformat是一个包含了多媒体格式的分离器和混流器的库。
- libavdevice是一个包含输入输出设备的库，用于捕捉和渲染很多来自常用的多媒体输入/输出软件框架的数据，包括Video4Linux，Video4Linux2，VfW和ALSA。
- libavfilter是一个包含媒体过滤器的库。
- libswscale是一个用于执行高度优化的图像缩放和颜色空间/像素格式转换操作的库。
- libswresample是一个用于执行高度优化的音频重采样，重新矩阵和取样格式转换操作的库。

**注意**：ffmpeg和FFmpeg不是同一个东西。FFmpeg是框架，而ffmpeg是一个其中的一个功能。

### 开始行动 ###

如果你想跟着教程做，你需要在你的linux机中安装ffmpeg命令行功能。Ubuntu用户可以在终端运行以下命令轻松安装ffmpeg功能。

    sudo apt-get install ffmpeg

Fedora用户可以从源中直接安装ffmpeg。

    yum install ffmpeg

或者你可以编译源代码。在你使用源代码编译并安装它之前，你需要从官网上下载源代码，使用以下命令。

    wget http://www.ffmpeg.org/releases/ffmpeg-2.2.3.tar.bz2

用下面命令解压文档。

    tar -xvjf ffmpeg-2.2.3.tar.bz2

文档解压完成后进入解压后的目录运行以下命令。

    ./configure
    make

编译完成后运行下面的命令安装ffmpeg。

    su -c 'make install'

全部的事情并没有完成，而你将要做的所有事就是在终端键入一些命令而且将能够从任何视频文件中抓取图片。

在做之后的步骤前，确保你在想要提取图片的视频文件的目录下。使用cd命令切换到正确的目录。教程中我使用的视频在我的桌面上，我用以下命令将目录切换到我的桌面。

    cd /home/oltjano/Desktop

之后我使用以下命令从视频中提取图片。

    ffmpeg -i "你是我的小呀小苹果儿.mp4" -r 1 -q:v 2 -f image2 image-3%d.jpeg

**-i**选项用来获取输入文件，在这里是视频文件名**你是我的小呀小苹果儿.mp4**，-r选项设置每秒提取图片的帧数。我想要每秒提取一帧。

之后有一个重要的选项是-q:v，应该留意这个选项并且我很喜欢用它，它用来设置提取到的图片质量。我总是设置值为2来从视频中获取高质量图片。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/extract-images-videos-using-ffmpeg/

译者：[linuhap](https://github.com/linuhap) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
