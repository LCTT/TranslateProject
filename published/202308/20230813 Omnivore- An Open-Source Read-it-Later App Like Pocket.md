[#]: subject: "Omnivore: An Open-Source Read-it-Later App Like Pocket"
[#]: via: "https://news.itsfoss.com/omnivore/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16102-1.html"

Omnivore：一个类似 Pocket 的开源稍后阅读应用
======

![][0]

> 一款具有令人兴奋的功能的，Mozilla 的 Pocket 的开源替代品。

如果我告诉你有一个解决你所有稍后阅读需求的一站式解决方案，你会怎么想？

当你遇到了你想看却没时间阅读的有趣文章的时候。

这就是稍后阅读解决方案的作用。在这篇文章中，我们将看看一个名为 “**Omnivore**” 的跨平台，开源稍后阅读平台，它可以实现这样的任务。

让我向你展示它可以提供的东西。

### Omnivore：概览 ⭐

![][1]

它主要由 **HTML** 和 **TypeScript** 驱动，Omnivore **的目标是成为满足你所有阅读需求的一站式解决方案**。

它听起来像是非常热门的 Mozilla 的 [Pocket][2] 应用的替代品。

你可以跨很多平台使用它，比如 **Web**、**安卓** 和 **iOS**。

你也可以在服务器上自己托管它，尽管 Omnivore 最初被设计为在 [GCP][3]（谷歌云平台）上部署。幸运的是，开发者正在研发更具包容性的部署系统，这将使它更便携。

那么，让我们先来看看 Omnivore 的一些重要亮点：

  * 支持全键盘导航。
  * 在长文章中自动保存进度。
  * 支持各种插件。
  * 提供离线阅读功能。

#### 初次体验 👨‍💻

我在免费托管的 Omnivore 版本上进行了测试，这需要创建一个账户。

创建账号后，我将一些稍后阅读的文章添加到了它里面，结果就是这个 **组织良好的主页** 。

![][4]

它具有一个侧边栏菜单，包括 <ruby>收件箱<rt>Inbox</rt></ruby>、<ruby>继续阅读<rt>Continue Reading</rt></ruby>、<ruby>稍后阅读<rt>Read Later</rt></ruby>、<ruby>无标签的<rt>Unlabeled</rt></ruby> 等分类选项。

主网格布局储存了所有保存的文章；它还有另一种列表式的视图，但我选择了网格视图。

下面，让我告诉你 **如何向 Omnivore 添加文章** 。

在 Omnivore 上保存稍后阅读的文章主要有两种方法。

一种是 **通过用户菜单** ，你需要点击 “<ruby>添加链接<rt>Add Link</rt></ruby>”，然后在你点击它时弹出的文本框中粘贴 URL。

![][5]

但另一种方法更为直观；它是 **通过浏览器扩展** 完成的。我使用 [Chrome 网上应用店][6] 的 Omnivore 扩展在 Vivaldi 上进行了测试。

安装后，你只需访问你感兴趣的文章，并点击浏览器扩展栏中显示的 Omnivore 图标。

![][7]

文章将被添加到你的 Omnivore 账户；你还可以利用可用选项来 **添加注释、标签、编辑标题** 等。

别担心；这不仅仅是 Chromium 的独有方式。你也可以为 [Firefox][8] 和 [Safari][9] 获取浏览器扩展，这是很好的。

之后，我看了一下 Omnivore 上的 “<ruby>标签<rt>Labels</rt></ruby>” 系统。我创建了两个标签，并相应地将它们分配给了保存的文章。

它允许我按标签对它们进行排序。我只需要点击我想要访问的那个。

![][10]

要创建新标签，点击侧边栏菜单中 “<ruby>标签<rt>Labels</rt></ruby>” 旁边的三点菜单，然后进行编辑。

![][11]

接下来，你可以通过添加标签或修改已有的标签来开始，为它们设置一个名称和颜色。

![][12]

要将它们分配给现有的文章，将鼠标悬停在一个文章卡片上，进入三点菜单，然后选择 “<ruby>设置标签<rt>Set Labels</rt></ruby>”。

然后，我看了一下 **文章阅读的体验** ，我并没有感到失望。文章查看器有一个干净的布局，一个浮动的侧边栏菜单允许各种功能。

第一个选项是设置文章的标签；第二个选项会打开一个笔记本，让你为特定的文章添加注释。

![][13]

然后有 “<ruby>编辑信息<rt>Edit Info</rt></ruby>” 按钮，该按钮会打开一个编辑窗口，用于编辑已保存文章的关键细节。最后，最后两个按钮用于删除或归档已保存的文章。

![][14]

然后，我转而去检查了 **在 Omnivore 上** 的插件支持。它支持几种不同的插件，允许你从各个地方导出内容。

你可以将其连接到 [Logseq][15]、[Obsidian][16]、[Readwise][17]，甚至是 Mozilla 的 [Pocket][2]。

这种互操作性对我来说总是一个加分项！🤓

![][18]

而这最后一点对我来说是一个惊喜。

Omnivore **支持创建电子邮件别名**，然后可以用该别名注册各种新闻简报。官方支持来自 [Substack][19]、[beehiv][20]、[Axios][21] 等的新闻简报。

![][22]

但是，结果证明，它也适用于其他新闻简报。我在 **[我们的新闻简报][23]** 上进行了测试，它集成得很好！

### 📥 获取 Omnivore

如果你像我一样，希望方便地开始使用，我建议你访问 [官方网站][24]。

然而，如果你更喜欢自己托管，我建议你看一看 [官方文档][25] 和它的 [GitHub 仓库][26]。

> **[Omnivore][24]**

**对于他们的定价结构**，目前，Omnivore 是完全免费的。开发者还没有决定一个合适的定价计划，但是他们有一些他们打算追求的主意。

目前，他们完全依赖社区的捐款。

💬 你对此有什么看法？你会尝试一下吗？

*（题图：MJ/ed3cc6ff-cc45-4895-9733-3145bef84b48）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/omnivore/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/08/Omnivore_1.jpg
[2]: https://getpocket.com/en/
[3]: https://cloud.google.com/
[4]: https://news.itsfoss.com/content/images/2023/08/Omnivore_2.jpg
[5]: https://news.itsfoss.com/content/images/2023/08/add-omnivore-link.jpg
[6]: https://chrome.google.com/webstore/detail/omnivore/blkggjdmcfjdbmmmlfcpplkchpeaiiab/
[7]: https://news.itsfoss.com/content/images/2023/08/Omnivore_4.jpg
[8]: https://addons.mozilla.org/en-US/firefox/addon/omnivore/
[9]: https://apps.apple.com/us/app/omnivore-read-highlight-share/id1564031042
[10]: https://news.itsfoss.com/content/images/2023/08/Omnivore_6.jpg
[11]: https://news.itsfoss.com/content/images/2023/08/edit-labels-omnivore.jpg
[12]: https://news.itsfoss.com/content/images/2023/08/label-add-omnivore.jpg
[13]: https://news.itsfoss.com/content/images/2023/08/Omnivore_7.jpg
[14]: https://news.itsfoss.com/content/images/2023/08/Omnivore_8.jpg
[15]: https://logseq.com/
[16]: https://obsidian.md/
[17]: https://readwise.io/
[18]: https://news.itsfoss.com/content/images/2023/08/Omnivore_9.jpg
[19]: https://substack.com/
[20]: https://www.beehiiv.com/
[21]: https://www.axios.com/
[22]: https://news.itsfoss.com/content/images/2023/08/omnivore-email-alias.jpg
[23]: https://itsfoss.com/newsletter/
[24]: https://omnivore.app/
[25]: https://docs.omnivore.app/
[26]: https://github.com/omnivore-app/omnivore
[27]: https://linuxhandbook.com/tag/bash-beginner/
[28]: https://itsfoss.community/
[29]: https://itsfoss.com/newsletter/
[0]: https://img.linux.net.cn/data/attachment/album/202308/17/135134ardrua15ezuv8rd2.jpg