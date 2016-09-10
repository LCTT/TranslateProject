translating by Bestony

使用Github Pages 发布你的项目文档
=====

你可能比较熟悉[Github Pages 如何帮你分享你的工作][3] 又或许你加入了[一堂课][4] 来帮你建立你的第一个 Github Pages 的网站。近期 Github Pages 的改进使[从不同的源来发布您的网站][5]更加的方便.其中的来源之一就是你的仓库的 /docs 目录. 

文档的质量是任何一个健康的软件项目的标志。对于开源项目来说，维护一个强大的知识大纲详细说明所有的细节是至关重要的。维护很好的文档可以增强项目的可用性，提供一步一步的指导和培养不同步合作可以推动开源软件开发的协作进程。

在Web上托管你的文档是一个消耗时间的挑战而且发布和维护不会有什么有用的经验，而这是可以避免的。面对不同的发布工具，比如 FTP 服务器 和 数据库 意味着文件存在于多个不同的状态下和不同的地点，而这些都需要手动来同步。需要澄清的是，传统的 Web 发布提供了无与伦比的灵活性和性能，但是在许多情况下，这是以牺牲简单为代价的。

当作为文档时，一个路径显然更容易去接触到。


[GitHub Pages][2] 给你一个指定的路径来为你的项目创建网站，这使得他天然适合发布和维护文档。因为 Github Pages 支持 Jekyll ,所以你可以使用纯文本或 Markdown 来书写你的文档，降低你维护的成本，减少维护时的障碍。Jekyll还支持许多有用的工具比如变量、模板、以及自动的代码高亮，他会给你更多的灵活性而不会增加复杂性，这些你在一些笨重的平台是见不到的。

最重要的是,在 Github 上使用 GitHub Pages 意味着你的文档和代码可以使用诸如 Issues 和 Pull Requests 来确保它受到到应有的高水平的维护,而且因为 GitHub Pages 允许您发布主分支的 /docs 目录,您可以在同一分支维护你的代码库及其文档。

### 现在开始！

发布你的第一个文档页面只需要短短几分钟。

1. 在你的仓库的主分支里创建一个 /docs/index.md 文件。

2. 把你的内容以 Jekyll 格式添加进去，并提交你的修改。

![](https://cloud.githubusercontent.com/assets/3477155/17778793/47c5a586-6533-11e6-982c-ebd41ec6968c.gif)

3. 查看你的仓库的设置分支然后选择主分支 /docs 目录，将其设置为 GitHub Pages 的源 ，点击保存，你就搞定了。

![](https://cloud.githubusercontent.com/assets/3477155/17778792/47c2ecc4-6533-11e6-828a-91980daa7297.gif)

GitHub Pages 将会从你的 /docs 目录中读取内容,转换 index.md 为 HTML。然后把它发布到你的 GitHub Pages URL 上。

这样将会创建一个最基础的HTML并输出，而且你可以在Jekyll自定义模板、CSS 和其他特性.如果想要看所有的可能，你可以看看 [GitHub Pages Showcase][1]。

--------------------------------------------------------------------------------

via: https://github.com/blog/2233-publish-your-project-documentation-with-github-pages

作者：[ loranallensmith ][a]
译者：[Bestony](https://github.com/bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/loranallensmith
[1]: https://github.com/showcases/github-pages-examples
[2]: https://pages.github.com/
[3]: https://www.youtube.com/watch?v=2MsN8gpT6jY
[4]: https://www.youtube.com/watch?v=RaKX4A5EiQo
[5]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/
