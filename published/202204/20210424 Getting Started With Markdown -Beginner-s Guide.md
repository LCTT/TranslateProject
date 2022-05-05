[#]: subject: (Getting Started With Markdown [Beginner’s Guide])
[#]: via: (https://itsfoss.com/markdown-guide/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14503-1.html)

Markdown 初学者指南
======

![](https://img.linux.net.cn/data/attachment/album/202204/24/140247d969nm9kkhxeknje.jpg)

在我的工作中，我经常要写代码、写与代码相配套的文档、创建网页、进行文本恢复项目。我在学校的时候还写过几篇正式的论文，也包括写课堂笔记，几乎每节课都写。

我几乎在我所有的写作中都使用 Markdown，它对我来说是一个节省时间的好工具。

在这篇文章中，我将分享我使用 Markdown 的体会。你将会了解以下内容：

  * 什么是 Markdown ？
  * 它是怎么工作的？
  * Markdown 的基本语法和怎样使用它们。

### 什么是 Markdown ？

假如你是 Markdown 新手，它是一个为网络写手转换文本到 HTML 格式的工具。Markdown 文档遵循一种特定的语法，容易阅读和写作。它们是纯文本，所以能够通过电脑上的任何文本编辑器来创建。然后这些文档能够转换成网页 —— 而网页是用一个叫做 HTML 的语言标记创建的。

Markdown 只是一种不必（即使知道怎么做）写 HTML 代码就能够创建网页的方式。实际上，如果你不转换成 HTML 的话，Markdown 甚至是个对纯文本格式化的好方法。有人曾这样对我描述 Markdown ：


> “ _它不是所见即所得，而是所见即所意_ ”。

然而，Markdown 不只是一个简单的格式化体系，它也是一个纯文本格式转化到 HTML 的一个软件工具。

这就是为什么语法很重要。如果你想在网页上起个标题，Markdown 将会基于你标题前面的字符来创建。Markdown 的一些语法示例如截图所示：

![Markdown to HTML conversion][1]

### 所以我怎样才能使纯文本文件转换成 HTML 格式呢?

John Gruber 的 Markdown 是一个运行在命令行上的 Perl 脚本。也就是说，它可以读取你创建的 Markdown 文本并用它来构建网页。

由于有 [许多著名的编辑器][2] 可以为你做这个转换，我在这里尽量避免使用命令行。不仅如此，许多这样的编辑器会让你写下你的文本，并同时向你展示网页的样子（称为渲染）。

Markdown 编辑器总的来说设置了两帧：左边部分是你要写你文本的地方，右边部分是用 HTML 语言显示给你格式化后文本的样子：  

![Most Markdown editors have two panes to write and preview the text][3]

当你用它满意地完成你的写作，只需保存 Markdown 文件即可。就像这样，之后一旦你需要编辑和修改的时候，你就会用到它。文件保存后，你可以用编辑器将 Markdown 文档导出为 HTML 格式的文档。

编辑器用你的 Markdown 作为参考创建网页。你的 Markdown 文档在导出时不会修改，你仍然拥有源文档，同时创建一个独立的、新的 HTML 文档（网页），你可以把它放到一个网页服务器上。

**注意**：许多 Markdown 编辑器也可以将你的 Markdown 文档导出为其他格式，比如 `.doc`、`.docx` 和 `.pdf`。之后你可以了解这些高级设置和你可能需要的额外软件。

###  Markdown 基础语法

为了让 Markdown 新用户快速了解，我将把这部分内容限制在我最常使用的语法上。我相信这些将是最有帮助的 - 你可以在现在就提高工作效率，同时了解更多关于 Markdown 以后能为你做什么。

#### 写标题

我经常使用 `#` 字符来表示标题。这里有六个等级：

```
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题
```

还有一种标题类型，是在文本下使用下划线。我很少使用这种类型的标题，我只限于使用两种：一种是使用 `=` 字符表示的双下划线，生成 `H1` 标题。一种是使用 `-` 字符表示的单下划线，生成 `H2` 标题：

```
一级标题
===============

二级标题
---------------
```

![][4]

#### 段落

段落被空行隔开（确保段落之间有一个空行）。首行不要缩进。在 Markdown 里用 `Tab` 键或者空格键缩进有着不同的目的和作用。

段落是一个文本块，不应该用空格键和 `Tab` 键来缩进。它可以有一行或者多行。要结束这一段另起一段，点两下回车键；段落通过一个空行分开。

![][5]

#### 换行

请记住，对于段落，必须用空行来分隔它们，这要通过按两次回车键来实现。Markdown 对此很严格。
 
Markdown 不支持 “<ruby>强制插入换行符<rt>hard-wrapped</rt></ruby>” 或者 “<ruby>固定行长度<rt>fixed-line-length</rt></ruby>” 段落。那就是说，单击回车键一次将不会强制文本换到新的一行。它可能在编辑窗口显示，但是 HTML 格式下不显示。

然而，有时你可能需要拆分段落或者换行。Markdown 确实有一种方法可以做到，但是它一开始看起来可能有一点奇怪：**换行是通过用两到多个空格键然后点一次回车键完成的。**

![][6]

这里有一个短诗的范例。每行以两个空格结束。最后一行，由于是这个小节的结束，没有额外的空格。因为它是这个诗句（段落）的结束，我双击回车键两次：

```
Baa, baa black sheep,  
Have you any wool?.  
Yes, sir. Yes, sir.  
Three bags full.
```

在一行的最后加两个空格来创建一个换行，可能需要时间去习惯。
 
![][7]

#### 水平线

水平线非常适合将文本拆分为多个部分。

用三个或更多的破折号 `-` ，下划线 `_` ，或者星号 `*` 来做水平线，像这样：

```
---

***

___
```

你甚至可以在字符之间输入空格：

```
- - -
```

在文章和报告中我不经常使用水平线，但是在日记、系统日志和课堂笔记中对我很有用。

![][8]

#### 用加粗和斜体来强调文本

当你想让一个单词或者短语脱颖而出，引起注意，你可以让它加粗或者斜体显示。斜体和加粗文本可以在两种方式中任选其一。第一种是用星号 `*` 将其包括，第二种是用下划线 `_` 的方式。 
 
使一个单词或者短语斜体显示，用一个下划线或者星号来括住文本。使一个单词或者短语加粗，使用两个下划线或者星号来括住文本：

```
用星号来显示 *斜体* 。

用下划线来显示 _斜体_ 。

用星号来显示 **加粗** 。

用下划线来显示 __加粗__ 。
```

记住两边使用相同的字符。单词或短语的一面是星号，另一面是下划线，将不会生效。相同字符必须在单词或者短语的两边。

![][9]

#### 块引用

块引用被用来直接引用。如果你正在写博客，你想重复本杰明•富兰克林说过的话，你可以使用块引用。
 
一个右尖括号被用来指定块引用：

```
> 这是块引用。

>> 如果你想进一步再次块引用，使用两个右尖括号。
```

![][10]

#### 在 Markdown 中添加超链接

超链接非常酷。在基础版的 Markdown 语言有三种方式创建超链接，在这里我只讲两种：普通连接和自动连接。
 
第三种链接被称为参考链接，在 Markdown 语言的基础版和高级版都支持。我想让你快速入门。你可以在准备好的时候找找参考链接的资料。

普通链接可以让你链接到各种各样的网站。网站名称或者你要使用的短语被放置在中括号 `[]` 中。真实的链接地址在小括号 `()` 中。 

```
现在去看看 [Linux 中国](https://linux.cn) 。
```

自动连接通过用尖括号 `<>` 括住链接地址。这个链接是一个实际的地址（可以是网址或者电子邮件地址）。拼写出来的链接被转换到 HTML 的时候，就变成了有效的链接。
 
```
<http://automatic-link-to-url.com/>

<name@emailaddress.com>
```

当你想在文本中拼写出网址时，这很有用：

![][11]

#### 在 Markdown 中添加图片

链接图片几乎与链接网站一样。网站链接和图片链接微小的不同是，图片链接以感叹号 `!` 开始。

图片名称或者图片描述放置在中括号 `[]` 里。实际链接放置在小括号 `()` 里。

你可以像这样嵌入图片：

```
![alternate text](./images/image.jpg)
```

这儿有一个示例图像链接。这是一个示例链接，没有这个图片，但是这是个好例子，显示了实际链接应该有的样子：

```
![a picture of bill](./images/my_photo_of_me.jpg)
```

![][12]

#### 列表

制作列表有很多原因。它们可能用来作为代办事项、大纲中的主题元素、组装项目中的明细栏等等。列表有两种主要类型：无序列表和有序列表。
 
无序列表没有编号；这些就是我们在许多文档中所看到的列表项。有序列表是有编号的。

要创建一个有序（有编号的）列表，只需在每行用一个数字开始，像这样：

```
1. 项目 一。
2. 项目 二。
3. 项目 三。
```

无序列表没有编号，但要在列表每个项目的开始使用一个星号 `*` 、一个加号 `+` ，或者一个减号 `-` 。我偏向于使用一个星号或者减号，你可以选择适合你的：
 
```
* 项目 一。
+ 项目 二。
- 项目 三。
```

子项目可以通过缩进被添加到有序和无序列表中，像这样：

```
1. 项目 一
    1. 子项目 一
    2. 子项目 二
2. 项目 二
3. 项目 三
```

![][13]

### Markdown 语法速查表

这是一个简短的 Markdown 语法列表为你作为参考，这个列表已经在本小结中介绍。
 
如果你决定使用 Markdown 作为写作工具，你会发现 Markdown 会让写作变得更加简单。

![][14]

> **[下载 PDF 格式的 Markdown 速查表][15]**

### 结语

Markdown 可以做比我描述的更多的事情。我写作的很大一部分是用我在这里介绍的 Markdown 语法完成的 - 而这些是我最常使用的项目，即使是在更复杂的项目中。

如果这些看起来太简单了，那么说明它真的很容易。Markdown 用来完成简单的写作任务，但是你不必完全听我的。你可以尝试一下！不必安装 Markdown 编辑器；你可以在线尝试。这里有几个 [优秀的在线 Markdown 编辑器][16]。这里我喜欢用这三个：

- John Gruber’s [Dingus][17]
- [Editor.md][18]
- [Dillinger][19]

Editor.md 和 Dillinger 会让你看到你的 Markdown 文本作为 HTML 实时渲染的效果。 Dingus 不能实时预览，但是在参考页有 Markdown 的语法速查表。

![][20]

用以上这些在线编辑器尝试一下文章中的示例。也可以尝试一下你自己的想法。这将使你在可能致力于学习更多的知识之前习惯于 Markdown。

--------------------------------------------------------------------------------

via: https://itsfoss.com/markdown-guide/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/retext_window_showing_syntax_and_preview-2.png?resize=800%2C429&ssl=1
[2]: https://itsfoss.com/best-markdown-editors-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/ghostwriter_two_frames-1.png?resize=800%2C458&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/1_md_headings_vscodium.png?resize=800%2C485&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/2_md_paragraphs_example_vscodium.png?resize=800%2C593&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/3_md_line_break_fail_vscodium.png?resize=800%2C593&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/4_md_line_break_success_vscodium.png?resize=800%2C450&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/5_md_horizontal_rules_vscodium.png?resize=800%2C326&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/6_md_emphasis_vscodium.png?resize=800%2C393&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/7_md_blockquotes_vscodium.png?resize=800%2C393&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/8_md_links_vscodium.png?resize=800%2C678&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/9_md_images_vscodium.png?resize=800%2C725&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/10_md_lists_vscodium.png?resize=800%2C725&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/markdown-syntax-cheatsheet.png?resize=727%2C743&ssl=1
[15]: https://drive.google.com/file/d/1y-Qz9PX_2HksEG5D_WwN-asNB-tpjZHV/view?usp=sharing
[16]: https://itsfoss.com/online-markdown-editors/
[17]: https://daringfireball.net/projects/markdown/dingus
[18]: http://editor.md.ipandao.com/en.html
[19]: https://dillinger.io/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/editor-md_page_in_browser-1.png?resize=800%2C505&ssl=1
