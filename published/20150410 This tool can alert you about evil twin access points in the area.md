EvilAP_Defender：可以警示和攻击 WIFI 热点陷阱的工具 
===============================================================================

**开发人员称，EvilAP_Defender甚至可以攻击流氓Wi-Fi接入点**

这是一个新的开源工具，可以定期扫描一个区域，以防出现恶意 Wi-Fi 接入点，同时如果发现情况会提醒网络管理员。

这个工具叫做 EvilAP_Defender，是为监测攻击者所配置的恶意接入点而专门设计的，这些接入点冒用合法的名字诱导用户连接上。

这类接入点被称做假面猎手（evil twin），使得黑客们可以从所接入的设备上监听互联网信息流。这可以被用来窃取证书、钓鱼网站等等。

大多数用户设置他们的计算机和设备可以自动连接一些无线网络，比如家里的或者工作地方的网络。通常，当面对两个同名的无线网络时，即SSID相同，有时候甚至连MAC地址（BSSID）也相同，这时候大多数设备会自动连接信号较强的一个。

这使得假面猎手攻击容易实现，因为SSID和BSSID都可以伪造。

[EvilAP_Defender][1]是一个叫Mohamed Idris的人用Python语言编写，公布在GitHub上面。它可以使用一个计算机的无线网卡来发现流氓接入点，这些坏蛋们复制了一个真实接入点的SSID，BSSID，甚至是其他的参数如通道，密码，隐私协议和认证信息等等。

该工具首先以学习模式运行，以便发现合法的接入点[AP]，并且将其加入白名单。然后可以切换到正常模式，开始扫描未认证的接入点。

如果一个恶意[AP]被发现了，该工具会用电子邮件提醒网络管理员，但是开发者也打算在未来加入短信提醒功能。

该工具还有一个保护模式，在这种模式下，应用会发起一个denial-of-service [DoS]攻击反抗恶意接入点，为管理员采取防卫措施赢得一些时间。

“DoS 将仅仅针对有着相同SSID的而BSSID（AP的MAC地址）不同或者不同信道的流氓 AP，”Idris在这款工具的文档中说道。“这是为了避免攻击到你的正常网络。”

尽管如此，用户应该切记在许多国家，攻击别人的接入点很多时候都是非法的，甚至是一个看起来像是攻击者操控的恶意接入点。

要能够运行这款工具，需要Aircrack-ng无线网套装，一个支持Aircrack-ng的无线网卡，MySQL和Python运行环境。

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2905725/security0/this-tool-can-alert-you-about-evil-twin-access-points-in-the-area.html

作者：[Lucian Constantin][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Lucian-Constantin/
[1]:https://github.com/moha99sa/EvilAP_Defender/blob/master/README.TXT
