[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12227-1.html)
[#]: subject: (9 open source CSS frameworks for frontend web development)
[#]: via: (https://opensource.com/article/20/4/open-source-css-frameworks)
[#]: author: (Bryant Son https://opensource.com/users/brson)

9 个用于前端 Web 开发的开源 CSS 框架
======

> 探索开源 CSS 框架，找到适合你的项目的框架。

![](https://img.linux.net.cn/data/attachment/album/202005/18/094922of81rqfiei8x78xi.jpg)

当大多数人想到 Web 开发时，通常会想到 HTML 或 JavaScript。他们通常会忘记对网站的欣赏能力有更大影响的技术：<ruby>[级联样式表][2]<rt>cascading style sheets</rt></ruby>（简称 CSS）。据维基百科的说法，CSS 既是网页中最重要的部分，也是最常被遗忘的部分，尽管它是万维网的三大基石技术之一。

本文将探讨九种流行的、强大的、开源的框架，是这些框架让构建漂亮的网站前端的 CSS 开发变得简单明了。

名称 | 介绍| 许可证
---|---|---
[Bootstrap][3] | 最流行的 CSS 框架，来自 Twitter | MIT
[PatternFly][4] | 开源框架，来自 Red Hat | MIT
[MDC Web][5] | Material Design 组件开源框架，来自 Google | MIT
[Pure][6] | 开源框架，来自 Yahoo | BSD
[Foundation][7] | 前端框架，来自 Zurb 基金会 | MIT
[Bulma][8] | 现代 CSS 框架，基于 Flexbox | MIT
[Skeleton][9] | 轻量级 CSS 框架 | MIT
[Materialize][10] | 基于 Material Design 的 CSS 框架 | MIT
[Bootflat][11] | 开源 Flat UI 工具，基于 Bootstrap 3.3.0 | MIT

### Bootstrap

[Bootstrap][2] 无疑是最流行的 CSS 框架，它是所有前端 Web 设计的开端。Bootstrap 由 Twitter 开发，提供了可用性、功能性和可扩展性。

![Bootstrap homepage][13]

Bootstrap 还提供了大量的[例子][14]来帮助你入门。

![Bootstrap examples][15]

使用 Bootstrap，你可以将不同的组件和布局拼接在一起，创造出有趣的页面设计。它还提供了大量详细的文档。

![Bootstrap documentation][16]

Bootstrap 的 [GitHub][3] 仓库有超过 19000 个提交和 1100 个贡献者。它基于 MIT 许可证，所以（和这个列表中的所有框架一样）你也可以加入并贡献。

![Bootstrap GitHub][17]

### PatternFly

[PatternFly][18] 是由 Red Hat 开发的一个开源的（MIT 许可证）CSS 框架。PatternFly 采取了与 Bootstrap 不同的方法：Bootstrap 是为任何对创建一个漂亮网站感兴趣的人而设计的，而 PatternFly 主要针对企业级应用开发者，它提供的组件，如条形图、图表和导航，对于创建强大的、指标驱动的仪表盘非常有吸引力。事实上，Red Hat 在其产品（如 OpenShift）的设计中也使用了这个 CSS 框架。

![PatternFly homepage][19]

除了静态 HTML 之外，PatternFly 还支持 ReactJS 框架，ReactJS 是 Facebook 开发的一个流行的 JavaScript 框架。

![PatternFly ReactJS support][20]

PatternFly 有许多高级组件，如条形图、图表、[模态窗口][21]和布局等，适用于企业级应用。

![PatternFly chart component][22]

PatternFly 的 [GitHub][4] 页面列出了超过 1050 个提交和 44 个贡献者。PatternFly 得到了很多人的关注，欢迎大家踊跃贡献。

![PatternFly GitHub][23]

### MDC Web

凭借其大获成功的安卓平台，谷歌以一个名为 [Material Design][24] 的概念制定了自己的标准设计准则。Material Design 标准旨在体现在所有谷歌的产品中，这些标准也可以面向大众，并且在 MIT 许可证下开源。

![Material Design homepage][25]

Material Design 有许多“用于创建用户界面的交互式构建块”的[组件][26]。这些按钮、卡片、背景等可用于创建网站或移动应用程序的任何类型的用户界面。

![Material Components webpage][27]

维护人员为不同的平台提供了详尽的文档。

![Material Design documentation][28]

还有分步教程，其中包含用于实现不同目标的练习。

![Material Design tutorial][29]

Material 组件的 GitHub 页面承载了面向不同平台的存储库，包括用于网站开发的 [Material Web 组件（MDC Web）][5]。MDC Web 有超过 5700 个提交和 349 个贡献者。

![MDC Web GitHub][30]

### Pure

Bootstrap、Patternfly 和 MDC Web 都是非常强大的 CSS 框架，但是它们可能相当的笨重和复杂。如果你想要一个轻量级的 CSS 框架，它更接近于自己编写 CSS，但又能帮助你建立一个漂亮的网页，可以试试 [Pure.css][31]。Pure 是一个轻量级的 CSS 框架，它的体积很小。它是由 Yahoo 开发的，在 BSD 许可证下开源。

![Pure.css homepage][32]

尽管体积小，但 Pure 提供了建立一个漂亮网页的很多必要的组件。

![Pure.css components][33]

Pure 的 [GitHub][6] 页面显示它有超过 565 个提交和 59 个贡献者。

![Pure.css GitHub][34]

### Foundation

[Foundation][35] 号称是世界上最先进的响应式前端框架。它提供了先进的功能和教程，用于构建专业网站。

![Foundation homepage][36]

该框架被许多公司、组织甚至政客[使用][37]，并且有大量的文档可用。

![Foundation documentation][38]

Foundation 的 [GitHub][7] 页面显示有近 17000 个提交和 1000 个贡献者。和这个列表中的大多数其他框架一样，它也是在 MIT 许可证下提供的。

![Foundation GitHub][39]

### Bulma

[Bulma][40] 是一个基于 Flexbox 的开源框架，在 MIT 许可证下提供。Bulma 是一个相当轻量级的框架，因为它只需要一个 CSS 文件。

![Bulma homepage][41]

Bulma 有简洁明快的文档，让你可以很容易地选择你想要探索的主题。它也有很多网页组件，你可以直接拿起来在设计中使用。

![Bulma documentation][42]

Bulma 的 [GitHub][8] 页面列出了 1400 多个提交和 300 多个贡献者。

![Bulma GitHub][43]

### Skeleton

如果连 Pure 都觉得太重了，那么还有一个叫 [Skeleton][44] 的更轻量级框架。Skeleton 库只有 400 行左右的长度，而且这个框架只提供了开始你的 CSS 框架之旅的基本组件。

![Skeleton homepage][45]

尽管它很简单，但 Skeleton 提供了详细的文档，可以帮助你马上上手。

![Skeleton documentation][46]

Skeleton 的 [GitHub][9] 列出了 167 个提交和 22 个贡献者。然而，它不是很活跃，它的最后一次更新是在 2014 年，所以在使用之前可能需要一些维护。由于它是在 MIT 许可证下发布的，你可以自行维护。

![Skeleton GitHub][47]

### Materialize

[Materialize][48] 是一个基于 Google 的 Material Design 的响应式前端框架，带有由 Materialize 的贡献者开发的附加主题和组件。

![Materialize homepage][49]

Materialize 的文档页面非常全面，而且相当容易理解。它的组件页面包括按钮、卡片、导航等等。

![Materialize documentation][50]

Materialize 是 MIT 许可证下的开源项目，它的 [GitHub][10] 列出了超过 3800 个提交和 250 个贡献者。

![Materialize GitHub][51]

### Bootflat

[Bootflat][52] 是由 Twitter 的 Bootstrap 衍生出来的一个开源 CSS 框架。与 Bootstrap 相比， Bootflat 更简单，框架组件更轻量级。

![Bootflat homepage][53]

Bootflat 的[文档][54]几乎像是受到了宜家的启发 —— 它显示的是每个组件的图片，没有太多的文字。

![Bootflat docs][55]

Bootflat 是在 MIT 许可证下提供的，其 [GitHub][11] 页面包括 159 个提交和 8 个贡献者。

![Bootflat GitHub][56]

### 你应该选择哪个 CSS 框架？

对于开源的 CSS 框架，你有很多选择，这取决于你想要的工具功能有多丰富或简单。就像所有的技术决定一样，没有一个正确的答案，只有在给定的时间和项目中才有正确的选择。

尝试一下其中的一些，看看要在下一个项目中使用哪个。另外，我有没有错过任何有趣的开源 CSS 框架？请在下面的评论中分享你的反馈和想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/open-source-css-frameworks

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://en.wikipedia.org/wiki/Cascading_Style_Sheets
[3]: https://github.com/twbs/bootstrap
[4]: https://github.com/patternfly/patternfly
[5]: https://github.com/material-components/material-components-web
[6]: https://github.com/pure-css/pure
[7]: https://github.com/foundation/foundation-sites
[8]: https://github.com/jgthms/bulma
[9]: https://github.com/dhg/Skeleton
[10]: https://github.com/Dogfalo/materialize
[11]: https://github.com/bootflat/bootflat.github.io
[12]: https://getbootstrap.com
[13]: https://opensource.com/sites/default/files/uploads/2_bootstrapscreenshot.jpg (Bootstrap homepage)
[14]: https://getbootstrap.com/docs/4.4/examples/
[15]: https://opensource.com/sites/default/files/uploads/3_bootstrapsamples.jpg (Bootstrap examples)
[16]: https://opensource.com/sites/default/files/uploads/4_bootstrapdocs.jpg (Bootstrap documentation)
[17]: https://opensource.com/sites/default/files/uploads/5_bootstrapgithub.jpg (Bootstrap GitHub)
[18]: https://www.patternfly.org
[19]: https://opensource.com/sites/default/files/uploads/6_patternflyhomepage.jpg (PatternFly homepage)
[20]: https://opensource.com/sites/default/files/uploads/7_patternflyreactjs.jpg (PatternFly ReactJS support)
[21]: https://en.wikipedia.org/wiki/Modal_window
[22]: https://opensource.com/sites/default/files/uploads/8_patternflycomponents.jpg (PatternFly chart component)
[23]: https://opensource.com/sites/default/files/uploads/9_patternflygithub.jpg (PatternFly GitHub)
[24]: https://material.io
[25]: https://opensource.com/sites/default/files/uploads/10_materialhome.jpg (Material Design homepage)
[26]: https://material.io/components/
[27]: https://opensource.com/sites/default/files/uploads/11_materialcomponents.jpg (Material Components webpage)
[28]: https://opensource.com/sites/default/files/uploads/12_materialdocs.jpg (Material Design documentation)
[29]: https://opensource.com/sites/default/files/uploads/13_materialtutorial.jpg (Material Design tutorial)
[30]: https://opensource.com/sites/default/files/uploads/15_materialgithub.jpg (MDC Web GitHub)
[31]: https://purecss.io
[32]: https://opensource.com/sites/default/files/uploads/16_purehome.jpg (Pure.css homepage)
[33]: https://opensource.com/sites/default/files/uploads/17_purecomponents.jpg (Pure.css components)
[34]: https://opensource.com/sites/default/files/uploads/18_puregithub.jpg (Pure.css GitHub)
[35]: https://get.foundation
[36]: https://opensource.com/sites/default/files/uploads/19_foundationhome.jpg (Foundation homepage)
[37]: https://zurb.com/responsive
[38]: https://opensource.com/sites/default/files/uploads/21_foundationdocs.jpg (Foundation documentation)
[39]: https://opensource.com/sites/default/files/uploads/22_foundationgithub.jpg (Foundation GitHub)
[40]: https://bulma.io
[41]: https://opensource.com/sites/default/files/uploads/23_bulmahome.jpg (Bulma homepage)
[42]: https://opensource.com/sites/default/files/uploads/24_bulmadoc.jpg (Bulma documentation)
[43]: https://opensource.com/sites/default/files/uploads/25_bulmagithub.jpg (Bulma GitHub)
[44]: http://getskeleton.com
[45]: https://opensource.com/sites/default/files/uploads/26_skeletonhome.jpg (Skeleton homepage)
[46]: https://opensource.com/sites/default/files/uploads/27_skeletondocs.jpg (Skeleton documentation)
[47]: https://opensource.com/sites/default/files/uploads/28_skeletongithub.jpg (Skeleton GitHub)
[48]: https://materializecss.com
[49]: https://opensource.com/sites/default/files/uploads/29_materializehome.jpg (Materialize homepage)
[50]: https://opensource.com/sites/default/files/uploads/30_materializedocs.jpg (Materialize documentation)
[51]: https://opensource.com/sites/default/files/uploads/31_materializegithub.jpg (Materialize GitHub)
[52]: http://bootflat.github.io
[53]: https://opensource.com/sites/default/files/uploads/32_bootflathome.jpg (Bootflat homepage)
[54]: http://bootflat.github.io/documentation.html
[55]: https://opensource.com/sites/default/files/uploads/33_bootflatdocs.jpg (Bootflat docs)
[56]: https://opensource.com/sites/default/files/uploads/34_bootflatgithub.jpg (Bootflat GitHub)
