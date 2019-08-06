[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11193-1.html)
[#]: subject: (OpenHMD: Open Source Project for VR Development)
[#]: via: (https://itsfoss.com/openhmd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

OpenHMD：用于 VR 开发的开源项目
======

> 在这个时代，有一些开源替代品可满足你的所有计算需求。甚至还有一个 VR 眼镜之类的开源平台。让我们快速看一下 OpenHMD 这个项目。

![][5]

### 什么是 OpenHMD？

![][1]

[OpenHMD][2] 是一个为沉浸式技术创建开源 API 及驱动的项目。这类技术包括带内置头部跟踪的头戴式显示器。

它目前支持很多系统，包括 Android、FreeBSD、Linux、OpenBSD、mac OS 和 Windows。它支持的[设备][3]包括 Oculus Rift、HTC Vive、DreamWorld DreamGlass、Playstation Move 等。它还支持各种语言，包括 Go、Java、.NET、Perl、Python 和 Rust。

OpenHMD 项目是在 [Boost 许可证][4]下发布的。

### 新版本中的更多功能和改进功能

最近，OpenHMD 项目[发布版本 0.3.0][6]，代号为 Djungelvral（[Djungelvral][7] 是来自瑞典的盐渍甘草）。它带来了不少变化。

这次更新添加了对以下设备的支持：

  * 3Glasses D3
  * Oculus Rift CV1
  * HTC Vive 和 HTC Vive Pro
  * NOLO VR
  * Windows Mixed Reality HMD 支持
  * Deepoon E2
  * GearVR Gen1

OpenHMD 增加了一个通用扭曲着色器。这一新增功能“可以方便地在驱动程序中设置一些变量，为着色器提供有关镜头尺寸、色差、位置和 Quirks 的信息。”

他们还宣布计划改变构建系统。OpenHMD 增加了对 Meson 的支持，并将在下一个 （0.4） 版本中将删除对 Autotools 的支持。

OpenHMD 背后的团队还不得不删除一些功能，因为他们希望他们的系统适合所有人。由于 Windows 和 mac OS 对 HID 头的兼容问题，因此禁用了对 PlayStation VR 的支持。NOLO 有一堆固件版本，很多都会有小改动。OpenHMD 无法测试所有固件版本，因此某些版本可能无法正常工作。他们建议升级到最新的固件版本。最后，几个设备仅提供有限的支持，因此不包含在此版本中。

他们预计将加快 OpenHMD 发布周期，以便更快地获得更新的功能并为用户提供更多设备支持。他们优先要做的是“让当前在主干分支中禁用的设备在下次发布补丁时能够试用，同时让支持的头戴式显示器支持位置跟踪。”

### 最后总结

我没有 VR 设备而且从未使用过。我相信它们有很大的潜力，甚至能超越游戏。我很兴奋（但并不惊讶）有一个开源实现会去支持许多设备。我很高兴他们专注于各种各样的设备，而不是专注于一些非品牌的 VR 的努力。

我希望 OpenHMD 团队做得不错，并希望他们创建一个平台，让它们成为 VR项目。

你曾经使用或看到过 OpenHMD 吗？你有没有使用 VR 进行游戏和其他用途？如果是，你是否用过任何开源硬件或软件？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/openhmd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/openhmd-logo.png?resize=300%2C195&ssl=1
[2]: http://www.openhmd.net/
[3]: http://www.openhmd.net/index.php/devices/
[4]: https://github.com/OpenHMD/OpenHMD/blob/master/LICENSE
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/virtual-reality-development.jpg?ssl=1
[6]: http://www.openhmd.net/index.php/2019/07/12/openhmd-0-3-0-djungelvral-released/
[7]: https://www.youtube.com/watch?v=byP5i6LdDXs
[9]: http://reddit.com/r/linuxusersgroup
