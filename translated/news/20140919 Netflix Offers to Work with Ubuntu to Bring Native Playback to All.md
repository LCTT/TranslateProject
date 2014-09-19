Netflix与Ubuntu合作带来在Ubuntu上回放Netflix节目的功能
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/08/netflix-ubuntu.jpg)

**我们[上个月见到Netflix刚关闭了在Linux上的支持][1]，现在我们只需几个简单的步骤就可以在Ubuntu桌面上启用HTML 5视频流了。

现在Netflix想要更近一部。它希望给Ubuntu带来真正的开箱即用的Netflix回放。现在需要的就是更新**网络安全**服务库。

### 原生Netflix? Neato. ###

在一封寄给Ubuntu开发者邮件列表的[邮件中][2]，Netflix的Paul Adolph解释了现在的情况：

> “如果NSS的版本是3.16.2或者更高的话，Netflix可以在14.02的稳定版Chrome中播放。如果版本超过了14.02,Netflix会作出一些改变来避免用户不得不对客户端进行一些修改才能播放。”

很快要发布的Ubuntu 14.10提供了更新的[NSS v3.17][3], Ubuntu 14.04 LTS — 这个被大多数用户使用的版本 — 目前提供v3.15.x。


NSS是一系列的库，支持多种安全功能的客户端和服务端应用，包括SSL，TLS，PKCS和其他安全标准。热终于让Ubuntu LTS用户可以用上原声HTML5 Netflix， Paul 问道：

>”让一个新的NSS版本进入更新流的过程是什么？或者有人可以给我提供正确的联系么？“

Netflix began offering HTML5 video playback on Windows 8.1 and OS X Yosemite earlier this year, negating the need for any extra downloads or plugins. The switch has been made possible through the [Encrypted Media Extension][4] spec.
Netflix今年早期时在Windows 8.1和OSX Yosemite上提供HTML5视频回放，而否定了任何额外的下载或者插件。现在可以通过[加密媒体扩展][4]特性来使用

虽然我们等待这讨论取得进展（并且希望可以完全解决），但是你仍可以在Ubuntu上[下面的指导来][5]修改HTML5 Netflix。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/09/netflix-linux-html5-nss-change-request

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins
[2]:https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2014-September/015048.html
[3]:https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.17_release_notes
[4]:http://en.wikipedia.org/wiki/Encrypted_Media_Extensions
[5]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins