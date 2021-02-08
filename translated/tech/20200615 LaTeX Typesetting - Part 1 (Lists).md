[#]: collector: "lujun9972"
[#]: translator: "rakino"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "LaTeX Typesetting – Part 1 (Lists)"
[#]: via: "https://fedoramagazine.org/latex-typesetting-part-1/"
[#]: author: "Earl Ramirez https://fedoramagazine.org/author/earlramirez/"

LaTeX 排版——第 1 部分：列表
======

![][1]

本系列基于前文 [Typeset your docs with LaTex and TeXstudio on Fedora][2] 和 [LaTeX 101 for beginners][3]，本文即系列的第一部分是关于 LaTeX 列表的。



### 列表类型

LaTeX 中的列表是封闭的环境，列表中的每个项目可以取一行文字到一个完整的段落。在 LaTeX 中有三种列表类型：

  * **itemize**: <ruby>无序列表<rt>unordered list</rt></ruby>/<ruby>项目符号列表<rt>bullet list</rt></ruby> 
  * **enumerate**: <ruby>有序列表<rt>ordered list</rt></ruby> 
  * **description**: <ruby>描述列表<rt>descriptive list</rt></ruby> 



### 创建列表

要创建一个列表，需要在每个项目前加上控制序列 \\_item_，并在项目清单前后分别加上控制序列 \\_begin_{<类型>} 和 \\_end_{<类型>}（将其中的 <类型> 替换为将要使用的列表类型），如下例：

#### itemize（无序列表）

```
\begin{itemize}
    \item Fedora
    \item Fedora Spin
    \item Fedora Silverblue
\end{itemize}
```

![][4]

#### enumerate（有序列表）

```
\begin{enumerate}
    \item Fedora CoreOS
    \item Fedora Silverblue
    \item Fedora Spin
\end{enumerate}
```

![][5]

#### description（描述列表）

```
\begin{description}
    \item[Fedora 6] Code name Zod
    \item[Fedora 8] Code name Werewolf
\end{description}
```

![][6]

### 列表项目间距

可以通过在导言区加入 \\_usepackage{enumitem}_ 来自定义默认的间距，宏包 _enumitem_ 启用了选项 _noitemsep_ 和控制序列 \\_itemsep_ ，可以在列表中使用他们，如下例所示：

#### 使用选项 noitemsep

将选项 _noitemsep_ 封闭在方括号内，并同下文所示放在控制序列 \\_begin_ 之后，该选项将移除默认的间距。

```
\begin{itemize}[noitemsep]
    \item Fedora
    \item Fedora Spin
    \item Fedora Silverblue
\end{itemize}
```

![][7]

#### 使用控制序列 \itemsep

控制序列 \\_itemsep_ 必须以一个数字作为后缀，用以表示列表项目之间应该有多少空间。

```
\begin{itemize} \itemsep0.75pt
    \item Fedora Silverblue
    \item Fedora CoreOS
\end{itemize}
```

![][8]

### 嵌套列表

LaTeX 最多最多支持四层嵌套列表，如下例：

#### 嵌套无序列表

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

#### 嵌套有序列表

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

### 每种列表类型的列表样式名称

**enumerate（有序列表）** | **itemize（无序列表）** 
---|---
\alph* （小写字母） | $\bullet$ (Bullet) 
\Alph* （大写字母） | $\cdot$ (Period) 
\arabic* （阿拉伯数字） | $\diamond$ (Diamond) 
\roman* （小写罗马数字） | $\ast$ (Asterisk) 
\Roman* （大写罗马数字） | $\circ$ (Circle) 
| $-$ (Dash) 

### 按嵌套深度划分的默认样式

**嵌套深度** | **enumerate（有序列表）** | **itemize（无序列表）** 
---|---|---
1 | 阿拉伯数字 | Bullet
2 | 小写字母 | Dash
3 | 小写罗马数字 | Asterisk
4 | 大写字母 | Period

### 设置列表样式

下面的例子列举了无序列表的不同样式。

```
% 无序列表样式
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

有三种设置列表样式的方式，下面将按照优先级从高到低的顺序分别举例。

#### 方式一：为各项目单独设置

将需要的样式名称封闭在方括号内，并放在控制序列 \\_item_ 之后，如下例： 

```
% 方式一
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

#### 方式二：为整个列表设置

将需要的样式名称以 _label=_ 前缀并封闭在方括号内，放在控制序列 _\begin_ 之后，如下例：

```
% 方式二
\begin{enumerate}[label=\Alph*.]
    \item Fedora 32
    \item Fedora 31
    \item Fedora 30
\end{enumerate}
```

#### 方式三：为整个文档设置

该方式将改变整个文档的默认样式。使用 \\_renewcommand_ 来设置项目标签的值，下例分别为四个嵌套深度的项目标签设置了不同的样式。

```
% 方式三
\renewcommand{\labelitemi}{$\ast$}
\renewcommand{\labelitemii}{$\diamond$}
\renewcommand{\labelitemiii}{$\bullet$}
\renewcommand{\labelitemiv}{$-$}
```

### 总结

LaTeX 支持三种列表，而每种列表的风格和间距都是可以自定义的。在以后的文章中，我们将解释更多的 LaTeX 元素。

关于 LaTeX 列表的延伸阅读可以在这里找到：[LaTeX List Structures][12]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/latex-typesetting-part-1/

作者：[Earl Ramirez][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
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
