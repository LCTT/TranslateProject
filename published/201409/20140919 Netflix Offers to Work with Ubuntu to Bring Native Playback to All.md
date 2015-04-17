Netflix支持 Ubuntu 上原生回放
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/08/netflix-ubuntu.jpg)

**我们[上个月说的Netflix 的原生Linux支持很接近了][1]，现在终于有了，我们只需几个简单的步骤就可以在Ubuntu桌面上启用HTML 5视频流了。

现在Netflix更近一步提供了支持。它希望给Ubuntu带来真正的开箱即用的Netflix回放。现在只需要更新**网络安全（Network Security Services，NSS）**服务库就行。

### 原生Netflix? Neato. ###

在一封发给Ubuntu开发者邮件列表的[邮件中][2]，Netflix的Paul Adolph解释了现在的情况：

> “如果NSS的版本是3.16.2或者更高的话，Netflix可以在Ubuntu 14.04的稳定版Chrome中播放。如果版本超过了14.04，Netflix会作出一些调整，以避免用户必须对浏览器的 User-Agent 参数进行一些修改才能播放。”

[LCTT 译注：此处原文是“14.02”，疑是笔误，应该是指Ubuntu 14.04。]

很快要发布的Ubuntu 14.10提供了更新的[NSS v3.17][3], 而目前大多数用户使用的版本 Ubuntu 14.04 LTS 提供的是 v3.15.x。

NSS是一系列支持多种安全功能的客户端和服务端应用的库，包括SSL，TLS，PKCS和其他安全标准。为了让Ubuntu LTS用户可以尽快用上原生的HTML5 Netflix， Paul 问道：

>”让一个新的NSS版本进入更新流的过程是什么？或者有人可以给我提供正确的联系方式么？“

Netflix今年早期时在Windows 8.1和OSX Yosemite上提供了HTML5视频回放，而不需要任何额外的下载或者插件。现在可以通过[加密媒体扩展][4]特性来使用。

虽然我们等待这讨论取得进展（并且希望可以完全解决），但是你仍可以在Ubuntu上[下面的指导来][5]修改HTML5 Netflix。

更新：9/19

本文发表后，Canonical 已经确认所需版本的NSS 库会按计划在下个“安全更新”中更新，预计 Ubuntu 14.04 LTS 将在两周内得到更新。

这个新闻让 Netflix 的Paul Adolph 很高兴，作为回应，他说当软件包更新后，他将“去掉 Chrome 中回放 Netflix HTML5 视频时的User-Agent 过滤，不再需要修改UA 了”。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/09/netflix-linux-html5-nss-change-request

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins
[2]:https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2014-September/015048.html
[3]:https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.17_release_notes
[4]:http://en.wikipedia.org/wiki/Encrypted_Media_Extensions
[5]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins