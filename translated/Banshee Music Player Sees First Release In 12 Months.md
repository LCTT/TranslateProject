音乐播放器将在12个月内首次发布
================================================================================

就像等待首张专辑一样，实际上Banshee音乐播放器的粉丝们也等待了很长一段时间了——12个月了。

[Banshee 2.9.0版本的发布][1], 在通往下一个稳定版本道路上的首个里程碑 (Banshee 3.0, 真正的粉丝)，修复了36个漏洞，实现了应用移植到GTK3（绝对不是任何简单的事情）并且增加了音乐与运行塞班系统设备同步的功能。

*所有的3 N95用户可能会激动的功能*

其他改进包括：

- 支持GNOME软件市场上架
- 提交成功的Scrobble将会更快
- AMR文件导入
- 更精确的寻找
- 针对Unity & GNOME Shell的关键字寻找
- 现在能够在会话间记住DAP源

距离最新版发布的时间将不会太长。 我很看好Banshee [一个支持专辑封面浏览的播放器][2]。

**获得Banshee 2.9.0**

目前位置还没有任何关于这个最新版本什么时候才能在Ubuntu上可用的消息。

但是，如果你想为安装它做准备的话，你可以添加Banshee团队的PPA。这能在不远的将来，升级最新的Banshee或者任何需要关联它而运行的程序时会用到。

    sudo add-apt-repository ppa:banshee-team/ppa
    sudo apt-get update && sudo apt-get install banshee

一旦安装完成，Banshee能够通过Unity Dash，GNOME Shell活动覆盖（activities overlay）或者Mint Menu启动。

--------------------------------------------------------------------------------

来自: http://www.omgubuntu.co.uk/2013/10/banshee-music-player-2-9-0-released

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[SCUSJS][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[SCUSJS]:http://blog.csdn.net/scusjs
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://banshee.fm/download/archives/2-9-0/
[2]:http://www.omgubuntu.co.uk/2013/10/coverart-browser-for-linux-music-players