如何在树莓派上使用图片特效
================================================================================
现在使用[树莓派摄像头模组][1]("raspi cam")，也可以像使用卡片相机那样，给拍摄的照片增加各种各样的图片特效。 raspistill命令行工具，为您的树莓派提供了丰富的图片特效选项，来美化处理你的图片。

有[三个命令行工具][2]可以用于[抓取raspicam拍摄的照片或者视频][3]，在这文章中将重点介绍其中的raspstill工具。raspstill工具提供了丰富的控制选项来处理图片，比如说：锐度（sharpness）、对比度（contrast）、亮度（brightness）、饱和度（saturation）、ISO、自动白平衡（AWB）、以及图片特效（image effect）等。

在这篇文章中，将介绍如何使用raspstill工具以及raspicam摄像头模组来控制照片的曝光、AWB以及其他的图片效果。我写了一个简单的python脚本来自动拍摄照片并在这些照片上自动应用各种图片特效。raspicam的帮助文档中介绍了该摄像头模组所支持的曝光模式、AWB和图片特效。总的来说，raspicam一共支持16种图片特效、12种曝光模式以及10种AWB选项。

Python脚本很简单，如下所示 。

    #!/usb/bin/python
    import os
    import time
    import subprocess
    list_ex=['auto','night']
    list_awb=['auto','cloud',flash']
    list_ifx=['blur','cartoon','colourswap','emboss','film','gpen','hatch','negative','oilpaint','posterise','sketch','solarise','watercolour']
    x=0
    for ex in list_ex:
        for awb in list_awb:
            for ifx in list_ifx:
                x=x+1
                filename='img_'+ex+'_'+awb+'_'+ifx+'.jpg'
                cmd='raspistill -o '+filename+' -n -t 1000 -ex '+ex+' -awb '+awb+' -ifx '+ifx+' -w 640 -h 480'
                pid=subprocess.call(cmd,shell=True)
                print "["+str(x)+"]-"+ex+"_"+awb+"_"+ifx+".jpg"
                time.sleep(0.25)
    print "End of image capture"


这个脚本完成了以下几个工作。首先，脚本中定义了3个列表，分别用于枚举曝光模式、AWB模式以及图片特效。在这个实例中，我们将使用到2种曝光模式、3种AWB模式以及13种图片特效。脚本会遍历上述3种选项的各种组合，并使用这些参数组合来运行raspistill工具。传入的参数共6个，分别为：（1）输出文件名；（2）曝光模式；（3）AWB模式；（4）图片特效模式；（5）拍照时间，设为1秒；（6）图片尺寸，设为640x480。脚本会自动拍摄78张照片，每张照片会应用不同的特效参数。

执行这个脚本也很简单，只需键入下面的命令行：

    $ python name_of_this_script.py 

下面是抓取到一些样张。

![](https://farm8.staticflickr.com/7483/16134215939_c93291158a_c.jpg)

### 小福利 ###

除了使用raspistill命令行工具来操控raspicam摄像模组以外，还有其他的方法可以用哦。[Picamera][4]是一个python库，它提供了操控raspicam摄像模组的的API接口，这样就可以便捷地构建更加复杂的应用程序。如果你精通python，那么picamera一定是你的 hack 项目的好伙伴。picamera已经被默认集成到Raspbian最新版本的的镜像中。当然，如果你用的不是最新的Raspbian或者是使用其他的操作系统版本，你可以通过下面的方法来进行手动安装。

首先，先在你的系统上安装pip，详见[指导][6]。

然后，就可以按下面的方法安装picamera。

     $ sudo pip install picamera 

picamera的使用说明可以查阅[官方文档][7]。

--------------------------------------------------------------------------------

via: http://xmodulo.com/apply-image-effects-pictures-raspberrypi.html

作者：[Kristophorus Hadiono][a]
译者：[coloka](https://github.com/coloka)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/kristophorus
[1]:http://xmodulo.com/go/picam
[2]:http://www.raspberrypi.org/documentation/usage/camera/raspicam/
[3]:http://xmodulo.com/install-raspberry-pi-camera-board.html
[4]:https://pypi.python.org/pypi/picamera
[5]:http://xmodulo.com/go/raspberrypi
[6]:http://ask.xmodulo.com/install-pip-linux.html
[7]:http://picamera.readthedocs.org/