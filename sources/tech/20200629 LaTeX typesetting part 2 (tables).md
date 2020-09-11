[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (LaTeX typesetting part 2 (tables))
[#]: via: (https://fedoramagazine.org/latex-typesetting-part-2-tables/)
[#]: author: (Earl Ramirez https://fedoramagazine.org/author/earlramirez/)

LaTeX typesetting part 2 (tables)
======

![][1]

LaTeX offers a number of tools to create and customise tables, in this series we will be using the tabular and tabularx environment to create and customise tables.

### Basic table

To create a table you simply specify the environment \begin{tabular}{columns}
```

```

\begin{tabular}{c|c}
    Release &amp;amp;amp;Codename \\\ \hline
    Fedora  Core 1 &amp;amp;amp;Yarrow \\\
    Fedora Core 2 &amp;amp;amp;Tettnang \\\
    Fedora Core 3 &amp;amp;amp;Heidelberg \\\
    Fedora Core 4 &amp;amp;amp;Stentz \\\
\end{tabular}
```

```

![Basic Table][2]

In the above example "{c|c}" in the curly bracket refers to the position of the text in the column. The below table summarises the positional argument together with the description.

Position | Argument
---|---
c | Position text in the centre
l | Position text left-justified
r | Position text right-justified
p{width} | Align the text at the top of the cell
m{width} | Align the text in the middle of the cell
b{width} | Align the text at the bottom of the cell

&gt;Both m{width} and b{width} requires the array package to be specified in the preamble.

Using the example above, let us breakdown the important points used and describe a few more options that you will see in this series

Option | Description
---|---
&amp; | Defines each cell, the ampersand is only used from the second column
\ | This terminates the row and start a new row
|
\hline | Specifies the horizontal line (optional)
*{num}{form} | This is handy when you have many columns and is an efficient way of limiting the repetition
|

### Customising our table

Now that some of the options available let create a table using the options described in the previous section.
```

```

\begin{tabular}{*{3}{|l|}}
\hline
    \textbf{Version} &amp;amp;amp;\textbf{Code name} &amp;amp;amp;\textbf{Year released} \\\
\hline
    Fedora 6 &amp;amp;amp;Zod &amp;amp;amp;2006 \\\ \hline
    Fedora 7 &amp;amp;amp;Moonshine &amp;amp;amp;2007 \\\ \hline
    Fedora 8 &amp;amp;amp;Werewolf &amp;amp;amp;2007 \\\
\hline
\end{tabular}
```

```

![Customise Table][3]

### Managing long text

With LaTeX if there are many texts in a column it will not be formatted well and does not look presentable.

The below example shows how long text is formatted, we will use "blindtext" in the preamble so that we can produce sample text.
```

```

\begin{tabular}{|l|l|}\hline
    Summary &amp;amp;amp;Description \\\ \hline
    Test &amp;amp;amp;\blindtext \\\
\end{tabular}
```

```

![Default Formatting][4]

As you can see the text exceed the page width; however, there are a couple of options to overcome this challenge.

  * Specify the column width, for example, m{5cm}
  * Utilise the tabularx environment, this requires tabularx package in the preamble.



### Managing long text with column width

By specifying the column width the text will be wrapped into the width as shown in the example below.
```

```

\begin{tabular}{|l|m{14cm}|} \hline
    Summary &amp;amp;amp;Description \\\ \hline
    Test &amp;amp;amp;\blindtext \\\ \hline
\end{tabular}\vspace{3mm}
```

```

![Column width][5]

### Managing long text with tabularx

Before we can leverage tabularx we need to add it in the preamble. Tabularx takes the following example

**\begin{tabularx}{width}{columns}**
```

```

\begin{tabularx}{\textwidth}{|l|X|} \hline
Summary &amp;amp;amp; Tabularx Description\\\ \hline
Text &amp;amp;amp;\blindtext \\\ \hline
\end{tabularx}
```

```

![Tabularx][6]

Notice that the column that we want the long text to be wrapped has a capital "X" specified.

### Multirow and multicolumn

There are times when you will need to merge rows and/or column. This section describes how it is accomplished. To use multirow and multicolumn add multirow to the preamble.

### Multirow

Multirow takes the following argument _\multirow{number_of_rows}{width}{text}_, let us look at the below example.
```

```

\begin{tabular}{|l|l|}\hline
    Release &amp;amp;amp;Codename \\\ \hline
    Fedora Core 4 &amp;amp;amp;Stentz \\\ \hline
    \multirow{2}{*}{MultiRow} &amp;amp;amp;Fedora 8 \\\
    &amp;amp;amp;Werewolf \\\ \hline
\end{tabular}
```

```

![MultiRow][7]

In the above example, two rows were specified, the ‘*’ tells LaTeX to automatically manage the size of the cell.

### Multicolumn

Multicolumn argument is _\multicolumn{number_of_columns}{cell_position}{text}_, below example demonstrates multicolumn.
```

```

\begin{tabular}{|l|l|l|}\hline
    Release &amp;amp;amp;Codename &amp;amp;amp;Date \\\ \hline
    Fedora Core 4 &amp;amp;amp;Stentz &amp;amp;amp;2005 \\\ \hline
    \multicolumn{3}{|c|}{Mulit-Column} \\\ \hline
\end{tabular}
```

```

![Multi-Column][8]

### Working with colours

Colours can be assigned to the text, an individual cell or the entire row. Additionally, we can configure alternating colours for each row.

Before we can add colour to our tables we need to include _\usepackage[table]{xcolor}_ into the preamble. We can also define colours using the following colour reference [LaTeX Colour][9] or by adding an exclamation after the colour prefixed by the shade from 0 to 100. For example, _gray!30_
```

```

\definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
\definecolor{darkgray}{rgb}{0.66, 0.66, 0.66}
```

```

Below example demonstrate this a table with alternate colours, \rowcolors take the following options _\rowcolors{row_start_colour}{even_row_colour}{odd_row_colour}_.
```

```

\rowcolors{2}{darkgray}{gray!20}
\begin{tabular}{c|c}
    Release &amp;amp;amp;Codename \\\ \hline
    Fedora  Core 1 &amp;amp;amp;Yarrow \\\
    Fedora Core 2 &amp;amp;amp;Tettnang \\\
    Fedora Core 3 &amp;amp;amp;Heidelberg \\\
    Fedora Core 4 &amp;amp;amp;Stentz \\\
\end{tabular}
```

```

![Alt colour table][10]

In addition to the above example, \rowcolor can be used to specify the colour of each row, this method works best when there are multi-rows. The following examples show the impact of using the \rowcolours with multi-row and how to work around it.

![Impact on multi-row][11]

As you can see the _multi-row_ is visible in the first row, to fix this we have to do the following.
```

```

\begin{tabular}{|l|l|}\hline
    \rowcolor{darkblue}\textsc{\color{white}Release}  &amp;amp;amp;\textsc{\color{white}Codename} \\\ \hline
    \rowcolor{gray!10}Fedora Core 4 &amp;amp;amp;Stentz \\\ \hline
    \rowcolor{gray!40}&amp;amp;amp;Fedora 8 \\\
    \rowcolor{gray!40}\multirow{-2}{*}{Multi-Row} &amp;amp;amp;Werewolf \\\ \hline
\end{tabular}
```

```

![Multi-row][12]

Let us discuss the changes that were implemented to resolve the multi-row with the alternate colour issue.

  * The first row started above the multi-row
  * The number of rows was changed from 2 to -2, which means to read from the line above
  * \rowcolor was specified for each row, more importantly, the multi-rows must have the same colour so that you can have the desired results.



One last note on colour, to change the colour of a column you need to create a new column type and define the colour. The example below illustrates how to define the new column colour.
```

```

\newcolumntype{g}{&amp;amp;gt;{\columncolor{darkblue}}l}
```

```

Let’s break it down

  * \newcolumntype{g}: defines the letter _g_ as the new column
  * {&gt;{\columncolor{darkblue}}l}: here we select our desired colour, and _l_ tells the column to be left-justified, this can be subsitued with _c_ or _r_


```

```

\begin{tabular}{g|l}
    \textsc{Release}  &amp;amp;amp;\textsc{Codename} \\\ \hline
    Fedora Core 4 &amp;amp;amp;Stentz \\\
    &amp;amp;amp;Fedora 8 \\\
    \multirow{-2}{*}{Multi-Row} &amp;amp;amp;Werewolf \\\
\end{tabular}\
```

```

![Column Colour][13]

### Landscape table

There may be times when your table has many columns and will not fit elegantly in portrait. With the _rotating_ package in preamble you will be able to create a sideways table. The below example demonstrates this.

For the landscape table, we will use the _sidewaystable_ environment and add the tabular environment within it, we also specified additional options.

  * \centering to position the table in the centre of the page
  * \caption{} to give our table a name
  * \label{} this enables us to reference the table in our document


```

```

\begin{sidewaystable}
\centering
\caption{Sideways Table}
\label{sidetable}
\begin{tabular}{ll}
    \rowcolor{darkblue}\textsc{\color{white}Release}  &amp;amp;amp;\textsc{\color{white}Codename} \\\
    \rowcolor{gray!10}Fedora Core 4 &amp;amp;amp;Stentz \\\
    \rowcolor{gray!40} &amp;amp;amp;Fedora 8 \\\
    \rowcolor{gray!40}\multirow{-2}{*}{Multi-Row} &amp;amp;amp;Werewolf \\\
\end{tabular}\vspace{3mm}
\end{sidewaystable}
```

```

![Sideways Table][14]

### List and tables

To include a list into a table you can use tabularx and include the list in the column where the _X_ is specified. Another option will be to use tabular but you must specify the column width.

### List in tabularx
```

```

\begin{tabularx}{\textwidth}{|l|X|} \hline
    Fedora Version &amp;amp;amp;Editions \\\ \hline
    Fedora 32 &amp;amp;amp;\begin{itemize}[noitemsep]
        \item CoreOS
        \item Silverblue
        \item IoT
    \end{itemize} \\\ \hline
\end{tabularx}\vspace{3mm}
```

```

![List in tabularx][15]

### List in tabular
```

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

```

![List in tabular][16]

### Conclusion

LaTeX offers many ways to customise your table with tabular and tabularx, you can also add both tabular and tabularx within the table environment (\begin\table) to add the table name and to position the table.

### LaTeX packages

The packages used in this series are.
```

```

\usepackage{fullpage}
\usepackage{blindtext}  % add demo text
\usepackage{array} % used for column positions
\usepackage{tabularx} % adds tabularx which is used for text wrapping
\usepackage{multirow} % multi-row and multi-colour support
\usepackage[table]{xcolor} % add colour to the columns
\usepackage{rotating} % for landscape/sideways tables
```

```

### Additional Reading

This was an intermediate lesson on tables; for more advanced information about tables and LaTex in general, you can go to [LaTeX Wiki][17]

![][13]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/latex-typesetting-part-2-tables/

作者：[Earl Ramirez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
