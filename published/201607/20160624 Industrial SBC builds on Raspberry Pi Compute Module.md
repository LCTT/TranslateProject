用树莓派计算模块搭建的工业单板计算机
=====================================================

![](http://hackerboards.com/files/embeddedmicro_mypi-thm.jpg)

在 Kickstarter 众筹网站上，一个叫 “MyPi” 的项目用树莓派计算模块制作了一款 SBC（LCTT 译注： Single Board Computer 单板计算机），提供一个 mini-PCIe 插槽，串口，宽范围输入电源，以及模块扩展等功能。

你也许觉得奇怪，都 2016 年了，为什么还会有人发布这样一款长得有点像三明治，用过时的 ARM11 构建的 COM （LCTT 译注： Compuer on Module，模块化计算机）版本的树莓派单板计算机：[树莓派计算模块][1]。原因是这样的，首先，目前仍然有大量工业应用不需要太多 CPU 处理能力，第二，树莓派计算模块仍是目前仅有的基于树莓派硬件的 COM，虽然更便宜、有点像 COM 并采用同样的 700MHz 处理器的 [零号树莓派][2] 也很类似。

![](http://hackerboards.com/files/embeddedmicro_mypi-sm.jpg)

*安装了 COM 和 I/O 组件的 MyPi*

![](http://hackerboards.com/files/embeddedmicro_mypi_encl-sm.jpg)

*装入了可选的工业外壳中*

另外，Embedded Micro Technology 还表示它的 SBC 还设计成可升级替换为支持的树莓派计算模块 —— 采用了树莓派 3 的四核、Cortex-A53 博通 BCM2837处理器的 SoC。因为这个产品最近很快就会到货，不确定他们怎么能及时为 Kickstarter 赞助者处理好这一切。不过，以后能支持也挺不错，就算要为这个升级付费也可以接受。

MyPi 并不是唯一一款新的基于树莓派计算模块的商业嵌入式设备。Pigeon Computers 在五月份启动了 [Pigeon RB100][3] 的项目，是一个基于 COM 的工业自动化控制器。不过，包括 [Techbase Modberry][4] 在内的这一类设备大都出现在 2014 年 COM 发布之后的一小段时间内。

MyPi 的目标是 30 天内筹集 $21,696，目前已经实现了三分之一。早期参与包的价格 $119 起，九月份发货。其他选项有 $187 版本，里面包含了价值 $30 的树莓派计算模块，以及各种线缆。套件里还有各种插件板以及工业外壳可选。

![](http://hackerboards.com/files/embeddedmicro_mypi_baseboard-sm.jpg)

*不带 COM 和插件板的 MyPi 主板*

![](http://hackerboards.com/files/embeddedmicro_mypi_detail-sm.jpg)

*以及它的接口定义*

树莓派计算模块能给 MyPi 带来博通 BCM2835 Soc，512MB 内存，以及 4GB eMMC 存储空间。MyPi 主板扩展了一个 microSD 卡槽，一个 HDMI 接口，两个 USB 2.0 接口，一个 10/100M 以太网口，还有一个像网口的 RS232 端口（通过 USB 连接）。

![](http://hackerboards.com/files/embeddedmicro_mypi_angle1-sm.jpg)

*插上树莓派计算模块和 mini-PCIe 模块的 MyPi 的两个视角*

![](http://hackerboards.com/files/embeddedmicro_mypi_angle2.jpg)

*插上树莓派计算模块和 mini-PCIe 模块的 MyPi 的两个视角*

MyPi 还将配备一个 mini-PCIe 插槽，据说“只支持 USB，以及只适用 mPCIe 形式的调制解调器”。还带有一个 SIM 卡插槽。板上还有双标准的树莓派摄像头接口，一个音频输出接口，自带备用电池的 RTC，LED 灯。还支持宽范围的 9-23V 直流输入。

Embedded Micro 表示，MyPi 是为那些树莓派爱好者们设计的，他们拼接了太多 HAT 外接板，已经不能有效地工作了，或者不能很好地装入工业外壳里。MyPi 支持 HAT，另外还提供了公司自己定义的 “ASIO” （特定应用接口）插件模块，它会将自己的 I/O 扩展到载板上，载板再将它们连到载板边上的 8针的绿色凤凰式工业 I/O 连接器（标记了“ASIO Out”）上，在下面图片里有描述。

![](http://hackerboards.com/files/embeddedmicro_mypi_io-sm.jpg)

*MyPi 的模块扩展接口*

就像 Kickstarter 页面里描述的：“比起在板边插满带 IO 信号接头的 HAT 板，我们更愿意把同样的 IO 信号接到另一个接头，它直接接到绿色的工业接头上。” 另外，“通过简单地延长卡上的插脚长度（抬高），你将来可以直接扩展 IO 集 - 这些都不需要任何排线！”Embedded Micro 表示。

![](http://hackerboards.com/files/embeddedmicro_mypi_with_iocards-sm.jpg)

*MyPi 和它的可选 I/O 插件板卡*

像上面展示的，这家公司为 MyPi 提供了一系列可靠的 ASIO 插卡，。一开始这些会包括 CAN 总线，4-20mA 传感器信号，RS485，窄带 RF，等等。
 
### 更多信息

MyPi 在 Kickstarter 上提供了 7 月 23 日到期的 79 英镑（$119）早期参与包（不包括树莓派计算模块），预计九月份发货。更多信息请查看 [Kickstarter 上 MyPi 的页面][5] 以及 [Embedded Micro Technology 官网][6]。

--------------------------------------------------------------------------------

via: http://hackerboards.com/industrial-sbc-builds-on-rpi-compute-module/

作者：[Eric Brown][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[Ezio](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://hackerboards.com/industrial-sbc-builds-on-rpi-compute-module/
[1]: http://hackerboards.com/raspberry-pi-morphs-into-30-dollar-com/
[2]: http://hackerboards.com/pi-zero-tweak-adds-camera-connector-keeps-5-price/
[3]: http://hackerboards.com/automation-controller-runs-linux-on-raspberry-pi-com/
[4]: http://hackerboards.com/automation-controller-taps-raspberry-pi-compute-module/
[5]: https://www.kickstarter.com/projects/410598173/mypi-industrial-strength-raspberry-pi-for-iot-proj
[6]: http://www.embeddedpi.com/
