

如何使用树莓派制作一个数字针孔摄像头
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rasp-pi-pinhole-howto.png?itok=ubmevVZB)
在 2015 年底的时候，树莓派基金会发布了一个非常小的 [Raspberry Pi Zero][1]，这让大家感到很意外。更夸张的是，他们随 MagPi 杂志一起 [免费赠送][2]。我看到这个消息后立即冲出去到处找报刊亭，直到我在这一区域的某处找到最后两份。实际上我还没有想好如何去使用它们，但是我知道，因为它们非常小，所以，它们可以做很多全尺寸树莓派没法做的一些项目。


![Raspberry Pi Zero][4]

从 MagPi 杂志上获得的树莓派 Zero。CC BY-SA.4.0。

因为我对天文摄影非常感兴趣，我以前还改过一台微软出的 LifeCam Cinema 高清网络摄像头，拆掉了它的外壳、镜头、以及红外滤镜，露出了它的 [CCD 芯片][5]。我把它定制为我的 Celestron 天文望远镜的目镜。用它我捕获到了令人难以置信的木星照片、月球上的陨石坑、以及太阳黑子的特写镜头（使用了适当的 Baader 安全保护膜）。

在那之前，我甚至还在我的使用胶片的 SLR 摄像机上，通过在镜头盖（这个盖子就是在摄像机上没有安装镜头时，用来保护摄像机的内部元件的那个盖子）上钻一个小孔来变成一个 [针孔摄像头][6]，将这个钻了小孔的盖子，盖到一个汽水罐上切下来的小圆盘上，以提供一个针孔。碰巧有一天，在我的桌子上发现了一个可以用来做针孔体的盖子，随后我将它改成了用于天文摄像的网络摄像头。我很好奇这个网络摄像头是否有从针孔盖子后面捕获低照度图像的能力。我花了一些时间使用 [GNOME Cheese][7] 应用程序，去验证这个针孔摄像头确实是个可行的创意。

自从有了这个想法，我就有了树莓派 Zero 的一个用法！针孔摄像机一般都非常小，除了曝光时间和胶片的 ISO 速率外，一般都不提供其它的控制选项。数字摄像机就不一样了，它至少有 20 多个按钮和成百上千的设置菜单。我的数字针孔摄像头的目标是真实反映天文摄像的传统风格，设计一个没有控制选项的极简设备，甚至连曝光时间控制也没有。

用树莓派 Zero、高清网络镜头和空粉盒设计的数字针孔摄像头，是我设计的 [一系列][9] 针孔摄像头的 [第一个项目][8]。现在，我们开始来制作它。

### 硬件

因为我手头已经有了一个树莓派 Zero，为完成这个项目我还需要一个网络摄像头。这个树莓派 Zero 在英国的零售价是 4 英磅，这个项目其它部件的价格，我希望也差不多是这样的价格水平。花费 30 英磅买来的摄像头安装在一个 4 英磅的计算机主板上，让我感觉有些不平衡。显而易见的答案是前往一个知名的拍卖网站上，去找到一些二手的网络摄像头。不久之后，我仅花费了 1 英磅再加一些运费，获得了一个普通的高清摄像头。之后，在 Fedora 上做了一些测试操作，以确保它是可用正常使用的，我拆掉了它的外壳，以检查它的电子元件的大小是否适合我的项目。


![Hercules DualPix HD webcam][11]

Hercules DualPix 高清网络摄像头，它将被解剖以提取它的电路板和 CCD 图像传感器。CC BY-SA 4.0.

接下来，我需要一个安放摄像头的外壳。树莓派 Zero 电路板大小仅仅为 65mm x 30mm x 5mm。虽然网络摄像头的 CCD 芯片周围有一个用来安装镜头的塑料支架，但是，实际上它的电路板尺寸更小。我在家里找了一圈，希望能够找到一个适合盛放这两个极小的电路板的容器。最后，我发现我妻子的粉盒足够去安放树莓派的电路板。稍微做一些小调整，似乎也可以将网络摄像头的电路板放进去。

![Powder compact][13]

变成我的针孔摄像头外壳的粉盒。CC BY-SA 4.0.

我拆掉了网络摄像头外壳上的一些螺丝，取出了它的内部元件。网络摄像头外壳的大小反映了它的电路板的大小或 CCD 的位置。我很幸运，这个网络摄像头很小而且它的电路板的布局也很方便。因为我要做一个针孔摄像头，我需要取掉镜像，露出 CCD 芯片。

它的塑料外壳大约有 1 厘米高，它太高了没有办法放进粉盒里。我拆掉了电路板后面的螺丝，将它完全拆开，我认为将它放在盒子里有助于阻挡从缝隙中来的光线，因此，我用一把工艺刀将它修改成 4 毫米高，然后将它重新安装。我折弯了 LED 的支脚以降低它的高度。最后，我切掉了安装麦克风的塑料管，因为我不想采集声音。

![Bare CCD chip][15]

取下镜头以后，就可以看到裸露的 CCD 芯片了。圆柱形的塑料柱将镜头固定在合适的位置上，并阻挡 LED 光进入镜头破坏图像。CC BY-SA 4.0

网络摄像头有一个很长的带全尺寸插头的 USB 线缆，而树莓派 Zero 使用的是一个 Micro-USB 插座，因此，我需要一个 USB-to-Micro-USB 适配器。但是，使用适配器插入，这个树莓派将放不进这个粉盒中，更不用说还有将近一米长的 USB 线缆。因此，我用刀将 Micro-USB 适配器削开，切掉了它的 USB 插座并去掉这些塑料，露出连接到 Micro-USB 插头上的金属材料。同时也切掉了网络摄像头上大约 6 厘米长的 USB 电缆，并剥掉裹在它外面的锡纸，露出它的四根电线。我把它们直接焊接到 Micro-USB 插头上。现在网络摄像头可以插入到树莓派 Zero 上了，并且电线也可以放到粉盒中了。

![Modified USB plugs][17]

网络摄像头使用的 Micro-USB 插头已经剥掉了线，并直接焊接到触点上。这个插头现在插入到树莓派 Zero 后大约仅高出树莓派 1 厘米。CC BY-SA 4.0

最初，我认为到此为止，已经全部完成了电子设计部分，但是在测试之后，我意识到，如果摄像头没有捕获图像或者甚至没有加电我都不知道。我决定使用树莓派的 GPIO 针脚去驱动 LED 指示灯。一个黄色的 LED 表示网络摄像头控制软件已经运行，而一个绿色的 LED 表示网络摄像头正在捕获图像。我在 BCM 的 17 号和 18 号针脚上各自串接一个 300 欧姆的电阻，并将它们各自连接到 LED 的正极上，然后将 LED 的负极连接到一起并接入到公共地针脚上。

![LEDs][19]

LED 使用一个 300 欧姆的电阻连接到 GPIO 的 BCM 17 号和 BCM 18 号针脚上，负极连接到公共地针脚。CC BY-SA 4.0.

接下来，该去修改粉盒了。首先，我去掉了卡在粉盒上的托盘以腾出更多的空间，并且用刀将连接处切开。我打算在一个便携式充电宝上运行树莓派 Zero，充电宝肯定是放不到这个盒子里面，因此，我挖了一个孔，这样就可以引出 USB 连接头。LED 的光需要能够从盒子外面看得见，因此，我在盖子上钻了两个 3 毫米的小孔。

然后，我使用一个 6 毫米的钻头在盖子的底部中间处钻了一个孔，并找了一个薄片盖在它上面，然后用针在它的中央扎了一个小孔。一定要确保针尖很细，因为如果插入整个针会使孔太大。我使用干/湿砂纸去打磨这个针孔，以让它更光滑，然后从另一面再次打孔，再强调一次仅使用针尖。使用针孔摄像头的目的是为了得到一个规则的、没有畸形或凸起的圆孔，并且勉强让光通过。孔越小，图像越锐利。

![Bottom of the case with the pinhole aperture][21]

带针孔的盒子底部。CC BY-SA 4.0

剩下的工作就是将这些已经改造完成的设备封装起来。首先我使用蓝色腻子将摄像头的电路板固定在盒子中合适的位置，这样针孔就直接处于 CCD 之上了。使用蓝色腻子的好处是，如果我需要清理污渍（或者如果放错了位置）时，就可以很容易地重新安装 CCD 了。将树莓派 Zero 直接放在摄像头电路板上面。为防止这两个电路板之间可能出现的短路情况，我在这两个电路板之间放了几层防静电袋。

[树莓派 Zero][22] 非常适合放到这个粉盒中，并且不需要任何固定，而从小孔中穿出去连接充电宝的 USB 电缆需要将它粘住固定。最后，我将 LED 塞进了前面在盒子上钻的孔中，并用胶水将它们固定住。我在 LED 的针脚之中放了一些防静电袋，以防止盒子盖上时，它与树莓派电路板接触而发生短路。

![Raspberry Pi Zero slotted into the case][24]

树莓派 Zero 塞入到这个盒子中后，周围的空隙不到 1mm。从盒子中引出的连接到网络摄像头上的 Micro-USB 插头，接下来需要将它连接到充电宝上。CC BY-SA 4.0

### 软件

当然，计算机硬件离开控制它的软件是不能使用的。树莓派 Zero 同样可以运行全尺寸树莓派能够运行的软件，但是，因为树莓派 Zero 的 CPU 速度比较慢，让它去引导传统的 [Raspbian OS][25] 镜像非常耗时。打开摄像头都要花费差不多一分钟的时间，这样的速度在现实中是没有什么用处的。而且，一个完整的树莓派操作系统对我的这个摄像头项目来说也没有必要。甚至是，我禁用了引导时启动的所有可禁用的服务，启动仍然需要很长的时间。因此，我决定仅使用需要的软件，我将用一个 [U-Boot][26] 引导加载器和 Linux 内核。自定义 `init` 二进制文件从 microSD 卡上加载 root 文件系统，读入驱动网络摄像头所需要的内核模块，并将它放在 `/dev` 目录下，然后运行二进制的应用程序。

这个二进制的应用程序是另一个定制的 C 程序，它做的核心工作就是管理摄像头。首先，它等待内核驱动程序去初始化网络摄像头、打开它、以及通过低级的 `v4l ioctl` 调用去初始化它。GPIO 针是通过 `/dev/mem` 寄存器被配置为驱动 LED。

初始化完成之后，摄像头进入一个 loop 循环。每个图像捕获循环是摄像头使用缺省配置，以 JPEG 格式捕获一个单一的图像帧、保存这个图像帧到 SD 卡、然后休眠三秒。这个循环持续运行直到断电为止。这已经很完美地实现了我的最初目标，那就是用一个传统的模拟的针孔摄像头设计一个简单的数字摄像头。

定制的用户空间 [代码][27] 在遵守 [GPLv3][28] 或者更新版许可下自由使用。树莓派 Zero 需要 ARMv6 的二进制文件，因此，我使用了 [QEMU ARM][29] 模拟器在一台 x86_64 主机上进行编译，它使用了 [Pignus][30] 发行版（一个针对 ARMv6 移植/重构建的 Fedora 23 版本）下的工具链，在 `chroot` 下进行编译。所有的二进制文件都静态链接了 [glibc][31]，因此，它们都是自包含的。我构建了一个定制的 RAMDisk 去包含这些二进制文件和所需的内核模块，并将它拷贝到 SD 卡，这样引导加载器就可以找到它们了。

![Completed camera][33]

最终完成的摄像机完全隐藏在这个粉盒中了。唯一露在外面的东西就是 USB 电缆。CC BY-SA 4.0

### 照像

软件和硬件已经完成了，是该去验证一下它能做什么了。每个人都熟悉用现代的数字摄像头拍摄的高质量图像，不论它是用专业的 DSLRs 还是移动电话拍的。但是，这个高清的 1280x1024 分辨率的网络摄像头（差不多是一百万像素），在这里可能会让你失望。这个 CCD 从一个光通量极小的针孔中努力捕获图像。网络摄像头自动提升增益和曝光时间来进行补偿，最后的结果是一幅噪点很高的图像。图像的动态范围也非常窄，从一个非常拥挤的柱状图就可以看出来，这可以通过后期处理来拉长它，以得到更真实的亮部和暗部。

在户外阳光充足时捕获的图像达到了最佳效果，因此在室内获得的图像大多数都是不可用的图像。它的 CCD 直径仅有大约 1cm，并且是从一个几毫米的针孔中来捕获图像的，它的视界相当窄。比如，在自拍时，手臂拿着相机尽可能伸长，所获得的图像也就是充满整个画面的人头。最后，图像都是失焦的，所有的针孔摄像机都是这样的。

![Picture of houses taken with pinhole webcam][35]

在伦敦，大街上的屋顶。CC BY-SA 4.0

![Airport photo][37]

范堡罗机场的老航站楼。CC BY-SA 4.0

最初，我只是想使用摄像头去捕获一些静态图像。后面，我降低了 loop 循环的延迟时间，从三秒改为一秒，然后用它捕获一段时间内的一系列图像。我使用 [GStreamer][38] 将这些图像做成了延时视频。

以下是我创建视频的过程：

[][38]

视频是我在某天下班之后，从银行沿着泰晤式河到滑铁卢的画面。以每分钟 40 帧捕获的 1200 帧图像被我制作成了每秒 20 帧的动画。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/how-build-digital-pinhole-camera-raspberry-pi

作者：[Daniel Berrange][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/berrange
[1]:https://www.raspberrypi.org/products/raspberry-pi-zero/
[2]:https://opensource.com/users/node/24776
[3]:https://opensource.com/file/390776
[4]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-raspberrypizero.jpg?itok=1ry7Kx9m "Raspberry Pi Zero"
[5]:https://en.wikipedia.org/wiki/Charge-coupled_device
[6]:https://en.wikipedia.org/wiki/Pinhole_camera
[7]:https://help.gnome.org/users/cheese/stable/
[8]:https://pinholemiscellany.berrange.com/motivation/m-arcturus/
[9]:https://pinholemiscellany.berrange.com/
[10]:https://opensource.com/file/390756
[11]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-hercules_dualpix_hd.jpg?itok=r858OM9_ "Hercules DualPix HD webcam"
[12]:https://opensource.com/file/390771
[13]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-powdercompact.jpg?itok=RZSwqCY7 "Powder compact"
[14]:https://opensource.com/file/390736
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-bareccdchip.jpg?itok=IQzjZmED "Bare CCD chip"
[17]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-usbs.jpg?itok=QJBkbI1F "Modified USB plugs"
[19]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-_pi-zero-led.png?itok=oH4c2oCn "LEDs"
[21]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-casebottom.jpg?itok=QjDMaWLi "Bottom of the case with the pinhole aperture"
[22]:https://opensource.com/users/node/34916
[24]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-pizeroincase.jpg?itok=cyUIvjjt "Raspberry Pi Zero slotted into the case"
[25]:https://www.raspberrypi.org/downloads/raspbian/
[26]:https://www.denx.de/wiki/U-Boot
[27]:https://gitlab.com/berrange/pinholemiscellany/
[28]:https://www.gnu.org/licenses/gpl-3.0.en.html
[29]:https://wiki.qemu.org/Documentation/Platforms/ARM
[30]:https://pignus.computer/
[31]:https://www.gnu.org/software/libc/
[33]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-completedcamera.jpg?itok=VYFaT-kA "Completed camera"
[35]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-housesimage.jpg?itok=-_gtwn9N "Picture of houses taken with pinhole webcam"
[37]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pinhole-farnboroughairportimage.jpg?itok=E829gg4F "Airport photo"
[38]:https://gstreamer.freedesktop.org/modules/gst-ffmpeg.html
