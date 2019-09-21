在开源项目中做出你的第一个贡献
============================================================

> 这是许多事情的第一步

![women programming](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G "women programming")

图片提供 : [WOCinTech Chat][16]. 图片修改 : Opensource.com. [CC BY-SA 4.0][17]

有一个普遍的误解，那就是对开源做出贡献是一件很难的事。你可能会想，“有时我甚至不能理解我自己的代码；那我怎么可能理解别人的？”

放轻松。直到去年，我都以为是这样。阅读和理解他人的代码，然后在他们的基础上写上你自己的代码，这是一件令人气馁的任务；但如果有合适的资源，这不像你想象的那么糟。

第一步要做的是选择一个项目。这个决定是可能是一个菜鸟转变成一个老练的开源贡献者的关键一步。

许多对开源感兴趣的业余程序员都被建议从 [Git][18] 入手，但这并不是最好的开始方式。Git 是由许多有着多年软件开发经验的超级极客维护的。它是寻找可以做贡献的开源项目的好地方，但对新手并不友好。大多数对 Git 做出贡献的开发者都有足够的经验，他们不需要参考各类资源或文档。在这篇文章里，我将提供一个对新手友好的特性的列表，并且给出一些建议，希望可以使你更轻松地对开源做出贡献。

### 理解产品

在开始贡献之前，你需要理解项目是怎么工作的。为了理解这一点，你需要自己来尝试。如果你发现这个产品很有趣并且有用，它就值得你来做贡献。

初学者常常选择参与贡献那些他们没有使用过的软件。他们会失望，并且最终放弃贡献。如果你没有用过这个软件，你不会理解它是怎么工作的。如果你不理解它是怎么工作的，你怎么能解决 bug 或添加新特性呢？

要记住：尝试它，才能改变它。

### 确认产品的状况

这个项目有多活跃？

如果你向一个暂停维护的项目提交一个<ruby>拉取请求<rt>pull request</rt></ruby>，你的请求可能永远不会被讨论或合并。找找那些活跃的项目，这样你的代码可以得到即时的反馈，你的贡献也就不会被浪费。

这里介绍了怎么确认一个项目是否还是活跃的：

*   **贡献者数量：** 一个增加的贡献者数量表明开发者社区乐于接受新的贡献者。
*   **<ruby>提交<rt>commit</rt></ruby>频率：** 查看最近的提交时间。如果是一周之内，甚至是一两个月内，这个项目应该是定期维护的。
*   **维护者数量：** 维护者的数量越多，你越可能得到指导。
*   **聊天室或 IRC 活跃度：** 一个繁忙的聊天室意味着你的问题可以更快得到回复。

### 新手资源

Coala 是一个开源项目的例子。它有自己的教程和文档，让你可以使用它（每一个类和方法）的 API。这个网站还设计了一个有吸引力的界面，让你有阅读的兴趣。

**文档：** 不管哪种水平的开发者都需要可靠的、被很好地维护的文档，来理解项目的细节。找找在 [GitHub][19]（或者放在其它位置）或者类似于 [Read the Docs][20] 之类的独立站点上提供了完善文档的项目，这样可以帮助你深入了解代码。

![Coala Newcomers' Guide screen](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/coala-newcomers_guide.png?itok=G7mfPbXN "Coala Newcomers' Guide screen")

**教程：** 教程会给新手解释如何在项目里添加特性 （然而，你不是在每个项目中都能找到它）。例如，Coala 提供了 [小熊编写指南][21] （进行代码分析的<ruby>代码格式化<rt>linting</rt></ruby>工具的 Python 包装器）。

![Coala UI](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/coala_ui.png?itok=LR02629W "Coala User Interface screenshot")

**分类的<ruby>讨论点<rt>issue</rt></ruby>：** 对刚刚想明白如何选择第一个项目的初学者来说，选择一个讨论点是一个更加困难的任务。标签被设为“难度/低”、“难度/新手”、“利于初学者”，以及“<ruby>触手可及<rt>low-hanging fruit</rt></ruby>”都表明是对新手友好的。

![Coala labeled issues](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/coala_labeled_issues.png?itok=74qSjG_T "Coala labeled issues")

### 其他因素

![CI user pipeline log](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/ci_logs.png?itok=J3V8gbc7 "CI user pipeline log")

*   **维护者对新的贡献者的态度：** 从我的经验来看，大部分开源贡献者都很乐于帮助他们项目里的新手。然而，当你问问题时，你也有可能遇到一些不太友好的人（甚至可能有点粗鲁）。不要因为这些人失去信心。他们只是因为在比他们经验更丰富的人那儿得不到发泄的机会而已。还有很多其他人愿意提供帮助。
*   **审阅过程/机制：** 你的拉取请求将经历几遍你的同伴和有经验的开发者的查看和更改——这就是你学习软件开发最主要的方式。一个具有严格审阅过程的项目使您在编写生产级代码的过程中成长。
*   **一个稳健的<ruby>持续集成<rt>continuous integration</rt></ruby>管道：** 开源项目会向新手们介绍持续集成和部署服务。一个稳健的 CI 管道将帮助你学习阅读和理解 CI 日志。它也将带给你处理失败的测试用例和代码覆盖率问题的经验。
*   **参加编程项目（例如 [Google Summer Of Code][1]）：** 参加组织证明了你乐于对一个项目的长期发展做贡献。他们也会给新手提供一个机会来获得现实世界中的开发经验，从而获得报酬。大多数参加这些项目的组织都欢迎新人加入。

### 7 对新手友好的组织

*   [coala (Python)][7]
*   [oppia (Python, Django)][8]
*   [DuckDuckGo (Perl, JavaScript)][9]
*   [OpenGenus (JavaScript)][10]
*   [Kinto (Python, JavaScript)][11]
*   [FOSSASIA (Python, JavaScript)][12]
*   [Kubernetes (Go)][13]


### 关于作者

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/img_20180309_001440858.jpg?itok=tG8yvrJF)][22] 
 
Palash Nigam - 我是一个印度计算机科学专业本科生，十分乐于参与开源软件的开发，我在 GitHub 上花费了大部分的时间。我现在的兴趣包括 web 后端开发，区块链，和 All things python。[更多关于我][14]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/get-started-open-source-project

作者：[Palash Nigam][a]
译者：[lonaparte](https://github.com/lonaparte)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/palash25
[1]:https://en.wikipedia.org/wiki/Google_Summer_of_Code
[2]:https://opensource.com/file/391211
[3]:https://opensource.com/file/391216
[4]:https://opensource.com/file/391226
[5]:https://opensource.com/file/391221
[6]:https://opensource.com/article/18/4/get-started-open-source-project?rate=i_d2neWpbOIJIAEjQKFExhe0U_sC6SiQgkm3c7ck8IM
[7]:https://github.com/coala/coala
[8]:https://github.com/oppia/oppia
[9]:https://github.com/duckduckgo/
[10]:https://github.com/OpenGenus/
[11]:https://github.com/kinto
[12]:https://github.com/fossasia/
[13]:https://github.com/kubernetes
[14]:https://opensource.com/users/palash25
[15]:https://opensource.com/user/212436/feed
[16]:https://www.flickr.com/photos/wocintechchat/25171528213/
[17]:https://creativecommons.org/licenses/by/4.0/
[18]:https://git-scm.com/
[19]:https://github.com/
[20]:https://readthedocs.org/
[21]:http://api.coala.io/en/latest/Developers/Writing_Linter_Bears.html
[22]:https://opensource.com/users/palash25
[23]:https://opensource.com/users/palash25
[24]:https://opensource.com/users/palash25
[25]:https://opensource.com/article/18/4/get-started-open-source-project#comments
[26]:https://opensource.com/tags/web-development
