[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10774-1.html)
[#]: subject: (Enjoy Netflix? You Should Thank FreeBSD)
[#]: via: (https://itsfoss.com/netflix-freebsd-cdn/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

喜欢 Netflix 么？你应该感谢 FreeBSD
======

![][7]

Netflix 是世界上最受欢迎的流媒体服务之一。对，你已经知道了。但你可能不知道的是 Netflix 使用 [FreeBSD][1] 向你提供内容。

是的。Netflix 依靠 FreeBSD 来构建其内部内容交付网络（CDN）。

[CDN][2] 是一组位于世界各地的服务器。它主要用于向终端用户分发像图像和视频这样的“大文件”。

Netflix 没有选择商业 CDN 服务，而是建立了自己的内部 CDN，名为 [Open Connect][3]。

Open Connect 使用[自定义硬件][4]：Open Connect Appliance。你可以在下面的图片中看到它。它可以每秒处理 40Gb 的数据，存储容量为 248 TB。

![Netflix’s Open Connect Appliance runs FreeBSD][5]

Netflix 免费为合格的互联网服务提供商（ISP） 提供 Open Connect Appliance。通过这种方式，大量的 Netflix 流量得到了本地化，ISP 可以更高效地提供 Netflix 内容。

Open Connect Appliance 运行在 FreeBSD 操作系统上，并且[几乎完全运行开源软件][6]。

### Open Connect 使用最新版 FreeBSD 


你或许会觉得 Netflix 会在这样一个关键基础设施上使用 FreeBSD 的稳定版本，但 Netflix 会跟踪 [FreeBSD 最新/当前版本][8]。Netflix 表示，跟踪“最新版”可以让他们“保持前瞻性，专注于创新”。

以下是 Netflix 跟踪最新版 FreeBSD 的好处：

* 更快的功能迭代
* 更快地使用 FreeBSD 的新功能
* 更快的 bug 修复
* 实现协作
* 尽量减少合并冲突
* 摊销合并“成本”

> 运行 FreeBSD “最新版” 可以让我们非常高效地向用户分发大量数据，同时保持高速的功能开发。
>
> Netflix

请记得，甚至[谷歌也使用 Debian][9] 测试版而不是 Debian 稳定版。也许这些企业更喜欢最先进的功能。

与谷歌一样，Netflix 也计划向上游提供代码。这应该有助于 FreeBSD 和其他基于 FreeBSD 的 BSD 发行版。

那么 Netflix 用 FreeBSD 实现了什么？以下是一些统计数据：

> 使用 FreeBSD 和商业硬件，我们在 16 核 2.6 GHz CPU 上使用约 55％ 的 CPU，实现了 90 Gb/s 的 TLS 加密连接。
>
> Netflix

如果你想了解更多关于 Netflix 和 FreeBSD 的信息，可以参考 [FOSDEM 的这个演示文稿][10]。你还可以在[这里][11]观看演示文稿的视频。

目前，大型企业主要依靠 Linux 来实现其服务器基础架构，但 Netflix 已经信任了 BSD。这对 BSD 社区来说是一件好事，因为如果像 Netflix 这样的行业领导者重视 BSD，那么其他人也可以跟上。你怎么看？

--------------------------------------------------------------------------------

via: https://itsfoss.com/netflix-freebsd-cdn/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.freebsd.org/
[2]: https://www.cloudflare.com/learning/cdn/what-is-a-cdn/
[3]: https://openconnect.netflix.com/en/
[4]: https://openconnect.netflix.com/en/hardware/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/netflix-open-connect-appliance.jpeg?fit=800%2C533&ssl=1
[6]: https://openconnect.netflix.com/en/software/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/netflix-freebsd.png?resize=800%2C450&ssl=1
[8]: https://www.bsdnow.tv/tutorials/stable-current
[9]: https://itsfoss.com/goobuntu-glinux-google/
[10]: https://fosdem.org/2019/schedule/event/netflix_freebsd/attachments/slides/3103/export/events/attachments/netflix_freebsd/slides/3103/FOSDEM_2019_Netflix_and_FreeBSD.pdf
[11]: http://mirror.onet.pl/pub/mirrors/video.fosdem.org/2019/Janson/netflix_freebsd.webm
