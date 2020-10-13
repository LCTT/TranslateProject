[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (LaTeX Typesetting – Part 1 (Lists))
[#]: via: (https://fedoramagazine.org/latex-typesetting-part-1/)
[#]: author: (Earl Ramirez https://fedoramagazine.org/author/earlramirez/)

LaTeX Typesetting – Part 1 (Lists)
======

![][1]

This series builds on the previous articles: [Typeset your docs with LaTex and TeXstudio on Fedora][2] and [LaTeX 101 for beginners][3]. This first part of the series is about LaTeX lists.

### Types of lists

LaTeX lists are enclosed environments, and each item in the list can take a line of text to a full paragraph. There are three types of lists available in LaTeX. They are:

  * **Itemized**: unordered or bullet
  * **Enumerated**: ordered
  * **Description**: descriptive



### Creating lists

To create a list, prefix each list item with the \_item_ command. Precede and follow the list of items with the \_begin_{&lt;type&gt;} and \_end_{&lt;type&gt;} commands respectively where &lt;type&gt; is substituted with the type of the list as illustrated in the following examples.

#### Itemized list

```
\begin{itemize}
    \item Fedora
    \item Fedora Spin
    \item Fedora Silverblue
\end{itemize}
```

![][4]

#### Enumerated list

```
\begin{enumerate}
    \item Fedora CoreOS
    \item Fedora Silverblue
    \item Fedora Spin
\end{enumerate}
```

![][5]

#### Descriptive list

```
\begin{description}
    \item[Fedora 6] Code name Zod
    \item[Fedora 8] Code name Werewolf
\end{description}
```

![][6]

### Spacing list items

The default spacing can be customized by adding \_usepackage{enumitem}_ to the preamble. The _enumitem_ package enables the _noitemsep_ option and the \_itemsep_ command which you can use on your lists as illustrated below.

#### Using the noitemsep option

Enclose the _noitemsep_ option in square brackets and place it on the \_begin_ command as shown below. This option removes the default spacing.

```
\begin{itemize}[noitemsep]
    \item Fedora
    \item Fedora Spin
    \item Fedora Silverblue
\end{itemize}
```

![][7]

#### Using the \itemsep command

The \_itemsep_ command must be suffixed with a number to indicate how much space there should be between the list items.

```
\begin{itemize} \itemsep0.75pt
    \item Fedora Silverblue
    \item Fedora CoreOS
\end{itemize}
```

![][8]

### Nesting lists

LaTeX supports nested lists up to four levels deep as illustrated below.

#### Nested itemized lists

```
\begin{itemize}[noitemsep]
    \item Fedora Versions
    \begin{itemize}
        \item Fedora 8
        \item Fedora 9
        \begin{itemize}
            \item Werewolf
            \item Sulphur
            \begin{itemize}
                \item 2007-05-31
                \item 2008-05-13
            \end{itemize}
        \end{itemize}
    \end{itemize}
    \item Fedora Spin
    \item Fedora Silverblue
\end{itemize}
```

![][9]

#### Nested enumerated lists

```
\begin{enumerate}[noitemsep]
    \item Fedora Versions
    \begin{enumerate}
        \item Fedora 8
        \item Fedora 9
        \begin{enumerate}
            \item Werewolf
            \item Sulphur
            \begin{enumerate}
                \item 2007-05-31
                \item 2008-05-13
            \end{enumerate}
        \end{enumerate}
    \end{enumerate}
    \item Fedora Spin
    \item Fedora Silverblue
\end{enumerate}
```

![][10]

### List style names for each list type

**Enumerated** | **Itemized**
---|---
\alph* | $\bullet$
\Alph* | $\cdot$
\arabic* | $\diamond$
\roman* | $\ast$
\Roman* | $\circ$
| $-$

### Default style by list depth

**Level** | **Enumerated** | **Itemized**
---|---|---
1 | Number | Bullet
2 | Lowercase alphabet | Dash
3 | Roman numerals | Asterisk
4 | Uppercase alphabet | Period

### Setting list styles

The below example illustrates each of the different itemiszed list styles.

```
% Itemize style
\begin{itemize}
    \item[$\ast$] Asterisk
    \item[$\diamond$] Diamond
    \item[$\circ$] Circle
    \item[$\cdot$] Period
    \item[$\bullet$] Bullet (default)
    \item[--] Dash
    \item[$-$] Another dash
\end{itemize}
```

![][11]

There are three methods of setting list styles. They are illustrated below. These methods are listed by priority; highest priority first. A higher priority will override a lower priority if more than one is defined for a list item.

#### List styling method 1 – per item

Enclose the name of the desired style in square brackets and place it on the \_item_ command as demonstrated below.

```
% First method
\begin{itemize}
    \item[$\ast$] Asterisk
    \item[$\diamond$] Diamond
    \item[$\circ$] Circle
    \item[$\cdot$] period
    \item[$\bullet$] Bullet (default)
    \item[--] Dash
    \item[$-$] Another dash
\end{itemize}
```

#### List styling method 2 – on the list

Prefix the name of the desired style with _label=_. Place the parameter, including the _label=_ prefix, in square brackets on the \_begin_ command as demonstrated below.

```
% Second method
\begin{enumerate}[label=\Alph*.]
    \item Fedora 32
    \item Fedora 31
    \item Fedora 30
\end{enumerate}
```

#### List styling method 3 – on the document

This method changes the default style for the entire document. Use the \_renewcommand_ to set the values for the labelitems. There is a different labelitem for each of the four label depths as demonstrated below.

```
% Third method
\renewcommand{\labelitemi}{$\ast$}
\renewcommand{\labelitemii}{$\diamond$}
\renewcommand{\labelitemiii}{$\bullet$}
\renewcommand{\labelitemiv}{$-$}
```

### Summary

LaTeX supports three types of lists. The style and spacing of each of the list types can be customized. More LaTeX elements will be explained in future posts.

Additional reading about LaTeX lists can be found here: [LaTeX List Structures][12]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/latex-typesetting-part-1/

作者：[Earl Ramirez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/earlramirez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/latex-series-816x345.png
[2]: https://fedoramagazine.org/typeset-latex-texstudio-fedora
[3]: https://fedoramagazine.org/fedora-classroom-latex-101-beginners
[4]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-1.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-2.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-3.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-4.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-5.png
[9]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-7.png
[10]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-8.png
[11]: https://fedoramagazine.org/wp-content/uploads/2020/06/image-9.png
[12]: https://en.wikibooks.org/wiki/LaTeX/List_Structures
