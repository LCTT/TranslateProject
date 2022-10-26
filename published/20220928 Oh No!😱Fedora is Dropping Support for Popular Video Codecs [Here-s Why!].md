[#]: subject: "Oh No!😱Fedora is Dropping Support for Popular Video Codecs [Here's Why!]"
[#]: via: "https://news.itsfoss.com/fedora-drops-vaapi-codec/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15113-1.html"

哦，不！Fedora 正在放弃对流行的视频编解码器的支持
======

> Fedora 37（和 36）可能不再允许你使用一些流行的编解码器来方便地使用视频的图形加速功能。

![哦，不！😱Fedora正在放弃对流行视频编解码器的支持[这里有原因！]][1]

Fedora 是一个流行的 Linux 发行版，迎合了那些希望在他们的工作站（和服务器）上使用最先进技术的用户。

它没有搭载任何专有组件，默认情况下坚持使用完全开源的软件库。

虽然这对一些人来说已经很不方便了，但现在看来，另一个变化可能会困扰期待 Fedora 37 的用户。

[最近在 Fedora 上的一个 Mesa 的提交][2] 告诉我们，由于法律问题，**H.264、H.265 和 VC-1** 编解码器的视频加速 API（VAAPI）的支持已经被禁用。

这一变化可能也会被回传到 Fedora 36。

> 💡 H.264 是大多数视频行业使用的主流视频编解码器。
>
> 例如，苹果公司广泛使用 H.264 编解码器，用于 iPhone 手机拍摄的照片和视频。你可以阅读此 [文档][3] 来了解更多。

Fedora 项目论坛的一位成员 [首先发现][4] 了 Fedora 中的这一变化，他将其描述为 “*F36 的一大退步*”。

### 这对 Fedora 用户来说是坏消息吗？

是的，基本上是的。

**主要是，它将影响使用开源驱动程序的 AMD GPU 用户**，阻止他们使用 **GPU 加速** 来播放需要使用这些编解码器的视频内容。

此外，它还会影响到 **任何使用开源图形驱动的用户**，即使他们在英特尔芯片上运行 iGPU。Fedora 开发者还没有对此提供任何澄清，但你可以自己测试一下。

如果你在英伟达显卡上使用专有驱动程序，你就没有什么可担心的。

运行旧硬件的用户也可能有问题，他们的系统可能不支持这些编解码器。

这些编解码器最常用在你从 BT 或各种服务中下载的视频中，这些视频还没有转移到更新一代的编解码器（如 **AV1** 和 **VP9**）。

我相信，这是互联网上的**大部分**视频的情况。

一些流媒体平台也使用这些编解码器在其各自的平台上提供内容，这可能导致用户在试图通过其服务访问内容时面临问题。

### 这是否影响到每个人？

如果你是那些观看 YouTube 视频的人，不使用任何需要这些编解码器的视频的平台或下载它们，你就不会有任何问题。

### Fedora 正在避免法律上的麻烦

还没有人起诉 Fedora 或强迫他们这样做。然而，正如 [Phoronix][6] 所指出的，Mesa 的一个变化最近允许开发者选择性地禁用编解码器，以帮助避免法律纠纷和软件专利冲突。

因此，为了避免法律上的混乱，Fedora 进行了这一改变。

H.264 和 H.265 的专利属于一家名为 [MPEG LA][7] 的公司，该公司专门用于持有视频编解码器和显示标准领域的专利。

而 VC-1 的专利属于 [SMPTE][8]，这是一个由媒体和娱乐机构的专业人士管理的团体。

考虑到用户在购买显卡时已经支付了使用这些编解码器的许可，我们仍然不确定为什么会这样。你可以在 [Fedora 的法律列表会话][9] 中阅读更多相关信息。

### 可能的解决方法是什么？

**显然**，你必须依赖基于 CPU 的解码了。当然，你也可以使用官方或第三方的 Mesa 构建版本。

Flatpak 应用程序可能允许你观看图形加速的视频内容而没有问题。但是，这要取决于软件的维护者。

但是，对于大多数用户来说，这可能是一个不方便的解决方案。

另一个解决方法可能是在旨在包含第三方应用程序的 RPM Fusion 仓库中单独包含支持 VAAPI 的编解码器。

然而，负责 Fedora RPM Fusion 仓库的开发者对维护 Fedora Mesa 3D 的复刻版本不感兴趣。该开发者提到：

> rpmfusion 基本上没有兴趣去打包和维护它，而且保持仓库与 Fedora 同步对我来说也不是一个优先事项。

![][10]

*💬 你对 Fedora 的这一变化有什么看法？请在下面的评论中告诉我们你的想法。*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-drops-vaapi-codec/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/fedora-dropping-support-for-popular-video-codecs.png
[2]: https://src.fedoraproject.org/rpms/mesa/c/94ef544b3f2125912dfbff4c6ef373fe49806b52?branch=rawhide
[3]: https://support.apple.com/en-us/HT207022
[4]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/PYUYUCM3RGTTN4Q3QZIB4VUQFI77GE5X/
[5]: https://youtu.be/ibXKKllz4xQ
[6]: https://www.phoronix.com/news/Mesa-Optional-Video-Codecs
[7]: https://en.wikipedia.org/wiki/MPEG_LA
[8]: https://en.wikipedia.org/wiki/Society_of_Motion_Picture_and_Television_Engineers
[9]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/M4LTGLHY5JX42IHC45WNWB5FH2JIFMAS/
[10]: https://news.itsfoss.com/content/images/2022/09/fedora-rpm-mesa.jpg
[11]: https://www.humblebundle.com/books/linux-no-starch-press-books?partner=itsfoss
