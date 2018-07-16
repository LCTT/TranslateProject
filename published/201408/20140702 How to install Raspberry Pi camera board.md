如何安装树莓派摄像头模块
==============================================================================
[树莓派摄像头模块(Pi Cam)][1]发售于2013年5月。其第一个发布版本配备了500万像素的传感器，通过排线链接树莓派上的CSI接口。而Pi Cam的第二个发布版本——也被叫做[Pi NoIR][2]中，配备了相同的传感器，但没有红外线过滤装置。因此第二版的摄像头模块就像安全监控摄像机一样，可以观测到近红外线的波长(700 - 1000 nm)，不过当然同时也就牺牲了一定的显色性。

本文将会展示**如何在[树莓派][3]上安装摄像头模块**。我们将使用第一版摄像头模块来演示。在安装完摄像头模块之后，你将会使用三个应用程序来访问这个模块：raspistill, raspiyuv 和raspivid。其中前两个应用用来捕捉图像，第三个应用来捕捉视频。raspistill 工具生成标准的图片文件，例如 .jpg 图像，而 raspiyuv 可以通过摄像头生成未处理的 raw 图像文件。

### 安装树莓派摄像头模块 ###

按照以下步骤来将树莓派摄像头模块连接搭配树莓派：

1. 找到 CSI 接口(CSI接口在以太网接口旁边)，掀起深色胶带。

2. 拉起 CSI 接口挡板。

3. 拿起你的摄像头模块，将贴在镜头上的塑料保护膜撕掉。确保黄色部分的PCB(有字的一面)是安装完美的（可以轻轻按一下黄色的部分来保证安装完美）。

4. 将排线插入CSI接口。记住，有蓝色胶带的一面应该面向以太网接口方向。同样，这时也确认一下排线安装好了之后，将挡板拉下。

![](https://farm3.staticflickr.com/2938/14529915452_0910b2e13f_z.jpg)

好了，现在你的 Pi Cam 已经准备就绪，可以拍摄照片或视频了。

### 在树莓派上启用摄像头模块 ###

在安装完摄像头模块之后，首先要确认你已经升级了树莓派系统并应用了最新的固件。可以输入以下命令来操作：

    $ sudo apt-get update
    $ sudo apt-get upgrade 

运行树莓派配置工具来激活摄像头模块：

    $ sudo raspi-config 

移动光标至菜单中的 "Enable Camera（启用摄像头）"，将其设为Enable（启用状态）。完成之后重启树莓派。

![](https://farm4.staticflickr.com/3837/14530918915_e68ca0beef_z.jpg)

![](https://farm3.staticflickr.com/2922/14344284230_6cabbe2522_z.jpg)

![](https://farm3.staticflickr.com/2923/14529915362_7a437a53cb_z.jpg)

安装完摄像头模块后的完成照：

![](https://farm3.staticflickr.com/2924/14551046653_1c37e077fd_z.jpg)

### 通过摄像头模块拍照 ###

在重启完树莓派后，我们就可以使用Pi Cam了。要用它来拍摄照片的话，可以从命令行运行raspistill：

    $ raspistill -o keychain.jpg -t 2000 

这句命令将在 2000ms 后拍摄一张照片，然后保存为 keychain.jpg。下面就是一张由 Pi Cam 拍摄的我的小熊公仔钥匙链。

![](https://farm4.staticflickr.com/3845/14530919095_ea0f37045a_z.jpg)

raspiyuv 工具用法差不多，只不过拍摄得到的是一张未处理过的raw图像。

### 通过摄像头模块拍视频 ###

想要用摄像头模块拍一段视频的话，可以从命令行运行 raspivid 工具。下面这句命令会按照默认配置(长度5秒，分辨率1920x1080，比特率 17Mbps)拍摄一段视频。

    $ raspivid -o mykeychain.h264

如果你想改变拍摄时长，只要通过 "-t" 选项来设置你想要的长度就行了（单位是毫秒）。

    $ raspivid -o mykeychain.h264 -t 10000

使用 "-w" 和 "-h" 选项将分辨率降为 1280x720...

    $ raspivid -o mykeychain.h264 -t 10000 -w 1280 -h 720

raspivid 的输出是一段未压缩的 H.264 视频流，而且这段视频不含声音。为了能被通常的视频播放器所播放，这个 raw 的 H.264 视频还需要转换。可以使用 gpac 包中所带有的 MP4Box 应用。

在 Raspbian 上安装 gpac，输入命令：

    $ sudo apt-get install -y gpac 

然后将这段 raw 的 H.264 格式的视频流转换为每秒30帧的 .mp4 格式视频：

    $ MP4Box -fps 30 -add keychain.h264 keychain.mp4 

视频长度为10秒，使用默认分辨率以及比特率。下面是一段通过 Pi Camera 拍摄的一段实例视频。

注：youtube视频地址

<iframe width="615" height="376" frameborder="0" src="http://www.youtube.com/embed/3uyR2AVVwAU?version=3&amp;rel=1&amp;fs=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;wmode=transparent" type="text/html" class="youtube-player"></iframe>

如果想要获取 raspistill, raspiyuv 和 raspivid 的完整命令行选项，不加任何选项直接运行以上命令即可。


----------------

### [Kristophorus Hadiono][a] ###

Kristophorus Hadiono是一名 Linux 爱好者，并且是印度尼西亚一所民办高等学府的教师。他在日常生活中使用 Linux，也在给学生们教学的时候使用。他现在仍靠着政府的奖学金，在泰国曼谷的一所民办大学继续着学业。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/install-raspberry-pi-camera-board.html

译者：[ThomazL](https://github.com/ThomazL) 校对：[reinoir](https://github.com/reinoir)

本文由 [lctt](https://github.com/lctt/translateproject) 原创翻译，[linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/go/picam
[2]:http://xmodulo.com/go/pinoir
[3]:http://xmodulo.com/go/raspberrypi
[a]:http://hadiono.org/blog

