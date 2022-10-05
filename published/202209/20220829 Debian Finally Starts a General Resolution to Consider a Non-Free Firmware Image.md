[#]: subject: "Debian Finally Starts a General Resolution to Consider a Non-Free Firmware Image"
[#]: via: "https://news.itsfoss.com/debian-non-free/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14988-1.html"

Debian 终于开始讨论非自由固件镜像了
======

> Debian 终于开始考虑将非自由固件纳入一般决议中了。那么，将会如何呢？

![Debian 终于开始考虑非自由固件映像的一般决议][1]

由于其稳定性和新功能之间的平衡的做法，Debian 是最受欢迎的 Linux 发行版之一。

但是，它并没有配备任何非自由固件。

对于想在新硬件上使用 Debian 的用户来说，这已经成为一个问题。

大多数最新的设备和配置都需要非自由固件来使其工作，这包括 Wi-Fi、图形显示等等。

为了解决这个问题，前 Debian 项目负责人、开发者 Steve McIntyre 已经对此积极讨论了一段时间。最近在 DebConf 22 会议上，正如 [Geeker's Digest][2] 所发现的那样，Steve 谈到了修复固件的混乱局面，更好地向用户和开发者表明了这一点。

现在社区中讨论的进展是，看起来 Debian 已经启动了一项一般决议，让其利益相关者投票决定如何处理非自由固件的问题。

### Debian 的一般决议提案

这个一般决议案有四个提案（LCTT 译注：原文和官方提案说明不够清晰，我根据理解重新梳理了）：

* 提案 A：改变原有的官方镜像集（安装镜像和实况镜像），Debian 将在官方镜像中包含非自由固件包。包含的固件将在检测到需求时默认启用。然而，它也将包括让用户在启动时禁用的方法。（截止本文发表时的提案支持人数：17）
* 提案 B：不改变原有的镜像集，保留原来的不包含非自由固件的镜像，另外单独提供包含非自由固件的官方镜像。新的镜像下载链接将更醒目以方便新用户找到它们，而原来的镜像的视觉优先级将变低。（截止本文发表时的提案支持人数：10）
* 提案 C：和提案 B 类似，在用户下载不包含自由固件的镜像时，提醒他们还有包含非自由固件的镜像可供下载。（截止本文发表时的提案支持人数：6）
* 提案 D：继续遵守《<ruby>Debian 社会契约<rt>Debian Social Contract</rt></ruby>》第 1 节和第 5 节的精神，继续保持现状，不在 Debian 中包含任何非自由软件，但支持它们的使用，并欢迎其他人分发这样的作品。（截止本文发表时的提案支持人数：6）

这些是一些有趣的建议。我认为提案 A 对所有人都很方便，同时给高级用户禁用非自由固件的机会。

你可以在 [官方网页][3] 中了解更多关于一般决议的信息。

你怎么看？

### 将非自由固件纳入官方发行版中

至于目前的情况，你可以找到带有非自由固件的“**非官方**”的 Debian 镜像。

然而，并不是每个用户都知道它，即使它在 Debian 的下载页面上被宣传，“**非官方**”的说法也不会让用户比推荐的镜像更喜欢。

此外，当用户可以选择任何基于 Ubuntu 的发行版或 Ubuntu 作为替代品时，期望他们安装非自由固件是违反直觉的。

不仅仅限于这些问题，Steve 在他的 [博客][4] 中还提到了其他一些问题，包括：

* 维护独立的非自由镜像是很耗时的。
* 由于缺乏非自由固件，许多用户不喜欢官方镜像。

*那么，你认为 Debian 的一般决议的投票结果是什么？一个单独的介质镜像？还是把它包括在官方镜像中？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/debian-non-free/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/wordpress/2022/07/debian-non-free-firmware.jpg
[2]: https://www.geekersdigest.com/debian-on-the-verge-to-include-non-free-firmware-in-official-releases/
[3]: https://www.debian.org/vote/2022/vote_003#timeline
[4]: https://blog.einval.com/2022/04/19#firmware-what-do-we-do
