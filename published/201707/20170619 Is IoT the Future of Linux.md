物联网是 Linux 的未来么?
============================================================ 

> Linux 无疑将在物联网中扮演一个关键角色，但是其光彩将与其它的一些分享。

随着 [Canonical 重新关注于][8]赢利和新技术，我们中的一些人发现我们正在思考 Linux 未来将走向何方，IoT（物联网）是否是 Linux 的未来？ 本文旨在解决这两个问题。

### Mycroft 运行于 Linux

对于大多数非技术世界的人来说，实际上有几个不同的 IoT 项目，它们不是我们不断在网络上看到广告的过度商业化的项目，其中最成功的就是 [Mycroft][9] 项目。

使得 Mycroft 有趣的部分原因是你不需要在专门的硬件上得到它。这意味着你可以将其下载到 Raspberry Pi 或甚至您自己的 PC 上。这是物联网领域更常见的来自其它厂商的商业化替代品中所没有出现的自由元素。Mycroft 项目的另一个有趣的事实是，它最初是众筹的，所以从一开始它就是真正的社区驱动的项目。

那么它的技能（skill）——这个用来描述它能力的术语——怎么样？目前，我听到一些褒贬不一的评论。通过查看 Github 上列出的技能，其整个列表似乎相当令人印象深刻。更深层次挖掘的话，很容易看出，它的许多技能比使用专有的 IoT 设备要好。

值得注意的是，为物联网设备开发的官方技能与社区成员开发的功能之间存在明显的区别。Mycroft 的官方技能列表其实很薄弱。让我们面对这个情况，就像 Linux 运行在物联网设备上一样酷，让我大开眼界的是，在 [Mycroft Github][10] 页面上并没有一个官方的邮件检查技能。好吧，在社区技能部分有一个 Gmail，它带有一个问号，因为它显然没有验证过是否可以工作（或不工作）。

### Google Home - 这是一个包含在谜语中的 Linux 谜题

那么 Google 的物联网产品 Google Home 呢？当然这运行在 Linux上，对吧？是的，在广义上说是这样……事实证明，Google Home [基于 Chromecast][11]。那 Chromecast 呢？它是基于 Google TV。我们还在 Linux 的部分么？不完全是。

显然，Chromecast 基本上运行的是 [Android 的精简版][12]。而且我们大多数人都知道，Android 确实使用了 Linux 内核的定制版本。

在这一点上，我觉得我们需要问自己 - Google 是我们可以想出的最好的 Linux 物联网代表吗？我认为不是，因为我觉得他们会愿意做出隐私妥协，而这是我们在一个纯粹的 Linux 物联网环境中所不愿见的。 但这只是我个人的信仰。

假设我们愿意接受 Google Home 这种隐私方面的可疑而带来的好处，也假设有在底层有一些可辨识出来的 Linux 成分，那么与 Mycroft 的纯粹的开源体验相比如何呢？

目前，谷歌正在解决这个局面。首先，如果你愿意，你可以安装 Google Home的“大脑”（称为 Google Assistant）到树莓派上。这可以通过 [Google Assistant SDK][13] 获得。

如你猜的那样，这个 SDK 可以在 Linux 上安装。安装完 portaudio、各种库和用 pip 安装 google-assistant-sdk 之后，你可以开始用树莓派进行通话了，就像 Google Home 设备一样。

回到实际 Google Home 设备本身，你可能会想知道它的可用技能？开箱即用，它提供与 Google Play 音乐、Pandora、Spotify 和 iHeart Radio 以及其他流式音乐服务的音乐播放。Google Home 不仅拥有比 Mycroft 更多的“交流”技能，它还可以与像 Netflix 这样的服务和诸如 Philips、Nest 和 [IFTTT][14] 等各种智能家居任务的家庭品牌一同工作。我有提到它还可以安排 Google 日历或者订购披萨么？

相比之下，Mycroft 对于想要创造自己的技能的 DIY 开发者来说更好，Google Home 现在可以就开始使用，而不是某一天。

### Amazon Echo 可以运行于 Linux

我首先要承认的是我不知道 Amazon Echo 本身是否运行在 Linux 的某些元素上。也就是说，我知道你可以将 Echo 背后的大脑安装到 Linux 驱动的树莓派上！当[第一次发布派上的版本时][15]，有点让人失望的是，你不得不按一个按钮来激活 Echo 的聆听模式。

转眼到了现在，派上的 Echo 现在支持用可编程的“热词”来激活它。这意味着你可以运行一个安装了 Linux 的派，其操作方式与官方 Amazon Echo 相似。然后，如果你买了 Echo Dot，你可以跳过额外的工作，省去在树莓派上安装 Mycroft 的那些极客的东西。

就像 Mycroft 和 Google Home 一样，Amazon Echo 可以在派上使用很重要，因为它使任何人都可以使用物联网技术 - 而不仅仅是那些选择官方硬件的人。而且由于亚马逊已经有更多的时间来开发这项技术，因此，可以说 Echo 是超前于可编程技能竞争以及整体进度的。

所以即使 Google Home 在问题回答上做的更好，但是 Echo 支持更多的第三方物联网设备，有些人认为它比 Google Home 的声音更自然。就个人而言，我认为两台设备的声音听起来都不错。但这只是我的意见。

### 物联网是 Linux 最好的

假如我们用一点时间来继续看看这些与 Linux 兼容的物联网设备或者像 Mycroft 这样真正使用 Linux 的社区伙伴的项目，有一点是可以肯定的，Linux 仍然是等式的一部分。

我认为不使用像 Linux 这样的自由/开放源代码平台是愚蠢的。毕竟，这些设备往往会连接到其他物联网自动化组件。这意味着安全性是一个真正的考虑。在 Linux 下运行物联网意味着我们可以有一个社区确保安全，而不是希望制造商为我们做到这一点。

需要一个例子说明为什么这很重要吗？看看那些不运行开源固件的路由器，当制造商停止支持该设备时会发生什么 - 安全风险开始出现。

物联网是 Linux 的未来吗？在我看来，我认为是……但不是全部。我认为对许多人来说，这是前进的道路。但是最后，我认为在 Linux 之上将会有许多专有的“东西”，只有像 Mycroft 这样纯粹的项目才能保持 Linux。

那么你怎么看？你认为像 Mycroft 这样的开源项目现在与 Google 和 Amazon 的产品在正常竞争么？反之，你觉得还有其他基于 Linux 的产品更适合这项工作么？无论是什么，点击评论，让我们来谈谈。

--------------------------------------------------------------------------------

via: http://www.datamation.com/open-source/is-iot-the-future-of-linux.html

作者：[Matt Hartley][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.datamation.com/author/Matt-Hartley-3080.html
[1]:http://www.datamation.com/feedback/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[2]:http://www.datamation.com/author/Matt-Hartley-3080.html
[3]:http://www.datamation.com/e-mail/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[4]:http://www.datamation.com/print/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[5]:http://www.datamation.com/open-source/is-iot-the-future-of-linux.html#comment_form
[6]:http://www.datamation.com/open-source/is-iot-the-future-of-linux.html#
[7]:http://www.datamation.com/author/Matt-Hartley-3080.html
[8]:https://insights.ubuntu.com/2017/04/05/growing-ubuntu-for-cloud-and-iot-rather-than-phone-and-convergence/
[9]:https://mycroft.ai/
[10]:https://github.com/MycroftAI/mycroft-skills
[11]:https://www.theverge.com/circuitbreaker/2016/5/31/11822032/google-home-chromecast-android
[12]:https://www.extremetech.com/computing/162463-chromecast-hacked-its-based-on-google-tv-and-android-not-chrome-os
[13]:https://developers.google.com/assistant/sdk/
[14]:https://ifttt.com/google_assistant
[15]:https://www.raspberrypi.org/blog/amazon-echo-homebrew-version/
