给中级  Meld 用户的有用技巧
============================================================

Meld 是 Linux 上功能丰富的可视化比较和合并工具。如果你是第一次接触，你可以进入我们的[初学者指南][5]，了解该程序的工作原理，如果你已经阅读过或正在使用 Meld 进行基本的比较/合并任务，你将很高兴了解本教程的东西，在本教程中，我们将讨论一些非常有用的技巧，这将让你使用工具的体验更好。

_但在我们跳到安装和解释部分之前，值得一提的是，本教程中介绍的所有说明和示例已在 Ubuntu 14.04 上进行了测试，而我们使用的 Meld 版本为 3.14.2_。

### 1、 跳转

你可能已经知道（我们也在初学者指南中也提到过这一点），标准滚动不是在使用 Meld 时在更改之间跳转的唯一方法 - 你可以使用向上和向下箭头键轻松地从一个更改跳转到另一个更改位于编辑区域上方的窗格中：

[
 ![Navigating in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-go-next-prev-9.png) 
][6]

但是，这需要你将鼠标指针移动到这些箭头，然后再次单击其中一个（取决于你要去哪里 - 向上或向下）。你会很高兴知道，存在另一种更简单的方式来跳转：只需使用鼠标的滚轮即可在鼠标指针位于中央更改栏上时进行滚动。

[
 ![The change bar](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-center-area-scrolling.png) 
][7]

这样，你就可以在视线不离开或者分心的情况下进行跳转，

### 2、 可以对更改进行的操作

看下上一节的最后一个屏幕截图。你知道那些黑箭头做什么吧？默认情况下，它们允许你执行合并/更改操作 - 当没有冲突时进行合并，并在同一行发生冲突时进行更改。

但是你知道你可以根据需要删除个别的更改么？是的，这是可能的。为此，你需要做的是在处理更改时按下 Shift 键。你会观察到箭头被变成了十字架。

[
 ![Things you can do with changes](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-delete-changes.png) 
][8]

只需点击其中任何一个，相应的更改将被删除。

不仅是删除，你还可以确保冲突的更改不会在合并时更改行。例如，以下是一个冲突变化的例子：

[
 ![Delete changes in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-conflicting-change.png) 
][9] 

现在，如果你点击任意两个黑色箭头，箭头指向的行将被改变，并且将变得与其他文件的相应行相似。只要你想这样做，这是没问题的。但是，如果你不想要更改任何行呢？相反，目的是将更改的行在相应行的上方或下方插入到其他文件中。

我想说的是，例如，在上面的截图中，需要在 “test23” 之上或之下添加 “test 2”，而不是将 “test23” 更改为 “test2”。你会很高兴知道在 Meld 中这是可能的。就像你按下 Shift 键删除注释一样，在这种情况下，你必须按下 Ctrl 键。

你会观察到当前操作将被更改为插入 - 双箭头图标将确认这一点 。

[
 ![Change actions](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-ctrl-insert.png) 
][10]

从箭头的方向看，此操作可帮助用户将当前更改插入到其他文件中的相应更改 (如所选择的)。

### 3、 自定义文件在 Meld 的编辑器区域中显示的方式

有时候，你希望 Meld 的编辑区域中的文字大小变大（为了更好或更舒适的浏览），或者你希望文本行被包含而不是脱离视觉区域（意味着你不要想使用底部的水平滚动条）。

Meld 在 _Editor_ 选项卡（_Edit->Preferences->Editor_）的 _Preferences_ 菜单中提供了一些显示和字体相关的自定义选项，你可以进行这些调整：

[
 ![Meld preferences](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-editor-tab.png) 
][11]

在这里你可以看到，默认情况下，Meld 使用系统定义的字体宽度。只需取消选中 _Font_ 类别下的框，你将有大量的字体类型和大小选项可供选择。

然后在 _Display_ 部分，你将看到我们正在讨论的所有自定义选项：你可以设置 Tab 宽度、告诉工具是否插入空格而不是 tab、启用/禁用文本换行、使Meld显示行号和空白（在某些情况下非常有用）以及使用语法突出显示。

### 4、 过滤文本

有时候，并不是所有的修改都是对你很重要的。例如，在比较两个 C 编程文件时，你可能不希望 Meld 显示注释中的更改，因为你只想专注于与代码相关的更改。因此，在这种情况下，你可以告诉 Meld 过滤（或忽略）与注释相关的更改。

例如，这里是 Meld 中的一个比较，其中由工具高亮了注释相关更改：

[
 ![Filter Text in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-changes-with-comments.png) 
][12]

而在这种情况下，Meld 忽略了相同的变化，仅关注与代码相关的变更：

[
 ![Ignore Changes in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-changes-without-comments.png) 
][13]

很酷，不是吗？那么这是怎么回事？为此，我是在 “_Edit->Preferences->Text Filters_” 标签中启用了 “C comments” 文本过滤器：

[
 ![C-Comments in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-text-filters.png) 
][14]

如你所见，除了 “C comments” 之外，你还可以过滤掉 C++ 注释、脚本注释、引导或所有的空格等。此外，你还可以为你处理的任何特定情况定义自定义文本过滤器。例如，如果你正在处理日志文件，并且不希望 Meld 高亮显示特定模式开头的行中的更改，则可以为该情况定义自定义文本过滤器。

但是，请记住，要定义一个新的文本过滤器，你需要了解 Python 语言以及如何使用该语言创建正则表达式。

### 总结

这里讨论的所有四个技巧都不是很难理解和使用（当然，除了你想立即创建自定义文本过滤器），一旦你开始使用它们，你会认为他们是真的有好处。这里的关键是要继续练习，否则你学到的任何技巧不久后都会忘记。

你还知道或者使用其他任何中级 Meld 的贴士和技巧么？如果有的话，欢迎你在下面的评论中分享。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/

作者：[Ansh][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/
[1]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-navigation
[2]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-things-you-can-do-with-changes
[3]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-filtering-text
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#conclusion
[5]:https://linux.cn/article-8402-1.html
[6]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-go-next-prev-9.png
[7]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-center-area-scrolling.png
[8]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-delete-changes.png
[9]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-conflicting-change.png
[10]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-ctrl-insert.png
[11]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-editor-tab.png
[12]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-changes-with-comments.png
[13]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-changes-without-comments.png
[14]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-text-filters.png
