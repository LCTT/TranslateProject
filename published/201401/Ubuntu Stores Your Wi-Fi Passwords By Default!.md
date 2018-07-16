Ubuntu默认在主目录外面明文存储你的Wi-Fi密码!
================================================================================

Ubuntu可能不像你想象的那么安全．据报道，Linux驱动的发行版在主目录外存储Wi-Fi配置文件，这使得它们更易于被访问。这包括Wi-Fi配置文件的密码。报道说，一个用户指出，Wi-Fi密码在Ubuntu上是不加密的，因为它们都存储在主目录之外。此文件夹虽然可以在操作系统的安装过程中进行加密。

"最近，我偶然发现了一个事实，NetworkManager默认存储WiFi配置文件*包括明文密码*到/etc/NetworkManager/system-connections/。我认为当他/她开启了主目录加密时，肯定不希望存储密码到主目录之外，应该以某种方式纠正。" - Softpedia引用邮件列表中Per Guth的话。

这个问题显然是为了让“所有用户都可以连接到这个网络”，即默认情况下启用该选项的结果。为了关掉此功能，用户必须打开Network Indicator，然后去Edit Connection。然后选择在Edit上的Select Network and clock。在General选项卡，取消勾选，以将其关闭。

取消选中该选项据说会移动这个密码进入到所需的文件夹（主目录），但Softpedia报告推测，大多数用户不会注意到这个问题。Canonical是否会进行任何更改，还有待观察。

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=125483

译者：[Akagi201](https://github.com/Akagi201) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出