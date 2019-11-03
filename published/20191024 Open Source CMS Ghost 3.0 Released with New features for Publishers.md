[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11534-1.html)
[#]: subject: (Open Source CMS Ghost 3.0 Released with New features for Publishers)
[#]: via: (https://itsfoss.com/ghost-3-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

开源 CMS Ghost 3.0 发布，带来新功能
======

[Ghost][1] 是一个自由开源的内容管理系统（CMS）。如果你还不了解 CMS，那我在此解释一下。CMS 是一种软件，用它可以构建主要专注于创建内容的网站，而无需了解 HTML 和其他与 Web 相关的技术。

事实上，Ghost 是目前[最好的开源 CMS][2] 之一。它主要聚焦于创建轻量级、快速加载、界面美观的博客。

Ghost 系统有一个现代直观的编辑器，该编辑器内置 SEO（搜索引擎优化）功能。你也可以用本地桌面（包括 Linux 系统）和移动应用程序。如果你喜欢终端，也可以使用其提供的 CLI（命令行界面）工具。

让我们看看 Ghost 3.0 带来了什么新功能。

### Ghost 3.0 的新功能

![][3]

我通常对开源的 CMS 解决方案很感兴趣。因此，在阅读了官方公告后，我通过在 Digital Ocean 云服务器上安装新的 Ghost 实例来进一步尝试它。

与以前的版本相比，Ghost 3.0 在功能和用户界面上的改进给我留下了深刻的印象。

在此，我将列出一些值得一提的关键点。

#### 书签卡

![][5]

除了编辑器的所有细微更改之外，3.0 版本现在支持通过输入 URL 添加漂亮的书签卡。

如果你使用过 WordPress（你可能已经注意到，WordPress 需要添加一个插件才能添加类似的卡片），所以该功能绝对是 Ghost 3.0 系统的一个最大改进。

#### 改进的 WordPress 迁移插件

我没有专门对此进行测试，但它更新了 WordPress 的迁移插件，可以让你轻松地将帖子（带有图片）克隆到 Ghost CMS。

基本上，使用该插件，你就能够创建一个存档（包含图片）并将其导入到 Ghost CMS。

#### 响应式图像库和图片

为了使用户体验更好，Ghost 团队还更新了图像库（现已为响应式），以便在所有设备上舒适地呈现你的图片集。

此外，帖子和页面中的图片也更改为响应式的了。

#### 添加成员和订阅选项

![Ghost Subscription Model][6]

虽然，该功能目前还处于测试阶段，但如果你是以此平台作为维持你业务关系的重要发布平台，你可以为你的博客添加成员、订阅选项。

该功能可以确保只有订阅的成员才能访问你的博客，你也可以选择让未订阅者也可以访问。

#### Stripe：集成支付功能

默认情况下，该版本支持 Stripe 付款网关，帮助你轻松启用订阅功能（或使用任何类型的付款的付款方式），而 Ghost 不收取任何额外费用。

#### 新的应用程序集成

![][7]

你现在可以在 Ghost 3.0 的博客中集成各种流行的应用程序/服务。它可以使很多事情自动化。

#### 默认主题改进

引入的默认主题（设计）已得到改进，现在也提供了夜间模式。

你也可以随时选择创建自定义主题（如果没有可用的预置主题）。

#### 其他小改进

除了所有关键亮点以外，用于创建帖子/页面的可视编辑器也得到了改进（具有某些拖放功能）。

我确定还有很多技术方面的更改，如果你对此感兴趣，可以在他们的[更改日志][8]中查看。

### Ghost 影响力渐增

要在以 WordPress 为主导的世界中获得认可并不是一件容易的事。但 Ghost 逐渐形成了它的一个专门的发布者社区。

不仅如此，它的托管服务 [Ghost Pro][9] 现在拥有像 NASA、Mozilla 和 DuckDuckGo 这样的客户。

在过去的六年中，Ghost 从其 Ghost Pro 客户那里获得了 500 万美元的收入。就从它是致力于开源系统解决方案的非营利组织这一点来讲，这确实是一项成就。

这些收入有助于它们保持独立，避免风险投资家的外部资金投入。Ghost CMS 的托管客户越多，投入到免费和开源的 CMS 的研发款项就越多。

总体而言，Ghost 3.0 是迄今为止提供的最好的升级版本。这些功能给我留下了深刻的印象。

如果你拥有自己的网站，你会使用什么 CMS？你曾经使用过 Ghost 吗？你的体验如何？请在评论部分分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ghost-3-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/recommends/ghost/
[2]: https://itsfoss.com/open-source-cms/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/ghost-3.jpg?ssl=1
[4]: https://itsfoss.com/recommends/digital-ocean/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/ghost-editor-screenshot.png?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/ghost-subscription-model.jpg?resize=800%2C503&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/ghost-app-integration.jpg?ssl=1
[8]: https://ghost.org/faq/upgrades/
[9]: https://itsfoss.com/recommends/ghost-pro/
