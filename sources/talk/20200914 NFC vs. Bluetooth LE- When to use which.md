[#]: collector: (lujun9972)
[#]: translator: ( chenmu-kk )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NFC vs. Bluetooth LE: When to use which)
[#]: via: (https://www.networkworld.com/article/3574932/nfc-vs-bluetooth-le-when-to-use-which.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

NFC vs. 蓝牙 LE: 如何抉择
======
近场通信和蓝牙LE是适合企业不同用途的低功耗无线技术。
Metamorworks / Getty Images

在低功率、相对短距离连接的众多选择中，两种技术脱颖而出——近场通信和低功耗蓝牙。两者都具有相对低廉的部署成本且易于使用。


NFC作为许多现代智能卡片的背后技术而为大众所熟知。NFC芯片必须十分接近（在几厘米内）读卡器来实现连接， 但这是它主要企业用例（安全性和访问控制）的一个优势。

[[通过注册Network World时事通讯定期获取信息。]][1]

蓝牙LE是主要蓝牙标准的低功耗衍生产品，通过显著降低能耗来抵消较低的潜在吞吐量，并具备适应更宽广的潜在用例的能力。

接下来，我们将研究每种技术更深入的细节内容以及它们的主要用例。

### NFC的未来

NFC在近距离接触范围内工作（设备间必须靠近到几厘米范围内来进行连接），一个可读无源的NFC芯片根本不需要任何独立电源，它会从读卡器的信号中汲取能量，工作频率在13.5MHz附近，并且在主动读取芯片时需要100-700µA的电源。

Gartner研究高级总监兼分析师说，“事实上短距离是它的优势。” NFC的一大优点是它不仅仅是无线电，还内置了庞大的安全协议。也就是说，潜在的不良因素将会逼近——使用专用设备在几米的范围内才能检测到正在发生的NFC连接。 NFC的施行还可以在SSL技术上分层来提高安全性。

考虑到NFC本就起源于非接触式支付技术，这不足为奇。它的根源在于对零售商的吸引力，它可以使用NFC让客户在购买商品、获取优惠券或者向店员寻求帮助前，通过简单地使用手机来连接NFC热点就可以获取相关的信息。

尽管NFC只能在一个很短的范围内使用，限制了使用NFC技术用例的数量，但它不仅仅是打开门买一杯拿铁。NFC用于引导连接便于设备间轻松快速的配对，因此用户可以在配备有投影仪的会议室中使用手机即可创建一个NFC连接，并验证智能手机是否是一个可连接的授权设备并显示相关的信息。演示文稿或者视频数据本身不会通过NFC来传输，但是NFC握手可作为不同无线协议间的验证，从而无需用户登录，例如Wi-Fi网络或者任何其他更高带宽可以传输数据的网络。


### 蓝牙LE的特点

相较之下，Bluetooth LE可以在更长的距离上运行（长达几十米），在1 Mbit / s的带宽下，其最大带宽约为NFC连接的两倍。它是出名的蓝牙技术的产物，相较于主线标准的更低功耗优化了双机连接。 在双机连接的任何一端电流均小于15 mA，实用范围约为10米，可通过AES加密保护连接。

根据Forrester首席分析师Andre Kindness的说法，它远非NFC的替代品。

他说：“从信息传递角度来看， [NFC] 比BLE快一点。”BLE通常需要一秒或更长时间的验证并安全连接，而NFC几乎在瞬间完成连接。

然而根据IDC高级研究分析师Patrick Filkins的说法，相较于NFC，蓝牙LE由于范围更广而有着更多的通用性。 

他说：“我认为蓝牙LE比较适合企业”。而类似于资产追踪，室内导航和目标广告的用例只是冰山一角。

对于企业，结果是相当直接的——NFC用例大多与公司使用蓝牙的用例是分开的，对于少有的可以选择的重叠，相对的优势和劣势显而易见。NFC有着短距离，廉价，即时连接以及更低数据转换率的优点。蓝牙LE工作的距离更远、传输速率更高，成本也更高，还需要一点时间来进行“握手”连接。

加入 [Facebook][2] 和 [LinkedIn][3] 上的Network World社区，在最热门的话题下留下你的评论。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3574932/nfc-vs-bluetooth-le-when-to-use-which.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
