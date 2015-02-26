Android 中的 Wi-Fi 直连方式的 Bug 会导致拒绝服务
----

*Google标记这个问题为低严重性，并不急着修复*

![Wi-Fi Direct glitch crashes Android](http://i1-news.softpedia-static.com/images/news2/Bug-In-Wi-Fi-Direct-Android-Implementation-Causes-Denial-of-Service-471299-2.jpg)

Android处理Wi-Fi直连连接的方式中的一个漏洞可以导致在搜索连接节点的时候所连接的设备重启，这个节点可能是其他手机，摄像头，游戏设备，电脑或是打印机等任何设备。

Wi-Fi直连技术允许无线设备之间直接建立通信，而不用加入到本地网络中。

###安全公司致力于协调修复这个问题

这个漏洞允许攻击者发送一个特定的修改过的802.11侦测响应帧给设备，从而因为WiFi监控类中的一个未处理的异常导致设备重启。

Core Security通过自己的CoreLabs团队发现了这个瑕疵（CVE-2014-0997），早在2014年9月就汇报给了Google。Google确认了这个问题，却把它列为低严重性，并不提供修复时间表。

每次Core Security联系Android安全组要求提供修复时间表的时候都会收到同样的答复。最后一次答复是1月20日，意味着这么长的时间中都没有补丁。在星期一的时候，这家安全公司公布了他们的发现。

这家安全公司建立了一个[概念攻击][1]来展示他们研究结果的有效性。

根据这个漏洞的技术细节，一些Android设备在收到一个错误的wpa_supplicant事件后可能会进入拒绝服务状态，这些事件让无线驱动和Android平台框架之间的接口有效。

###Google并不着急解决这个问题

Android安全组对于这个问题的放松态度可能是基于这个原因：这种拒绝服务状态只发生在扫描节点这一小段时间。

不仅如此，实际上结果也并不严重，因为它会导致设备重启。不存在数据泄漏的风险或是能引起这个问题的攻击，不会吸引攻击者。但另一方面，不管怎样都应该提供一个补丁，以减轻任何未来的潜在风险。

Core Security声称在Android 5.0.1及以上版本中没有测试到这个问题，他们发现的受影响的设备有Android系统4.4.4的Nexus 5和4，运行Android 4.2.2的LG D806和Samsung SM-T310，以及4.1.2版本系统的Motorola RAZR HD。

目前，减轻影响的方式是尽量不用Wi-Fi直连，或者升级到没有漏洞的Android版本。

--------------------------------------------------------------------------------

via:http://news.softpedia.com/news/Bug-In-Wi-Fi-Direct-Android-Implementation-Causes-Denial-of-Service-471299.shtml

本文发布时间:27 Jan 2015, 09:11 GMT

作者：[Ionut Ilascu][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/ionut-ilascu
[1]:http://www.coresecurity.com/advisories/android-wifi-direct-denial-service
