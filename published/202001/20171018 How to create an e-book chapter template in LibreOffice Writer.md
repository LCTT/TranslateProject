如何在 LibreOffice Writer 中创建一个电子书章节模板
======

> 将电子书分成几章，创建电子书会更容易。这是设置模板的分步指南。

![](https://img.linux.net.cn/data/attachment/album/202001/02/102817vmflleeemehetblt.jpg)

对于很多人来说，使用 word 程序来撰写和发布一本电子书是一种最好的、最容易的、最熟悉的方法。但是，启动你的 word 程序和打字是不够的 —— 你需要遵循一种格式。

这就是模板的来源。一个模板确保你的电子书有一个一致的外观和体验。幸运的是，创建模板是快速和容易的，并你在其上花费的时间和努力将带给你一本更好感观的书。

在这篇文章中，我将陪伴你走过如何使用 LibreOffice Writer 创建一个简单的模板，可以用于一本电子书的各个章节。你可以将这个模板用于 PDF 和 EPUB 书籍，并加以修改来满足你的需要。

### 我的方法

为什么我着重于为一个章节创建一个模板，而不是为一整本书创建一个模板？因为编写和管理单独的章节比编写和管理单个庞大而僵化的文档更容易。

通过关注于单独的章节，你可以专心于你需要编写的东西。你可以很容易地四处移动这些章节，给审阅者发单独一章节比发送你的完整原稿更简单而高效。当你写完一章后，你可以简单地把你的章节拼凑在一起来出版这本书（我将在下面讨论如何做到这一点）。但是不要觉得你被这种方法所束缚 —— 如果你更喜欢在单个文件中编写，简单地调整在这篇文章中描述的步骤就行。

让我们开始吧。

### 设置页面

仅当你计划发布你的电子书为一本 PDF 书时，这是很重要的。设置页面意味着你的书将不包含大量的跨越屏幕的让眼睛疲劳的文本。

选择 **格式 > 页面** 来打开 **页面样式** 窗口。我的 PDF 电子书通常是 5x8 英寸高（大约 13x20cm ，对于我们这些生活在米制世界的人来说）。我也设置页边距为半英寸（约 1.25 cm）。这些是我较喜欢的尺寸；你可以使用任何适合你的尺寸。

![LibreOffice Page Style window][2]

*在 LibreOffice Writer 中的页面样式窗口让你设置页边距和页格式。*

接下来，添加页脚以显示页码。保持页面样式窗口打开着，并单击 **页脚** 选项卡。选择 **在页脚上** 并单击 **确定** 。

在该页面上，在页脚中单击，然后选择 **插入 > 字段 > 页码**。不要担心页码的位置和外观；我们接下来会处理。

### 设置你的样式

像模板本身一样，样式为你的文档提供一种一致的外观和体验。如果你想更改一个标题的字体或大小，例如，你只需要在一个地方完成它，而不是手动应用格式化到每个标题。

标准化的 LibreOffice 模板带有许多样式，你可以调整它们以适应你的需要。为此，按 `F11` 来打开 **样式和格式** 窗口。

![LibreOffice styles and formatting][4]

*使用样式和格式窗口更改字体和其它细节。*

在一个样式上右键单击，并选择 **修改** 来编辑它。 这里是我在每本中使用的主要样式：

 样式 | 字体 | 间距 / 对齐方式
 :-: | :-: | :-: 
 标题 1 | Liberation Sans, 36 pt | 上面 36 pt ，下面 48 pt ，左对齐
 标题 2 | Liberation Sans, 18 pt | 上面 12 pt ，下面 12 pt ，左对齐
 标题 3 | Liberation Sans, 14 pt | 上面 12 pt ，下面 12 pt ，左对齐
 正文 | Liberation Sans, 12 pt | 上面 12 pt ，下面 12 pt ，左对齐
 页脚 | Liberation Sans, 10 pt | 居中对齐


![LibreOffice styles in action][6]

*这是当我们应用到电子书内容时的一个选择的样式外观。*

对于大多数书来说，这通常是最小要求。可以随便更改字体和空格来适应你的要求。

根据你正在编写书的类型，你可能也想创建或修改项目符合样式，以及数字列表、引号、代码示例、数字符号等等。只需要记住始终如一地使用字体以及其大小。

### 保存你的模板

选择 **文件 > 另存为** 。在保持对话框中，从格式列表中选择 “ODF 文本文档模板 (.ott)” 。这将保存模板为一个模板，以后你可以快速调用该模板。

保存模板的最佳位置是 LibreOffice 模板文件夹。例如，在 Linux 中,那是在你的家目录下，在 `.config/libreoffice/4/user/template` 下。

### 编写你的书

在你开始编写前，在你的计算机上创建一个文件夹，它将为你的书保存所有的文件 —— 章节、图像、笔记等等。

当你准备编写时，启动 LibreOffice Writer 并选择 **文件 > 新建 > 模板** 。然后从列表中选择你的模板，并单击 **打开**。

![LibreOffice Writer template list][8]

*从你在 LibreOffice Writer 中设置的列表中选择你的模板，并开始编写。*

然后用一个描述性名称保存文档。

建议使用像 “第 1 章” 和 “第 2 章” 这样的惯例 —— 在某些时候，你可能决定重新编排你的章节，当你尝试管理这些章节时，它可能会变得混乱。然而，你可以在文件名称中放置章节数字，像 “第 1 章” 或 “一” 。如果你最后要重新排列全书的章节，像这样重命名更容易。

无需赘言，开始编写吧。记住在模板中使用样式来格式化文本 —— 这就是为什么你要创建模板，对吧？

### 发布你的电子书

在完成编写一堆章节后，并准备发布它们时，创建一个主控文档。把一个主控文档作为你所编写章节的一个容器。使用一个主控文档，你可以快速地组装你的书，并任意重新排序你的章节。LibreOffice 的帮助提供了使用[主控文档][9]的详细信息。

假设你想生成一个 PDF ，不要只是单击**直接导出到 PDF** 按钮。这将创建一个相当不错的 PDF ，但是你可能想优化它。为此，选择 **文件 > 导出为 PDF** ，并在 PDF 选项窗口中轻微调整。你可以在这篇  [LibreOffice Writer 文档][10] 中学到更多东西。

如果你想创建一个 EPUB 而不是一个 PDF，或者除了一个 PDF 以外，另外创建一个 EPUB，请安装 [Writer2EPUB][11] 扩展。Opensource.com 的 Bryan Behrenshausen 为这个扩展[分享了一些有用的说明][12] 。

### 结束语

我们在这里创建的模板是极简单的，但是你可以将其用于一本简单的书，或者作为构建一个复杂模板的起点。不管怎样，这个模板都会让你快速地开始编写和发布你的电子书。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/creating-ebook-chapter-template-libreoffice-writer

作者：[Scott Nesbitt][a]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[2]:https://opensource.com/sites/default/files/images/life-uploads/lo-page-style.png (LibreOffice Page Style window)
[4]:https://opensource.com/sites/default/files/images/life-uploads/lo-paragraph-style.png (LibreOffice styles and formatting window)
[5]:/file/374466
[6]:https://opensource.com/sites/default/files/images/life-uploads/lo-styles-in-action.png (Example of LibreOffice styles)
[8]:https://opensource.com/sites/default/files/images/life-uploads/lo-template-list.png (Template list - LibreOffice Writer)
[9]:https://help.libreoffice.org/Writer/Working_with_Master_Documents_and_Subdocuments
[10]:https://help.libreoffice.org/Common/Export_as_PDF
[11]:http://writer2epub.it/en/
[12]:https://opensource.com/life/13/8/how-create-ebook-open-source-way
