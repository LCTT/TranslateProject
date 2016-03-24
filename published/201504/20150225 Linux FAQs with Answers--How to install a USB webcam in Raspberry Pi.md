Linux有问必答：如何在树莓派上安装USB网络摄像头
================================================================================
> **Question**: 我可以在树莓派上使用标准的USB网络摄像头么？我该如何检查USB网络摄像头与树莓派是否兼容？另外我该如何在树莓派上安装它？

如果你想在树莓上拍照或者录影，你可以安装[树莓派的摄像头板][1]。如果你不想要为摄像头模块花费额外的金钱，那有另外一个方法，就是你常见的[USB 摄像头][2]。你可能已经在PC上安装过了。

本教程中，我会展示如何在树莓派上设置摄像头。我们假设你使用的系统是Raspbian。

在此之前，你最好检查一下你的摄像头是否在[这些][3]已知与树莓派兼容的摄像头之中。如果你的摄像头不在这个兼容列表中，不要丧气，仍然有可能树莓派能检测到你的摄像头。

### 检查USB摄像头是否雨树莓派兼容 ###

要检查你的摄像头是否可以被树莓派检测到，将它插入到树莓派的USB口中，然后输入下面的命令。

    $ lsusb 

如果输出中没有你的摄像头，那么有可能你的树莓派的电源无法供应足够的电力给你的摄像头。这时你可以给你的摄像头用独立的电源线，比如[有源USB hub][4]，并重新输入lsusb命令。如果摄像头还是不能被识别，我们只有建议你购买其他树莓派支持的摄像头了。

![](https://farm8.staticflickr.com/7408/16576646025_898f17f36e_o.png)

在上面的截屏中，USB摄像头被识别为“1e4e:0102”，但是没有显示摄像头的制造商。当你在笔记本的Fedora 20中使用它时，它可以成功的检测到“1e4e:0102 Cubeternet GL-UPC822 UVC WebCam”。

另外一个可以检查摄像头是否被树莓派支持的方法是检查/dev目录。如果有/dev/video0，那么这暗示树莓派支持你的摄像头。

### 用USB Webcam拍照片 ###

当USB摄像头成功挂载到树莓派上之后，下一步就是拍一些照片来验证它的功能了。

要想拍摄照片，你要安装fswebcam，这是一款小型摄像头程序。你可以直接通过Raspbian的仓库来安装fswebcam。

    $ sudo apt-get install fswebcam 

fswebcam安装完成后，在终端中运行下面的命令来抓去一张来自摄像头的照片：

    $ fswebcam --no-banner -r 640x480 image.jpg 

这条命令可以抓取一张640x480分辨率的照片，并且用jpg格式保存。它不会在照片的底部留下任何水印.

![](https://farm8.staticflickr.com/7417/16576645965_302046d230_o.png)

这就是fswebcam下640x480分辨率的结果。

![](https://farm8.staticflickr.com/7345/16575497512_8d77f1b34c_o.jpg)

下面的例子是没有定义分辨率的照片。图片是偏蓝的，并且默认的分辨率是358x288。

![](https://farm8.staticflickr.com/7390/15954067124_760fbcdd9c_o.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-usb-webcam-raspberry-pi.html

作者：[Kristophorus Hadiono][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/kristophorus
[1]:http://xmodulo.com/install-raspberry-pi-camera-board.html
[2]:http://xmodulo.com/go/usb_webcam
[3]:http://elinux.org/RPi_USB_Webcams
[4]:http://xmodulo.com/go/usb_powerhub
