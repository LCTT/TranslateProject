Linux有问必答：如何在命令行下压缩JPEG图像
================================================================================
> **问题**: 我有许多数码照相机拍出来的照片。我想在上传到Dropbox之前，优化和压缩下JPEG图片。有没有什么简单的方法压缩JPEG图片并不损耗他们的质量？

如今拍照设备（如智能手机、数码相机）拍出来的图片分辨率越来越大。甚至3630万像素的Nikon D800已经冲入市场，并且这个趋势根本停不下来。如今的拍照设备不断地提高着照片分辨率，使得我们不得不压缩后，再上传到有储存限制、带宽限制的云。

事实上，这里有一个非常简单的方法压缩JPEG图像。一个叫“jpegoptim”命令行工具可以帮助你“无损”美化JPEG图像，让你可以压缩JPEG图片而不至于牺牲他们的质量。万一你的存储空间和带宽预算真的很少，jpegoptim也支持“有损”压缩来调整图像大小。

如果要压缩PNG图像，参考[这个指南][1]的例子。

### 安装jpegoptim ###

Ubuntu, Debian 或 Linux Mint:

    $ sudo apt-get install jpegoptim

Fedora:

    $ sudo yum install jpegoptim

CentOS/RHEL安装，先开启[EPEL库][2]，然后运行下列命令：

    $ sudo yum install jpegoptim 

### 无损压缩jpeg图像 ###

为了无损地压缩一副JPG图片，使用：

    $ jpegoptim photo.jpg 

----------

    photo.jpg 2048x1536 24bit N ICC JFIF  [OK] 882178 --> 821064 bytes (6.93%), optimized.

注意，原始图像会被压缩后图像覆盖。

如果jpegoptim不能无损美化图像，将不会覆盖它：

    $ jpegoptim -v photo.jpg 

----------

    photo.jpg 2048x1536 24bit N ICC JFIF  [OK] 821064 --> 821064 bytes (0.00%), skipped.

如果你想保护原始图片，使用"-d"参数指明保存目录

    $ jpegoptim -d ./compressed photo.jpg 

这样，压缩的图片将会保存在./compressed目录（以同样的输入文件名）

如果你想要保护文件的创建修改时间，使用"-p"参数。这样压缩后的图片会得到与原始图片相同的日期时间。

    $ jpegoptim -d ./compressed -p photo.jpg 

如果你只是想看看无损压缩率而不是真的想压缩它们，使用"-n"参数来模拟压缩，然后它会显示出压缩率。

    $ jpegoptim -n photo.jpg 

### 有损压缩JPG图像 ###

万一你真的需要要保存在云空间上，你还可以使用有损压缩JPG图片。

这种情况下，使用"-m<质量>"选项，质量数范围0到100。（0是最好质量，100是最差质量）

例如，用50%质量压缩图片:

    $ jpegoptim -m50 photo.jpg 

----------

    photo.jpg 2048x1536 24bit N ICC JFIF  [OK] 882178 --> 301780 bytes (65.79%), optimized.

在牺牲质量的基础上，将会得到一个更小的图片。

![](https://farm9.staticflickr.com/8707/16260736234_6d6f1d2434_c.jpg)

### 一次压缩多张JPEG图像 ###

最常见的情况是需要压缩一个目录下的多张JPEG图像文件。为了应付这种情况，你可以使用接下来的脚本。

    #!/bin/sh
     
    # 压缩当前目录下所有*.jpg文件
    # 保存在./compressed目录
    # 并拥有与原始文件同样的修改日期
    for i in *.jpg; do jpegoptim -d ./compressed -p "$i"; done

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/compress-jpeg-images-command-line-linux.html

作者：[Dan Nanni][a]
译者：[VicYu/Vic020](https://github.com/Vic020)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-compress-png-files-on-linux.html
[2]:https://linux.cn/article-2324-1.html
