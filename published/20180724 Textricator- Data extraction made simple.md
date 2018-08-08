Textricator：让数据提取变得简单
======

> 这个新的开源工具可以从 PDF 文档中提取复杂的数据，而无需编程技能。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

你可能知道这种感觉：你请求得到数据并得到积极的响应，只打开电子邮件并发现一大堆附加的 PDF。数据——中断。

我们理解你的挫败感，并为此做了一些事情：让我们介绍下 [Textricator][1]，这是我们的第一个开源产品。

我们是 “Measures for Justice”（MFJ），一个刑事司法研究和透明度组织。我们的使命是为整个司法系统从逮捕到定罪后提供数据透明度。我们通过制定一系列多达 32 项指标来实现这一目标，涵盖每个县的整个刑事司法系统。我们以多种方式获取数据 —— 当然，所有这些都是合法的 —— 虽然许多州和县机构都掌握数据，可以为我们提供 CSV 格式的高质量格式化数据，但这些数据通常捆绑在软件中，没有简单的方法可以提取。PDF 报告是他们能提供的最佳报告。

开发者 Joe Hale 和 Stephen Byrne 在过去两年中一直在开发 Textricator，它用来提取数万页数据供我们内部使用。Textricator 可以处理几乎任何基于文本的 PDF 格式 —— 不仅仅是表格，还包括复杂的报表，其中包含从 Crystal Reports 等工具生成的文本和细节部分。只需告诉 Textricator 你要收集的字段的属性，它就会整理文档，收集并写出你的记录。

不是软件工程师？Textricator 不需要编程技巧。相反，用户描述 PDF 的结构，Textricator 处理其余部分。大多数用户通过命令行运行它。但是，你可以使用基于浏览器的 GUI。

我们评估了其他很好的开源解决方案，如 [Tabula][2]，但它们无法处理我们需要抓取的一些 PDF 的结构。技术总监 Andrew Branch 说：“Textricator 既灵活又强大，缩短了我们花费大量时间处理大型数据集的时间。”

在 MFJ，我们致力于透明度和知识共享，其中包括向任何人提供我们的软件，特别是那些试图公开自由共享数据的人。Textricator 可以在 [GitHub][3] 上找到，并在 [GNU Affero 通用公共许可证第 3 版][4]下发布。

你可以在我们的免费[在线数据门户][5]上查看我们的工作成果，包括通过 Textricator 处理的数据。Textricator 是我们流程的重要组成部分，我们希望民间技术机构和政府组织都可以使用这个新工具解锁更多数据。

如果你使用 Textricator，请告诉我们它如何帮助你解决数据问题。想要改进吗？提交一个拉取请求。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/textricator

作者：[Stephen Byrne][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stephenbyrne-mfj
[1]:https://textricator.mfj.io/
[2]:https://tabula.technology/
[3]:https://github.com/measuresforjustice/textricator
[4]:https://www.gnu.org/licenses/agpl-3.0.en.html
[5]:https://www.measuresforjustice.org/portal/
