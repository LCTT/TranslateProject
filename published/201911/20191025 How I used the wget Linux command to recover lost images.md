[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11592-1.html)
[#]: subject: (How I used the wget Linux command to recover lost images)
[#]: via: (https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

丢失的开放剪贴画库和新的公共艺术品图书馆 FreeSVG.org 的诞生
======

> 开放剪贴画库兴衰的故事以及一个新的公共艺术品图书馆 FreeSVG.org 的诞生。

![](https://img.linux.net.cn/data/attachment/album/201911/19/102040imbybpl32vgdibbm.jpg)

<ruby>开放剪贴画库<rt>Open Clip Art Library</rt></ruby>（OCAL）发布于 2004 年，成为了免费插图的来源，任何人都可以出于任何目的使用它们，而无需注明出处或提供任何回报。针对 1990 年代每个家庭办公室书架上的大量剪贴画 CD 以及由闭源公司和艺术品软件提供的艺术品转储，这个网站是开源世界的回应。

最初，这个剪贴画库主要由一些贡献者提供，但是在 2010 年，它重新打造成了一个全新的交互式网站，可以让任何人使用矢量插图应用程序创建和贡献剪贴画。该网站立即获得了来自全球的、各种形式的自由软件和自由文化项目的贡献。[Inkscape][2] 中甚至包含了该库的专用导入器。

但是，在 2019 年初，托管开放剪贴画库的网站离线了，没有任何警告或解释。它已经成长为有着成千上万的人的社区，起初以为这是暂时的故障。但是，这个网站一直离线已超过六个月，而没有任何清楚的解释。

谣言开始膨胀。该网站一直在更新中（“要偿还数年的技术债务”，网站开发者 Jon Philips 在一封电子邮件中说）。一个 Twitter 帐户声称，该网站遭受了猖狂的 DDoS 攻击。另一个 Twitter 帐户声称，该网站维护者已经成为身份盗用的牺牲品。今天，在撰写本文时，该网站的一个且唯一的页面声明它处于“维护和保护模式”，其含义不清楚，只是用户无法访问其内容。

### 恢复公地

网站会随着时间的流逝而消失，但是对其社区而言，开放剪贴画库的丢失尤其令人惊讶，因为它被视为一个社区项目。很少有社区成员知道托管该库的网站已经落入单个维护者手中，因此，由于 [CC0 许可证][3]，该库中的艺术品归所有人所有，但对它的访问是由单个维护者功能性拥有的。而且，由于该社区通过网站彼此保持联系，因此该维护者实际上拥有该社区。

当网站发生故障时，社区以及成员彼此之间都无法访问剪贴画。没有该网站，就没有社区。

最初，该网站离线后其上的所有东西都是被封锁的。不过，在几个月之后，用户开始意识到该网站的数据仍然在线，这意味着用户能够通过输入精确的 URL 访问单个剪贴画。换句话说，你不能通过在网站上到处点击来浏览剪贴画文件，但是如果你确切地知道该地址，你就可以在浏览器中访问它。类似的，技术型（或偷懒的）用户意识到能够通过类似 `wget` 的自动 Web 浏览器将网站“抓取”下来。

Linux 的 `wget` 命令从技术上来说是一个 Web 浏览器，虽然它不能让你像用 Firefox 一样交互式地浏览。相反，`wget` 可以连到互联网，获取文件或文件集，并下载到你的本次硬盘。然后，你可以在 Firefox、文本编辑器或最合适的应用程序中打开这些文件，查看内容。

通常，`wget` 需要知道要提取的特定文件。如果你使用的是安装了 `wget` 的 Linux 或 macOS，则可以通过下载 [example.com][4] 的索引页来尝试此过程： 

```
$ wget example.org/index.html
[...]
$ tail index.html

<body><div>
    <h1>Example Domain</h1>
    <p>This domain is for illustrative examples in documents.
    You may use this domain in examples without permission.</p>
        <p><a href="http://www.iana.org/domains/example">More info</a></p>
</div></body></html>
```

为了抓取 OCAL，我使用了 `--mirror` 选项，以便可以只是将 `wget` 指向到包含剪贴画的目录，就可以下载该目录中的所有内容。此操作持续下载了连续四天（96 个小时），最终得到了超过 50,000 个社区成员贡献的 100,000 个 SVG 文件。不幸的是，任何没有适当元数据的文件的作者信息都是无法恢复的，因为此信息被锁定在该数据库中不可访问的文件中，但是 CC0 许可证意味着此问题*在技术上*无关紧要（因为 CC0 文件不需要归属）。

随意分析了一下下载的文件进行还显示，其中近 45,000 个文件是同一个文件（该网站的徽标）的副本。这是由于指向该网站徽标的重定向引起的（原因未知），仔细分析能够提取到原始的文件，又过了 96 个小时，并且恢复了直到最后一天发布在 OCAL 上的所有剪贴画：总共约有 156,000 张图像。

SVG 文件通常很小，但这仍然是大量工作，并且会带来一些非常实际的问题。首先，将需要数 GB 的在线存储空间，这样这些剪贴画才能供其先前的社区使用。其次，必须使用一种搜索剪贴画的方法，因为手动浏览 55,000 个文件是不现实的。

很明显，社区真正需要的是一个平台。

### 构建新的平台

一段时间以来，[公共领域矢量图][6] 网站一直在发布公共领域的矢量图。虽然它仍然是一个受欢迎的网站，但是开源用户通常只是将其用作辅助的图片资源，因为其中大多数文件都是 EPS 和 AI 格式的，这两者均与 Adobe 相关。这两种文件格式通常都可以转换为 SVG，但是特性会有所损失。

当公共领域矢量图网站的维护者（Vedran 和 Boris）得知 OCAL 丢失时，他们决定创建一个面向开源社区的网站。诚然，他们选择了开源 [Laravel][7] 框架作为后端，该框架为网站提供了管理控制台和用户访问权限。该框架功能强大且开发完善，还使他们能够快速响应错误报告和功能请求，并根据需要升级网站。他们正在建立的网站称为 [FreeSVG.org][8]，已经是一个强大而繁荣的公共艺术品图书馆。

从那时起，他们就一直从 OCAL 上载所有剪贴画，并且他们甚至在努力地对这些剪贴画进行标记和分类。作为公共领域矢量图网站的创建者，他们还以 SVG 格式贡献了自己的图像。他们的目标是成为互联网上具有 CC0 许可证的 SVG 图像的主要资源。

### 贡献

[FreeSVG.org][8] 的维护者意识到他们已经继承了重要的管理权。他们正在努力对网站上的所有图像加上标题和描述，以便用户可以轻松找到这些剪贴画，并在准备就绪后将其提供给社区，同时坚信同这些剪贴画一样，与这些剪贴画有关的元数据属于创建和使用它们的人。他们还意识到可能会发生无法预料的情况，因此他们会定期为其网站和内容创建备份，并打算在其网站出现故障时向公众提供最新备份。

如果要为 [FreeSVG.org][9]的知识共享内容添砖加瓦，请下载 [Inkscape][10] 并开始绘制。世界上有很多公共领域的艺术品，例如[历史广告][11]、[塔罗牌][12]和[故事书][13]，只是在等待转换为 SVG，因此即使你对自己的绘画技巧没有信心你也可以做出贡献。访问 [FreeSVG 论坛][14]与其他贡献者联系并支持他们。

*公地*的概念很重要。无论你是学生、老师、图书馆员、小企业主还是首席执行官，[知识共享都会使所有人受益][15]。如果你不直接捐款，那么你随时可以帮助推广。

这是自由文化的力量：它不仅可以扩展，而且随着更多人的参与，它会变得更好。

### 艰辛的教训

从 OCAL 的消亡到 FreeSVG.org 的兴起，开放文化社区已经吸取了一些艰辛的经验。对于以后，以下是我认为最重要的那些。

#### 维护你的元数据

如果你是内容创建者，请帮助将来的档案管理员，将元数据添加到文件中。大多数图像、音乐、字体和视频文件格式都可以嵌入 EXIF 数据，其他格式在创建它们的应用程序中具有元数据输入界面。勤于用你的姓名、网站或公共电子邮件以及许可证来标记你的作品。

#### 做个副本

不要以为别人在做备份。如果你关心公用数字内容，请自己备份，否则不要指望永远提供它。无论*任何上传到互联网上的内容是永久的*的说法是不是正确的，但这并不意味着你永远可以使用。如果 OCAL 文件不再暗地可用，那么任何人都不太可能成功地从网络上的某个位置或从全球范围内的人们的硬盘中成功地发现全部的 55,000 张图像。

#### 创建外部渠道

如果一个社区是由单个网站或实际位置来定义的，那么该社区失去访问该空间的能力就如同解散了一样。如果你是由单个组织或网站驱动的社区的成员，则你应该自己与关心的人共享联系信息，并即使在该网站不可用时也可以建立沟通渠道。

例如，[Opensource.com][16] 本身维护其作者和通讯者的邮件列表和其他异地渠道，以便在有或没有网站干预或甚至没有网站的情况下相互交流。

#### 自由文化值得为此努力

互联网有时被视为懒人社交俱乐部。你可以在需要时登录并在感到疲倦时将其关闭，也可以漫步到所需的任何社交圈。

但实际上，自由文化可能是项艰难的工作。但是这种艰难从某种意义上讲并不是说要成为其中的一分子很困难，而是你必须努力维护。如果你忽略你所在的社区，那么该社区可能会在你意识到之前就枯萎并褪色。

花点时间环顾四周，确定你属于哪个社区，如果不是，那么请告诉某人你对他们带给你生活的意义表示赞赏。同样重要的是，请记住，这样你也为社区的生活做出了贡献。

几周前，知识共享组织在华沙举行了它的全球峰会，令人惊叹的国际盛会...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tribal_pattern_shoes.png?itok=e5dSf2hS (White shoes on top of an orange tribal pattern)
[2]: https://opensource.com/article/18/1/inkscape-absolute-beginners
[3]: https://creativecommons.org/share-your-work/public-domain/cc0/
[4]: http://example.com
[5]: http://www.iana.org/domains/example"\>More
[6]: http://publicdomainvectors.org
[7]: https://github.com/viralsolani/laravel-adminpanel
[8]: https://freesvg.org
[9]: http://freesvg.org
[10]: http://inkscape.org
[11]: https://freesvg.org/drinking-coffee-vector-drawing
[12]: https://freesvg.org/king-of-swords-tarot-card
[13]: https://freesvg.org/space-pioneers-135-scene-vector-image
[14]: http://forum.freesvg.org/
[15]: https://opensource.com/article/18/1/creative-commons-real-world
[16]: http://Opensource.com
