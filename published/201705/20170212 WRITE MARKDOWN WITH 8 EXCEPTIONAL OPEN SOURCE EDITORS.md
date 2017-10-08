8 个优秀的开源 Markdown 编辑器
============================================================

### Markdown

首先，对 Markdown 进行一个简单的介绍。Markdown 是由 John Gruber 和 Aaron Swartz 共同创建的一种轻量级纯文本格式语法。Markdown 可以让用户“以易读、易写的纯文本格式来进行写作，然后可以将其转换为有效格式的 XHTML（或 HTML）“。Markdown 语法只包含一些非常容易记住的符号。其学习曲线平缓；你可以在炒蘑菇的同时一点点学习 Markdown 语法（大约 10 分钟）。通过使用尽可能简单的语法，错误率达到了最小化。除了拥有友好的语法，它还具有直接输出干净、有效的（X）HTML 文件的强大功能。如果你看过我的 HTML 文件，你就会知道这个功能是多么的重要。

Markdown 格式语法的主要目标是实现最大的可读性。用户能够以纯文本的形式发布一份 Markdown 格式的文件。用 Markdown 进行文本写作的一个优点是易于在计算机、智能手机和个人之间共享。几乎所有的内容管理系统都支持 Markdown 。它作为一种网络写作格式流行起来，其产生一些被许多服务采用的变种，比如 GitHub 和 Stack Exchange 。

你可以使用任何文本编辑器来写 Markdown 文件。但我建议使用一个专门为这种语法设计的编辑器。这篇文章中所讨论的软件允许你使用 Markdown 语法来写各种格式的专业文档，包括博客文章、演示文稿、报告、电子邮件以及幻灯片等。另外，所有的应用都是在开源许可证下发布的，在 Linux、OS X 和 Windows 操作系统下均可用。


### Remarkable

![Remarkable - cross-platform Markdown editor](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/Remarkable.png?resize=800%2C319&ssl=1) 

让我们从 Remarkable 开始。Remarkable 是一个 apt 软件包的名字，它是一个相当有特色的 Markdown 编辑器 — 它并不支持 Markdown 的全部功能特性，但该有的功能特性都有。它使用和 GitHub Markdown 类似的语法。 

你可以使用 Remarkable 来写 Markdown 文档，并在实时预览窗口查看更改。你可以把你的文件导出为 PDF 格式（带有目录）和 HTML 格式文件。它有强大的配置选项，从而具有许多样式，因此，你可以把它配置成你最满意的 Markdown 编辑器。

其他一些特性：

*   语法高亮
*   支持 [GitHub 风味的 Markdown](https://linux.cn/article-8399-1.html)
*   支持 MathJax - 通过高级格式呈现丰富文档
*   键盘快捷键

在 Debian、Ubuntu、Fedora、SUSE 和 Arch 系统上均有 Remarkable 的可用的简易安装程序。

主页： [https://remarkableapp.github.io/][4]
许可证： MIT 许可

### Atom

![Atom - cross-platform Markdown editor](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/Atom-Markdown.png?resize=800%2C328&ssl=1) 

毫无疑问， Atom 是一个神话般的文本编辑器。超过 50 个开源包集合在一个微小的内核上，从而构成 Atom 。伴有 Node.js 的支持，以及全套功能特性，Atom 是我最喜欢用来写代码的编辑器。Atom 的特性在[杀手级开源应用][5]的文章中有更详细介绍，它是如此的强大。但是作为一个 Markdown 编辑器，Atom 还有许多不足之处，它的默认包不支持 Markdown 的特性。例如，正如上图所展示的，它不支持等价渲染。

但是，开源拥有强大的力量，这是我强烈提倡开源的一个重要原因。Atom 上有许多包以及一些复刻，从而添加了缺失的功能特性。比如，Markdown Preview Plus 提供了 Markdown 文件的实时预览，并伴有数学公式渲染和实时重加载。另外，你也可以尝试一下 [Markdown Preview Enhanced][6]。如果你需要自动滚动特性，那么 [markdown-scroll-sync][7] 可以满足你的需求。我是 [Markdown-Writer][8]和 [Markdown-pdf][9]的忠实拥趸，后者支持将 Markdown 快速转换为 PDF、PNG 以及 JPEG 文件。

这个方式体现了开源的理念：允许用户通过添加扩展来提供所需的特性。这让我想起了 Woolworths 的 n 种杂拌糖果的故事。虽然需要多付出一些努力，但能收获最好的回报。

主页： [https://atom.io/][10]
许可证： MIT 许可

### Haroopad

![Haroopad - - cross-platform Markdown editor](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/Haroopad-1.png?resize=800%2C332&ssl=1) 

Haroopad 是一个优秀的 Markdown 编辑器，是一个用于创建适宜 Web 的文档的处理器。使用 Haroopad 可以创作各种格式的文档，比如博客文章、幻灯片、演示文稿、报告和电子邮件等。Haroopad 在 Windows、Mac OS X 和 Linux 上均可用。它有 Debian/Ubuntu 的软件包，也有 Windows 和 Mac 的二进制文件。该应用程序使用 node-webkit、CodeMirror，marked，以及 Twitter 的 Bootstrap 。

Haroo 在韩语中的意思是“一天”。

它的功能列表非常可观。请看下面：

*   主题、皮肤和 UI 组件
    *   超过 30 种不同的编辑主题 - tomorrow-night-bright 和 zenburn 是近期刚添加的
    *   编辑器中的代码块的语法高亮
    *   Ruby、Python、PHP、Javascript、C、HTML 和 CSS 的语法高亮支持
    *   基于 CodeMirror，这是一个在浏览器中使用 JavaScript 实现的通用文本编辑器
*   实时预览主题
    *   基于 markdown-css 的 7 个主题
*   语法高亮
    *   基于 hightlight.js 的 112 种语言以及 49 种样式
*   定制主题
    *   基于 CSS （层叠样式表）的样式
*   演示模式 - 对于现场演示非常有用
*   绘图 - 流程图和序列图
*   任务列表
*   扩展 Markdown 语法，支持 TOC（目录）、 GitHub 风味 Markdown 以及数学表达式、脚注和任务列表等
*   字体大小
    *   使用首选窗口和快捷键来设置编辑器和预览字体大小
*   嵌入富媒体内容
    *   视频、音频、3D、文本、开放图形以及 oEmbed
    *   支持大约 100 种主要的网络服务（YouTude、SoundCloud、Flickr 等）
    *   支持拖放
*   显示模式
    *   默认：编辑器｜预览器，倒置：预览器｜编辑器，仅编辑器，仅预览器（View -> Mode）
*   插入当前日期和时间
    *   多种格式支持（Insert -> Data & Time）
*   HtML 到 Markdown
    *   拖放你在 Web 浏览器中选择好的文本
*   Markdown 解析选项
*   大纲预览
*   纯粹主义者的 Vim 键位绑定
*   Markdown 自动补全
*   导出为 PDF 和 HTML
*   带有样式的 HTML 复制到剪切板可用于所见即所得编辑器
*   自动保存和恢复
*   文件状态信息
*   换行符或空格缩进
*   （一、二、三）列布局视图
*   Markdown 语法帮助对话框
*   导入和导出设置
*   通过 MathJax 支持 LaTex 数学表达式
*   导出文件为 HTML 和 PDF
*   创建扩展来构建自己的功能
*   高效地将文件转换进博客系统：WordPress、Evernote 和 Tumblr 等
*   全屏模式－尽管该模式不能隐藏顶部菜单栏和顶部工具栏
*   国际化支持：英文、韩文、西班牙文、简体中文、德文、越南文、俄文、希腊文、葡萄牙文、日文、意大利文、印度尼西亚文土耳其文和法文

主页 [http://pad.haroopress.com/][11]
许可证： GNU GPL v3 许可

### StackEdit

![StackEdit - a web based Markdown editor](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/StackEdit.png?resize=800%2C311&ssl=1) 

StackEdit 是一个功能齐全的 Markdown 编辑器，基于 PageDown（该 Markdown 库被 Stack Overflow 和其他一些 Stack 交流网站使用）。不同于在这个列表中的其他编辑器，StackEdit 是一个基于 Web 的编辑器。在 Chrome 浏览器上即可使用 StackEdit 。

特性包括：

*   实时预览 HTML，并通过绑定滚动连接特性来将编辑器和预览的滚动条相绑定
*   支持 Markdown Extra 和 GitHub 风味 Markdown，Prettify/Highlight.js 语法高亮
*   通过 MathJax 支持 LaTex 数学表达式
*   所见即所得的控制按键
*   布局配置
*   不同风格的主题支持
*   la carte 扩展
*   离线编辑
*   可以与 Google 云端硬盘（多帐户）和 Dropbox 在线同步
*   一键发布到 Blogger、Dropbox、Gist、GitHub、Google Drive、SSH 服务器、Tumblr 和 WordPress

主页： [https://stackedit.io/][12]
许可证： Apache 许可

### MacDown

![MacDown - OS X Markdown editor](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/MacDown.png?resize=800%2C422&ssl=1) 

MacDown 是在这个列表中唯一一个只运行在 macOS 上的全特性编辑器。具体来说，它需要在 OX S 10.8 或更高的版本上才能使用。它在内部使用 Hoedown 将 Markdown 渲染成 HTML，这使得它的特性更加强大。Heodown 是 Sundown 的一个复活复刻。它完全符合标准，无依赖，具有良好的扩展支持和 UTF-8 感知。

MacDown 基于 Mou，这是专为 Web 开发人员设计的专用解决方案。

它提供了良好的 Markdown 渲染，通过 Prism 提供的语言识别渲染实现代码块级的语法高亮，MathML 和 LaTex 渲染，GTM 任务列表，Jekyll 前端以及可选的高级自动补全。更重要的是，它占用资源很少。想在 OS X 上写 Markdown？MacDown 是我针对 Web 开发者的开源推荐。

主页： [https://macdown.uranusjr.com/][13]
许可证： MIT 许可


### ghostwriter

![ghostwriter - cross-platform Markdown editor](https://i0.wp.com/www.ossblog.org/wp-content/uploads/2017/02/ghostwriter.png?resize=800%2C310&ssl=1) 

ghostwriter 是一个跨平台的、具有美感的、无干扰的 Markdown 编辑器。它内建了 Sundown 处理器支持，还可以自动检测 pandoc、MultiMarkdown、Discount 和 cmark 处理器。它试图成为一个朴实的编辑器。

ghostwriter 有许多很好的功能设置，包括语法高亮、全屏模式、聚焦模式、主题、通过 Hunspell 进行拼写检查、实时字数统计、实时 HTML 预览、HTML 预览自定义 CSS 样式表、图片拖放支持以及国际化支持。Hemingway 模式按钮可以禁用退格键和删除键。一个新的 “Markdown cheat sheet” HUD 窗口是一个有用的新增功能。主题支持很基本，但在 [GitHub 仓库上][14]也有一些可用的试验性主题。

ghostwriter 的功能有限。我越来越欣赏这个应用的通用性，部分原因是其简洁的界面能够让写作者完全集中在策划内容上。这一应用非常值得推荐。

ghostwirter 在 Linux 和 Windows 系统上均可用。在 Windows 系统上还有一个便携式的版本可用。

主页： [https://github.com/wereturtle/ghostwriter][15]
许可证： GNU GPL v3 许可

### Abricotine

![Abricotine - cross-platform Markdown editor](https://i2.wp.com/www.ossblog.org/wp-content/uploads/2017/02/Abricotine.png?resize=800%2C316&ssl=1) 

Abricotine 是一个为桌面构建的、旨在跨平台且开源的 Markdown 编辑器。它在 Linux、OS X 和 Windows 上均可用。

该应用支持 Markdown 语法以及一些 GitHub 风味的 Markdown 增强（比如表格）。它允许用户直接在文本编辑器中预览文档，而不是在侧窗栏。

该应用有一系列有用的特性，包括拼写检查、以 HTML 格式保存文件或把富文本复制粘贴到邮件客户端。你也可以在侧窗中显示文档目录，展示语法高亮代码、以及助手、锚点和隐藏字符等。它目前正处于早期的开发阶段，因此还有一些很基本的 bug 需要修复，但它值得关注。它有两个主题可用，如果有能力，你也可以添加你自己的主题。

主页： [http://abricotine.brrd.fr/][16]
许可证： GNU 通用公共许可证 v3 或更高许可

### ReText

![ReText - Linux Markdown editor](https://i1.wp.com/www.ossblog.org/wp-content/uploads/2017/02/ReText.png?resize=800%2C270&ssl=1) 

ReText 是一个简单而强大的 Markdown 和 reStructureText 文本编辑器。用户可以控制所有输出的格式。它编辑的文件是纯文本文件，但可以导出为 PDF、HTML 和其他格式的文件。ReText 官方仅支持 Linux 系统。

特性包括：

*   全屏模式
*   实时预览
*   同步滚动（针对 Markdown）
*   支持数学公式
*   拼写检查
*   分页符
*   导出为 HTML、ODT 和 PDF 格式
*   使用其他标记语言

主页： [https://github.com/retext-project/retext][17]
许可证： GNU GPL v2 或更高许可

--------------------------------------------------------------------------------

via: https://www.ossblog.org/markdown-editors/

作者：[Steve Emms][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ossblog.org/author/steve/
[1]:https://www.ossblog.org/author/steve/
[2]:https://www.ossblog.org/markdown-editors/#comments
[3]:https://www.ossblog.org/category/utilities/
[4]:https://remarkableapp.github.io/
[5]:https://www.ossblog.org/top-software/2/
[6]:https://atom.io/packages/markdown-preview-enhanced
[7]:https://atom.io/packages/markdown-scroll-sync
[8]:https://atom.io/packages/markdown-writer
[9]:https://atom.io/packages/markdown-pdf
[10]:https://atom.io/
[11]:http://pad.haroopress.com/
[12]:https://stackedit.io/
[13]:https://macdown.uranusjr.com/
[14]:https://github.com/jggouvea/ghostwriter-themes
[15]:https://github.com/wereturtle/ghostwriter
[16]:http://abricotine.brrd.fr/
[17]:https://github.com/retext-project/retext
