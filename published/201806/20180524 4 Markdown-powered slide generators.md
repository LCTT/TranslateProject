4 种基于 Markdown 的幻灯片生成器
======

> 这些简单的幻灯片创建工具可以无缝地使用 Markdown，可以让你的演示添加魅力。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_presentation.png?itok=CQeyO61b)

假设你需要做一个<ruby>演示<rt>presentation</rt></ruby>。在准备的过程中，你想到“我需要写几张幻灯片”。

你可能倾向于简洁的[纯文本][1]，认为 LibreOffice Writer 这样的软件对你要做的事情而言像是杀鸡用牛刀。或者你只是遵从你内心深处的极客意识。

将 [Markdown][2] 格式的文件转换为优雅的演示幻灯片并不困难。下面介绍可以完成这项工作的四种工具。

### Landslide

在这些工具中，[Landslide][3] 具有更高的灵活性。它是一个命令行工具，可以将 Markdown、[reStructuredText][4] 或 [Textile][5] 格式的文件转换为基于 [Google HTML5 幻灯片模板][6]的 HTML 文件。

你要做的不过是编写 Markdown 格式的幻灯片源文件，打开一个终端窗口并运行 `landslide` 命令即可，其中命令参数为 Markdown 文件的文件名。Landslide 会生成 `presentation.html`，可以在任何 Web 浏览器中打开。简单吧？

但不要被简易的操作误导你。Landslide 提供了不少有用的特性，例如增加注记以及为幻灯片增加配置文件。为何要使用这些特性呢？按照 Landslide 开发者的说法，这样可以汇聚不同演示中的源文件目录并重用。

![landslide.png][8]

*在 Landslide 演示中查看演示者注记*

### Marp

[Marp][9] 仍处于开发中，但值得期待。它是 “Markdown Presentation Writer” 的简写。Marp 是一个基于 [Electron][10] 的工具，让你在一个简单的双栏编辑器中编写幻灯片：在左栏编写 Markdown，在右栏中预览效果。

Marp 支持 [GitHub 风格 Markdown][11]。如果你需要一个使用 GitHub 风格 Markdown 编写幻灯片的快速教程，可以参考 [示例项目][12]。GitHub 风格 Markdown 比基础 Markdown 更加灵活。

Marp 只自带两个基础主题，但你可以为幻灯片增加背景图片、调整图片大小以及增加数学表达式。不足之处，目前只支持 PDF 格式导出。老实说，我很好奇为何不一开始就提供 HTML 格式导出。


![marp.png][14]

*使用 Marp 编辑简单的幻灯片*

### Pandoc

你可能已经知道 [pandoc][15] 是一种支持多种<ruby>标记语言<rt>markup languages</rt></ruby>相互转换的神奇工具。但你可能不知道，pandoc 可以将 Markdown 格式文件转换为 [Slidy][16]、[Slideous][17]、[DZSlides][18] 和 [Reveal.js][20] 等演示框架支持的优雅 HTML 幻灯片。如果你使用 [LaTeX][21]，可以使用 [Beamer 软件包][22]输出 PDF 格式的幻灯片。

你需要在幻灯片中[使用特定格式][23]，但可以通过[变量][24]控制其效果。你也可以更改幻灯片的外观与风格，增加幻灯片之间的暂停，添加演示者注记等。

当然，你需要在你的主机上安装你喜欢的演示框架，因为 Pandoc 只生成原始幻灯片文件。


![pandoc.png][26]

*查看使用 Pandoc 和 DZSlides 创建的幻灯片*

### Hacker Slides

[Hacker Slides][27] 是一个 [Sandstorm][28] 和 [Sandstorm Oasis][29] 平台上的应用，基于 Markdown 和 [Reveal.js][20] 幻灯片框架。生成的幻灯片可以比较朴素，也可以很炫。

在浏览器的两栏界面中编写幻灯片，左栏输入 Markdown 文本，右栏渲染效果。当你制作完成后，可以在 Sandstorm 中演示，也可以生成分享链接让其它人演示。

你可能会说，你不使用 Sandstorm 或 Sandstorm Oasis 怎么办？不要担心，Hacker Slides 提供了可以在桌面或服务器上运行的[版本][30]。

![hacker-slides.png][32]

*在 Hacker Slides 中编辑幻灯片*

### 两点特别补充

如果你使用 [Jupyter <ruby>笔记本<rt>Notebooks</rt></ruby>][33] （参考社区版主 Don Watkins 的[文章][34]）发布数据或指令文本，你可以使用 [Jupyter2slides][35]。该工具基于 Reveal.js，可以将笔记本转换为一系列精美的 HTML 幻灯片。

如果你倾向于托管应用，试试 [GitPitch][36]，支持 GitHub、GitLab 和 Bitbucket。只需在将幻灯片源文件推送到支持的代码仓库中，在 GitPitch 中指向该仓库，这样你就可以在 GitPitch 网站上看到你的幻灯片了。

你有最喜欢的基于 Markdown 的幻灯片生成器吗？留下评论分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/markdown-slide-generators

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://plaintextproject.online/
[2]:https://en.wikipedia.org/wiki/Markdown
[3]:https://github.com/adamzap/landslide
[4]:https://en.wikipedia.org/wiki/ReStructuredText
[5]:https://en.wikipedia.org/wiki/Textile_(markup_language)
[6]:https://github.com/skaegi/html5slides
[7]:/file/397441
[8]:https://opensource.com/sites/default/files/uploads/landslide.png (landslide.png)
[9]:https://yhatt.github.io/marp/
[10]:https://en.wikipedia.org/wiki/Electron_(software_framework)
[11]:https://guides.github.com/features/mastering-markdown/
[12]:https://raw.githubusercontent.com/yhatt/marp/master/example.md
[13]:/file/397446
[14]:https://opensource.com/sites/default/files/uploads/marp.png (marp.png)
[15]:https://pandoc.org/
[16]:https://www.w3.org/Talks/Tools/Slidy2/Overview.html#(1)
[17]:http://goessner.net/articles/slideous/
[18]:http://paulrouget.com/dzslides/
[19]:https://meyerweb.com/eric/tools/s5/
[20]:https://revealjs.com/#/
[21]:https://www.latex-project.org/
[22]:https://en.wikipedia.org/wiki/Beamer_(LaTeX)
[23]:https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc
[24]:https://pandoc.org/MANUAL.html#variables-for-slides
[25]:/file/397451
[26]:https://opensource.com/sites/default/files/uploads/pandoc.png (pandoc.png)
[27]:https://github.com/jacksingleton/hacker-slides
[28]:https://sandstorm.io/
[29]:https://oasis.sandstorm.io/
[30]:https://github.com/msoedov/hacker-slides
[31]:/file/397456
[32]:https://opensource.com/sites/default/files/uploads/hacker-slides.png (hacker-slides.png)
[33]:http://jupyter.org/
[34]:https://linux.cn/article-9664-1.html
[35]:https://github.com/datitran/jupyter2slides
[36]:https://gitpitch.com/
