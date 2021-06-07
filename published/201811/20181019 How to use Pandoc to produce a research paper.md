用 Pandoc 生成一篇调研论文
======

> 学习如何用 Markdown 管理章节引用、图像、表格以及更多。  

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T)

这篇文章对于使用 [Markdown][1] 语法做一篇调研论文进行了一个深度体验。覆盖了如何创建和引用章节、图像（用 Markdown 和 [LaTeX][2]）和参考书目。我们也讨论了一些棘手的案例和为什么使用 LaTex 是一个正确的做法。  

### 调研

调研论文一般包括对章节、图像、表格和参考书目的引用。[Pandoc][3] 本身并不能交叉引用这些，但是它能够利用 [pandoc-crossref][4] 过滤器来完成自动编号和章节、图像、表格的交叉引用。  

让我们从重写原本以 LaTax 撰写的 [一个教育调研报告的例子][5] 开始，然后用 Markdown（和一些 LaTax）、Pandoc 和 Pandoc-crossref 重写。  

#### 添加并引用章节

要想章节被自动编号，必须使用 Markdown H1 标题编写。子章节使用 H2-H4 子标题编写（通常不需要更多级别了）。例如一个章节的标题是 “Implementation”，写作 `# Implementation {#sec: implementation}`，然后 Pandoc 会把它转化为 `3. Implementation `（或者转换为相应的章节编号）。`Implementation` 这个标题使用了 H1 并且声明了一个 `{#sec: implementation}` 的标签，这是作者用于引用该章节的标签。要想引用一个章节，输入 `@` 符号并跟上对应章节标签，使用方括号括起来即可： `[@ sec:implementation]`

[在这篇论文中][5], 我们发现了下面这个例子：

```
we lack experience (consistency between TAs, [@sec:implementation]).
```

Pandoc 转换：

```
we lack experience (consistency between TAs, Section 4).
```

章节被自动编号（这在本文最后的 `Makefile` 当中说明）。要创建无编号的章节，输入章节的标题并在最后添加 `{-}`。例如：`### Designing a game for maintainability {-}` 就以标题 “Designing a game for maintainability”，创建了一个无标号的章节。

#### 添加并引用图像

添加并引用一个图像，跟添加并引用一个章节和添加一个 Markdown 图片很相似：

```
![Scatterplot matrix](data/scatterplots/RScatterplotMatrix2.png){#fig:scatter-matrix}
```

上面这一行是告诉 Pandoc，有一个标有 Scatterplot matrix 的图像以及这张图片路径是 `data/scatterplots/RScatterplotMatrix2.png`。`{#fig:scatter-matrix}` 表明了用于引用该图像的名字。  

这里是从一篇论文中进行图像引用的例子：  

```
The boxes "Enjoy", "Grade" and "Motivation" ([@fig:scatter-matrix]) ...
```

Pandoc 产生如下输出：  

```
The boxes "Enjoy", "Grade" and "Motivation" (Fig. 1) ...
```

#### 添加及引用参考书目

大多数调研报告都把引用放在一个 BibTeX 的数据库文件中。在这个例子中，该文件被命名为 [biblio.bib][6]，它包含了论文中所有的引用。下面是这个文件的样子：

```
@inproceedings{wrigstad2017mastery,
    Author =       {Wrigstad, Tobias and Castegren, Elias},
    Booktitle =    {SPLASH-E},
    Title =        {Mastery Learning-Like Teaching with Achievements},
    Year =         2017
}

@inproceedings{review-gamification-framework,
  Author =       {A. Mora and D. Riera and C. Gonzalez and J. Arnedo-Moreno},
  Publisher =    {IEEE},
  Booktitle =    {2015 7th International Conference on Games and Virtual Worlds
                  for Serious Applications (VS-Games)},
  Doi =          {10.1109/VS-GAMES.2015.7295760},
  Keywords =     {formal specification;serious games (computing);design
                  framework;formal design process;game components;game design
                  elements;gamification design frameworks;gamification-based
                  solutions;Bibliographies;Context;Design
                  methodology;Ethics;Games;Proposals},
  Month =        {Sept},
  Pages =        {1-8},
  Title =        {A Literature Review of Gamification Design Frameworks},
  Year =         2015,
  Bdsk-Url-1 =   {http://dx.doi.org/10.1109/VS-GAMES.2015.7295760}
}

...
```

第一行的 `@inproceedings{wrigstad2017mastery,` 表明了出版物 的类型（`inproceedings`），以及用来指向那篇论文的标签（`wrigstad2017mastery`）。

引用这篇题为 “Mastery Learning-Like Teaching with Achievements” 的论文, 输入：

```
the achievement-driven learning methodology [@wrigstad2017mastery]
```

Pandoc 将会输出：

```
the achievement- driven learning methodology [30]
```

这篇论文将会产生像下面这样被标号的参考书目：  

![](https://opensource.com/sites/default/files/uploads/bibliography-example_0.png)

引用文章的集合也很容易：只要引用使用分号 `;` 分隔开被标记的参考文献就可以了。如果一个引用有两个标签 —— 例如： `SEABORN201514` 和 `gamification-leaderboard-benefits`—— 像下面这样把它们放在一起引用：

```
Thus, the most important benefit is its potential to increase students' motivation
and engagement [@SEABORN201514;@gamification-leaderboard-benefits].
```

Pandoc 将会产生：

```
Thus, the most important benefit is its potential to increase students’ motivation
and engagement [26, 28]
```

### 问题案例

一个常见的问题是所需项目与页面不匹配。不匹配的部分会自动移动到它们认为合适的地方，即便这些位置并不是读者期望看到的位置。因此在图像或者表格接近于它们被提及的地方时，我们需要调节一下那些元素放置的位置，使得它们更加易于阅读。为了达到这个效果，我建议使用 `figure` 这个 LaTeX 环境参数，它可以让用户控制图像的位置。  

我们看一个上面提到的图像的例子：  

```
![Scatterplot matrix](data/scatterplots/RScatterplotMatrix2.png){#fig:scatter-matrix}
```

然后使用 LaTeX 重写： 

```
\begin{figure}[t]
\includegraphics{data/scatterplots/RScatterplotMatrix2.png}
\caption{\label{fig:matrix}Scatterplot matrix}
\end{figure}
```

在 LaTeX 中，`figure` 环境参数中的 `[t]` 选项表示这张图用该位于该页的最顶部。有关更多选项，参阅 [LaTex/Floats, Figures, and Captions][7] 这篇 Wikibooks 的文章。  

### 产生一篇论文

到目前为止，我们讲了如何添加和引用（子）章节、图像和参考书目，现在让我们重温一下如何生成一篇 PDF 格式的论文。要生成 PDF，我们将使用 Pandoc 生成一篇可以被构建成最终 PDF 的 LaTeX 文件。我们还会讨论如何以 LaTeX，使用一套自定义的模板和元信息文件生成一篇调研论文，以及如何将 LaTeX 文档编译为最终的 PDF 格式。  

很多会议都提供了一个 .cls 文件或者一套论文应有样式的模板；例如，它们是否应该使用两列的格式以及其它的设计风格。在我们的例子中，会议提供了一个名为 `acmart.cls` 的文件。  

作者通常想要在他们的论文中包含他们所属的机构，然而，这个选项并没有包含在默认的 Pandoc 的 LaTeX 模板（注意，可以通过输入 `pandoc -D latex` 来查看 Pandoc 模板）当中。要包含这个内容，找一个 Pandoc 默认的 LaTeX 模板，并添加一些新的内容。将这个模板像下面这样复制进一个名为 `mytemplate.tex` 的文件中：

```
pandoc -D latex > mytemplate.tex
```

默认的模板包含以下代码：

```
$if(author)$
\author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
$if(institute)$
\providecommand{\institute}[1]{}
\institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
```

因为这个模板应该包含作者的联系方式和电子邮件地址，在其他一些选项之间，我们更新这个模板以添加以下内容（我们还做了一些其他的更改，但是因为文件的长度，就没有包含在此处）：

```
latex
$for(author)$
    $if(author.name)$
        \author{$author.name$}
        $if(author.affiliation)$
            \affiliation{\institution{$author.affiliation$}}
        $endif$
        $if(author.email)$
            \email{$author.email$}
        $endif$
    $else$
        $author$
    $endif$
$endfor$
```
要让这些更改起作用，我们还应该有下面的文件：  

* `main.md` 包含调研论文
* `biblio.bib` 包含参考书目数据库
* `acmart.cls` 我们使用的文档的集合
* `mytemplate.tex` 是我们使用的模板文件（代替默认的）

让我们添加论文的元信息到一个 `meta.yaml` 文件：  

```
---
template: 'mytemplate.tex'
documentclass: acmart
classoption: sigconf
title: The impact of opt-in gamification on `\\`{=latex} students' grades in a software design course
author:
- name: Kiko Fernandez-Reyes
  affiliation: Uppsala University
  email: kiko.fernandez@it.uu.se
- name: Dave Clarke
  affiliation: Uppsala University
  email: dave.clarke@it.uu.se
- name: Janina Hornbach
  affiliation: Uppsala University
  email: janina.hornbach@fek.uu.se
bibliography: biblio.bib
abstract: |
  An achievement-driven methodology strives to give students more control over their learning with enough flexibility to engage them in deeper learning. (more stuff continues)

include-before: |
      \` ``{=latex}
      \copyrightyear{2018}
      \acmYear{2018}
      \setcopyright{acmlicensed}
      \acmConference[MODELS '18 Companion]{ACM/IEEE 21th International Conference on Model Driven Engineering Languages and Systems}{October 14--19, 2018}{Copenhagen, Denmark}
      \acmBooktitle{ACM/IEEE 21th International Conference on Model Driven Engineering Languages and Systems (MODELS '18 Companion), October 14--19, 2018, Copenhagen, Denmark}
      \acmPrice{XX.XX}
      \acmDOI{10.1145/3270112.3270118}
      \acmISBN{978-1-4503-5965-8/18/10}

      \begin{CCSXML}
      <ccs2012>
      <concept>
      <concept_id>10010405.10010489</concept_id>
      <concept_desc>Applied computing~Education</concept_desc>
      <concept_significance>500</concept_significance>
      </concept>
      </ccs2012>
      \end{CCSXML}

      \ccsdesc[500]{Applied computing~Education}

      \keywords{gamification, education, software design, UML}
      \` ``
figPrefix:
  - "Fig."
  - "Figs."
secPrefix:
  - "Section"
  - "Sections"
...
```

这个元信息文件使用 LaTeX 设置下列参数：  

* `template` 指向使用的模板（`mytemplate.tex`）
* `documentclass` 指向使用的 LaTeX 文档集合（`acmart`）
* `classoption` 是在 `sigconf` 的案例中，指向这个类的选项
* `title` 指定论文的标题
* `author` 是一个包含例如 `name`、`affiliation` 和 `email` 的地方
* `bibliography` 指向包含参考书目的文件（`biblio.bib`）
* `abstract` 包含论文的摘要
* `include-before` 是这篇论文的具体内容之前应该被包含的信息；在 LaTeX 中被称为 [前言][8]。我在这里包含它去展示如何产生一篇计算机科学的论文，但是你可以选择跳过
* `figPrefix` 指向如何引用文档中的图像，例如：当引用图像的 `[@fig:scatter-matrix]` 时应该显示什么。例如，当前的 `figPrefix` 在这个例子 `The boxes "Enjoy", "Grade" and "Motivation" ([@fig:scatter-matrix])`中，产生了这样的输出：`The boxes "Enjoy", "Grade" and "Motivation" (Fig. 3)`。如果这里有很多图像，目前的设置表明它应该在图像号码旁边显示 `Figs.`
* `secPrefix` 指定如何引用文档中其他地方提到的部分（类似之前的图像和概览）

现在已经设置好了元信息，让我们来创建一个 `Makefile`，它会产生你想要的输出。`Makefile` 使用 Pandoc 产生 LaTeX 文件，`pandoc-crossref` 产生交叉引用，`pdflatex` 构建 LaTeX 为 PDF，`bibtex ` 处理引用。  


`Makefile` 已经展示如下：

```
all: paper

paper:
        @pandoc -s -F pandoc-crossref --natbib meta.yaml --template=mytemplate.tex -N \
         -f markdown -t latex+raw_tex+tex_math_dollars+citations -o main.tex main.md
        @pdflatex main.tex &> /dev/null
        @bibtex main &> /dev/null
        @pdflatex main.tex &> /dev/null
        @pdflatex main.tex &> /dev/null

clean:
        rm main.aux main.tex main.log main.bbl main.blg main.out

.PHONY: all clean paper
```

Pandoc 使用下面的标记： 

* `-s` 创建一个独立的 LaTeX 文档
* `-F pandoc-crossref` 利用 `pandoc-crossref` 进行过滤
* `--natbib` 用 `natbib` （你也可以选择 `--biblatex`）对参考书目进行渲染
* `--template` 设置使用的模板文件
* `-N` 为章节的标题编号
* `-f` 和 `-t` 指定从哪个格式转换到哪个格式。`-t` 通常包含格式和 Pandoc 使用的扩展。在这个例子中，我们标明的 `raw_tex+tex_math_dollars+citations` 允许在 Markdown 中使用 `raw_tex` LaTeX。 `tex_math_dollars` 让我们能够像在 LaTeX 中一样输入数学符号，`citations` 让我们可以使用 [这个扩展][9]。

要从 LaTeX 产生 PDF，按 [来自bibtex][10] 的指导处理参考书目：  

```
@pdflatex main.tex &> /dev/null
@bibtex main &> /dev/null
@pdflatex main.tex &> /dev/null
@pdflatex main.tex &> /dev/null
```

脚本用 `@` 忽略输出，并且重定向标准输出和错误到 `/dev/null` ，因此我们在使用这些命令的可执行文件时不会看到任何的输出。

最终的结果展示如下。这篇文章的库可以在 [GitHub][11] 找到：  

![](https://opensource.com/sites/default/files/uploads/abstract-image.png)

### 结论

在我看来，研究的重点是协作、思想的传播，以及在任何一个恰好存在的领域中改进现有的技术。许多计算机科学家和工程师使用 LaTeX 文档系统来写论文，它对数学提供了完美的支持。来自社会科学的研究人员似乎更喜欢 DOCX 文档。 

当身处不同社区的研究人员一同写一篇论文时，他们首先应该讨论一下他们将要使用哪种格式。然而如果包含太多的数学符号，DOCX 对于工程师来说不会是最简便的选择，LaTeX 对于缺乏编程经验的研究人员来说也有一些问题。就像这篇文章中展示的，Markdown 是一门工程师和社会科学家都很轻易能够使用的语言。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/pandoc-research-paper

作者：[Kiko Fernandez-Reyes][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kikofernandez
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Markdown
[2]: https://www.latex-project.org/
[3]: https://pandoc.org/
[4]: http://lierdakil.github.io/pandoc-crossref/
[5]: https://dl.acm.org/citation.cfm?id=3270118
[6]: https://github.com/kikofernandez/pandoc-examples/blob/master/research-paper/biblio.bib
[7]: https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures
[8]: https://www.sharelatex.com/learn/latex/Creating_a_document_in_LaTeX#The_preamble_of_a_document
[9]: http://pandoc.org/MANUAL.html#citations
[10]: http://www.bibtex.org/Using/
[11]: https://github.com/kikofernandez/pandoc-examples/tree/master/research-paper
