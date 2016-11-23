使用 Github Pages 发布你的项目文档
=====

你可能比较熟悉[如何用 Github Pages 来分享你的工作][3]，又或许你看过[一堂][4]教你建立你的第一个 Github Pages 网站的教程。近期 Github Pages 的改进使得[从不同的数据源来发布您的网站][5]更加的方便，其中的来源之一就是你的仓库的 /docs 目录。

文档的质量是一个软件项目健康发展的标志。对于开源项目来说，维护一个可靠而不出错的知识库、详细说明所有的细节是至关重要的。精心策划的文档可以让增加项目的亲切感，提供一步步的指导并促进各种方式的合作可以推动开源软件开发的协作进程。

在 Web 上托管你的文档是一个消耗时间的挑战，而且对于它的发布和维护也没有省事的办法，然而这是并非不可避免的。面对多种不同的发布工具，又是 FTP 服务器，又是数据库，文件以各种不同的方式存放在不同的位置下，而这些都需要你手动来调整。需要说明的是，传统的 Web 发布方式提供了无与伦比的灵活性和性能，但是在许多情况下，这是以牺牲简单易用为代价的。

当作为文档使用时，麻烦更少的方式显然更容易去维护。

[GitHub Pages][2] 可以以指定的方式为你的项目创建网站，这使得它天然地适合发布和维护文档。因为 Github Pages 支持 Jekyll，所以你可以使用纯文本或 Markdown 来书写你的文档，从而降低你维护的成本、减少维护时的障碍。Jekyll 还支持许多有用的工具比如变量、模板、以及自动代码高亮等等，它会给你更多的灵活性而不会增加复杂性，这些你在一些笨重的平台是见不到的。

最重要的是，在 Github 上使用 GitHub Pages 意味着你的文档和代码可以使用诸如 Issues 和 Pull Requests 来确保它得到应有的高水平维护，而且因为 GitHub Pages 允许您发布代码库主分支上的 /docs 目录，这样您就可以在同一分支同时维护你的代码库及其文档。

### 现在开始！

发布你的第一个文档页面只需要短短几分钟。

1. 在你的仓库的主分支里创建一个 /docs/index.md 文件。

2. 把你的内容以 Jekyll 格式添加进去，并提交你的修改。

	![](https://cloud.githubusercontent.com/assets/3477155/17778793/47c5a586-6533-11e6-982c-ebd41ec6968c.gif)

3. 查看你的仓库的设置分支然后选择主分支 /docs 目录，将其设置为 GitHub Pages 的源 ，点击保存，你就搞定了。

![](https://cloud.githubusercontent.com/assets/3477155/17778792/47c2ecc4-6533-11e6-828a-91980daa7297.gif)

GitHub Pages 将会从你的 /docs 目录中读取内容，转换 index.md 为 HTML。然后把它发布到你的 GitHub Pages 的 URL 上。

这样将会创建并输出一个最基础的 HTML ，而且你可以使用 Jekyll 的自定义模板、CSS 和其他特性。如果想要看所有的可能，你可以看看 [GitHub Pages Showcase][1]。

--------------------------------------------------------------------------------

via: https://github.com/blog/2233-publish-your-project-documentation-with-github-pages

作者：[loranallensmith][a]
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/loranallensmith
[1]: https://github.com/showcases/github-pages-examples
[2]: https://pages.github.com/
[3]: https://www.youtube.com/watch?v=2MsN8gpT6jY
[4]: https://www.youtube.com/watch?v=RaKX4A5EiQo
[5]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/
