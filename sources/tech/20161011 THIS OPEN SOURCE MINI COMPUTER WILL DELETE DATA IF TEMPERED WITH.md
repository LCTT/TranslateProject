ORWL：能够删除被篡改数据的小型开源计算机
===========

[](https://twitter.com/share?original_referer=https%3A%2F%2Fitsfoss.com%2F&source=tweetbutton&text=This+Open+Source+Mini+Computer+Will+Delete+Data+If+Tempered+With&url=https%3A%2F%2Fitsfoss.com%2Forwl-physically-secure-computer%2F&via=%40itsfoss)[](https://www.linkedin.com/cws/share?url=https://itsfoss.com/orwl-physically-secure-computer/)[](http://pinterest.com/pin/create/button/?url=https://itsfoss.com/orwl-physically-secure-computer/&description=This+Open+Source+Mini+Computer+Will+Delete+Data+If+Tempered+With&media=https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)

[![ORWL:开源物理安全电脑](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)

 在当今这个信息时代，安全是最重要的。恐怕没有人会希望自己的重要数据落入到坏人的手里。但是即使无安全防护的硬件同样拥有不少的威胁，大多数时候人们只对软件采取安全防护措施。ORWL 就是来改变这件事的。

### 【ORWL 是什么？】(http://www.design-shift.com/orwl/)

ORWL 宣称是社区里“造得最安全的家用电脑”。 它是一台小型的碟形计算机，在设计上考虑到了绝对的物理安全性。物理安全很重要，因为一旦有人获得从物理上访问你的计算机的途径，那么游戏就结束了，这是信息安全专业人员中的一个老生常谈。

![ ORWL 和安全密匙卡](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-fob.jpg)
>ORWL 和安全密匙卡</figcaption

ORWL 的基本规格包括英特尔 Skylake M3 处理器，USB-C 和微型 HDMI 接口，8GB 内存，120G 固态硬盘，蓝牙，Wifi 和 NFC 技术。目前它支持的操作系统有 Ubuntu 16.04，Qubes OS，以及 Windows 10 开箱。你只需要有一个显示器，键盘和鼠标就可以开始使用它了。
### ORWL 是开源的

ORWL 是完全开源的。这意味着，如果有人想设计一台自己的计算机或者对 ORWL 作出改进的话，原理图和设计文件，软件，固件，所有东西都是可以获取的。

![ORWL 拆卸](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-teardown.jpg)
>ORWL 拆卸

### ORWL 是如何工作的？

ORWL 使用自加密固态硬盘（SSD）。一个安全微控制器集成到其主板上来产生和存储加密密匙。一旦核实了系统的完整性和已验证用户，它就使用密匙来解密固态硬盘（SSD）。无论对 ORWL 进行任何类型的篡改，密匙都会立即删除固态硬盘（SSD）上的无用数据

为了实现验证目的，ORWL 有一个使用和智能卡类似技术的密匙卡。它使用 NFC 技术来验证用户，同时使用蓝牙来检测用户是否在当前使用范围内。如果用户不在附近（不在使用范围内），ORWL 将会自动锁定。
![ORWL 锁定图解](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-block-diagram.jpg)
>ORWL 锁定图解

整个 ORWL 系统被包裹在一个到处伴有压力开关的翻盖网里。安全微控制器持续监控专用惯性测量单元，主动网，以及用于检测篡改的内部温度和电源输入电压。这将防止访问内部组件，比如试图破坏翻盖将会触发安全微控制器从而删除加密密匙。此外，出于安全考虑，动态随机存储器（DRAM）也焊有外壳。

这并不是全部安全防护措施，ORWL 还有更多详细的措施来确保设备绝对的物理安全性，包括冷启动防护，直接存储器访问（DMA）攻击等。

更多信息可以在【ORWL 登录界面】(https://www.orwl.org/)找到。这儿是一个关于它如何工作的快速视频。
### ORWL 是信息安全的最终答案吗？

令人沮丧的是，ORWL 并不是信息安全的最终答案。ORWL 只能为计算机提供物理安全，尽管这很强大并且是一个完全地忍者（ninja），还有许多可能来自其他载体的攻击会损坏你的系统。然而，ORWL 确实从整体上提高了计算机的安全性。

[](https://itsfoss.com/maru-os-linux/)

你认为 ORWL 怎么样？通过评论让我们知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/orwl-physically-secure-computer/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[ Munif Tanjim][a]

译者：[ucasFL](https://github.com/ucasFL)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/munif/
