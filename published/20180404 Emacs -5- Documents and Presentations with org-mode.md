Emacs 系列（五）：Org 模式之文档与演示稿
======

这是 [Emacs 和 Org 模式系列][20]的第五篇。

这篇博文是由 Org 模式的源文件生成的，其有几种格式：[博客页面][21]、[演示稿][22] 和 [PDF 文档][23]。

### 1 Org 模式的输出

#### 1.1 背景

Org 模式不仅仅只是一个议程生成程序，它也能输出许多不同的格式： LaTeX、PDF、Beamer、iCalendar（议程）、HTML、Markdown、ODT、普通文本、手册页和其它更多的复杂的格式，比如说网页文件。

这也不只是一些事后的想法，这是 Org 模式的设计核心部分并且集成的很好。

这一个文件可以同时是源代码、自动生成的输出、任务列表、文档和展示。

有些人将 Org 模式作为他们首选的标记格式，甚至对于 LaTeX 文档也是如此。Org 模式手册中的 [输出一节][13] 有更详细的介绍。

#### 1.2 开始

对于任意的 Org 模式的文档，只要按下 `C-c C-e` 键，就会弹出一个让你选择多种输出格式和选项的菜单。这些选项通常是次键选择，所以很容易设置和执行。例如：要输出一个 PDF 文档，按 `C-c C-e l p`，要输出 HMTL 格式的， 按 `C-c C-e h h`。

对于所有的输出选项，都有许多可用的设置；详情参见手册。事实上，使用 LaTeX 格式相当于同时使用 LaTeX 和 HTML 模式，在不同的模式中插入任意的前言和设置等。

#### 1.3 第三方插件

[ELPA][19] 中也包含了许多额外的输出格式，详情参见 [ELPA][19]。

### 2 Org 模式的 Beamer 演示

#### 2.1 关于 Beamer

[Beamer][14] 是一个生成演示稿的 LaTeX 环境. 它包括了以下特性：

* 在演示稿中自动生成结构化的元素（例如 [Marburg 主题][1])。 在演示稿中，这个特性可以为观众提供了视觉参考。
* 对组织演示稿有很大的帮助。
* 主题
* 完全支持 LaTeX

#### 2.2 Org 模式中 Beamer 的优点

在 Org 模式中用 Beamer 有很多好处，总的来说：

*   Org 模式很简单而且对可视化支持的很好，同时改变结构可以快速的重组你的材料。
*   与 org-babel 绑定在一起，实时语法高亮源码和内嵌结果。
*   语法通常更容易使用。

我已经完全用 Org 模式和 beamer 替换掉使用 LibreOffice/Powerpoint/GoogleDocs。事实上，当我必须使用其中一种工具时，这是相当令人沮丧的，因为它们在可视化表示演讲稿结构方面远远比不上 Org 模式。

#### 2.3 标题层次

Org 模式的 Beamer 会将你文档中的部分（文中定义了标题的）转换成幻灯片。当然，问题是：哪些部分？这是由 H [输出设置][15]（`org-export-headline-levels`）决定的。

针对不同的人，有许多不同的方法。我比较喜欢我的演示稿这样：

```
#+OPTIONS: H:2
#+BEAMER_HEADER: \AtBeginSection{\frame{\sectionpage}}
```

这将为每个主题提供了独立部分，以突出主题的改变然后使用级别 2（两个星号）的标题来设置幻灯片。许多 Beamer 主题也有第三个间接层次，所以你可以将 H 设为 3。

#### 2.4 主题和配置

你可以在 Org 模式的文件顶部来插入几行来配置 Beamer 和 LaTeX。在本文中，例如，你可以这样定义：

```
#+TITLE:  Documents and presentations with org-mode
#+AUTHOR: John Goerzen
#+BEAMER_HEADER: \institute{The Changelog}
#+PROPERTY: comments yes
#+PROPERTY: header-args :exports both :eval never-export
#+OPTIONS: H:2
#+BEAMER_THEME: CambridgeUS
#+BEAMER_COLOR_THEME: default
```

#### 2.5 高级设置

我比教喜欢修改颜色、项目符号样式等。我的配置如下：

```
# We can't just +BEAMER_INNER_THEME: default because that picks the theme default.
# Override per https://tex.stackexchange.com/questions/11168/change-bullet-style-formatting-in-beamer
#+BEAMER_INNER_THEME: default
#+LaTeX_CLASS_OPTIONS: [aspectratio=169]
#+BEAMER_HEADER: \definecolor{links}{HTML}{0000A0}
#+BEAMER_HEADER: \hypersetup{colorlinks=,linkcolor=,urlcolor=links}
#+BEAMER_HEADER: \setbeamertemplate{itemize items}[default]
#+BEAMER_HEADER: \setbeamertemplate{enumerate items}[default]
#+BEAMER_HEADER: \setbeamertemplate{items}[default]
#+BEAMER_HEADER: \setbeamercolor*{local structure}{fg=darkred}
#+BEAMER_HEADER: \setbeamercolor{section in toc}{fg=darkred}
#+BEAMER_HEADER: \setlength{\parskip}{\smallskipamount}
```

在这里，`aspectratio=169` 将纵横比设为 16:9, 其它部分都是标准的 LaTeX/Beamer 配置。

#### 2.6 缩小 (适应屏幕)

有时你会遇到一些非常大的代码示例，你可能更倾向与将幻灯片缩小以适应它们。

只要按下 `C-c C-c p` 将 `BEAMER_opt` 属性设为 `shrink=15`\。（或者设为更大的 shrink 值）。上一张幻灯片就用到了这个。

#### 2.7 效果

这就是最终的效果：

 [![screenshot1](https://farm1.staticflickr.com/889/26366340577_fbde8ff266_o.png)][16] 

### 3 幻灯片之间的交互

#### 3.1 交互式的 Emacs 幻灯片

使用 [org-tree-slide][17] 这个插件的话，就可以在 Emacs 的右侧显示幻灯片了。 只要按下 `M-x`，然后输入 `org-tree-slide-mode`，回车，然后你就可以用 `C->` 和 `C-<` 在幻灯片之间切换了。

你可能会发现 `C-c C-x C-v` （即 `org-toggle-inline-images`）有助于使系统显示内嵌的图像。

#### 3.2 HTML 幻灯片

有许多方式可以将 Org 模式的演讲稿导出为 HTML，并有不同级别的 JavaScript 集成。有关详细信息，请参见 Org 模式的 wiki 中的 [非 beamer 演讲稿一节][18]。

### 4 更多

#### 4.1 本文中的附加资源

*   [orgmode.org beamer tutorial][2]
*   [LaTeX wiki][3]
*   [Generating section title slides][4]
*   [Shrinking content to fit on slide][5]
*   很棒的资源： refcard-org-beamer 
    * 详情参见其 [Github repo][6] 中的 PDF 和 .org 文件。
*   很漂亮的主题： [Theme matrix][7]

#### 4.2 下一个 Emacs 系列

mu4e 邮件!


--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9900-emacs-5-documents-and-presentations-with-org-mode

作者：[John Goerzen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://hartwork.org/beamer-theme-matrix/all/beamer-albatross-Marburg-1.png
[2]:https://orgmode.org/worg/exporters/beamer/tutorial.html
[3]:https://en.wikibooks.org/wiki/LaTeX/Presentations
[4]:https://tex.stackexchange.com/questions/117658/automatically-generate-section-title-slides-in-beamer/117661
[5]:https://tex.stackexchange.com/questions/78514/content-doesnt-fit-in-one-slide
[6]:https://github.com/fniessen/refcard-org-beamer
[7]:https://hartwork.org/beamer-theme-matrix/
[8]:https://changelog.complete.org/archives/tag/emacs2018
[9]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/emacs-org-beamer/emacs-org-beamer.org
[10]:http://changelog.complete.org/archives/9900-emacs-5-documents-and-presentations-with-org-mode
[11]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer.pdf
[12]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer-document.pdf
[13]:https://orgmode.org/manual/Exporting.html#Exporting
[14]:https://en.wikipedia.org/wiki/Beamer_(LaTeX)
[15]:https://orgmode.org/manual/Export-settings.html#Export-settings
[16]:https://www.flickr.com/photos/jgoerzen/26366340577/in/dateposted/
[17]:https://orgmode.org/worg/org-tutorials/non-beamer-presentations.html#org-tree-slide
[18]:https://orgmode.org/worg/org-tutorials/non-beamer-presentations.html
[19]:https://www.emacswiki.org/emacs/ELPA
[20]:https://changelog.complete.org/archives/tag/emacs2018
[21]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/emacs-org-beamer/emacs-org-beamer.org
[22]:http://changelog.complete.org/archives/9900-emacs-5-documents-and-presentations-with-org-mode
[23]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer.pdf
[24]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer-document.pdf

