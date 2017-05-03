5 个开源 RSS 订阅阅读器
============================================================

 ![RSS feed](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/rss_feed.png?itok=FHLEh-fZ "RSS feed") 
>Image by : [Rob McDonald][2] on Flickr. Modified by Opensource.com. [CC BY-SA 2.0][3].

### 你平时使用 RSS 阅读器么？

<form class="pollanon" action="https://opensource.com/article/17/3/rss-feed-readers" method="post" id="poll-view-voting" accept-charset="UTF-8"><label class="element-invisible" for="edit-choice" style="display: block; clip: rect(1px 1px 1px 1px); overflow: hidden; height: 1px; width: 1px; color: rgb(67, 81, 86); position: absolute !important;">选择</label><input type="radio" id="edit-choice-7621" name="choice" value="7621" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7621" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">是</label><input type="radio" id="edit-choice-7626" name="choice" value="7626" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7626" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">不，但是我过去使用</label><input type="radio" id="edit-choice-7631" name="choice" value="7631" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7631" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">不，我从没使用过</label><input type="submit" id="edit-vote" name="op" value="投票" class="form-submit" style="font-family: &quot;Swiss 721 SWA&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Nimbus Sans L&quot;, sans-serif; font-size: 1em; max-width: 100%; line-height: normal; font-style: normal; border-width: 1px; border-style: solid; border-color: rgb(119, 186, 77); color: rgb(255, 255, 255); background: rgb(119, 186, 77); padding: 0.6em 1.9em;"></form>

四年前当 Google Reader 宣布停止的时候，许多“技术专家”声称 RSS 订阅将会结束。

对于某些人而言，社交媒体和其他聚合工具满足了 RSS、Atom 以及其它格式的阅读器的需求。但是老技术绝对不会因为新技术而死，特别是如果新技术不能完全覆盖旧技术的所有使用情况时。技术的目标受众可能会有所改变，人们使用这个技术的工具也可能会改变。

但是，RSS 并不比像 email、JavaScript、SQL 数据库、命令行或者十几年前告诉我的其它时日无多的技术消失的更快。（黑胶专辑的销售额去年刚刚达到了其 [25 年的顶峰][4]，这不是个奇迹么？）只要看看在线 Feed 阅读器网站 Feedly 的成功，就能了解 RSS 阅读器仍然有市场。

事实是，RSS 和相关的 Feed 格式比任何广泛使用的尝试替换它的东西还要多才多艺。作为一名阅读消费者，对于我来说没有比它更简单的方法了，我可以阅读大量的出版信息，并且是用我选择的客户端格式化的，我可以确认看到发布的每一条内容，同时不会显示我已经阅读过的文章。而作为发布者，这是一种比我使用过的大多数发布软件都简单的格式，开箱即用，它可以让我的信息递交给更多的人，并且可以很容易地分发多种不同类型的文档格式。

所以 RSS 没有死。RSS 长存！我们最后一次是在 2013 年回顾了[开源 RSS 阅读器][5]选择，现在是更新的时候了。这里是我关于 2017 年开源 RSS 订阅阅读器的一些最佳选择，每个在使用上稍微不同。

### Miniflux

[Miniflux][6] 是一个极度简约的基于 Web 的 RSS 阅读器，但不要将其特意的轻设计与开发人员的懒惰混淆。它目的是构建一个简单而有效的设计。Miniflux 的思想似乎是将程序弱化，以便让读者可以专注于内容，在大量臃肿的 web 程序中我们会特别欣赏这一点。

但轻便并不意味着缺乏功能。其响应式设计在任何设备上看起来都很好，并可以使用主题、API 接口、多语言、固定书签等等。

Miniflux 的 [源代码][7]以 [GPLv3 Affero][8] 许可证在 GitHub 中发布。如果你不想自行托管，则可以支付每年 15 美元的托管计划。

### RSSOwl

[RSSOwl][9] 是一个跨平台的桌面 Feed 阅读器。它用 Java 编写，在风格和感觉上它像很多流行的桌面邮件客户端。它具有强大的过滤和搜索功能、可定制的通知，以及用于排序 Feed 的标签。 如果你习惯使用 Thunderbird 或其他桌面阅读器进行电子邮件发送，那么在 RSSOwl 中你会感到宾至如归。

可以在 GitHub 中找到 [Eclipse Public 许可证][11]下发布的 [RSSOwl][10] 的源代码。

### Tickr

[Tickr][12] 在这个系列中有点不同。它是一个 Linux 桌面客户端，但它不是传统的浏览-阅读形式。相反，它会将你的 Feed 标题如滚动新闻那样在桌面横栏上滚动显示。对于想要从各种来源获得最新消息的新闻界来说，这是一个不错的选择。点击标题将在你选择的浏览器中打开它。它不像这个列表中的其他程序那样是专门的阅读客户端，但是如果比起阅读每篇文章，你对阅读标题更感兴趣，这是一个很好的选择。

Tickr 的源代码和二进制文件以 GPL 许可证的形式在这个[网站][13]上可以找到。

### Tiny Tiny RSS

如果缺少了 [Tiny Tiny RSS][14]，那么很难称之为这是一个现代化的 RSS 阅读器列表。它是最受欢迎的自主托管的基于 Web 的阅读器，它功能丰富：支持OPML 导入和导出、键盘快捷键、共享功能、主题界面、插件支持、过滤功能等等。

Tiny Tiny RSS 还有官方的 [Android客户端][15]，让你可以随时随地阅读。

Tiny Tiny RSS 的 [Web][16] 版本和 [Android][17] 源代码以 [GPLv3 许可][18] 在 GitLab 上发布。

### Winds

[Winds][19] 是一个建立在 React 之上的看起来很现代化的自托管的 web 订阅阅读器。它利用称为 Stream 的机器学习个性化 API，帮助你根据当前的兴趣找到可能感兴趣的更多内容。这有一个在线显示版本，因此你可以在下载之前先[尝试][20]。这是一个只有几个月的新项目，也许评估它是否能取代我日常的 Feed 阅读器还太早，但这当然是一个我感兴趣关注的项目。

Winds 的[源代码][21] 以 [MIT][22] 许可证在 GitHub 上发布。

* * *

这些当然不是仅有的选择。RSS 是一个相对易于解析、文档格式良好的格式，因此有许许多多因为不同的需求而建立的各种 Feed 阅读器。这有一个很长的自托管的开源 Feed 阅读器[列表][23]，除了我们列出的之外你还可能会考虑使用它们。我们希望你能在下面的评论栏与我们分享你最喜欢的 RSS 阅读器。

--------------------------------------------------------------------------------

作者简介：

Jason Baker - Jason 热衷于使用技术使世界更加开放，从软件开发到阳光政府行动。Linux 桌面爱好者、地图/地理空间爱好者、树莓派工匠、数据分析和可视化极客、偶尔的码农、云本土主义者。在 Twitter 上关注他 @jehb。

--------------

via: https://opensource.com/article/17/3/rss-feed-readers

作者：[Jason Baker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/article/17/3/rss-feed-readers?rate=2sJrLq0K3QPQCznBId7K1Qrt3QAkwhQ435UyP77B5rs
[2]:https://www.flickr.com/photos/evokeartdesign/6002000807
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://www.theguardian.com/music/2017/jan/03/record-sales-vinyl-hits-25-year-high-and-outstrips-streaming
[5]:https://opensource.com/life/13/6/open-source-rss
[6]:https://miniflux.net/
[7]:https://github.com/miniflux/miniflux
[8]:https://github.com/miniflux/miniflux/blob/master/LICENSE
[9]:http://www.rssowl.org/
[10]:https://github.com/rssowl/RSSOwl
[11]:https://github.com/rssowl/RSSOwl/blob/master/LICENSE
[12]:https://www.open-tickr.net/
[13]:https://www.open-tickr.net/download.php
[14]:https://tt-rss.org/gitlab/fox/tt-rss/wikis/home
[15]:https://tt-rss.org/gitlab/fox/tt-rss-android
[16]:https://tt-rss.org/gitlab/fox/tt-rss/tree/master
[17]:https://tt-rss.org/gitlab/fox/tt-rss-android/tree/master
[18]:https://tt-rss.org/gitlab/fox/tt-rss-android/blob/master/COPYING
[19]:https://winds.getstream.io/
[20]:https://winds.getstream.io/app/getting-started
[21]:https://github.com/GetStream/Winds
[22]:https://github.com/GetStream/Winds/blob/master/LICENSE.md
[23]:https://github.com/Kickball/awesome-selfhosted#feed-readers
[24]:https://opensource.com/user/19894/feed
[25]:https://opensource.com/article/17/3/rss-feed-readers#comments
[26]:https://opensource.com/users/jason-baker
