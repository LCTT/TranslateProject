[#]: subject: "Raspberry Pi 4 Support is Coming to Fedora Linux"
[#]: via: "https://news.itsfoss.com/fedora-raspberry-pi-4/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14808-1.html"

Fedora Linux 37 即将正式支持树莓派 4
======

> 由于上游的一些改进，Fedora Linux 37 将引入对树莓派 4 的正式支持。

![Fedora raspberry pi][1]

Fedora Linux 的工作站版很适合台式机使用。不过，如果你想让它用于服务器或物联网需求，可以使用 Fedora ARM 项目。

它也支持树莓派，只是最新的树莓派 4 除外（其实早在 2019 年就发布了）。

现在，随着 [Phoronix][2] 发现的一项拟议的变化，看起来 Fedora Linux 37 可能会正式增加对树莓派 4 的支持。

### 目前还不是正式的...

到现在为止，对树莓派 4 的支持只是一个拟议的变化。

Fedora Linux 通常会公开其拟议的变化列表，以接受社区反馈并让其他人跟踪其进展。

所以，Fedora Linux 37 中的正式支持只有在得到 Fedora 工程指导委员会的批准后才会实施。

但是，**支持树莓派 4 的阻碍是什么呢？**

这是由于缺乏加速图形以及缺失一些功能，所以不方便增加对它的支持。

现在，随着新的 Linux 内核和 Mesa 的上游工作为树莓派 4 带来了图形加速功能，可以让他们启用对它的支持。

拟议的变化文件中提到：

> 上游现在支持使用 V3D GPU 的 OpenGL-ES 和 Vulkan 加速图形。对有线网络也有增强，支持 CM4/4B 上的 PTPv2。

此外，不仅仅是引入对树莓派 4 的支持，一些拟议的变化还涉及对树莓派 3 系列和 Zero 2 W 的改进。

因此，如果如人们所期望的那样发生，这应该是一个有趣的变化。

请注意，对树莓派 400 的 Wi-Fi 的支持不是这个过程的一部分，但对音频支持的测试将是这个变化的一部分。

你可以在 [拟议文件][3] 中阅读所有的细节。

你对 Fedora Linux 37 对树莓派 4 的支持有什么看法？请在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-raspberry-pi-4/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/fedora-coming-to-raspberry-pi.jpg
[2]: https://www.phoronix.com/scan.php?page=news_item&px=Fedora-37-Raspberry-Pi-4
[3]: https://fedoraproject.org/wiki/Changes/RaspberryPi4
