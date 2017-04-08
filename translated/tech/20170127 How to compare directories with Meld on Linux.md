在 Linux 上使用 Meld 比较文件夹
============================================================

### 本文导航
1.  [用 Meld 比较文件夹][1]
2.  [总结][2]

我们已经从一个新手的角度了解了 Meld (包括 Meld 的安装)，我们也提及了一些 Meld 中级用户常用的小技巧。如果你有印象，在新手教程中，我们说过 Meld 可以比较文件和文件夹。已经讨论过怎么讨论文件，今天，我们来看看 Meld 怎么比较文件夹。

本教程中的所有命令和例子都是在 Ubuntu 14.04 上测试的，使用的 Meld 版本基于 3.14.2 版。 


### 用 Meld 比较文件夹
打开 Meld 工具，然后选择_比较文件夹_选项来比较两个文件夹。
[
 ![Compare directories using Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dir-comp-1.png) 
][5]

选择你要比较的文件夹：
[
 ![select the directories](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-sel-dir-2.png) 
][6]

然后单击_比较_按钮，你会看到 Meld 像图中这样分成两栏显示。
[
 ![Compare directories visually](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dircomp-begins-3.png) 
][7]
分栏会树形显示这些文件/文件夹。你可以在上图中看到明显的区别——不论文件是新建的还是被修改过的——都会以不同的颜色高亮显示。

根据 Meld 的官方文档可以知道在窗口中看到的每个不同的文件或文件夹都会被突出显示。这样就很容易看出这个文件/文件夹与另一个分栏中对应位置的文件/文件夹的区别。

下表是 Meld 网站上列出的在比较文件夹时突出显示的不同字体大小/颜色/背景等代表的含义。


|**State** | **Appearance** | **Meaning** |
| --- | --- | --- |
| Same | Normal font | The file/folder is the same across all compared folders. |
| Same when filtered | Italics | These files are different across folders, but once text filters are applied, these files become identical. |
| Modified | Blue and bold | These files differ between the folders being compared. |
| New | Green and bold | This file/folder exists in this folder, but not in the others. |
| Missing | Greyed out text with a line through the middle | This file/folder doesn't exist in this folder, but does in one of the others. |
| Error | Bright red with a yellow background and bold | When comparing this file, an error occurred. The most common error causes are file permissions (i.e., Meld was not allowed to open the file) and filename encoding errors. |
Meld 默认会列出文件夹中的所有内容，即使这些内容没有任何不同。当然，你也可以在工具栏中单击_同样的_按钮设置 Meld 不显示这些相同的文件/文件夹——单击这个按钮使其不可用。
[
 ![same button](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-button.png) 
][3]

[
 ![Meld compare buttons](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-disabled.png) 
][8]
下面是单击_同样的_按钮使其不可用的截图：
[
 ![Directory Comparison without same files](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-only-diff.png) 
][9]
这样你会看到只显示了两个文件夹中不同的文件（新建的和修改过的）。同样，如果你单击_新建的_按钮使其不可用，那么 Meld 就只会列出修改过的文件。所以，在比较文件夹时可以通过这些按钮自定义要显示的内容。

你可以使用上下箭头来切换选择是显示新建的文件还是修改过的文件，然后打开两个文件进行分栏比较。双击文件或者单击箭头旁边的_比较_按钮都可以进行分栏比较。。
[
 ![meld compare arrow keys](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-compare-arrows.png) 
][10]

**提示 1**：如果你仔细观察，就会看到 Meld 窗口的左边和右边有一些小进度块。这些进度块就像是“用颜色区分的包含不同文件/文件夹的数个区段”。每个区段都由很多的小进度块组成，而一个个小小的有颜色的进度块就表示此处有不同的文件/文件夹。你可以单击每一个这样的小小进度块跳到它对应的文件/文件夹。


**提示 2**：尽管你经常分栏比较文件然后以你的方式合并不同的文件，假如你想要合并所有不同的文件/文件夹（就是说你想要把一个文件夹中特有的文件/文件夹添加到另一个文件夹中），那么你可以用_复制到左边_和_复制到右边_按钮：
[
 ![meld copy right part](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-copy-right-left.png) 
][11]
比如，你可以在左边的分栏中选择一个文件或文件夹，然后单击_复制到右边_按钮在右边的文件夹中对应的位置新建完全一样的文件或文件夹。

现在，在窗口的下栏菜单中找到_过滤_按钮，它就在_同样的_、_新建的_和_修改过的_ 这三个按钮下面。这里你可以选择或取消文件的类型来让 Meld 在比较文件夹时决定是否显示这种类型的文件/文件夹。官方文档解释说菜单中的这个条目表示“被匹配到的文件不会显示。”

这个条目包括备份文件，操作系统元数据，版本控制文件、二进制文件和多媒体文件。


[
 ![Meld filters](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-filters.png) 
][12]
前面提到的条目也可以通过这样的方式找到：_浏览->文件过滤_。你可以同过 _编辑->首选项->文件过滤_ 为这个条目增加新元素（也可以删除已经存在的元素）。

[
 ![Meld preferences](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-edit-filters-menu.png) 
][13]
要新建一个过滤条件，你需要使用一组 shell 符号，下表列出了 Meld 支持的 shell 符号：


| **Wildcard** | **Matches** |
| --- | --- |
| * | anything (i.e., zero or more characters) |
| ? | exactly one character |
| [abc] | any one of the listed characters |
| [!abc] | anything except one of the listed characters |
| {cat,dog} | either "cat" or "dog" |
最重要的一点是 Meld 的文件名默认大小写敏感。也就是说，Meld 认为 readme 和 ReadMe 与 README 是不一样的文件。

幸运的是，你可以关掉 Meld 的大小写敏感。只需要打开_浏览_菜单然后选择_忽略文件名大小写_选项。
[
 ![Meld ignore filename case](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-ignore-case.png) 
][14]

### 结论
你是否觉得使用 Meld 比较文件夹很容易呢——事实上，我认为它相当容易。只有新建一个过滤器会花点时间，但是这不意味着你没必要学习创建过滤器。显然，这取决于你要过滤的内容。

真的很棒，你甚至可以用 Meld 比较三个文件夹。想要比较三个文件夹时你可以通过_单击 3 个比较_ 复选框。今天，我们不介绍怎么比较三个文件夹，但它肯定会出现在后续的教程中。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/

作者：[Ansh][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[校对者ID](https://github.com/校对者ID)

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
