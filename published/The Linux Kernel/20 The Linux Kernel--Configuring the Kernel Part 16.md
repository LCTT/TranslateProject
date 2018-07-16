戴文的Linux内核专题：20 配置内核 (16)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.587/)

欢迎来到下一篇Linux内核文章。在本篇里，我们将讨论输入/输出端口。

首先，PS/2鼠标和AT键盘需要"i8042 PC Keyboard controller"驱动。在USB之前，鼠标和键盘使用圆形端口的PS/2端口。AT键盘是一种84键使用AT端口的IBM键盘。AT端口有5针而PS/2口有六针。

使用COM口(有时也称RS232串口)的输入设备需要这个驱动(Serial port line discipline)。COM是一种串口，意味着每次传输一位。

TravelMate笔记本需要这个特殊的驱动来使用连接到QuickPort的鼠标(ct82c710 Aux port controller)。

对于PS/2 mice、AT keyboards 和 XT keyboards的并口适配器使用这个驱动(Parallel port keyboard adapter)。

"PS/2 driver library"用于PS/2鼠标和AT键盘。

可以启用"Raw access to serio ports"来允许设备文件作为字符文件来使用。

下面，下面有一个用于"Altera UP PS/2 controller"的驱动。

PS/2复用同样需要一个驱动(TQC PS/2 multiplexer)。

ARC FPGA平台对于PS/2控制器需要特殊的驱动(ARC PS/2 support)。

注意：我想要说清楚这篇文章中讨论的PS/2控制器并不是Sony的PlayStation上的游戏控制器。这篇文章讨论的是6针鼠标/键盘端口。控制器是一种有PS/2端口的卡。

"Gameport support"提供对15针gameport的支持。gameport是一种曾经被很多游戏设备使用直到USB端口的发明的15针口。

下一个驱动是在ISA或者PnP总线卡上的gameport驱动(Classic ISA and PnP gameport support)。ISA代表"Industry Standard Architecture"(工业标准架构)并且它是一种在PCI之前的并行总线标准。PnP代表"Plug-and-Play"(即插即用)并且他是一种在ISA之前的通用标准。

"PDPI Lightning 4 gamecard support"提供了一个有gameport的游戏卡的专有驱动。

SoundBlaster Audigy卡是一种专有gameport卡(SB Live and Audigy gameport support)。

ForteMedia FM801 PCI音频控制器在卡上有一个音频控制器(ForteMedia FM801 gameport support)。这个驱动只支持gameport。

下一步，我们可以进入"Character devices"。字符设备以字符传输数据。

首先，可以启用/禁用TTY(Enable TTY)。移除TTY会节约很多空间，但是许多终端和这类设备需要TTY。除非你知道你在做什么，否则不要禁用TTY。

致我的粉丝：如果你知道一个禁用TTY的理由，你能在下面发表你的答案并与我们共享么?谢谢！

下一步，可以启用/禁用"Virtual terminals"(虚拟终端)。再说一次，这个可以节约很多空间，但是虚拟终端很重要。

下一个驱动支持字体映射和Unicode转换(Enable character translations in console)。这用于转换ASCII到Unicode。

虚拟终端可以用这个驱动作为系统控制台(Support for console on virtual terminal)。系统控制台管理着登陆和内核信息/警告。

虚拟终端必须通过控制台驱动与物理终端交互(Support for binding and unbinding console drivers)。在虚拟终端可用之前，控制台驱动必须被加载。当虚拟终端关闭后，控制台终端必须被卸载。

下一个驱动提供了对Unix98 PTY驱动的支持(Unix98 PTY support)。这是Unix98伪终端。

有趣的事实：Linux内核允许某个文件系统一次在很多地方被多次挂载。

接下来，可以支持"Support multiple instances of devpts"(译注：允许多个"devpts"文件系统实例）。devpts文件系统用于伪终端的slave。

过时的PTY同样可以启用(Legacy (BSD) PTY support)。

可以设置最大数量的使用中的过时PTS(Maximum number of legacy PTY in use)。

下面的驱动可以用于提供对其他驱动不支持的串口的支持 (Non-standard serial port support)。

下面有一些用于特定板和卡的驱动。

这个驱动支持GSM MUX协议(GSM多路复用)(GSM MUX line discipline support (EXPERIMENTAL))。

下一个驱动启用kmem设备文件(/dev/kmem virtual device support)。kmem通常用于内核调试。kmem可以用于读取某些内核变量和状态。

Stallion卡上面有许多串口Stallion multiport serial support)。这个驱动特别支持这块卡。

下面，我们可以进入到串行设备驱动了。如前所述，串行设备每次传输一位。

第一个驱动用于标准串口支持(8250/16550 and compatible serial support)。

在这个驱动下，即插即用(Plug-and-Play)同样存在于串口中(8250/16550 PNP device support)。

下面的驱动允许串口用于连接一个终端后作为控制台(Console on 8250/16550 and compatible serial port)。

一些UART控制器支持直接内存访问(DMA support for 16550 compatible UART controllers)。UART代表的是"Universal Asynchronous Receiver/Transmitter"(通用异步收发)。UART控制器转换串行到并行，反之亦然。

下一步，这个驱动提供了标准PCI串行设备支持(8250/16550 PCI device support)。

16位PCMCIA串行设备由这个驱动支持(8250/16550 PCMCIA device support)。记住，PCMCIA是一种通常使用于笔记本的PC卡。

可以设置最大数量支持的串口(Maximum number of 8250/16550 serial ports)，接着是在启动中注册的最大数量(Number of 8250/16550 serial ports to register at runtime)。

为了扩展像HUB6的串行能力，启用这个驱动(Extended 8250/16550 serial driver options)。

一个特殊驱动用于支持多于4种的过时串口(Support more than 4 legacy serial ports)。

当启用这个驱动后，可以共享串口中断(Support for sharing serial interrupts)。

使用这个驱动可以自动检测串口中断请求(Autodetect IRQ on standard ports)。

RSA串口同样也在Linux内核中支持(Support RSA serial ports)。RSA代表的是"Remote Supervisor Adapter"(远程管理适配器)。RSA是一种IBM特定的硬件。

下面，有不同的供应商/设备特定驱动。

下面有一个使用printk输出用户信息的TTY驱动(TTY driver to output user messages via printk)。printk(print kernel)是一种通常打印启动信息的特殊软件。任何由printk显示的字符串通常在/var/log/messages文件里。shell命令"dmesg"显示所有被printk使用的字符串。

下面，我们可以启用/禁用并口打印机的支持(Parallel printer support)。

接下来的驱动允许打印机作为一个控制台(Parallel printer support)。这意味着内核消息会被逐字地由打印机打印。通常地在这个系列中使用"print"(打印)这个单词时，意味这将输出信息到屏幕上。而这次，字面上的意思是将数据输出在纸上。

以下的驱动使设备文件在/dev/parport/中(Support for user-space parallel port device drivers)。这使得一些进程可以访问。

再说一次，Linux内核有许多特性和驱动，所以我们还会在下一篇文章中继续讨论更多的驱动。谢谢！

致粉丝：我们正在接近配置过程的终点。我有一张你们很多人想知道的内核话题列表。这些话题包含了安装内核、管理模块、加入第三方驱动、还有许多其他有趣的建议和要求。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-16.4835/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出