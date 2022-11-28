[#]: subject: (SonoBus: An Open Source Peer-to-Peer Audio Streaming App with Cross-Platform Support)
[#]: via: (https://itsfoss.com/sonobus/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13405-1.html)

SonoBus：支持跨平台的开源点对点音频流应用
======

![](https://img.linux.net.cn/data/attachment/album/202105/19/122610n5qgu4443jf4nf4k.jpg)

> 一个有趣的开源点对点音频流应用，它提供了一个简单的用户界面和强大的功能。

### SonoBus: 跨平台音频流应用

如今，音频流服务在听音乐时非常受欢迎。然而，本地音乐集仍然是一种有用的方式，这不需要一直连接到互联网。

尽管流媒体音乐服务很方便，但你并不真正拥有这些音乐。因此，如果出现许可问题，该平台可能会删除你最喜欢的音乐，而你对此无能为力。

而有了本地音乐音乐集，你就不会遇到这个问题了。但是，你如何通过设备网络串流你本地的音乐，或者与一个小组分享？

![][1]

SonoBus 可以成为解决这个问题的办法。不仅仅限于音乐，还包括任何音频，如与一群朋友远程练习音乐或合作制作音乐，为什么不呢？

让我们来看看它提供了什么。

### SonoBus 的功能

![][2]

SonoBus 使用起来比较简单，但提供的功能可能会让人震惊。因此，在继续使用之前，你可能想先知道它能让你做什么：

  * 能够连接到多个用户
  * 创建一个有可选密码的小组
  * 分享来自你的麦克风的音频输入
  * 分享来自文件的音频流
  * 支持单声道/立体声
  * 组内播放
  * 录制所有人的音频
  * 能够使个别用户或所有人都静音
  * 可以通过互联网或本地网络连接
  * 支持节拍器，用于协作制作音乐或远程练习课程
  * 支持高质量的音频，最高可达 256Kbps
  * 输入混音器
  * 支持声相
  * 支持有用的效果器（噪声门、压缩器和均衡器）
  * 可在 JACK 和 ALSA 下工作
  * 跨平台支持（Windows、macOS、Android、iOS 和 Linux）

虽然我试图提到所有的基本功能，但你可以在效果器的帮助下得到非常多的控制，来调整音量、质量、延迟，以及音频效果。

![][3]

它最好的一点是**跨平台支持**，这使它成为任何用户群的有趣选择，而无论你出于什么原因要串流音频。

### 在 Linux 中安装 SonoBus

无论你使用什么 Linux 发行版，你都可以轻松地安装 [Snap 包][4]或 [Flatpak 包][5]。如果你不想使用它们，你可以手动添加官方仓库来安装：

```
echo "deb http://pkg.sonobus.net/apt stable main" | sudo tee /etc/apt/sources.list.d/sonobus.list

sudo wget -O /etc/apt/trusted.gpg.d/sonobus.gpg https://pkg.sonobus.net/apt/keyring.gpg

sudo apt update && sudo apt install sonobus
```

你也可以通过其官方网站为你喜欢的平台下载它。

- [SonoBus][6]

### 总结

SonoBus 是一个令人印象深刻的音频流应用，有很多潜在的用途，但它也有一些问题，可能不是每个人的完美解决方案。

例如，我注意到桌面应用占用大量的系统资源，所以这对较旧的系统来说可能是个问题。

另外，Play Store 上的安卓应用仍处于早期访问阶段（测试版）。在我的快速测试中，它工作符合预期，但我已经很久没有使用它了。因此，当依靠它进行跨平台会话时，可能会出现预期的小问题。

在任何情况下，它都适用于每种用例的大量功能。如果你还没有使用过，请试一试。

--------------------------------------------------------------------------------

via: https://itsfoss.com/sonobus/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonobus-screenshot.png?resize=800%2C605&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonus-screenshot-1.png?resize=800%2C619&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonobus-official.png?resize=800%2C545&ssl=1
[4]: https://snapcraft.io/sonobus
[5]: https://flathub.org/apps/details/net.sonobus.SonoBus
[6]: https://sonobus.net/
