[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11586-1.html)
[#]: subject: (Why I made the switch from Mac to Linux)
[#]: via: (https://opensource.com/article/19/10/why-switch-mac-linux)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

为什么我从 Mac 换到了 Linux
======

> 感谢这么多的开源开发人员，日常使用 Linux 比以往任何时候都容易得多。

![](https://img.linux.net.cn/data/attachment/album/201911/17/203212qes7o7zpeefbpffe.jpg)

自 2004 年开始从事 IT 工作以来，我一直是 Mac 的忠实粉丝。但是几个月前，由于种种原因，我决定将 Linux 用作日常使用的系统。这不是我第一次尝试完全采用 Linux，但是我发现它比以往更加容易。下面是促使我转换的原因。

### 我在个人电脑上的首次 Linux 体验

我记得，我抬头看着投影机，而它和我面面相觑。我们俩都不明白为什么它不显示。VGA 线完全接好了，针脚也没有弯折。我按了我所有想到的可能的按键组合，以向我的笔记本电脑发出信号，想让它克服“舞台恐惧症”。

我在大学里运行 Linux 只是作为实验。而我在 IT 部门的经理是多种口味的倡导者，随着我对桌面支持和编写脚本的信心增强，我想了解更多 Linux 的信息。对我来说，IT 比我的计算机科学学位课程有趣得多，课程的感觉是如此抽象和理论化：“二叉树有啥用？”，我如是想 —— 而我们的系统管理员团队的工作却是如此的真真切切。

这个故事的结尾是，我登录到 Windows 工作站完成了我的课堂演讲，这标志着我将 Linux 作为我的日常操作系统的第一次尝试的终结。我很欣赏 Linux 的灵活性，但是它缺乏兼容性。我偶尔会写个脚本，脚本通过 SSH 连接到一个机器中以运行另一个脚本，但是我对 Linux 的日常使用仅止于此。

### 对 Linux 兼容性的全新印象

几个月前，当我决定再试一次 Linux 时，我曾觉得我遇到更多的兼容性噩梦，但我错了。

安装过程完成后，我立即插入了 USB-C 集线器以了解兼容性到底如何。一切立即工作。连接 HDMI 的超宽显示器作为镜像显示器弹出到我的笔记本电脑屏幕上，我轻松地将其调整为第二台显示器。USB 连接的网络摄像头对我的[在家工作方式][2]至关重要，它可以毫无问题地显示视频。甚至自从我使用 Mac 以来就一直插在集线器的 Mac 充电器可以为我的非常不 Mac 的硬件充电。

我的正面体验可能与 USB-C 的一些更新有关，它在 2018 年得到一些所需的关注，因此才能与其他操作系统的体验相媲美。正如 [Phoronix 解释的那样][3]：

> “USB Type-C 接口为非 USB 信号提供了‘替代模式’扩展，在规范中该替代模式的最大使用场景是支持 DisplayPort。除此之外，另一个替代模式是支持 Thunderbolt 3。DisplayPort 替代模式支持 4K 甚至 8Kx4K 的视频输出，包括多声道音频。
>
> “虽然 USB-C 替代模式和 DisplayPort 已经存在了一段时间，并且在 Windows 上很常见，但是主线 Linux 内核不支持此功能。所幸的是，多亏英特尔，这种情况正在改变。”
>

而在端口之外，快速浏览一下 [笔记本电脑 Linux][4] 的硬件选择，列出了比我 2000 年代初期所经历的更加完整的选择集。

与我第一次尝试采用 Linux 相比，这已经天差地别，这是我张开双臂欢迎的。

### 突破 Apple 的樊篱

使用 Linux 给我的日常工作流程增加了一些新的麻烦，而我喜欢这种麻烦。

我的 Mac 工作流程是无缝的：早上打开 iPad，写下关于我今天想要做什么的想法，然后开始在 Safari 中阅读一些文章；移到我的 iPhone 上可以继续阅读；然后登录我的 MacBook，这些地方我进行了多年的微调，已经弄清楚了所有这些部分之间的连接方式。键盘快捷键已内置在我的大脑中；用户体验一如既往。简直不要太舒服了。

这种舒适需要付出代价。我基本上忘记了我的环境如何运作的，也无法解答我想解答的问题。我是否自定义了一些 [PLIST 文件][5]以获得快捷方式，是不是记得将其签入[我的 dotfiles][6] 当中？当 Firefox 的功能更好时，我为何还如此依赖 Safari 和 Chrome？为什么我不使用基于 Android 的手机代替我的 i-系列产品呢？

关于这一点，我经常考虑改用基于 Android 的手机，但是我会失去在所有这些设备之间的连接性以及为这种生态系统设计的一些便利。例如，我将无法在 iPhone 上为 Apple TV 输入搜索内容，也无法与其他用 Apple 的朋友用 AirDrop 共享密码。这些功能是同类设备环境的巨大好处，并且是一项了不起的工程。也就是说，这些便利是被生态系统所困的代价。

我喜欢了解设备的工作方式。我希望能够解释使我的系统变得有趣或容易使用的环境配置，但我也想看看增加一些麻烦对我的观点有什么影响。用 [Marcel Proust][7] 的话来说，“真正的发现之旅不在于寻找新的土地，而在于用新的眼光来看待。”技术的使用是如此的方便，以至于我不再对它的工作原理感到好奇，而 Linux 使我有机会再次有了新的眼光。

### 受你的启发

以上所有内容足以成为探索 Linux 的理由，但我也受到了你的启发。尽管所有操作系统都受到开源社区的欢迎，但 Opensource.com 的作者和读者对 Linux 的喜悦是充满感染力的。它激发了我重新潜入的乐趣，我享受这段旅途的乐趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/why-switch-mac-linux

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/article/19/8/rules-remote-work-sanity
[3]: https://www.phoronix.com/scan.php?page=news_item&px=Linux-USB-Type-C-Port-DP-Driver
[4]: https://www.linux-laptop.net/
[5]: https://fileinfo.com/extension/plist
[6]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[7]: https://www.age-of-the-sage.org/quotations/proust_having_seeing_with_new_eyes.html
