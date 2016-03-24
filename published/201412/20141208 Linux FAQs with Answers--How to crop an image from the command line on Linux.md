Linux有问必答——如何在Linux命令行中剪裁图像
================================================================================
> **问题**：我想要去除图像文件中的白色空白，有没有什么便捷的方法能在Linux命令行中对图像文件进行剪裁？

当涉及到在Linux中转换或编辑图像文件时，ImageMagick毫无疑问是最为熟知的一体化软件之一。它包含了一整套命令行工具，用以显示、转换，或复制超过200中类型的光栅或矢量图像文件，所有这一切都在命令行下完成。ImageMagick可以用于多样化的图像编辑工作，如转换文件格式，添加特殊效果，添加文本，以及改变图像（调整大小、旋转、翻转、剪裁）。

如果你想要剪裁映像以去除空白，你可以使用ImageMagick自带的两个命令行工具。如果你还没有安装ImageMagick，请参照[本指南][1]来安装。

在本教程中，让我们来剪裁以下PNG图像。我们想要去除图像右边和底部的边缘，以便让图标居中。

![](https://farm8.staticflickr.com/7562/15688242319_ed19aca3a2_z.jpg)

首先，鉴定图像文件的尺寸（宽度和高度）。你可以使用identity命令来完成。

     $ identify chart.png 

----------

    chart.png PNG 1500x1000 1500x1000+0+0 8-bit DirectClass 31.7KB 0.000u 0:00.000

就像上面显示的那样，输入的图像是1500x1000px。

接下来，确定图像剪裁要做的两件事：（1）剪裁图像开始的位置（2）剪裁矩形区域的大小。

在本实例中，让我们假定图像剪裁从左上角开始，更精确点是在x=20px和y=10px，那样的话，剪裁后的图像尺寸为1200x700px。

用于剪裁图像的工具是convert。使用“-crop”选项后，convert命令会在输入图像中剪裁出一个矩形区域。

     $ convert chart.png -crop 1200x700+20+10 chart-cropped.png 

指定输入图像为chart.png，convert命令会将剪裁后的图像存储为chart-cropped.png。

![](https://farm8.staticflickr.com/7527/15872271461_401276e072_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/crop-image-command-line-linux.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/install-imagemagick-linux.html
