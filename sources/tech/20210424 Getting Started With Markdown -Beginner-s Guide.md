[#]: subject: (Getting Started With Markdown [Beginner’s Guide])
[#]: via: (https://itsfoss.com/markdown-guide/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

开始使用 Markdown [初学者指南]
======

在我的工作中，我经常要写代码，写于代码配套的文档，创建网页，进行文本恢复项目，但我还在学校的时候写过几篇正式的论文。我也在这里写课堂笔记，几乎每节课都写。

我几乎在我的所有写作中都使用 Markdown,它对我来说是一个节省时间的好方法。

在这篇文章中，我将分享使用 Markdown 的体会。你将会了解一下内容：

  * 什么是 Markdown ？
  * 它是怎么工作的？
  * 的基本语法和怎样使用它们



### 什么是 Markdown ？

如果你是 Markdown 新手，它是一个为网络写手转换文本到 HTML 的工具。Markdown 文档按照特定的语法容易阅读和写作。它们是存文本所以能够通过电脑上的任何文本编辑器来创建。这些文档然后能够被转换成网页 —— 网页通过使用叫做 HTML 为标记而创建的。

Markdown只是一种不需要 (甚至知道怎么做) 写 HTML 代码就能够创建网页的方式。实际上，如果你不转换 HTML 的话，Markdown甚至是个格式化的纯文本的好的方法。有人曾这样对我描述 Markdown ：


> “ 它不是 _你看到的就是你得到的，而是 _你看到的是你想到的_ ”.

然而，Markdown不只是一个简单的格式化体系，它也是一个转化纯文本格式化到 HTML 的一个软件工具。

这就是为什么语法是重要的了。如果你想在网页上起个标题，Markdown 将会基于你的标题前面的字符来创建。Markdown　的一些语法示例如截图所示：

![Markdown to HTML conversion][1]

### 所以我怎样才能使纯文本文件转换成 HTML 呢?

John Gruber 的 Markdown 是一个运行在命令行上的 Perl 脚本。也就是说，它可以读取你创建的的 Markdown 文本和用它来构建网页。

由于有 [许多著名的编辑器][2] 能为你做这个转换，我在这里尽量避免命令行。不止这些，同时许多编辑器会让你写入你的文本并通过网页显示给你想看的 (被称为 _渲染_) 。

Markdown 编辑器总的来说设置了两个框架。左边框架是你要写你文本的地方，右边框见显示给你用 HTML 语言显示格式化文本的样子：  


![Most Markdown editors have two panes to write and preview the text][3]

当你用它完成你的文本并喜欢使用它时，简单的保存 Markdown 文件。就像这样，之后一旦你需要编辑和修改的时候，你总是会想起它。一旦文件保存后，你可以用编辑器将 Markdown 文档导出为 HTML 格式的文档。

编辑器将会创建网页，用你的 Markdown 作为参照。你的 Markdown 文档在导出时不会修改，你仍然可以拥有它，同时创建一个独立的，新的 <ruby>HTML<rt>网页</rt></ruby> 文档，你可以把它放到一个网页服务器上。

**注意**: 许多 Markdown 编辑器也可以将你的 Markdown 文档导出为其他格式，比如 `.doc`, `.docx`, and `.pdf`。之后你可以了解这些高级设置和你可能需要的额外软件。


### 基础 Markdown 语法

为了让新 Markdown 用户快速了解，我将有限的讲解我经常使用的的语法。我相信这些将是最有帮助的 - 当你了解更多关于 Markdown 能为你做什么之后，可以马上提高你的生产力。

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

另一种标题类型是在文本下使用下划线。我很少使用这种类型的标题，因为我只使用限于两种。一种是使用 `=`字符表示的双下划线，生成 `H1` 标题。一种是使用 `-` 字符表示的单下划线，生成 `H2` 标题：

```
一级标题
===============

二级标题
---------------
```

![][4]

#### 段落

段落被空行隔开(确保段落之间有一个空行)。首行不要缩进。在 Markdown 里用 <ruby>`<Tab>`<rt>Tab键</rt></ruby> 或者 <ruby>`<spaces>`<rt>空格键</rt></ruby>  缩进有着不懂的目的和作用。

段落是一个文本块，不应该用空格键和 tab 键来缩进。它可以有一行或者多行。要结束这一段另起一段，点两下 <ruby>`<Enter>`<rt>回车键</rt></ruby>  ；段落通过一个空行分开。

![][5]

#### Line Breaks

Remember that with paragraphs, a blank line has to separate them and this is done by pressing twice on the `<Enter>` key. Markdown is strict about it.

Markdown does not support “hard-wrapped” or “fixed-line-length” paragraphs. That is, hitting the `<Enter>` key once will not force text to a new line. It may appear so in the editing window, but the HTML won’t show it.

Yet, there will be times when you may need to break up paragraphs with some way to break up a line. Markdown does have a way to do this but it may seem a little strange at first: **a line break is made by ending a line with two or more spaces and then hitting the `<Enter>` key once.**

![][6]

Here is a working example of a short verse. Each line has two spaces at the end. The last line, since it’s the end of the verse, doesn’t have the extra spaces. Since it’s the end of the verse (paragraph), I hit the `<Enter>` key twice:

Baa, baa black sheep,
Have you any wool?.
Yes, sir. Yes, sir.
Three bags full.

Adding two spaces at the end of a line, to create a line break, can take some getting used to.

![][7]

#### Horizontal Rules

Horizontal rules are great for splitting up text into sections.

Use three or more dashes `-`, underscores `_`, or asterisks `*` for horizontal rules, like so:

```
`---`

`***`

`___`
```

You can even put spaces between the characters:

```
`- - -`
```

I do not use horizontal rules very often in articles or papers, but they come in handy for me in journal entries, system logs, and class notes.

![][8]

#### Emphasis on text with bold and italics

When you want a word or phrase to stand out and be noticed, you can either make it bold or italicized. Italics and bold text can be made on one of two ways. The first is by surrounding the text with asterisks `*`, while the second is to use underscores `_`.

To italicize a word or phrase, surround the text with one underscore or asterisk. To make a word or phrase bold, surround it with two underscores or asterisks:

```
This is *italics* made with asterisks.

This is _italics_ made with underscores.

This is **bold** made with asterisks.

This is __bold__ made with underscores.
```

Remember to use the same character. An asterisk on one side of a word or phrase, and an underscore on the side, will not work. The same character has to be on both sides of the word or phrase.

![][9]

#### Block quotes

Block quotes are used for direct quotes. If you were writing a blog entry and you wanted to repeat something that Benjamin Franklin said, you could use a block quote.

A right angle bracket is used to specify a block quote:

```
> This is a block quote.

>> Use two right angle brackets if you want a block quote that is further indented.
```

![][10]

#### Adding links in Markdown

Links are just plain cool. There are three ways to create links on basic Markdown, but I will only cover two here: Regular links and automatic links.

The third type of link, called reference links, are supported in basic Markdown and more advanced flavors. I want to get to started quickly. You can look up reference links when you are ready for that.

Regular links let you link to various websites. The name of the site, or a phrase you want to use, is placed in square brackets `[]`. The actual link is inside parentheses `()`.

```
Visit [It's FOSS](https://itsfoss.com) today!
```

Automatic links are made with angle brackets `<>` surrounding the link. The link is an actual address (either a Web or email address). The link is spelled out and, when it is converted to HTML, the spelled out link becomes a working link.

```
<http://automatic-link-to-url.com/>

<[email protected]>
```

This is useful for when you want to spell out the address in your text:

![][11]

#### Adding images in Markdown

Links to images are almost identical to links to Web sites. The small difference between site links and images, is that image links begin with a bang (exclamation point) `!`

The name of the image, or a descriptive phrase of the image, is placed in square brackets `[]`. The actual link is inside parentheses `()`.

You can embed images like so:

```
![alternate text](./images/image.jpg)
```

Here’s an example image link. It is a sample link, with no image, but it is a decent sample of how an actual link might look like:

```
![a picture of bill](./images/my_photo_of_me.jpg)
```

![][12]

#### Lists

Lists are made for many reasons. They can be used as ‘things to do’ items, topic elements in an outline, parts lists in an assembly project, and so on. There are two main types of lists: unordered and ordered.

Unordered lists are not numbered; these are the ‘bullet items’ we see in many documents. Ordered lists are numbered.

To create an ordered (numbered) list, just begin each line with a number, like so:

```
1. Item one.
2. Item two.
3. Item three.
```

Unordered lists are not numbered, but use either an asterisk `*`, a plus sign `+`, or a minus sign `-` at the beginning of each item on the list. I prefer to use either an asterisk or minus sign, but you get to choose:

```
* Item one.
+ Item two.
- Item three.
```

Sub-items can be added to both ordered and unordered lists by indenting, like so:

```
1. Item 1
    1. Sub-item 1
    2. Sub-item 2
2. Item 2
3. Item 3
```

![][13]

### Markdown syntax cheat sheet

For your reference, here is a short listing of Markdown syntax that has been covered in this small introduction.

If you decide to adopt it as a writing tool, you’ll find that Markdown has the means to simplify writing even more.

![][14]

[Download Markdown Cheat Sheet in PDF format][15]

### Conclusion

Markdown can do more than what I have described here. A huge percentage of my writing can be accomplished with the Markdown syntax I have covered here – and these are the items I use most often even in more complex projects.

If all of this seems too simple, it really is that easy. Markdown was built to simply the writing task, but you don’t have to take my word for it. Try it out! There is no need to install a Markdown editor; you can do this online. There are several [good online Markdown editors][16]. Here are three that I prefer:

John Gruber’s [Dingus][17], [Editor.md][18], and [Dillinger][19]. Editor.md and Dillinger will let you see your Markdown rendered as HTML in real time. Dingus doesn’t preview in real time, but there is a Markdown syntax cheat sheet on the page for reference.

![][20]

Try out some of the examples in this article on either of these online editors. Try out some of your own ideas, too. This will let you get used to Markdown before possibly committing to learn more about it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/markdown-guide/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
