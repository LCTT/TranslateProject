使用 MDwiki 将 Markdown 发布成 HTML
======
> 用这个有用工具从 Markdown 文件创建一个基础的网站。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

有很多理由喜欢 Markdown，这是一门简单的语言，有易于学习的语法，它可以与任何文本编辑器一起使用。使用像 [Pandoc][1] 这样的工具，你可以将 Markdown 文本转换为[各种流行格式][2]，包括 HTML。你还可以在 Web 服务器中自动执行转换过程。由 TimoDörr 创建的名为  [MDwiki][3] 的 HTML5 和 JavaScript 应用可以将一堆 Markdown 文件在浏览器请求它们时转换为网站。MDwiki 网站包含一个操作指南和其他信息可帮助你入门：

![MDwiki site getting started][5]

*Mdwiki 网站的样子。*

在 Web 服务器内部，基本的 MDwiki 站点如下所示：

![MDwiki site inside web server][7]

*该站点的 web 服务器文件夹的样子*

我将此项目的 MDwiki HTML 文件重命名为 `START.HTML`。还有一个处理导航的 Markdown 文件和一个 JSON 文件来保存一些配置设置。其他的都是网站内容。

虽然整个网站设计被 MDwiki 固定了，但内容、样式和页面数量却没有。你可以在 [MDwiki 站点][8]查看由 MDwiki 生成的一系列不同站点。公平地说，MDwiki 网站缺乏网页设计师可以实现的视觉吸引力 —— 但它们是功能性的，用户应该平衡其简单的外观与创建和编辑它们的速度和简易性。

Markdown 有不同的风格，可以针对不同的特定目的扩展稳定的核心功能。MDwiki 使用 GitHub 风格 [Markdown][9]，它为流行的编程语言添加了格式化代码块和语法高亮等功能，使其非常适合生成程序文档和教程。

MDwiki 还支持 “gimmick”，它增加了如嵌入 YouTube 视频和显示数学公式等额外功能。如果在某些项目中需要它们，这些值得探索。我发现 MDwiki 是创建技术文档和教育资源的理想工具。我还发现了一些可能不会立即显现出来的技巧和 hack。

当部署在 Web 服务器中时，MDwiki 可与任何现代 Web 浏览器一起使用。但是，如果你使用 Mozilla Firefox 访问 MDwiki，那么就不需要 Web 服务器。大多数 MDwiki 用户会选择在 Web 服务器上部署完整的项目，以避免排除潜在用户，但只需使用文本编辑器和 Firefox 即可完成开发和测试。任何现代浏览器都可以读取加载到 Moodle 虚拟学习环境（VLE）中的完整的 MDwiki 项目，这在教育环境中非常有用。 （对于其他 VLE 软件，这可能也是如此，但你应该测试它。）

MDwiki 的默认配色方案并非适用于所有项目，但你可以将其替换为从 [Bootswatch.com][10] 下载的其他主题。为此，只需在编辑器中打开 MDwiki HTML 文件，找到 `extlib/css/bootstrap-3.0.0.min.css`，然后插入下载的 Bootswatch 主题。还有一个 MDwiki gimmick，让用户在浏览器中载入 MDwiki 后，选择 Bootswatch 主题来替换默认值。我经常与有视力障碍的用户一起工作，他们倾向于喜欢高对比度的主题，在深色背景上使用白色文字。

![MDwiki screen with Bootswatch Superhero theme][12]

*MDwiki 页面使用 Bootswatch Superhero 主题*

MDwiki、Markdown 文件和静态图像可以用于许多目的。但是，你有时可能希望包含 JavaScript 幻灯片或反馈表单。Markdown 文件可以包含 HTML 代码，但将 Markdown 与 HTML 混合会让人感到困惑。一种解决方案是在单独的 HTML 文件中创建所需的功能，并将其显示在带有 iframe 标记的 Markdown 文件中。我从 [Twine Cookbook][13] 知道了这个想法，它是 Twine 交互式小说引擎的支持站点。Twine Cookbook 实际上并没有使用 MDwiki，但结合 Markdown 和 iframe 标签开辟了广泛的创作可能性。

这是一个例子：

此 HTML 将显示由 Markdown 文件中的 Twine 交互式小说引擎创建的 HTML 页面。

```
<iframe height="400" src="sugarcube_dungeonmoving_example.html" width="90%"></iframe>
```

MDwiki 生成的站点结果如下所示：

![](https://opensource.com/sites/default/files/uploads/4_-_mdwiki_site_summary.png)

简而言之，MDwiki 是一个出色的小应用，可以很好地实现其目的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/markdown-html-publishing

作者：[Peter Cheer][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petercheer
[1]: https://pandoc.org/
[2]: https://opensource.com/downloads/pandoc-cheat-sheet
[3]: http://dynalon.github.io/mdwiki/#!index.md
[4]: https://opensource.com/file/407306
[5]: https://opensource.com/sites/default/files/uploads/1_-_mdwiki_screenshot.png (MDwiki site getting started)
[6]: https://opensource.com/file/407311
[7]: https://opensource.com/sites/default/files/uploads/2_-_mdwiki_inside_web_server.png (MDwiki site inside web server)
[8]: http://dynalon.github.io/mdwiki/#!examples.md
[9]: https://guides.github.com/features/mastering-markdown/
[10]: https://bootswatch.com/
[11]: https://opensource.com/file/407316
[12]: https://opensource.com/sites/default/files/uploads/3_-_mdwiki_bootswatch_superhero.png (MDwiki screen with Bootswatch Superhero theme)
[13]: https://github.com/iftechfoundation/twine-cookbook
