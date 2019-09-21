怎样如软件工程师一样组织知识
==========

总体上说，软件开发和技术是以非常快的速度发展的领域，所以持续学习是必不可少的。在互联网上花几分钟找一下，在 Twitter、媒体、RSS 订阅、Hacker News 和其它专业网站和社区等地方，就可以从文章、案例研究、教程、代码片段、新应用程序和信息中找到大量有用的信息。

保存和组织所有这些信息可能是一项艰巨的任务。在这篇文章中，我将介绍一些我用来组织信息的工具。

我认为在知识管理方面非常重要的一点就是避免锁定在特定平台。我使用的所有工具都允许以标准格式（如 Markdown 和 HTML）导出数据。

请注意，我的流程并不完美，我一直在寻找新工具和方法来优化它。每个人都不同，所以对我有用的东西可能不适合你。


### 用 NotionHQ 做知识库

对我来说，知识管理的基本部分是拥有某种个人知识库或维基。这是一个你可以以有组织的方式保存链接、书签、备注等的地方。

我使用 [NotionHQ][7] 做这件事。我使用它来记录各种主题，包括资源列表，如通过编程语言分组的优秀的库或教程，为有趣的博客文章和教程添加书签等等，不仅与软件开发有关，而且与我的个人生活有关。

我真正喜欢 NotionHQ 的是，创建新内容是如此简单。你可以使用 Markdown 编写它并将其组织为树状。

这是我的“开发”工作区的顶级页面：

[![Image](https://res.cloudinary.com/practicaldev/image/fetch/s--uMbaRUtu--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/http://i.imgur.com/kRnuvMV.png)][8] 

NotionHQ 有一些很棒的其他功能，如集成了电子表格/数据库和任务板。

如果您想认真使用 NotionHQ，您将需要订阅付费个人计划，因为免费计划有所限制。我觉得它物有所值。NotionHQ 允许将整个工作区导出为 Markdown 文件。导出功能存在一些重要问题，例如丢失页面层次结构，希望 Notion 团队可以改进这一点。

作为一个免费的替代方案，我可能会使用 [VuePress][9] 或 [GitBook][10] 来托管我自己的知识库。

### 用 Pocket 保存感兴趣的文章

[Pocket][11] 是我最喜欢的应用之一！使用 Pocket，您可以创建一个来自互联网上的文章的阅读列表。每当我看到一篇看起来很有趣的文章时，我都会使用 Chrome 扩展程序将其保存到 Pocket。稍后，我会阅读它，如果我发现它足够有用，我将使用 Pocket 的“存档”功能永久保存该文章并清理我的 Pocket 收件箱。

我尽量保持这个阅读清单足够小，并存档我已经处理过的信息。Pocket 允许您标记文章，以便以后更轻松地搜索特定主题的文章。

如果原始网站消失，您还可以在 Pocket 服务器中保存文章的副本，但是您需要 Pocket Premium 订阅计划。

Pocket 还具有“发现”功能，根据您保存的文章推荐类似的文章。这是找到可以阅读的新内容的好方法。

### 用 SnippetStore 做代码片段管理

从 GitHub 到 Stack Overflow 的答案，到博客文章，经常能找到一些你想要保存备用的好代码片段。它可能是一些不错的算法实现、一个有用的脚本或如何在某种语言中执行某种操作的示例。

我尝试了很多应用程序，从简单的 GitHub Gists 到 [Boostnote][12]，直到我发现 [SnippetStore][13]。

SnippetStore 是一个开源的代码片段管理应用。SnippetStore 与其他产品的区别在于其简单性。您可以按语言或标签整理片段，并且可以拥有多个文件片段。它不完美，但是可以用。例如，Boostnote 具有更多功能，但我更喜欢 SnippetStore 组织内容的简单方法。

对于我每天使用的缩写和片段，我更喜欢使用我的编辑器 / IDE 的代码片段功能，因为它更便于使用。我使用 SnippetStore 更像是作为编码示例的参考。

[Cacher][14] 也是一个有趣的选择，因为它与许多编辑器进行了集成，他有一个命令行工具，并使用 Gi​​tHub Gists 作为后端，但其专业计划为 6 美元/月，我觉这有点太贵。

### 用 DevHints 管理速查表

[Devhints][15] 是由 Rico Sta. Cruz 创建的一个速查表集合。它是开源的，是用 Jekyll 生成的，Jekyll 是最受欢迎的静态站点生成器之一。

这些速查表是用 Markdown 编写的，带有一些额外的格式化支持，例如支持列。

我非常喜欢其界面的外观，并且不像可以在 [Cheatography][16] 等网站上找到 PDF 或图像格式的速查表， Markdown 非常容易添加新内容并保持更新和进行版本控制。

因为它是开源，我创建了自己的分叉版本，删除了一些我不需要的速查表，并添加了更多。

我使用速查表作为如何使用某些库或编程语言或记住一些命令的参考。速查表的单个页面非常方便，例如，可以列出特定编程语言的所有基本语法。

我仍在尝试这个工具，但到目前为止它的工作很好。

### Diigo

[Diigo][17] 允许您注释和突出显示部分网站。我在研究新东西时使用它来注释重要信息，或者从文章、Stack Overflow 答案或来自 Twitter 的鼓舞人心的引语中保存特定段落！;）

* * *

就这些了。某些工具的功能方面可能存在一些重叠，但正如我在开始时所说的那样，这是一个不断演进的工作流程，因为我一直在尝试和寻找改进和提高工作效率的方法。

你呢？是如何组织你的知识的？请随时在下面发表评论。

谢谢你的阅读。

------------------------------------------------------------------------

作者简介：Bruno Paz，Web 工程师，专精 #PHP 和 @Symfony 框架。热心于新技术。喜欢运动，@FCPorto 的粉丝！

--------------------------------------------------------------------------------

via: https://dev.to/brpaz/how-do-i-organize-my-knowledge-as-a-software-engineer-4387

作者：[Bruno Paz][a]
选题：[oska874](https://github.com/oska874)
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://brunopaz.net/
[1]:https://dev.to/brpaz
[2]:http://twitter.com/brunopaz88
[3]:http://github.com/brpaz
[4]:https://dev.to/t/knowledge
[5]:https://dev.to/t/learning
[6]:https://dev.to/t/development
[7]:https://www.notion.so/
[8]:https://res.cloudinary.com/practicaldev/image/fetch/s--uMbaRUtu--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/http://i.imgur.com/kRnuvMV.png
[9]:https://vuepress.vuejs.org/
[10]:https://www.gitbook.com/?t=1
[11]:https://getpocket.com/
[12]:https://boostnote.io/
[13]:https://github.com/ZeroX-DG/SnippetStore
[14]:https://www.cacher.io/
[15]:https://devhints.io/
[16]:https://cheatography.com/
[17]:https://www.diigo.com/index
