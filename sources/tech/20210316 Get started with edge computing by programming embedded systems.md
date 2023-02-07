[#]: subject: "Get started with edge computing by programming embedded systems"
[#]: via: "https://opensource.com/article/21/3/rtos-embedded-development"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

通过编写嵌入式系统入手边缘计算
======
用于操控无线调制解调器的AT设备包是RTOS最流行的扩展功能之一。

![Looking at a map][1]

Image by: opensource.com

RTOS 是一个开源的[嵌入式设备操作系统][2]，由 RT-Thread 开发。它为开发者提供了标准化、友好的基础架构，开发者可以基于各种设备编写代码，它包含大量有用的类库和工具包，使开发过程更加便捷。

RTOS 使用的是模块方式，以便于扩展，这一点跟 Linux 类似。程序包令开发者能基于任何目标设备使用 RTOS。RTOS 最常用的一种扩展是 AT 设备包，它包含各种不同 AT 设备（例如调制解调器）的移植文件和示例代码。

在超过62,000次下载中(至少在撰写本文时)，最流行的RTOS扩展之一是At设备包，其中包括用于不同At设备的移植文件和示例代码。

### 关于 AT 命令

起初，AT 命令是一个协议，用于控制拨号调制解调器。随着调制解调器技术发展到较高的带宽，它仍然可以用于为设备控制建立轻量级而高效的协议，主流的移动电话厂商也联手开发了一系列 AT 命令，用于控制移动电话上的 GSM 模块。

如今，AT 命令仍然在网络通信领域具有通用性，很多设备，例如WiFi、蓝牙、4G，都支持 AT 命令。

如果您正在创建用于边缘计算输入、监控或物联网(IoT)的专用设备，则您可能接触到的 RTOS 支持的 AT 设备包括ESP8266、ESP32、M26、MC20、RW007、MW31、SIM800C、W60X、SIM76XX、A9/A9G、BC26、AIR720、ME3616、M 6315、BC28和EC200X。

RT-Thread包含套接字抽象层（SAL）组件，SAL 实现了多种网络协议和接口的抽象，为上层提供了一系列标准的 [BSD Socket][3] API。SAL 进而接替了AT 的套接字接口，所以开发者需要考虑网络应用层提供的网络接口。

这个包实现了设备（包括上述设备）上的 AT 套接字功能，也支持通过标准套接字接口以 AT 命令的形式通信。[RT-Thread 编程指南][4]中就有关于这些功能的详细介绍。

at_device 包是在 LGPLv2.1 许可证下分发的，借助 [RT-Thread Env tool][5] 可以方便地获取到。该工具包含一个配置器和一个包管理器，它们分别用于配置内核和组件功能，可以用于定制组件并管理在线包。有了这些工具，开发者可以像搭积木一样构建系统。

### 获取 AT 设备包

欲使用配置了 RTOS 的 AT 设备，你必须启用 AT 组件库和 AT 套接字功能，需要:

* RT_Thread 4.0.2+
* RT_Thread AT component 1.3.0+
* RT_Thread SAL component
* RT-Thread netdev component

AT 设备包已经针对多种版本进行了相应的更新。版本不同，配置选项也相应地不同，因此必须针对相应的系统版本进行适配。目前最常用的 AT 设备包版本有：

* V1.2.0: 针对低于V3.1.3的RT-Thread，V1.0.0 的AT组件
* V1.3.0: 针对低于V3.1.3的RT-Thread，V1.1.0 的AT组件
* V1.4.0: 针对低于V3.1.3或等于V4.0.0 的 RT-Thread，V1.2.0 的 AT 组件
* V1.5.0: 针对低于V3.1.3或等于V4.0.0 的 RT-Thread，V1.2.0 的 AT 组件
* V1.6.0: 针对低于V3.1.3 或等于V4.0.1 的 RT-Thread，V1.2.0 的 AT 组件
* V2.0.0/V2.0.1: 针对高于V3.1.3 的 RT-Thread，V1.3.0 的 AT 组件
* 最新版: 针对高于V3.1.3 的 RT-Thread，V1.3.0 的 AT 组件

获取正确的版本的过程主要是在生成菜单时自动完成的。它基于现有的系统环境提供最合适的 AT 设备包。

正如前文提到的，不同的版本需要不同的配置选项。例如，

```
RT-Thread online packages  --->
     IoT - internet of things  --->
        -*- AT DEVICE: RT-Thread AT component porting or samples for different device  
        [ ]   Enable at device init by thread
              AT socket device modules (Not selected, please select)  --->    
              Version (V1.6.0)  --->
```

启用AT设备init by thread的选项决定了配置是否创建一个单独的线程来初始化设备网络。

2.x版本支持同时启用多个 AT 设备：

```
RT-Thread online packages  --->
     IoT - internet of things  --->
        -*- AT DEVICE: RT-Thread AT component porting or samples for different device
        [*]   Quectel M26/MC20  --->
          [*]   Enable initialize by thread
          [*]   Enable sample
          (-1)    Power pin
          (-1)    Power status pin
          (uart3) AT client device name
          (512)   The maximum length of receive line buffer
        [ ]   Quectel EC20  --->
        [ ]   Espressif ESP32  --->
        [*]   Espressif ESP8266  --->
          [*]   Enable initialize by thread
          [*]   Enable sample
          (realthread) WIFI ssid
          (12345678) WIFI password
          (uart2) AT client device name
          (512)   The maximum length of receive line buffer
        [ ]   Realthread RW007  --->
        [ ]   SIMCom SIM800C  --->
        [ ]   SIMCom SIM76XX  --->
        [ ]   Notion MW31  --->
        [ ]   WinnerMicro W60X  --->
        [ ]   AiThink A9/A9G  --->
        [ ]   Quectel BC26  --->
        [ ]   Luat air720  --->
        [ ]   GOSUNCN ME3616  --->
        [ ]   ChinaMobile M6315  --->
        [ ]   Quectel BC28  --->
        [ ]   Quectel ec200x  --->
        Version (latest)  --->
```

这个版本包含了很多其他选项，其中也有启用示例代码的选项，这对初学者或使用不熟悉的设备的开发者很有帮助。

你也可以设置相应选项，选择你需要使用的识别码，来为你的组件供电，一个识别码来指示电源状态，样本设备使用的串行设备的名称，以及样本设备接收的数据的最大长度。在合适的设备上，你也可以设置 SSID 和密码。

简而言之，控制选项是够用的。

* V2.x.x 版本支持同时启用多个 AT 设备，欲查看启用的设备信息，在[finsh shell][6] 中执行 `ifocnfig` 命令即可。
* V2.X.X 版本需要设备在使用前先注册；注册可以在样例目录中进行，或在应用层以自定义方式进行。
* 识别码选项，例如电源选项和电源状态选项，是按照设备的硬件连接来配置的。如果硬件的开启功能不可用，它们就会被设置为 `-1`。
* 一台AT 设备应当对应一个序列名称，每台设备的 AT客户端名称应当是不同的。

### AT 组件配置选项

当选择了 AT 组件包，启用了设备支持，AT 组件的客户端功能也就默认选择完成了。对 AT 组件来说，这就意味着有更多的选项要设置：

```
RT-Thread Components  --->
    Network  --->
        AT commands  --->
    [ ]   Enable debug log output
    [ ]   Enable AT commands server 
    -*-   Enable AT commands client
    (1)     The maximum number of supported clients
    -*-     Enable BSD Socket API support by AT commnads
    [*]     Enable CLI(Command-Line Interface) for AT commands
    [ ]     Enable print RAW format AT command communication data
    (128)   The maximum length of AT Commonds buffer
```

与AT 设备包有关的配置选项有：

* 支持的客户端最大个数：选择 AT 设备包中的多台设备时，需要将该选项配置为对应的设备台数；
* 通过 AT 命令启用 BSD Socket API 功能：当选择 AT 设备包时默认选择该选项。
* AT 命令的最大长度：AT 命令可发送的数据的最大长度

### 一切皆有可能

当你开始进行嵌入式系统编程，你会很快意识到，你可以创造自己想象得到得任何东西。RTOS 旨在帮助你实现它，它的那些功能包为你提供了良好的开端。现在，设备的互联也是可期待的。IoT 技术一定会实现多种协议间的通信，AT 协议将发挥关键作用。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/rtos-embedded-development

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://en.wikipedia.org/wiki/Berkeley_sockets
[4]: https://github.com/RT-Thread/rtthread-manual-doc/blob/master/at/at.md
[5]: https://www.rt-thread.io/download.html?download=Env
[6]: https://www.rt-thread.org/download/rttdoc_1_0_0/group__finsh.html
[7]: https://www.redhat.com/en/topics/edge-computing
