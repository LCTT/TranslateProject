[#]: subject: "Learn the OSI model in 5 minutes"
[#]: via: "https://opensource.com/article/22/10/osi-model-network-communications"
[#]: author: "Anamika https://opensource.com/users/anamika"
[#]: collector: "lkxed"
[#]: translator: "cool-summer-021"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15352-1.html"

5 分钟内了解 OSI 模型
======

![][0]

> 理解 OSI 框架的基本概念，掌握计算机系统通信机制。

<ruby>开放系统互联<rt>Open Systems Interconnection</rt></ruby>（OSI）模型是一个定义计算机、服务器和用户如何在一个系统内通信的标准。它是第一个网络通信标准模型，在上世纪 80 年代早期，所有主流的计算机和通信公司都采用了这个标准。

OSI 模型提供了一种用于描述网络的通用语言，并以离散的块或层的方式来描述。

### OSI 模型的各个层

该模型描述了计算机系统通过网络进行通信的七个层。 

- 7 应用层
- 6 表示层
- 5 会话层
- 4 传输层
- 3 网络层
- 2 数据链路层
- 1 物理层

每个层都有自己的工作方式和一系列跟其他层不同的协议。本文将逐个剖析这些层级。

### 应用层

应用层是在软件中实现的。它是与应用程序交互的层级。

用发送消息作为例子。发送消息的程序与应用层进行交互，并发送消息。接着，应用层向 OSI 模型的下一个层级（即表示层）发送消息。

### 表示层

来自应用层的数据被转发到表示层。表示层接收到文字、字符、字母、数字等形式的数据，并把它们转换为机器可识读的二进制格式数据。这个过程叫做编译。

在此阶段，ASCII（美国信息交换标准码）字符被转换为扩充的二进制编码的十进制交换码（EBCDIC）。转换后的数据在继续传输前，也会进行编码和加密过程，使用 SSL 协议进行加密和解密。

表示层的作用是抽象化，它假设下面的层级会处理它们收到的数据。它也负责压缩数据。数据的压缩可能是有损的，也有可能是无损的，这取决于很多因素，这不属于本文的讨论范围。

### 会话层

会话层的作用是建立和管理连接。该层级的主要工作是建立会话。例如，你登录网上商城，就在你的机器和服务器之间建立了会话。

会话层的作用是实现数据的发送和接收，完成后连接的会话就终止了。在一个会话建立前，会进行身份验证。与上一层类似，会话层也假设在它的工作完成后，下面的层级也会准确无误地处理数据。

### 传输层

传输层的作用是管理数据传输和其自身的关于数据如何传输的一些协议。从会话层传到这里的数据被分为更小的数据单元，这些数据单元称为片段。这个过程叫做“分段”。每个片段包含来源端口号、目标端口号和一个序列号。端口号用来识别发送数据的应用程序。注意，数据以块的形式传输。序列号用于把这些片段按正确的顺序排列。

传输层负责控制流量或在给定的时间内传输的数据量。它也负责错误控制，比如数据丢失、损坏等情况。它利用一种错误检测值，通常叫做校验和。传输层对每个数据片段加上校验和，就可以检查所发送的数据是否被正确接收。然后数据传输到网络层。

### 网络层

网络层的作用是跟其他网络进行通信。它把从一台机器接收到的数据片段传输给另一台位于不同网络的机器。路由器是作用于网络层的。

网络层的功能是逻辑寻址（就是确定 IP 地址）。它为发送方和接收方分配 IP 地址，数据包附带了这个地址，就可以被传输到正确的目标机器。接着网络层对数据包进行路由。负载均衡也是在网络层进行的，旨在确保不会发生过载。下一步，数据传输到数据链路层。

### 数据链路层

数据链路层支持跟其他设备直接通信。

它接收到来自网络层、包含发送方和接收方 IP 地址的数据包，进行物理寻址，然后将发送方和接收方的 MAC 地址分配给数据包，形成帧。

### 物理层

物理层由系统的所有硬件和物理设备（包括网线、导航系统、适配器等）组成。在这里，从前面层级接收到的数据都是 0 和 1 形式的。物理层把这些数据转换并通过各种方式（如果是光纤电缆，有电线、电信号、光信号；如果是 WIFI，则为无线电信号）传输至本地媒介。

注意，物理层作用于接收方的一端，把接收到的信号以帧的形式传输到数据链路层（把它转换回二进制数据形式）。然后帧传输到上面的层级，最终应用层（应用软件）会接收到需要的数据。

### 结语

当你需要描述网络架构或排除网络问题时，OSI 模型的相关知识会对你有所帮助。我希望本文能令你对这个模型的方方面面有清晰的理解。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/osi-model-network-communications

作者：[Anamika][a]
选题：[lkxed][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/anamika
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code_computer_development_programming.png
[2]: https://opensource.com/article/22/10/osi-model-network-communications#application-layer
[3]: https://opensource.com/article/22/10/osi-model-network-communications#presentation-layer
[4]: https://opensource.com/article/22/10/osi-model-network-communications#session-layer
[5]: https://opensource.com/article/22/10/osi-model-network-communications#transport-layer
[6]: https://opensource.com/article/22/10/osi-model-network-communications#network-layer
[7]: https://opensource.com/article/22/10/osi-model-network-communications#data-link-layer
[8]: https://opensource.com/article/22/10/osi-model-network-communications#physical-layer
[0]: https://img.linux.net.cn/data/attachment/album/202212/16/092612etn6gwaecb91bweg.jpg