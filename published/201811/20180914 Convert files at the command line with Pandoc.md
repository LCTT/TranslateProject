在命令行使用 Pandoc 进行文件转换
======

> 这篇指南介绍如何使用 Pandoc 将文档转换为多种不同的格式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Pandoc 是一个命令行工具，用于将文件从一种标记语言转换为另一种标记语言。标记语言使用标签来标记文档的各个部分。常用的标记语言包括 Markdown、ReStructuredText、HTML、LaTex、ePub 和 Microsoft Word DOCX。

简单来说，[Pandoc][1] 允许你将一些文件从一种标记语言转换为另一种标记语言。典型的例子包括将 Markdown 文件转换为演示文稿、LaTeX，PDF 甚至是 ePub。

本文将解释如何使用 Pandoc 从单一标记语言（在本文中为 Markdown）生成多种格式的文档，引导你完成从 Pandoc 安装，到展示如何创建多种类型的文档，再到提供有关如何编写易于移植到其他格式的文档的提示。

文中还将解释使用元信息文件对文档内容和元信息（例如，作者姓名、使用的模板、书目样式等）进行分离的意义。

### Pandoc 安装和要求

Pandoc 默认安装在大多数 Linux 发行版中。本教程使用 pandoc-2.2.3.2 和 pandoc-citeproc-0.14.3。如果不打算生成 PDF，那么这两个包就足够了。但是，我建议也安装 texlive，这样就可以选择生成 PDF 了。

通过以下命令在 Linux 上安装这些程序：

```
sudo apt-get install pandoc pandoc-citeproc texlive
```

您可以在 Pandoc 的网站上找到其他平台的 [安装说明][2]。

我强烈建议安装 [pandoc-crossref][3]，这是一个“用于对图表，方程式，表格和交叉引用进行编号的过滤器”。最简单的安装方式是下载 [预构建的可执行文件][4]，但也可以通过以下命令从 Haskell 的软件包管理器 cabal 安装它：

```
cabal update
cabal install pandoc-crossref
```

如果需要额外的 Haskell [安装信息][5]，请参考 pandoc-crossref 的 GitHub 仓库。

### 几个例子

我将通过解释如何生成三种类型的文档来演示 Pandoc 的工作原理：

- 由包含数学公式的 LaTeX 文件创建的网页
- 由 Markdown 文件生成的 Reveal.js 幻灯片
- 混合 Markdown 和 LaTeX 的合同文件

#### 创建一个包含数学公式的网站

Pandoc 的优势之一是以不同的输出文件格式显示数学公式。例如，我们可以从包含一些数学符号（用 LaTeX 编写）的 LaTeX 文档（名为 `math.tex`）生成一个网页。

`math.tex` 文档如下所示：

```
% Pandoc math demos

$a^2 + b^2 = c^2$

$v(t) = v_0 + \frac{1}{2}at^2$

$\gamma = \frac{1}{\sqrt{1 - v^2/c^2}}$

$\exists x \forall y (Rxy \equiv Ryx)$

$p \wedge q \models p$

$\Box\diamond p\equiv\diamond p$

$\int_{0}^{1} x dx = \left[ \frac{1}{2}x^2 \right]_{0}^{1} = \frac{1}{2}$

$e^x = \sum_{n=0}^\infty \frac{x^n}{n!} = \lim_{n\rightarrow\infty} (1+x/n)^n$
```

通过输入以下命令将 LaTeX 文档转换为名为 `mathMathML.html` 的网站：

```
pandoc math.tex -s --mathml  -o mathMathML.html
```

参数 `-s`  告诉 Pandoc 生成一个独立的网页（而不是网页片段，因此它将包括 HTML 中的 head 和 body 标签），`-mathml` 参数强制 Pandoc 将 LaTeX 中的数学公式转换成 MathML，从而可以由现代浏览器进行渲染。

![](https://opensource.com/sites/default/files/uploads/pandoc_math-formulas.png)

看一下 [网页效果][6] 和 [代码][7]，代码仓库中的 Makefile 使得运行更加简单。

#### 制作一个 Reveal.js 幻灯片

使用 Pandoc 从 Markdown 文件生成简单的演示文稿很容易。幻灯片包含顶级幻灯片和下面的嵌套幻灯片。可以通过键盘控制演示文稿，从一个顶级幻灯片跳转到下一个顶级幻灯片，或者显示顶级幻灯片下面的嵌套幻灯片。 这种结构在基于 HTML 的演示文稿框架中很常见。

创建一个名为 `SLIDES` 的幻灯片文档（参见 [代码仓库][8]）。首先，在 `％` 后面添加幻灯片的元信息（例如，标题、作者和日期）：

```
% Case Study
% Kiko Fernandez Reyes
% Sept 27, 2017
```

这些元信息同时也创建了第一张幻灯片。要添加更多幻灯片，使用 Markdown 的一级标题（在下面例子中的第5行，参考 [Markdown 的一级标题][9] ）生成顶级幻灯片。

例如，可以通过以下命令创建一个标题为 “Case Study”、顶级幻灯片名为 “Wine Management System” 的演示文稿：

```
% Case Study
% Kiko Fernandez Reyes
% Sept 27, 2017

# Wine Management System
```

使用 Markdown 的二级标题将内容（比如包含一个新管理系统的说明和实现的幻灯片）放入刚刚创建的顶级幻灯片。下面添加另外两张幻灯片（在下面例子中的第 7 行和 14 行 ，参考 [Markdown 的二级标题][9] ）。

- 第一个二级幻灯片的标题为 “Idea”，并显示瑞士国旗的图像
- 第二个二级幻灯片的标题为 “Implementation”

```
% Case Study
% Kiko Fernandez Reyes
% Sept 27, 2017

# Wine Management System

## <img src="img/SwissFlag.png" style="vertical-align:middle"/> Idea

## Implementation
```

我们现在有一个顶级幻灯片（`＃Wine Management System`），其中包含两张幻灯片（`## Idea` 和 `## Implementation`）。

通过创建一个由符号 `>` 开头的 Markdown 列表，在这两张幻灯片中添加一些内容。在上面代码的基础上，在第一张幻灯片中添加两个项目（第 9-10 行），第二张幻灯片中添加五个项目（第 16-20 行）：

```
% Case Study
% Kiko Fernandez Reyes
% Sept 27, 2017

# Wine Management System

## <img src="img/SwissFlag.png" style="vertical-align:middle"/> Idea

>- Swiss love their **wine** and cheese
>- Create a *simple* wine tracker system

![](img/matterhorn.jpg)

## Implementation

>- Bottles have a RFID tag
>- RFID reader (emits and read signal)
>- **Raspberry Pi**
>- **Server (online shop)**
>- Mobile app
```

上面的代码添加了马特洪峰的图像，也可以使用纯 Markdown 语法或添加 HTML 标签来改进幻灯片。

要生成幻灯片，Pandoc 需要引用 Reveal.js 库，因此它必须与 `SLIDES` 文件位于同一文件夹中。生成幻灯片的命令如下所示：

```
pandoc -t revealjs -s --self-contained SLIDES \
-V theme=white -V slideNumber=true -o index.html
```

![](https://opensource.com/sites/default/files/uploads/pandoc_matterhorn-slide.png)

上面的 Pandoc 命令使用了以下参数：

- `-t revealjs` 表示将输出一个 revealjs 演示文稿
- `-s` 告诉 Pandoc 生成一个独立的文档
- `--self-contained` 生成没有外部依赖关系的 HTML 文件
- `-V`  设置以下变量：
  - `theme=white` 将幻灯片的主题设为白色
  - `slideNumber=true` 显示幻灯片编号
- `-o index.html` 在名为 `index.html` 的文件中生成幻灯片

为了简化操作并避免键入如此长的命令，创建以下 Makefile：

```
all: generate

generate:
    pandoc -t revealjs -s --self-contained SLIDES \
    -V theme=white -V slideNumber=true -o index.html

clean: index.html
    rm index.html

.PHONY: all clean generate
```

可以在 [这个仓库][8] 中找到所有代码。

#### 制作一份多种格式的合同

假设你正在准备一份文件，并且（这样的情况现在很常见）有些人想用 Microsoft Word 格式，其他人使用自由软件，想要 ODT 格式，而另外一些人则需要 PDF。你不必使用 OpenOffice 或 LibreOffice 来生成 DOCX 或 PDF 格式的文件，可以用 Markdown 创建一份文档（如果需要高级格式，可以使用一些 LaTeX 语法），并生成任何这些文件类型。

和以前一样，首先声明文档的元信息（标题、作者和日期）：

```
% Contract Agreement for Software X
% Kiko Fernandez-Reyes
% August 28th, 2018
```

然后在 Markdown 中编写文档（如果需要高级格式，则添加 LaTeX）。例如，创建一个固定间隔的表格（在 LaTeX 中用 `\hspace{3cm}` 声明）以及客户端和承包商应填写的行（在 LaTeX 中用 `\hrulefill` 声明）。之后，添加一个用 Markdown 编写的表格。

创建的文档如下所示：

![](https://opensource.com/sites/default/files/uploads/pandoc_agreement.png)

创建此文档的代码如下：

```
% Contract Agreement for Software X
% Kiko Fernandez-Reyes
% August 28th, 2018

...

### Work Order

\begin{table}[h]
\begin{tabular}{ccc}
The Contractor & \hspace{3cm} & The Customer \\
& & \\
& & \\
\hrulefill & \hspace{3cm} & \hrulefill \\
%
Name & \hspace{3cm} & Name \\
& & \\
& & \\
\hrulefill & \hspace{3cm} & \hrulefill \\
...
\end{tabular}
\end{table}

\vspace{1cm}

+--------------------------------------------|----------|-------------+
| Type of Service                            | Cost     |     Total   |
+:===========================================+=========:+:===========:+
| Game Engine                                | 70.0     | 70.0        |
|                                            |          |             |
+--------------------------------------------|----------|-------------+
|                                            |          |             |
+--------------------------------------------|----------|-------------+
| Extra: Comply with defined API functions   | 10.0     | 10.0        |
|        and expected returned format        |          |             |
+--------------------------------------------|----------|-------------+
|                                            |          |             |
+--------------------------------------------|----------|-------------+
| **Total Cost**                             |          | **80.0**    |
+--------------------------------------------|----------|-------------+
```

要生成此文档所需的三种不同输出格式，编写如下的 Makefile：

```
DOCS=contract-agreement.md

all: $(DOCS)
    pandoc -s $(DOCS) -o $(DOCS:md=pdf)
    pandoc -s $(DOCS) -o $(DOCS:md=docx)
    pandoc -s $(DOCS) -o $(DOCS:md=odt)

clean:
    rm *.pdf *.docx *.odt

.PHONY: all clean
```

4 到 7 行是生成三种不同输出格式的具体命令：

如果有多个 Markdown 文件并想将它们合并到一个文档中，需要按照希望它们出现的顺序编写命令。例如，在撰写本文时，我创建了三个文档：一个介绍文档、三个示例和一些高级用法。以下命令告诉 Pandoc 按指定的顺序将这些文件合并在一起，并生成一个名为 document.pdf 的 PDF 文件。

```
pandoc -s introduction.md examples.md advanced-uses.md -o document.pdf
```

### 模板和元信息

编写复杂的文档并非易事，你需要遵循一系列独立于内容的规则，例如使用特定的模板、编写摘要、嵌入特定字体，甚至可能要声明关键字。所有这些都与内容无关：简单地说，它就是元信息。

Pandoc 使用模板生成不同的输出格式。例如，有一个 LaTeX 的模板，还有一个 ePub 的模板，等等。这些模板的元信息中有未赋值的变量。使用以下命令找出 Pandoc 模板中可用的元信息：

```
pandoc -D FORMAT
```

例如，LaTex 的模版是：

```
pandoc -D latex
```

按照以下格式输出：

```
$if(title)$
\title{$title$$if(thanks)$\thanks{$thanks$}$endif$}
$endif$
$if(subtitle)$
\providecommand{\subtitle}[1]{}
\subtitle{$subtitle$}
$endif$
$if(author)$
\author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
$if(institute)$
\providecommand{\institute}[1]{}
\institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
\date{$date$}
$if(beamer)$
$if(titlegraphic)$
\titlegraphic{\includegraphics{$titlegraphic$}}
$endif$
$if(logo)$
\logo{\includegraphics{$logo$}}
$endif$
$endif$

\begin{document}
```

如你所见，输出的内容中有标题、致谢、作者、副标题和机构模板变量（还有许多其他可用的变量）。可以使用 YAML 元区块轻松设置这些内容。 在下面例子的第 1-5 行中，我们声明了一个 YAML 元区块并设置了一些变量（使用上面合同协议的例子）：

```
---
title: Contract Agreement for Software X
author: Kiko Fernandez-Reyes
date: August 28th, 2018
---

(continue writing document as in the previous example)
```

这样做非常奏效，相当于以前的代码：

```
% Contract Agreement for Software X
% Kiko Fernandez-Reyes
% August 28th, 2018
```

然而，这样做将元信息与内容联系起来，也即 Pandoc 将始终使用此信息以新格式输出文件。如果你将要生成多种文件格式，最好要小心一点。例如，如果你需要以 ePub 和 HTML 的格式生成合同，并且 ePub 和 HTML 需要不同的样式规则，该怎么办？

考虑一下这些情况：

- 如果你只是尝试嵌入 YAML 变量 `css:style-epub.css`，那么将从 HTML 版本中移除该变量。这不起作用。
- 复制文档显然也不是一个好的解决方案，因为一个版本的更改不会与另一个版本同步。
- 你也可以像下面这样将变量添加到 Pandoc 命令中：

```
pandoc -s -V css=style-epub.css document.md document.epub
pandoc -s -V css=style-html.css document.md document.html
```

我的观点是，这样做很容易从命令行忽略这些变量，特别是当你需要设置数十个变量时（这可能出现在编写复杂文档的情况中）。现在，如果将它们放在同一文件中（`meta.yaml` 文件），则只需更新或创建新的元信息文件即可生成所需的输出格式。然后你会编写这样的命令：

```
pandoc -s meta-pub.yaml document.md document.epub
pandoc -s meta-html.yaml document.md document.html
```

这是一个更简洁的版本，你可以从单个文件更新所有元信息，而无需更新文档的内容。

### 结语

通过以上的基本示例，我展示了 Pandoc 在将 Markdown 文档转换为其他格式方面是多么出色。

------

via: https://opensource.com/article/18/9/intro-pandoc

作者：[Kiko Fernandez-Reyes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kikofernandez
[1]: https://pandoc.org/
[2]: http://pandoc.org/installing.html
[3]: https://hackage.haskell.org/package/pandoc-crossref
[4]: https://github.com/lierdakil/pandoc-crossref/releases/tag/v0.3.2.1
[5]: https://github.com/lierdakil/pandoc-crossref#installation
[6]: http://pandoc.org/demo/mathMathML.html
[7]: https://github.com/kikofernandez/pandoc-examples/tree/master/math
[8]: https://github.com/kikofernandez/pandoc-examples/tree/master/slides
[9]: https://daringfireball.net/projects/markdown/syntax#header
