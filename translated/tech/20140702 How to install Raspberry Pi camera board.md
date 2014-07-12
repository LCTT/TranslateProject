如何安装树莓派摄像头模块
==============================================================================
[树莓派摄像头模块(Pi Cam)][1]发售于2013年5月。在首发时，Pi Cam配备了500万像素的传感器，通过排线链接树莓派上的CSI接口。第二次发布时，Pi Cam改名为[Pi NoIR][2]并配备了相同的传感器，不同之处在于第二版摄像头模块没有红外线过滤装置。因此使用第二版的摄像头模块可以观测到近红外线的波长(700 - 1000 nm)，如同一个安全监控摄像机一样，当然实现红外线的感应牺牲了传感器的显色性。

本文将会展示**如何在[树莓派][3]上安装摄像头模块**。我们会使用第一版摄像头模块来演示。在安装完摄像头模块之后，你将会使用三个应用来访问这个模块：raspistill, raspiyuv 和raspivid。其中前两个应用用来捕捉图像，第三个应用来捕捉视频。raspistill 工具会生成标准的图片文件例如 .jpg 图像，但是 raspiyuv 可以通过摄像头生成未处理的 raw 图像文件。

### 安装树莓派摄像头模块 ###

按照以下指示来安装树莓派摄像头模块：

1. 找到 CSI 接口(CSI接口在以太网接口旁边)，掀起深色胶带。

2. 拉起 CSI 接口挡板。

3. 将摄像头模块贴在透镜上的塑料保护膜撕掉。确保黄色部分的PCB(有字的一面)是安装完美的。

4. 将排线插入CSI接口。记住，有蓝色胶带的一面应该面向以太网接口方向。在检查排线安装好了之后，将挡板拉下。

![](https://farm3.staticflickr.com/2938/14529915452_0910b2e13f_z.jpg)

好了，现在你的 Pi Cam 已经准备就绪来拍摄相片以及视频了。

### 在树莓派上启用摄像头模块 ###

在安装完摄像头模块之后，确认你已经升级了树莓派系统并应用了最新的固件。输入以下命令来更新：

    $ sudo apt-get update
    $ sudo apt-get upgrade 

运行树莓派配置工具来激活摄像头模块：

    $ sudo raspi-config 

移动光标至菜单中的 "Enable Camera"，确认启用。完成之后重启树莓派。

![](https://farm4.staticflickr.com/3837/14530918915_e68ca0beef_z.jpg)

![](https://farm3.staticflickr.com/2922/14344284230_6cabbe2522_z.jpg)

![](https://farm3.staticflickr.com/2923/14529915362_7a437a53cb_z.jpg)

安装完摄像头模块后的完成照：

![](https://farm3.staticflickr.com/2924/14551046653_1c37e077fd_z.jpg)

### 通过摄像头模块拍照 ###

在重启完树莓派后，我们就可以使用它了。输入以下命令通过摄像头模块拍摄照片：

    $ raspistill -o keychain.jpg -t 2000 

这句命令会在执行 2000ms 之后捕捉图像。然后保存为 keychain.jpg。下面是一张由 下面是一张由 Pi Cam 拍摄的钥匙链。

![](https://farm4.staticflickr.com/3845/14530919095_ea0f37045a_z.jpg)

raspivid 工具用法差不多，从命令行运行 raspivid 工具。下面这句命令会按照默认配置(5秒，分辨率1920x1080，比特率 17Mbps)拍摄一段视频。

    $ raspivid -o mykeychain.h264

如果你想改变拍摄时长，只要通过 "-t" 选项来设置长度就行了。

    $ raspivid -o mykeychain.h264 -t 10000

使用 "-w" 和 "-h" 选项将分辨率降为 1280x720...

    $ raspivid -o mykeychain.h264 -t 10000 -w 1280 -h 720

raspivid 的输出是一段未压缩的 H.264 视频流，而且这段视频没有声音。因此这段视频需要转换在能被通常的视频播放器所播放。使用 gpac 包中所带有的 MP4Box 应用。

在 Raspbian 上安装 gpac，输入命令：

    $ sudo apt-get install -y gpac 

然后将这段 raw 的 H.264 格式的视频流转换为30帧每秒的 .mp4 格式视频：

    $ MP4Box -fps 30 -add keychain.h264 keychain.mp4 

视频长度为10秒，默认分辨率以及比特率。下面是一段通过 Pi Camera 拍摄的一段实例视频。

注：youtube视频地址

<iframe width="615" height="376" frameborder="0" src="http://www.youtube.com/embed/3uyR2AVVwAU?version=3&amp;rel=1&amp;fs=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;wmode=transparent" type="text/html" class="youtube-player"></iframe>

如果想要看到 raspistill, raspiyuv 和 raspivid 的完整命令行选项，直接运行以上命令(不加选项)就行了。


----------------

### [Kristophorus Hadiono][a] ###

我是一个 Linux 爱好者。我在日常生活中使用 Linux，甚至在我给学生们教学的时候。我的梦想是成为一名优秀的作家。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/install-raspberry-pi-camera-board.html

译者：[ThomazL](https://github.com/ThomazL) 校对：[校对者id](https://github.com/校对者id)

本文由 [lctt](https://github.com/lctt/translateproject) 原创翻译，[linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/go/picam
[2]:http://xmodulo.com/go/pinoir
[3]:http://xmodulo.com/go/raspberrypi
[a]:http://hadiono.org/blog

