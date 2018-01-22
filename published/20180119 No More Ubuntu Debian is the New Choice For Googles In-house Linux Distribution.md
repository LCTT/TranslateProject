Debian 取代 Ubuntu 成为 Google 内部 Linux 发行版的新选择
============================================================

> 摘要：Google 多年来一直使用基于 Ubuntu 的内部操作系统 Goobuntu。如今，Goobuntu 正在被基于 Debian Testing 的 gLinux 所取代。

如果你读过那篇《[Ubuntu 十个令人惊奇的事实][18]》，你可能知道 Google 使用了一个名为 [Goobuntu][19] 的 Linux 发行版作为开发平台。这是一个定制化的 Linux 发行版，不难猜到，它是基于 Ubuntu 的。

Goobuntu 基本上是一个 [采用轻量级的界面的 Ubuntu][20]，它是基于 Ubuntu LTS 版本的。如果你认为 Google 对 Ubuntu 的测试或开发做出了贡献，那么你就错了。Google 只是 Canonical 公司的 [Ubuntu Advantage Program][21] 计划的付费客户而已。[Canonical][22] 是 Ubuntu 的母公司。

### 遇见 gLinux：Google 基于 Debian Buster 的新 Linux 发行版

![gLinux from Goobuntu](https://itsfoss.com/wp-content/uploads/2018/01/glinux-announcement-800x450.jpg)

在使用 Ubuntu 五年多以后，Google 正在用一个基于 Debian Testing 版本的 Linux 发行版 —— gLinux 取代 Goobuntu。

正如 [MuyLinux][23] 所报道的，gLinux 是从软件包的源代码中构建出来的，然后 Google 对其进行了修改，这些改动也将为上游做出贡献。

这个“新闻”并不是什么新鲜事，它早在去年八月就在 Debconf'17 开发者大会上宣布了。但不知为何，这件事并没有引起应有的关注。

请点击 [这里][24] 观看 Debconf 视频中的演示。gLinux 的演示从 12:00 开始。

[推荐阅读：微软出局，巴塞罗那青睐 Linux 系统和开源软件][25]

### 从 Ubuntu 14.04 LTS 转移到 Debian 10 Buster

Google 曾经看重 Ubuntu LTS 的稳定性，现在为了及时测试软件而转移到 Debian Testing 上。但目前尚不清楚 Google 为什么决定从 Ubuntu 切换到 Debian。

Google 计划如何转移到 Debian Testing？目前的 Debian Testing 版本是即将发布的 Debian 10 Buster。Google 开发了一个内部工具，用于将现有系统从 Ubuntu 14.04 LTS 迁移到 Debian 10 Buster。项目负责人 Margarita 在 Debconf 中声称，经过测试，该工具工作正常。

Google 还计划将这些改动发到 Debian 的上游项目中，从而为其发展做出贡献。

![gLinux testing plan from Google](https://itsfoss.com/wp-content/uploads/2018/01/glinux-testing-plan.jpg)

*gLinux 的开发计划*

### Ubuntu 丢失了一个大客户！

回溯到 2012 年，Canonical 公司澄清说 Google 不是他们最大的商业桌面客户。但至少可以说，Google 是他们的大客户。当 Google 准备切换到 Debian 时，必然会使 Canonical 蒙受损失。

[推荐阅读：Mandrake Linux Creator 推出新的开源移动操作系统][26]

### 你怎么看？

请记住，Google 不会限制其开发者使用任何操作系统，但鼓励使用 Linux。

如果你想使用 Goobuntu 或 gLinux，那得成为 Google 公司的雇员才行。因为这是 Google 的内部项目，不对公众开放。

总的来说，这对 Debian 来说是一个好消息，尤其是他们成为了上游发行版的话。对 Ubuntu 来说可就不同了。我已经联系了 Canonical 公司征求意见，但至今没有回应。

更新：Canonical 公司回应称，他们“不共享与单个客户关系的细节”，因此他们不能提供有关收入和任何其他的细节。

你对 Google 抛弃 Ubuntu 而选择 Debian 有什么看法？


![](https://secure.gravatar.com/avatar/20749c268f5d3e4d2c785499eb6a17c0?s=125&d=mm&r=g)

#### 关于作者 Abhishek Prakash

我是一名专业的软件开发人员，也是 FOSS 的创始人。我是一个狂热的 Linux 爱好者和开源爱好者。我使用 Ubuntu 并相信知识共享。除了 Linux 之外，我还喜欢经典的侦探推理故事。我是阿加莎·克里斯蒂（Agatha Christie）作品的忠实粉丝。


--------------------------------------------------------------------------------

via: https://itsfoss.com/goobuntu-glinux-google/

作者：[Abhishek Prakash][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/author/abhishek/
[2]:https://itsfoss.com/goobuntu-glinux-google/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%E2%80%99s+In-house+Linux+Distribution&url=https://itsfoss.com/goobuntu-glinux-google/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=abhishek_foss
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:http://www.stumbleupon.com/submit?url=https://itsfoss.com/goobuntu-glinux-google/&title=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%26%238217%3Bs+In-house+Linux+Distribution
[8]:https://www.reddit.com/submit?url=https://itsfoss.com/goobuntu-glinux-google/&title=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%26%238217%3Bs+In-house+Linux+Distribution
[9]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[10]:https://twitter.com/share?original_referer=/&text=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%E2%80%99s+In-house+Linux+Distribution&url=https://itsfoss.com/goobuntu-glinux-google/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=abhishek_foss
[11]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[12]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fgoobuntu-glinux-google%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[13]:http://www.stumbleupon.com/submit?url=https://itsfoss.com/goobuntu-glinux-google/&title=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%26%238217%3Bs+In-house+Linux+Distribution
[14]:https://www.reddit.com/submit?url=https://itsfoss.com/goobuntu-glinux-google/&title=No+More+Ubuntu%21+Debian+is+the+New+Choice+For+Google%26%238217%3Bs+In-house+Linux+Distribution
[15]:https://itsfoss.com/category/news/
[16]:https://itsfoss.com/tag/glinux/
[17]:https://itsfoss.com/tag/goobuntu/
[18]:https://itsfoss.com/facts-about-ubuntu/
[19]:https://en.wikipedia.org/wiki/Goobuntu
[20]:http://www.zdnet.com/article/the-truth-about-goobuntu-googles-in-house-desktop-ubuntu-linux/
[21]:https://www.ubuntu.com/support
[22]:https://www.canonical.com/
[23]:https://www.muylinux.com/2018/01/15/goobuntu-glinux-google/
[24]:https://debconf17.debconf.org/talks/44/
[25]:https://linux.cn/article-9236-1.html
[26]:https://itsfoss.com/eelo-mobile-os/
