[#]: subject: "Google Chrome vs Chromium: What’s the difference?"
[#]: via: "https://itsfoss.com/chrome-vs-chromium/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14041-1.html"

Chrome 与 Chromium 有何不同？
======

![](https://img.linux.net.cn/data/attachment/album/202112/02/100436xj1u51jhrjuwhjfw.jpg)

Chrome 浏览器是最流行的网页浏览器。无论你是否喜欢使用它，Chrome 都能提供良好的用户体验。

尽管它可以在 Linux 上使用，但它不是一个开源的网页浏览器。

而且，如果你喜欢 Chrome 的外观和感觉，但又想使用一个开源的解决方案，Chromium 是一个选择。

但是，Chrome 浏览器不是基于 Chromium 的吗？（是的。）而且，它也是由谷歌开发的吧？（也是的。）

那么，Chrome 和 Chromium 之间有什么区别呢？在这篇文章中，我们将深入了解它们，并介绍一些对它们进行比较的基准。

### 用户界面

![Chrom 和 Chromium 在 Zorin OS 16 上并排运行][1]

Chrome 和 Chromium 的用户界面非常相似，除了一些细微的区别。

例如，我注意到 Chrome 的系统标题栏和边框一开始就被默认禁用了。相比之下，在我测试的时候，Chromium 默认启用了它们。

你还可以注意到在 Chrome 的地址栏里有一个分享按钮，而在 Chromium 上却没有。

这并不是大的视觉差异，而只是根据现有的功能进行了一系列的 UI 调整。所以，你可以预期它们的用户体验类似，而在底层有所不同。如果你在意用户界面，这两款浏览器应该都很适合你。

### 开源与专有代码

![][2]

Chromium 是完全开源的，这意味着任何人都可以（根据许可证）按照自己的意愿使用和修改代码。你可以在其 [GitHub 镜像][3] 上查看其源代码。

这就是为什么你会发现有许多 [基于 Chromium 的浏览器][4]，如 Brave、Vivaldi 和 Edge。

有这么多的选择，你可以选择你最喜欢的那个。

另一方面，Chrome 在 Chromium 中加入了刚刚专有的代码，使 Chrome 成为了专有浏览器。例如，人们可以复刻 Brave，但不能复刻谷歌 Chrome，而限制使用其中的谷歌特定代码/工作。

对于终端用户来说，开源与否并不影响用户体验。然而，对于一个开源项目，你可以得到更多的透明度，而不需要依靠公司来沟通他们打算改变什么，以及他们在浏览器上做什么。

所以，是的，如果你不喜欢专有代码，Chromium 就是你的选择。

### 功能差异

谷歌不希望其竞争对手拥有类似的能力，这并不奇怪。因此，谷歌一直在 [锁定 Chromium 并在其中禁用了很多谷歌特有的能力][5]。

因此，你会发现这两个浏览器的能力有一些差异。

不仅如此，由于 Chromium 是开源的，你可能会注意到一些不便之处。别担心，我将在下面指出其中的关键差异。

Chrome  | Chromium
---|---
有签到和同步功能 | 无签到和同步功能
支持媒体编解码器以使用 Netflix | 需要手动安装编解码器

对于初学者来说，在 Chromium 中不再能使用由谷歌支持的登录/同步功能。它曾经支持签到和同步，直到谷歌决定将其从开源项目中删除。

接下来，Chrome 内置了对高质量媒体编解码器的支持。因此，你可以加载来自 Netflix 的内容。但是，在 Chromium 中没有这些。

![Netflix 在 Chromium 中默认不能工作][6]

从技术上讲，Chromium 并不包括 _Widevine 内容解密模块_。因此，你需要手动安装所需的编解码器，以使大部分东西都能工作。

不过，你在这两个浏览器上你都可以播放苹果音乐等平台的内容，应该不会有任何问题。

### 安装及最新更新

你可以在几乎任何平台上安装 Chrome。Linux 也不例外。只需前往其官方网站，抓取 DEB/RPM 包即可快速安装。安装后的应用程序也会自动更新。

![][7]

有几个平台上安装 Chromium 并不那么简单。曾经有一段时间，一些 Linux 发行版将 Chromium 作为默认浏览器。那是过去的日子了。

即使在 Windows 上，Chromium 的安装和更新也不像 Chrome 那样顺利。

在 Linux 上，安装 Chromium 则完全是另一回事。像 Ubuntu 这样的流行发行版把它打包成一个沙盒式的 Snap 应用程序。

即使你试图用终端安装它，希望能从 APT 库中得到它，但它又是一个 Snap。

![][8]

使用 Snap 软件包，你可能会面临与你的自定义桌面主题相融合的问题。Snap 应用程序的启动时间也会更长。

![][9]

而且，如果你构建它并手动安装 Chromium，你就得手动更新它。

### 隐私角度

Chrome 对大多数用户来说应该足够好了。但是，如果你担心你的隐私，Chrome 会追踪使用信息和一些与浏览有关的信息。

最近，[谷歌推出了一个新的 Chrome API][10]，可以让网站检测到你什么时候闲着，什么时候不闲着。虽然这是一个巨大的隐私问题，但并不是唯一的问题。

谷歌不断试验新的追踪用户的方法；例如，正如 [EFF][11] 所指出的那样，谷歌的 FLoC 实验并不受欢迎。

从技术上讲，他们声称他们想增强用户的隐私，而同时仍然提供广告机会。然而，就目前而言，这是一个不可能实现的任务。

相比之下，Chromium 在隐私方面的表现应该要好得多。然而，如果你讨厌你的浏览器中有任何与谷歌有关的东西，即使是最轻微的遥测，你应该试试 [UnGoogled Chromium][12]。

它是 Chromium，但没有任何谷歌组件。

### 浏览器性能

有各种各样的浏览器基准，可以让你了解到一个浏览器处理任务的能力如何。

考虑到网站上的高级网站应用和资源密集型的 JavaScript，如果一个网页浏览器的性能不好，当你打开许多活动的标签时，你的体验就会明显很糟糕。

[JetStream 2][13] 和 [Speedometer 2][14] 是两个流行的基准，可以给你处理各种任务和响应能力的性能估计。

除此之外，我还试用了 [Basemark Web 3.0][15]，它也是测试各种指标并给你一个综合分数。

![][16]

总体而言，Chrome 在此获胜。

但是，值得注意的是，在运行浏览器时，你的系统资源和后台进程会对性能产生不同的影响。因此，也要考虑到这一点。

### 你应该选择哪个？

之所以存在对浏览器的选择，是因为用户喜欢不同的东西。Chrome 提供了一个良好的功能集和用户体验。如果你以某种形式使用由谷歌提供的服务，Chrome 是一个简单的推荐。

然而，如果你担心隐私和专有代码，Chromium 或 UnGoogled Chromium，或任何其他基于 Chromium 的浏览器，如 Brave，可以是一个不错的选择。

这就是我在比较 Chrome 和 Chromium 时的全部看法。我愿意接受你的意见。评论区都是你的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/chrome-vs-chromium/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/chrome-chromium-ui.png?resize=800%2C627&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/open-source-proprietary.png?resize=800%2C450&ssl=1
[3]: https://github.com/chromium/chromium
[4]: https://news.itsfoss.com/chrome-like-browsers-2021/
[5]: https://news.itsfoss.com/is-google-locking-down-chrome/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/chromium-netflix.png?resize=800%2C541&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/google-chrome-version.png?resize=800%2C549&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-chromium.png?resize=800%2C440&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/chromium-version.png?resize=800%2C539&ssl=1
[10]: https://www.forbes.com/sites/zakdoffman/2021/10/02/stop-using-google-chrome-on-windows-10-android-and-apple-iphones-ipads-and-macs/
[11]: https://www.eff.org/deeplinks/2021/03/googles-floc-terrible-idea
[12]: https://github.com/Eloston/ungoogled-chromium
[13]: https://webkit.org/blog/8685/introducing-the-jetstream-2-benchmark-suite/
[14]: https://webkit.org/blog/8063/speedometer-2-0-a-benchmark-for-modern-web-app-responsiveness/
[15]: https://web.basemark.com/
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/chrome-chromium-benchmarks-1.png?resize=800%2C450&ssl=1
