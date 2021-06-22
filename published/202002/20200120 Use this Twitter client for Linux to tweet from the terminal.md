[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11858-1.html)
[#]: subject: (Use this Twitter client for Linux to tweet from the terminal)
[#]: via: (https://opensource.com/article/20/1/tweet-terminal-rainbow-stream)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用这个 Twitter 客户端在 Linux 终端中发推特
======

> 在我们的 20 个使用开源提升生产力的系列的第十篇文章中，使用 Rainbow Stream 跟上你的 Twitter 流而无需离开终端。

![](https://img.linux.net.cn/data/attachment/album/202002/06/113720bwi55j7xcccwwwi0.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 通过 Rainbow Stream 跟上Twitter

我喜欢社交网络和微博。它快速、简单，还有我可以与世界分享我的想法。当然，缺点是几乎所有非 Windows 的桌面客户端都对是网站的封装。[Twitter][2] 有很多客户端，但我真正想要的是轻量、易于使用，最重要的是吸引人的客户端。

![Rainbow Stream for Twitter][3]

[Rainbow Stream][4] 是好看的 Twitter 客户端之一。它简单易用，并且可以通过 `pip3 install rainbowstream` 快速安装。第一次运行时，它将打开浏览器窗口，并让你通过 Twitter 授权。完成后，你将回到命令行，你的 Twitter 时间线将开始滚动。

![Rainbow Stream first run][5]

要了解的最重要的命令是 `p` 暂停推流、`r` 继续推流、`h` 得到帮助，以及 `t` 发布新的推文。例如，`h tweets` 将提供发送和回复推文的所有选项。另一个有用的帮助页面是 `h messages`，它提供了处理直接消息的命令，这是我妻子和我经常使用的东西。还有很多其他命令，我会回头获得很多帮助。

随着时间线的滚动，你可以看到它有完整的 UTF-8 支持，并以正确的字体显示推文被转推以及喜欢的次数，图标和 emoji 也能正确显示。

![Kill this love][6]

关于 Rainbow Stream 的*最好*功能之一就是你不必放弃照片和图像。默认情况下，此功能是关闭的，但是你可以使用 `config` 命令尝试它。

```
config IMAGE_ON_TERM = true
```

此命令将任何图像渲染为 ASCII 艺术。如果你有大量照片流，它可能会有点多，但是我喜欢。它有非常复古的 1990 年代 BBS 感觉，我也确实喜欢 1990 年代的 BBS 场景。

你还可以使用 Rainbow Stream 管理列表、屏蔽某人、拉黑某人、关注、取消关注以及 Twitter API 的所有其他功能。它还支持主题，因此你可以用喜欢的颜色方案自定义流。

当我正在工作并且不想在浏览器上打开另一个选项卡时，Rainbow Stream 让我可以留在终端中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://twitter.com/home
[3]: https://opensource.com/sites/default/files/uploads/productivity_10-1.png (Rainbow Stream for Twitter)
[4]: https://rainbowstream.readthedocs.io/en/latest/
[5]: https://opensource.com/sites/default/files/uploads/productivity_10-2.png (Rainbow Stream first run)
[6]: https://opensource.com/sites/default/files/uploads/day10-image3_1.png (Kill this love)
