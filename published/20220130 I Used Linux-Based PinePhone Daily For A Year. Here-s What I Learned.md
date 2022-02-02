[#]: subject: "I Used Linux-Based PinePhone Daily For A Year. Here’s What I Learned!"
[#]: via: "https://news.itsfoss.com/pinephone-review/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14235-1.html"

我的一年的 PinePhone 日常使用体验
======

> 它不是每个人的理想选择，但作为一个 Linux 爱好者，我喜欢用它做实验。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pinephone-review.png?w=1200&ssl=1)

当 Pine64 在 2019 年发布 PinePhone 时，没有人能够预见它将对移动 Linux、桌面 Linux 和隐私产生巨大的影响。

作为 [少数专为运行桌面 Linux 而设计的手机][1] 之一，它具有低端安卓手机的所有功能，同时又具有笔记本电脑的多功能性。不幸的是，桌面 Linux 就是这样：它是为台式机设计的，而不是为手机设计的。

幸运的是，由于 GNOME、KDE、Pine64 和众多 Linux 社区的惊人力量，全新的桌面环境、应用程序和发行版应运而生。其中一些比较知名的包括 Plasma Mobile、[Phosh][2]、Megapixels 和Mobian。

有了这些所有关键的部分，Pine64 需要做的就是销售 PinePhone，他们确实也卖出了 PinePhone。每一轮社区版（每个都预装了不同的发行版）的预购都收到了数千份订单，其中之一就是我的。

自从我在 2020 年 12 月收到我的设备后，PinePhone 一直是我日常生活中的重要组成部分，我在 2021 年全年都把它作为我的日常设备。以下是我使用它的经验。

### 它的性能就像糖浆一样

PinePhone 采用了全志 a64 系统芯片，它的功率只够完成最基本的手机任务。即使是简单的事情，如打开火狐浏览器，也需要将近 20 秒的时间，这无疑要“归功于”它仅有的 4 个核心。这与现代中高端安卓手机形成鲜明对比，所有这些手机都有至少 2GHz 的 8 核处理器。

幸运的是，社区再次介入，对数以千计的小型软件实施了优化。虽然性能仍然不如安卓系统的竞争对手，但这确实意味着 PinePhone 对于大多数手机任务来说是非常适用了，甚至在通过附带的底座使用外部显示器时，也可以使用一些面向桌面的应用程序。

即使它在这里和那里可能会有一点卡顿，PinePhone 在大多数情况下都有足够的能力。但是电池呢？它真的能续航一整天吗？

### 电池续航……没问题

![][4]

虽然我很想说，由于 PinePhone 的低功耗组件，电池续航想必是超棒的。但不幸的是，情况并非如此，即使在实施了所有节电改进措施后也是如此。

经过一夜的充电，我通常在早上阅读新闻，然后在午餐时间再读一些。尽管这相当于不到一个小时的屏幕开启时间，但电池仍然持续下降约 35%，使我在下午只剩下 65%。幸运的是，这并不是一个大问题，尤其是调制解调器的深度睡眠功能工作得很好。

补充一句，几乎所有的移动电话都会将其调制解调器放入深度睡眠模式，这基本上是关闭一切除了接收电话和短信所需的功能。然后，当你接到一个电话时，调制解调器会唤醒自己和 SoC，然后开始响铃。

根据我的经验，PinePhone 上深度睡眠的实施绝对很棒，没有错过任何一个电话。因此，考虑到其糟糕的开屏续航时间，PinePhone 的关屏续航相当惊人。我在最少使用的情况下，电池寿命一直能保持在 60 小时以上，这是我的 Galaxy S20 FE 无法比拟的。

### 不要期望有什么漂亮的照片

PinePhone 仅有的 500 万像素后置摄像头和更小的 200 万像素前置摄像头，不要指望能拍出专业级别的照片。甚至许多 USB 网络摄像头也能提供更好的图像质量，以及更多的常规功能。见鬼，PinePhone 的摄像头甚至不能够拍摄视频！

它所做的少量后期处理确实有助于提升一点照片质量，尽管还不足以让它们适合发到社交媒体上。作为比较，这里是用 iPhone 4S（2011 年）和 PinePhone（2019 年）拍摄的同一张照片。

![iPhone 4S](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/iphone-4s-vs-pinephone-camera.jpg?w=780&ssl=1)

![PinePhone](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pinephone-vs-iphone-4s-camera-scaled.jpg?w=780&ssl=1)

在古老的 SoC、普普通通的电池续航和可怜的相机之间，很明显 PinePhone 的硬件绝对不是它的强项。但软件能拯救它吗？

### 桌面环境还是移动环境？

在这个移动 Linux 的世界里，主要有三种桌面环境领域，它们是：

  * Plasma Mobile
  * Phosh
  * [Lomiri][5]

在我日常使用 PinePhone 的过程中，我大约花了 4 个月的时间使用每个环境。在这段时间里，我发现它们的功能、问题和成熟度各有不同，我会在这里讨论这些问题。

#### Plasma Mobile

![图片来源：KDE Plasma Mobile][6]

早在 2015 年 Plasma 5 发布之后，Plasma Mobile 已经默默地在后台开发了近 7 年。从最初的发布到 PinePhone 的发布，Plasma Mobile 背后的团队成功地创造了一个相当可用的移动桌面环境。

然而，随着 PinePhone 的发布，这一切都改变了。困扰 Plasma Mobile 的许多错误已经被解决了，而且也在改进用户界面方面付出了巨大的努力。

作为一个 KDE 项目，Plasma Mobile 广泛使用了 Kirigami，这导致了一个极其一致和移动友好的应用生态系统。此外，许多先前就有的 KDE 应用程序也能完美地扩展到该平台。

由于 Maui 项目刚刚发布了他们的 Maui Shell，这个应用生态系统得到了进一步的扩展（更多信息即将发布）。由于他们强大的实用程序套件，Plasma Mobile 是一个真正的安卓替代品。

然而，这并不是说 Plasma Mobile 是完美的。即使到了 2022 年，仍有一些残余的错误和问题。然而，这被其成熟的应用生态系统、对手势的广泛使用和对移动体验的专注所抵消。

#### Phosh

![PinePhone 上的 Phosh 截屏][7]

Phosh 主要由 Purism 开发，是相当于 Plasma Mobile 的 GTK。它最初是为 Librem 5 打造的，自 2018 年以来一直在开发。由于只有 4 年的历史，你可能会认为 Phosh 是不成熟的，但这与事实相差甚远。

事实上，在超过 3 个月的时间里，我从未遇到过 Phosh 的崩溃，相比之下，Plasma Mobile 没几天崩溃一次。当然，由于建立在 GTK 和其他 Gnome 技术之上，Phosh 有许多可用的应用程序。一些流行的应用程序可以完美地工作，包括：

  * Firefox
  * Geary
  * Headlines（Reddit 应用程序）
  * Megapixels（相机应用）
  * Gnome 地图

此外，许多为 Plasma Mobile 设计的应用程序也能完美运行，尽管它们使用 Kirigami。不幸的是，虽然有许多 GTK 应用程序，但它们并不像 Kirigami 应用程序一样适合各种环境，所以开发者必须专门使他们的应用程序与 Phosh 和 PinePhone 兼容。

此外，GTK 主要是一个面向桌面的 UI 工具包，这意味着诸如手势等功能，甚至让应用程序能够适应屏幕的功能，充其量是零散的，最糟糕的是不存在。

不过幸运的是，Purism 在默认的 Gnome 应用程序中投入了大量的工作，这些应用程序都是完全可用的，而且速度很快。

总的来说，Phosh 是非常可靠的，特别是对于台式机和笔记本电脑上的 Gnome 用户。然而，它也因为缺乏核心的移动功能和优化的应用程序而受到阻碍。

#### Lomiri

![Lomiri on the PinePhone][8]

我怀疑你是否听说过它，因为它最近才改了名字。它以前被称为 Unity 8，是 Ubuntu Touch 操作系统的默认桌面环境。它也可以在 Manjaro ARM 上使用。

由于使用 Qt Quick 构建，它可能是 PinePhone 最成熟的桌面环境。它很好地利用了手势来实现核心系统功能，并且有大量专门为它制作的应用程序。

然而，它的缺点是只能在 Ubuntu Touch 上使用，因为没有一个应用程序被移植到 Manjaro。因此，它的用户受制于 Ubuntu Touch 的“锁定”风格，类似于安卓和 iOS。

虽然这对典型的用户来说可能是件好事，但 PinePhone 的用户一般都是喜欢控制自己设备的手工爱好者，而 Ubuntu Touch 则使其变得更加困难。

### 操作系统

与任何以 Linux 为主的设备一样，它有大量的发行版和操作系统可用。在写这篇文章的时候，Pine64 维基列出了 21 个单独的操作系统，它们的完整度各有不同。

然而，在这些不同的操作系统中，有四个我在 PinePhone 上有很好的体验：

  * Manjaro ARM
  * Mobian
  * SailfishOS
  * Ubuntu Touch

虽然我不打算详细介绍它们，但它们都是很好的选择，对于大多数任务来说都是完美的功能。除了 SailfishOS 之外，它们都是开源的，而 SailfishOS 大部分是开源的。

### 关于安卓应用程序的说明

正如你现在可能已经猜到的，应用程序的支持可能有点问题。即使看到 PinePhone 上有近 400 个确认可以使用的应用程序，但与安卓和 iOS 的数百万个应用程序相比，这也是相形见绌。

幸运的是，有一些方法可以解决这个问题，最简单的是使用兼容层来模拟安卓应用。在这方面，Anbox 已经成为几年来的首选。

#### Anbox

如果说 WINE 是 Windows 的兼容层，那么 Anbox 对 Android 也是如此。安装后，或打开它，因为它预装在许多发行版中，就像运行一个命令来安装一个 APK 文件一样简单。

从这里开始，该应用程序的行为就像任何 Linux 应用程序一样，尽管在性能上有很大的影响。

最近，有一群人决定解决这个问题，创建了一个名为 Waydroid 的新项目。

#### Waydroid

Waydroid 是为 PinePhone 开发的安卓模拟器的最新尝试，即使在这个早期阶段，它看起来也非常有发展前景。由于安卓应用可以直接在硬件上运行，它的性能相当惊人，特别是与 Anbox 相比。

因此，许多极为流行的应用程序都能完美运行，如 F-Droid 和 Aurora 商店。

此外，通过 Waydroid 安装的应用程序被很好地整合到 Linux 中，它们能够像其他应用程序一样被打开和关闭。

### 我对 PinePhone 的总体看法

在我使用它的过程中，我花时间使用了几乎所有可用于它的不同操作系统，以及每个桌面环境。正如我之前所说，它的性能一般都很差，尽管 Lomiri 和 Plasma Mobile 足够流畅。

我不经常拍照，所以相机的使用频率很低。然而，当我拍摄照片时，它们通常够用了，即使相片质量并不特别高。

总的来说，我认为 PinePhone 的最大弱点实际上是它的电池续航。这是因为即使只是打开它查看一下时间，也会唤醒调制解调器，导致电池迅速耗尽，除非我尽量不打开它。

幸运的是，我总是确保随身携带一块备用电池，我可以通过取下后盖换入。此外，我还可以插入一张 SD 卡，用作额外的存储空间或测试新的操作系统。

正如预期的，PinePhone 并不防水，但我发现在雨中使用它似乎没有任何损害，尽管你的经历可能有所不同。当我在室内时，我经常发现自己会借助它附带的底座来使用它的外部显示器。

在这种设置下，我对 PinePhone 作为一台笔记本电脑的能力感到惊讶。我经常发现自己可以在 LibreOffice 中编辑文件，甚至有一次还能用 Kdenlive 编辑了一段视频！

总的来说，即使有一些不足，我与 PinePhone 相处的这一年也很顺利，我从来没有发现自己对安卓的渴望。

### 获得 PinePhone

如果你想获得一台 PinePhone，下面有一个按钮，可以带你到 Pine64 的网站。在写这篇文章的时候，有两种型号可供选择，一种是 16GB 的存储空间和 2GB 的内存。另一个型号有 32GB 的存储空间和 3GB 的内存。（LCTT 译注：应该是不向中国发货的。）

本评论中使用的型号是 3GB 版本，价格为 199 美元。2GB 型号的价格为 149 美元。

- [获取 PinePhone][9]

我们只希望即将推出的 PinePhone Pro 能以其更强大的硬件保持这种积极的趋势！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/pinephone-review/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-phones/
[2]: https://github.com/agx/phosh
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/PinePhone-Battery.jpg?resize=1568%2C882&ssl=1
[5]: https://lomiri.com/
[6]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pinephone_plasma-mobile.jpg?resize=440%2C300&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pinephone-phosh.jpg?resize=448%2C295&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pinephone-lomiri-edited.jpg?resize=204%2C362&ssl=1
[9]: https://pine64.com/product-category/pinephone/
