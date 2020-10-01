[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12671-1.html"
[#]: subject: "10 Open Source Static Site Generators to Create Fast and Resource-Friendly Websites"
[#]: via: "https://itsfoss.com/open-source-static-site-generators/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"

10 大静态网站生成工具
======

![](https://img.linux.net.cn/data/attachment/album/202010/01/123903lx1q0w2oh1lxx7wh.jpg)

> 在寻找部署静态网页的方法吗？这几个开源的静态网站生成工具可以帮你迅速部署界面优美、功能强大的静态网站，无需掌握复杂的 HTML 和 CSS 技能。

### 静态网站是什么？

技术上来讲，静态网站是指网页不是由服务器动态生成的。HTML、CSS 和 JavaScript 文件就静静地躺在服务器的某个路径下，它们的内容与终端用户接收到的版本是一样的。原始的源码文件已经提前编译好了，源码在每次请求后都不会变化。

Linux.CN 是一个依赖多个数据库的动态网站，当有浏览器的请求时，网页就会生成并提供服务。大部分网站是动态的，你与这些网站互动时，大量的内容会经常改变。

静态网站有一些好处，比如加载时间更短，请求的服务器资源更少、更安全（值得商榷）。

传统上，静态网站更适合于创建只有少量网页、内容变化不频繁的小网站。

然而，随着静态网站生成工具出现后，静态网站的适用范围越来越大。你还可以使用这些工具搭建博客网站。

我整理了几个开源的静态网站生成工具，这些工具可以帮你搭建界面优美的网站。

### 最好的开源静态网站生成工具

请注意，静态网站不会提供很复杂的功能。如果你需要复杂的功能，那么你可以参考适用于动态网站的[最佳开源 CMS][1]列表。

#### 1、Jekyll

![][2]

Jekyll 是用 [Ruby][3] 写的最受欢迎的开源静态生成工具之一。实际上，Jekyll 是 [GitHub 页面][4] 的引擎，它可以让你免费用 GitHub 托管网站。

你可以很轻松地跨平台配置 Jekyll，包括 Ubuntu。它利用 [Markdown][5]、[Liquid][5]（模板语言）、HTML 和 CSS 来生成静态的网页文件。如果你要搭建一个没有广告或推广自己工具或服务的产品页的博客网站，它是个不错的选择。

它还支持从常见的 CMS（<ruby>内容管理系统<rt>Content management system</rt></ruby>）如 Ghost、WordPress、Drupal 7 迁移你的博客。你可以管理永久链接、类别、页面、文章，还可以自定义布局，这些功能都很强大。因此，即使你已经有了一个网站，如果你想转成静态网站，Jekyll 会是一个完美的解决方案。你可以参考[官方文档][6]或 [GitHub 页面][7]了解更多内容。

- [Jekyll][8]

#### 2、Hugo

![][9]

Hugo 是另一个很受欢迎的用于搭建静态网站的开源框架。它是用 [Go 语言][10]写的。

它运行速度快、使用简单、可靠性高。如果你需要，它也可以提供更高级的主题。它还提供了一些有用的快捷方式来帮助你轻松完成任务。无论是组合展示网站还是博客网站，Hogo 都有能力管理大量的内容类型。

如果你想使用 Hugo，你可以参照它的[官方文档][11]或它的 [GitHub 页面][12]来安装以及了解更多相关的使用方法。如果需要的话，你还可以将 Hugo 部署在 GitHub 页面或任何 CDN 上。

- [Hugo][13]

#### 3、Hexo

![][14]

Hexo 是一个有趣的开源框架，基于 [Node.js][15]。像其他的工具一样，你可以用它搭建相当快速的网站，不仅如此，它还提供了丰富的主题和插件。

它还根据用户的每个需求提供了强大的 API 来扩展功能。如果你已经有一个网站，你可以用它的[迁移][16]扩展轻松完成迁移工作。

你可以参照[官方文档][17]或 [GitHub 页面][18] 来使用 Hexo。

- [Hexo][19]

#### 4、Gatsby

![][20]

Gatsby 是一个越来越流行的开源网站生成框架。它使用 [React.js][21] 来生成快速、界面优美的网站。

几年前在一个实验性的项目中，我曾经非常想尝试一下这个工具，它提供的成千上万的新插件和主题的能力让我印象深刻。与其他静态网站生成工具不同的是，你可以使用 Gatsby 生成一个网站，并在不损失任何功能的情况下获得静态网站的好处。

它提供了与很多流行的服务的整合功能。当然，你可以不使用它的复杂的功能，或将其与你选择的流行 CMS 配合使用，这也会很有趣。你可以查看他们的[官方文档][22]或它的 [GitHub 页面][23]了解更多内容。

- [Gatsby][24]

#### 5、VuePress

![][25]

VuePress 是由 [Vue.js][26] 支持的静态网站生成工具，而 Vue.js 是一个开源的渐进式 JavaScript 框架。

如果你了解 HTML、CSS 和 JavaScript，那么你可以无压力地使用 VuePress。你应该可以找到几个有用的插件和主题来为你的网站建设开个头。此外，看起来 Vue.js 的更新一直很活跃，很多开发者都在关注 Vue.js，这是一件好事。

你可以参照他们的[官方文档][27]和 [GitHub 页面][28]了解更多。

- [VuePress][29]

#### 6、Nuxt.js

![][30]

Nuxt.js 使用了 Vue.js 和 Node.js，但它致力于模块化，并且有能力依赖服务端而非客户端。不仅如此，它的目标是为开发者提供直观的体验，并提供描述性错误，以及详细的文档等。

正如它声称的那样，在你用来搭建静态网站的所有工具中，Nuxt.js 可以做到功能和灵活性两全其美。他们还提供了一个 [Nuxt 线上沙盒][31]，让你不费吹灰之力就能直接测试它。

你可以查看它的 [GitHub 页面][32]和[官方网站][33]了解更多。

- [Nuxt.js][33]

#### 7、Docusaurus

![][34]

Docusaurus 是一个有趣的开源静态网站生成工具，为搭建文档类网站量身定制。它还是 [Facebook 开源计划][35]的一个项目。

Docusaurus 是用 React 构建的。你可以使用所有的基本功能，像文档版本管理、文档搜索和翻译大多是预先配置的。如果你想为你的产品或服务搭建一个文档网站，那么可以试试 Docusaurus。

你可以从它的 [GitHub 页面][36]和它的[官网][37]获取更多信息。

- [Docusaurus][37]

#### 8、Eleventy

![][38]

Eleventy 自称是 Jekyll 的替代品，旨在以更简单的方法来制作更快的静态网站。

它似乎很容易上手，而且它还提供了适当的文档来帮助你。如果你想找一个简单的静态网站生成工具，Eleventy 似乎会是一个有趣的选择。

你可以参照它的 [GitHub 页面][39]和[官网][40]来了解更多的细节。

- [Eleventy][40]

#### 9、Publii

![][41]

Publii 是一个令人印象深刻的开源 CMS，它能使生成一个静态网站变得很容易。它是用 [Electron][42] 和 Vue.js 构建的。如果有需要，你也可以把你的文章从 WorkPress 网站迁移过来。此外，它还提供了与 GitHub 页面、Netlify 及其它类似服务的一键同步功能。

如果你利用 Publii 生成一个静态网站，你还可以得到一个所见即所得的编辑器。你可以从[官网][43]下载它，或者从它的 [GitHub 页面][44]了解更多信息。

- [Publii][43]

#### 10、Primo

![][45]

一个有趣的开源静态网站生成工具，目前开发工作仍很活跃。虽然与其他的静态生成工具相比，它还不是一个成熟的解决方案，有些功能还不完善，但它是一个独特的项目。

Primo 旨在使用可视化的构建器帮你构建和搭建网站，这样你就可以轻松编辑和部署到任意主机上。

你可以参照[官网][46]或查看它的 [GitHub 页面][47]了解更多信息。

- [Primo][46]

### 结语

还有很多文章中没有列出的网站生成工具。然而，我试图提到最好的静态生成器，为您提供最快的加载时间，最好的安全性和令人印象深刻的灵活性。

列表中没有你最喜欢的工具？在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-source-static-site-generators/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-cms/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/01/jekyll-screenshot.jpg?resize=800%2C450&ssl=1
[3]: https://www.ruby-lang.org/en/
[4]: https://pages.github.com/
[5]: https://github.com/Shopify/liquid/wiki
[6]: https://jekyllrb.com/docs/
[7]: https://github.com/jekyll/jekyll
[8]: https://jekyllrb.com/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/hugo.jpg?resize=800%2C414&ssl=1
[10]: https://golang.org/
[11]: https://gohugo.io/getting-started/
[12]: https://github.com/gohugoio/hugo
[13]: https://gohugo.io/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/hexo.jpg?resize=800%2C213&ssl=1
[15]: https://nodejs.org/en/
[16]: https://hexo.io/api/migrator.html
[17]: https://hexo.io/docs/
[18]: https://github.com/hexojs/hexo
[19]: https://hexo.io/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/gatsbyjs.png?resize=800%2C388&ssl=1
[21]: https://reactjs.org/
[22]: https://www.gatsbyjs.com/docs/
[23]: https://github.com/gatsbyjs/gatsby
[24]: https://www.gatsbyjs.com/
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/VuePress.jpg?resize=800%2C498&ssl=1
[26]: https://vuejs.org/
[27]: https://vuepress.vuejs.org/guide/
[28]: https://github.com/vuejs/vuepress
[29]: https://vuepress.vuejs.org/
[30]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/nuxtjs.jpg?resize=800%2C415&ssl=1
[31]: https://template.nuxtjs.org/
[32]: https://github.com/nuxt/nuxt.js
[33]: https://nuxtjs.org/
[34]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/docusaurus.jpg?resize=800%2C278&ssl=1
[35]: https://opensource.facebook.com/
[36]: https://github.com/facebook/docusaurus
[37]: https://docusaurus.io/
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/eleventy.png?resize=800%2C375&ssl=1
[39]: https://github.com/11ty/eleventy/
[40]: https://www.11ty.dev/
[41]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/publii.jpg?resize=800%2C311&ssl=1
[42]: https://www.electronjs.org
[43]: https://getpublii.com/
[44]: https://github.com/GetPublii/Publii
[45]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/primo-af.jpg?resize=800%2C394&ssl=1
[46]: https://primo.af/
[47]: https://github.com/primo-app/primo-desktop
