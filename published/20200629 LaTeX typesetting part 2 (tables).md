[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13146-1.html)
[#]: subject: (LaTeX typesetting part 2 \(tables\))
[#]: via: (https://fedoramagazine.org/latex-typesetting-part-2-tables/)
[#]: author: (Earl Ramirez https://fedoramagazine.org/author/earlramirez/)

LaTex 排版 （2）：表格
======

![][1]

LaTeX 提供了许多工具来创建和定制表格，在本系列中，我们将使用 `tabular` 和 `tabularx` 环境来创建和定制表。

### 基础表格

要创建表，只需指定环境 `\begin{tabular}{列选项}`：

```
\begin{tabular}{c|c}
    Release &Codename \\ \hline
    Fedora Core 1 &Yarrow \\ 
    Fedora Core 2 &Tettnang \\ 
    Fedora Core 3 &Heidelberg \\ 
    Fedora Core 4 &Stentz \\ 
\end{tabular}
```

![Basic Table][2]

在上面的示例中，花括号中的 ”{c|c}” 表示文本在列中的位置。下表总结了位置参数及其说明。

参数 | 位置
|:---:|:---
`c` | 将文本置于中间
`l` | 将文本左对齐
`r` | 将文本右对齐
`p{宽度}` | 文本对齐单元格顶部
`m{宽度}` | 文本对齐单元格中间
`b{宽度}` | 文本对齐单元格底部

> `m{宽度}` 和 `b{宽度}` 都要求在最前面指定数组包。

使用上面的例子，让我们来详细讲解使用的要点，并描述你将在本系列中看到的更多选项：

选项 | 意义
|:-:|:-|
`&` | 定义每个单元格，这个符号仅用于第二列
`\\` | 这将终止该行并开始一个新行
`|` | 指定表格中的垂直线（可选）
`\hline` | 指定表格中的水平线（可选）
`*{数量}{格式}` | 当你有许多列时，可以使用这个，并且是限制重复的有效方法
`||` | 指定表格中垂直双线

### 定制表格

学会了这些选项，让我们使用这些选项创建一个表。

```
\begin{tabular}{*{3}{|l|}}
\hline
	\textbf{Version} &\textbf{Code name} &\textbf{Year released} \\
\hline
	Fedora 6 &Zod &2006 \\ \hline
	Fedora 7 &Moonshine &2007 \\ \hline
	Fedora 8 &Werewolf &2007 \\
\hline
\end{tabular}
```

![Customise Table][3]

### 管理长文本

如果列中有很多文本，那么它的格式就不好处理，看起来也不好看。

下面的示例显示了文本的格式长度，我们将在导言区中使用 `blindtext`，以便生成示例文本。

```
\begin{tabular}{|l|l|}\hline
	Summary &Description \\ \hline
	Test &\blindtext \\
\end{tabular}
```

![Default Formatting][4]

正如你所看到的，文本超出了页面宽度；但是，有几个选项可以克服这个问题。

  * 指定列宽，例如 `m{5cm}`
  * 利用 `tablarx` 环境，这需要在导言区中引用 `tablarx` 宏包。

#### 使用列宽管理长文本

通过指定列宽，文本将被折行为如下示例所示的宽度。

```
\begin{tabular}{|l|m{14cm}|} \hline
	Summary &Description \\ \hline
	Test &\blindtext \\ \hline
\end{tabular}\vspace{3mm}
```

![Column Width][5]

#### 使用 tabularx 管理长文本

在我们利用表格之前，我们需要在导言区中加上它。`tabularx` 方法见以下示例：`\begin{tabularx}{宽度}{列选项}`。

```
\begin{tabularx}{\textwidth}{|l|X|} \hline
Summary & Tabularx Description\\ \hline
Text &\blindtext \\ \hline
\end{tabularx}
```

![Tabularx][6]

请注意，我们需要处理长文本的列在花括号中指定了大写 `X`。

### 合并行合并列

有时需要合并行或列。本节描述了如何完成。要使用 `multirow` 和 `multicolumn`，请将 `multirow` 添加到导言区。

#### 合并行

`multirow` 采用以下参数 `\multirow{行的数量}{宽度}{文本}`，让我们看看下面的示例。

```
\begin{tabular}{|l|l|}\hline
	Release &Codename \\ \hline
	Fedora Core 4 &Stentz \\ \hline
	\multirow{2}{*}{MultiRow} &Fedora 8 \\ 
	&Werewolf \\ \hline
\end{tabular}
```

![MultiRow][7]

在上面的示例中，指定了两行，`*` 告诉 LaTeX 自动管理单元格的大小。

#### 合并列

`multicolumn` 参数是 `{multicolumn{列的数量}{单元格选项}{位置}{文本}`，下面的示例演示合并列。

```
\begin{tabular}{|l|l|l|}\hline
	Release &Codename &Date \\ \hline
	Fedora Core 4 &Stentz &2005 \\ \hline
	\multicolumn{3}{|c|}{Mulit-Column} \\ \hline
\end{tabular}
```

![Multi-Column][8]

### 使用颜色

可以为文本、单个单元格或整行指定颜色。此外，我们可以为每一行配置交替的颜色。

在给表添加颜色之前，我们需要在导言区引用 `\usepackage[table]{xcolor}`。我们还可以使用以下颜色参考 [LaTeX Color][9] 或在颜色前缀后面添加感叹号（从 0 到 100 的阴影）来定义颜色。例如，`gray！30`。

```
\definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
\definecolor{darkgray}{rgb}{0.66, 0.66, 0.66}
```

下面的示例演示了一个具有各种颜色的表，`\rowcolors` 采用以下选项 `\rowcolors{起始行颜色}{偶数行颜色}{奇数行颜色}`。

```
\rowcolors{2}{darkgray}{gray!20}
\begin{tabular}{c|c}
	Release &Codename \\ \hline
	Fedora  Core 1 &Yarrow \\
	Fedora Core 2 &Tettnang \\
	Fedora Core 3 &Heidelberg \\
	Fedora Core 4 &Stentz \\
\end{tabular}
```

![Alt colour table][10]

除了上面的例子，`\rowcolor` 可以用来指定每一行的颜色，这个方法在有合并行时效果最好。以下示例显示将 `\rowColors` 与合并行一起使用的影响以及如何解决此问题。

![Impact on multi-row][11]

你可以看到，在合并行中，只有第一行能显示颜色。想要解决这个问题，需要这样做：

```
\begin{tabular}{|l|l|}\hline
	\rowcolor{darkblue}\textsc{\color{white}Release}  &\textsc{\color{white}Codename} \\ \hline
	\rowcolor{gray!10}Fedora Core 4 &Stentz \\ \hline
	\rowcolor{gray!40}&Fedora 8 \\ 
	\rowcolor{gray!40}\multirow{-2}{*}{Multi-Row} &Werewolf \\ \hline
\end{tabular}
```

![Multi-row][12]

让我们讲解一下为解决合并行替换颜色问题而实施的更改。

  * 第一行从合并行上方开始
  * 行数从 `2` 更改为 `-2`，这意味着从上面的行开始读取
  * `\rowcolor` 是为每一行指定的，更重要的是，多行必须具有相同的颜色，这样才能获得所需的结果。

关于颜色的最后一个注意事项是，要更改列的颜色，需要创建新的列类型并定义颜色。下面的示例说明了如何定义新的列颜色。

```
\newcolumntype{g}{>{\columncolor{darkblue}}l} 
```

我们把它分解一下：

  * `\newcolumntype{g}`：将字母 `g` 定义为新列
  * `{>{\columncolor{darkblue}}l}`：在这里我们选择我们想要的颜色，并且 `l` 告诉列左对齐，这可以用 `c` 或 `r` 代替。

```
\begin{tabular}{g|l} 
	\textsc{Release}  &\textsc{Codename} \\ \hline
	Fedora Core 4 &Stentz \\ 
	&Fedora 8 \\ 
	\multirow{-2}{*}{Multi-Row} &Werewolf \\ 
\end{tabular}\
```

![Column Colour][13]

### 横向表

有时，你的表可能有许多列，纵向排列会很不好看。在导言区加入 `rotating` 包，你将能够创建一个横向表。下面的例子说明了这一点。

对于横向表，我们将使用 `sidewaystable` 环境并在其中添加表格环境，我们还指定了其他选项。

  * `\centering` 可以将表格放置在页面中心
  * `\caption{}` 为表命名
  * `\label{}` 这使我们能够引用文档中的表

```
\begin{sidewaystable}
\centering
\caption{Sideways Table}
\label{sidetable}
\begin{tabular}{ll}
	\rowcolor{darkblue}\textsc{\color{white}Release}  &\textsc{\color{white}Codename} \\ 
	\rowcolor{gray!10}Fedora Core 4 &Stentz \\ 
	\rowcolor{gray!40} &Fedora 8 \\ 
	\rowcolor{gray!40}\multirow{-2}{*}{Multi-Row} &Werewolf \\ 
\end{tabular}\vspace{3mm}
\end{sidewaystable}
```

![Sideways Table][14]

### 列表和表格

要将列表包含到表中，可以使用 `tabularx`，并将列表包含在指定的列中。另一个办法是使用表格格式，但必须指定列宽。

#### 用 tabularx 处理列表

```
\begin{tabularx}{\textwidth}{|l|X|} \hline
	Fedora Version &Editions \\ \hline
	Fedora 32 &\begin{itemize}[noitemsep]
		\item CoreOS
		\item Silverblue
		\item IoT
	\end{itemize} \\ \hline
\end{tabularx}\vspace{3mm}
```

![List in tabularx][15]

#### 用 tabular 处理列表

```
\begin{tabular}{|l|m{6cm}|}\hline
        Fedora Version &amp;amp;amp;Editions \\\ \hline
    Fedora 32 &amp;amp;amp;\begin{itemize}[noitemsep]
        \item CoreOS
        \item Silverblue
        \item IoT
    \end{itemize} \\\ \hline
\end{tabular}
```

![List in tabular][16]

### 总结

LaTeX 提供了许多使用 `tablar` 和 `tablarx` 自定义表的方法，你还可以在表环境 （`\begin\table`） 中添加 `tablar` 和 `tablarx` 来添加表的名称和定位表。

### LaTeX 宏包

所需的宏包有如下这些：

```
\usepackage{fullpage}
\usepackage{blindtext}  % add demo text
\usepackage{array} % used for column positions
\usepackage{tabularx} % adds tabularx which is used for text wrapping
\usepackage{multirow} % multi-row and multi-colour support
\usepackage[table]{xcolor} % add colour to the columns 
\usepackage{rotating} % for landscape/sideways tables
```

### 额外的知识

这是一堂关于表的小课，有关表和 LaTex 的更多高级信息，请访问 [LaTex Wiki][17]

![][13]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/latex-typesetting-part-2-tables/

作者：[Earl Ramirez][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/earlramirez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/latex-series-816x345.png
[2]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-13.png
[3]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-23.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-10.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-11.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-12.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-15.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-16.png
[9]: https://latexcolor.com
[10]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-17.png
[11]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-18.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-19.png
[13]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-24.png
[14]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-20.png
[15]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-21.png
[16]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-22.png
[17]: https://en.wikibooks.org/wiki/LaTeX/Tables
