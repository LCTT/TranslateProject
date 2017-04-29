在 Linux 上使用 Meld 比较文件夹
============================================================

我们已经从一个新手的角度[了解][15]了 Meld （包括 Meld 的安装），我们也提及了一些 Meld 中级用户常用的小技巧。如果你有印象，在新手教程中，我们说过 Meld 可以比较文件和文件夹。已经讨论过怎么比较文件，今天，我们来看看 Meld 怎么比较文件夹。

**需要指出的是，本教程中的所有命令和例子都是在 Ubuntu 14.04 上测试的，使用的 Meld 版本为 3.14.2。**

### 用 Meld 比较文件夹

打开 Meld 工具，然后选择 <ruby>比较文件夹<rt>Directory comparison</rt></ruby> 选项来比较两个文件夹。

[
 ![Compare directories using Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dir-comp-1.png) 
][5]

选择你要比较的文件夹：

[
 ![select the directories](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-sel-dir-2.png) 
][6]

然后单击<ruby>比较<rt>Compare </rt></ruby>按钮，你会看到 Meld 像图中这样分成两栏比较目录，就像文件比较一样。

[
 ![Compare directories visually](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dircomp-begins-3.png) 
][7]

分栏会树形显示这些文件夹。你可以在上图中看到 —— 区别之处，不论是新建的还是被修改过的文件 —— 都会以不同的颜色高亮显示。

根据 Meld 的官方文档可以知道，在窗口中看到的每个不同的文件或文件夹都会被突出显示。这样就很容易看出这个文件/文件夹与另一个分栏中对应位置的文件/文件夹的区别。

下表是 Meld 网站上列出的在比较文件夹时突出显示的不同字体大小/颜色/背景等代表的含义。

|**状态** | **表现** | **含义** |
| --- | --- | --- |
| 相同 | 正常字体 | 比较的文件夹中所有文件/文件夹相同。|
| 过滤后相同 | 斜体 | 文件夹中文件不同，但使用文本过滤器的话，文件是相同的。|
| 修改过 | 蓝色粗体 | 比较的文件夹中这些文件不同。 |
| 新建 | 绿色粗体 | 该文件/文件夹在这个目录中存在，但其它目录中没有。|
| 缺失 | 置灰文本，删除线 | 该文件/文件夹在这个目录中不存在，在在其它某个目录中存在。 |
| 错误 | 黄色背景的红色粗体 | 比较文件时发生错误，最常见错误原因是文件权限（例如，Meld 无法打开该文件）和文件名编码错误。 |

Meld 默认会列出比较文件夹中的所有内容，即使这些内容没有任何不同。当然，你也可以在工具栏中单击<ruby>相同<rt>Same</rt></ruby>按钮设置 Meld 不显示这些相同的文件/文件夹 —— 单击这个按钮使其不可用。

[
 ![same button](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-button.png) 
][3]

[
 ![Meld compare buttons](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-disabled.png) 
][8]

下面是单击 <ruby>相同<rt>Same</rt></ruby> 按钮使其不可用的截图：

[
 ![Directory Comparison without same files](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-only-diff.png) 
][9]

这样你会看到只显示了两个文件夹中不同的文件（新建的和修改过的）。同样，如果你单击 <ruby>新建<rt>New</rt></ruby> 按钮使其不可用，那么 Meld 就只会列出修改过的文件。所以，在比较文件夹时可以通过这些按钮自定义要显示的内容。

你可以使用工具窗口显示区的上下箭头来切换选择是显示新建的文件还是修改过的文件。要打开两个文件进行分栏比较，可以双击文件，或者单击箭头旁边的 <ruby>比较<rt>Compare</rt></ruby>按钮。

[
 ![meld compare arrow keys](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-compare-arrows.png) 
][10]

**提示 1**：如果你仔细观察，就会看到 Meld 窗口的左边和右边有一些小条。这些条的目的是提供“简单的用颜色区分的比较结果”。对每个不同的文件/文件夹，条上就有一个小的颜色块。你可以单击每一个这样的小块跳到它对应的文件/文件夹。

**提示 2**：你总可以分栏比较文件，然后以你的方式合并不同的文件，假如你想要合并所有不同的文件/文件夹（就是说你想要一个特定的文件/文件夹与另一个完全相同），那么你可以用 <ruby>复制到左边<rt>Copy Left</rt></ruby>和 <ruby>复制到右边<rt>Copy Right</rt></ruby> 按钮：

[
 ![meld copy right part](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-copy-right-left.png) 
][11]

比如，你可以在左边的分栏中选择一个文件或文件夹，然后单击 <ruby>复制到右边<rt>Copy Right</rt></ruby> 按钮，使右边对应条目完全一样。

现在，在窗口的下拉菜单中找到 <ruby>过滤<rt>Filters </rt></ruby> 按钮，它就在 <ruby>相同<rt>Same</rt></ruby>、<ruby>新建<rt>New</rt></ruby> 和 <ruby>修改的<rt>Modified</rt></ruby>  这三个按钮下面。这里你可以选择或取消文件的类型，告知 Meld 在比较文件夹时是否显示这种类型的文件/文件夹。官方文档解释说菜单中的这个条目表示“执行文件夹比较时该类文件名不会被查看。”

该列表中条目包括备份文件，操作系统元数据，版本控制文件、二进制文件和多媒体文件。

[
 ![Meld filters](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-filters.png) 
][12]

前面提到的条目也可以通过这样的方式找到：_浏览->文件过滤_。你可以通过 _编辑->首选项->文件过滤_ 为这个条目增加新元素（也可以删除已经存在的元素）。

[
 ![Meld preferences](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-edit-filters-menu.png) 
][13]

要新建一个过滤条件，你需要使用一组 shell 符号，下表列出了 Meld 支持的 shell 符号：

| **通配符** | **匹配** |
| --- | --- |
| * | 任何字符 (例如，零个或多个字符) |
| ? | 一个字符 |
| [abc] | 所列字符中的任何一个 |
| [!abc] | 不在所列字符中的任何一个 |
| {cat,dog} | “cat” 或 “dog” 中的一个 |

最重要的一点是 Meld 的文件名默认大小写敏感。也就是说，Meld 认为 readme 和 ReadMe 与 README 是不一样的文件。

幸运的是，你可以关掉 Meld 的大小写敏感。只需要打开 _浏览_ 菜单然后选择 <ruby>忽略文件名大小写<rt> Ignore Filename Case </rt></ruby> 选项。
[
 ![Meld ignore filename case](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-ignore-case.png) 
][14]

### 结论

你是否觉得使用 Meld 比较文件夹很容易呢 —— 事实上，我认为它相当容易。只有新建一个文件过滤器会花点时间，但是这不意味着你没必要学习创建过滤器。显然，这取决于你的需求。

另外，你甚至可以用 Meld 比较三个文件夹。想要比较三个文件夹时，你可以通过单击 <ruby>三向比较<rt>3-way comparison</rt></ruby> 复选框。今天，我们不介绍怎么比较三个文件夹，但它肯定会出现在后续的教程中。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/

作者：[Ansh][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/
[1]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/#compare-directories-using-meld
[2]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/#conclusion
[3]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-same-button.png
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/
[5]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-dir-comp-1.png
[6]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-sel-dir-2.png
[7]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-dircomp-begins-3.png
[8]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-same-disabled.png
[9]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-only-diff.png
[10]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-compare-arrows.png
[11]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-copy-right-left.png
[12]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-filters.png
[13]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-edit-filters-menu.png
[14]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-ignore-case.png
[15]:https://linux.cn/article-8402-1.html