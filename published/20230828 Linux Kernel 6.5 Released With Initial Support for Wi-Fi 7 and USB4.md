[#]: subject: "Linux Kernel 6.5 Released With Initial Support for Wi-Fi 7 and USB4"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-5-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16140-1.html"

Linux 内核 6.5 发布，首次支持 Wi-Fi 7 和 USB4
======

![][0]

> Linux 内核 6.5 进行了一系列的改善，阅读此文以了解详情。

新版的 Linux 内核已经发布！

**Linux 6.5 内核** 已经推出，此次更新在 Linux 6.4 内核的基础上进行了进一步的开发，带来了值得注意的改变和新特性。

Linus Torvalds 表示，这是一次相对顺畅的发布：

> 上周并没有发生任何异常或惊人的事情，因此没有理由延迟 6.5 版的发布。
>
> 我仍有这样一个担忧，似乎是因为许多人都在度假，部分导致整体状态比较平静。但目前这次发布进展顺利，所以这可能只是我多虑了。上周的最大更新就仅仅是对我们自我测试的几次修订。

### 🆕 Linux 内核 6.5：新增了哪些功能？

需要说明的是，这次发布的版本不是长期支持（LTS）版本。如果你期望使用最新的功能，那么这个版本就是为你准备的。否则，除非此版本解决了你关心的特定问题或者能有效提升性能，否则没有升级的必要。

以下是新版内核发布的主要亮点：

  * AMD FreeSync 视频的即插即用支持
  * AMD CPU 默认启用 P-State 主动模式
  * 对 USB4 v2 和 WiFi 7 的初步支持
  * ASUS ROG Ally 音效优化

### 开箱即用的 AMD FreeSync 视频支持

![][0A]

在这次发布中，重新引入的一项优秀功能是默认开启的 AMD FreeSync 视频模式支持。此特性在 Linux 内核 5.8 版本中首次引入，后因错误而被回滚。

启用 AMD FreeSync 模式后，通过将显示器的刷新率与显卡的帧率相匹配，可以显著减少游戏及视频中的屏幕撕裂和迟滞现象。

用技术词汇来描述，当它在 Linux 内核 5.8 版本中首次发布时，它的描述是：

> 这个补丁集启用了 FreeSync 视频模式的使用场景，这样用户空间可以请求一个 FreeSync 兼容的视频模式，因此，切换到此模式不会触发屏幕黑屏。

这对内容创作者和游戏玩家都非常有用。

但请注意，你需要一个兼容 FreeSync 的显示器和显卡才能充分利用它。

### AMD CPU 默认启用 P-State 主动模式

现代 AMD CPU，特别是那些基于 Zen 2 及更新架构构建的，将默认采用 amd-pstate 作为 CPU 性能调整驱动。之前，CPU 的频率调整机制默认由 CPUFreq 负责。

现在，amd-pstate 提供了三种模式：主动、被动和引导式自主模式。在这次发布中，默认启用了主动模式，从而取代了之前 Linux 内核 6.4 版本中使用的引导式自主模式。

据 Phoronix 的一些 [基准测试][1] 结果显示，发现 amd-pstate 的性能优于 CPUFreq。

你可以参考这个 [提交][2] 了解更多详情。

### ASUS ROG Ally 声音优化

![][2A]

ASUS ROG Ally 是一款使用 AMD Z1 和 Z1 Extreme SoCs 驱动的 Windows 手持式游戏电脑，直接竞争的对手是非常知名的 Steam Deck。它在今年七月发布。

使用 Linux 的游戏玩家如果拥有 ASUS ROG Ally，可以期待看到一个针对系统音频设备的修补发布，感谢这个 [提交][3]。

### 对 USB4 v2 & WiFi 7 的初始支持

![][3A]

下一代无线标准 - WiFi 7 - 的开发工作已经进行了一段时间。WiFi 7 支持 6Ghz 频段，最大数据传输速率达到 23 Gbps！

与此同时，下一代 USB4 标准的开发工作也已开始。USB4 支持 80 Gbps 的数据传输速率！

通过对 WiFi 的这个 [合并][4] 和对 WiFi 7 的 [拉取请求][5]，对二者的早期支持已经被嵌入到 Linux 6.5 内核中。

### 🛠️ 其他改动与提升

除了主要的亮点外，还有一些值得一提的更新：

  * 对英特尔 P-State 的 CPU 进行了缩放修复
  * 对 Btrfs 的性能进行了改进，以及其他存储优化
  * 对最新的 Xbox 控制器增加了 Rumble 支持
  * 对 AMD Radeon RX 7000 系列显卡进行了超频支持
  * 对 AMD 和英特尔图形驱动进行了各种优化和改进
  * 和以往一样，更多的 Rust 代码转换

[官方发布公告][6] 将给出自从上一个候选版释放以后的摘要。如果你对技术细节有兴趣，不妨参考 [变更日志][7]。

### 安装 Linux 内核 6.5

如果你使用像 Arch 这样的滚动更新发行版，可以很容易地升级至 Linux 内核 6.5。在新版本发布后的一段时间，这些发行版本会提供最新的内核。

另一方面，使用 Ubuntu 及其衍生版本的用户，可以期待在 Ubuntu 23.10 版本中看到这次的 Linux 内核发布。如果你使用的是像 Pop OS 和 Linux Lite 这样的发行版，可能会更早的见到这版内核发布。

但是如果你希望在基于 Ubuntu 的系统里快速尝试，可以按照我们的指南进行（请注意，这是自行承担风险！👀）。

你可以在它的 [官方网站][8] 上下载最新的 Linux 内核 的 Tarball（_发布之后可能需要一段时间才能下载到_）。

💬 欢迎在评论区分享你对最新内核发布的看法。


--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-5-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/review/amd-pstate-epp-ryzen-mobile
[2]: https://lore.kernel.org/lkml/CAJZ5v0iQk8ytZ0953_HCWU6Vr62J9UeC8Z9pirOHAfjpbvcOfg@mail.gmail.com/
[2A]: https://news.itsfoss.com/content/images/2023/08/linux-kernel-6-5-handheld.png
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=724418b84e6248cd27599607b7e5fac365b8e3f5
[3A]: https://news.itsfoss.com/content/images/2023/08/linux-kernel-6-5-wifi.png
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3a8a670eeeaa40d87bd38a587438952741980c18
[5]: https://lore.kernel.org/lkml/ZKKejqr0Db74u8TB@kroah.com/
[6]: https://lore.kernel.org/lkml/CAHk-=wgmKhCrdrOCjp=5v9NO6C=PJ8ZTZcCXj09piHzsZ7qqmw@mail.gmail.com/
[7]: https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.5
[8]: https://www.kernel.org/
[0]: https://news.itsfoss.com/content/images/size/w1304/2023/08/linux-6-5-release.png
[0A]: https://news.itsfoss.com/content/images/2023/08/linux-kernel-6-5-amd.png