[#]: subject: "Mastering Nautilus File Search in Linux Desktop"
[#]: via: "https://itsfoss.com/nautilus-file-search/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

掌握 Linux 桌面中的 Nautilus 文件搜索
======

GNOME 的 Nautilus 文件管理器非常通用。

不相信我？ 查看这篇文章，了解如何[调整 Nautilus 的全部功能][1]。

文件搜索是 Nautilus 被忽视的功能之一。没有多少 Linux 用户充分发挥其潜力。

这就是我创建本教程来分享有关使用 Nautilus 文件管理器中的文件搜索选项的一些技巧的原因。

我知道经验丰富的 Linux 用户可以使用终端中的 [find 命令][2]实现相同的目的，但许多桌面用户更喜欢使用 GUI。

让我们从最简单的搜索选项开始。

### 按名称搜索文件

打开 Nautilus 并单击顶部栏上的放大镜。这将打开一个搜索栏，你可以在其中输入查询字符串。

当你输入时，结果将得到完善，并在输入完整文件名时进行匹配。

![在 Nautilus 中搜索][3]

💡

搜索在当前目录及其子目录中执行。你可以启用[隐藏文件视图][4]以在搜索结果中包含隐藏文件。

### 根据时间搜索文件

使用 Nautilus，你可以根据文件的创建、修改或上次访问的时间过滤搜索。

为此，请单击搜索按钮并开始输入。当你开始输入时，你会注意到搜索按钮附近有一个下拉菜单。点击它。这将为你提供一个菜单，其中包含用于过滤搜索的选项。

![单击下拉菜单][5]

单击下拉菜单上的“选择日期”按钮。另外，选择选项“**文件名** ”以按文件名匹配。

![按日期搜索的设置][6]

这将为你提供一个扩展菜单，你可以在其中选择文件创建、修改或上次访问的日期。

![设定标准][7]

在这里，如果你想设置自定义日期，请单击日历图标，如下图所示：

![点击日历图标][8]

现在，你将获得一个小日历，并可以相应地选择日期。

![选择日期][9]

从列表中设置你选择的日期后，你可以看到搜索栏上应用的条件，并向你显示基于该条件的文件。

![应用日期标准][10]

### 根据文件类型搜索文件

你还可以根据文件类型过滤搜索。假设你正在寻找 PDF 文件。

与上一步一样，单击搜索图标并开始输入文件名。现在，从下拉菜单中，单击“任何”选项并选择“文件名”。

![根据文件类型搜索][11]

从展开的视图中选择要搜索的文件类型。在这里，我选择了 “PDF/Postscript”。

![设置所需的文件类型][12]

选择所需的文件类型后，你可以在搜索栏上看到应用的条件。你还将看到相应的结果。

![应用文件类型标准][13]

在搜索选项中没有找到所需的文件类型？ 向下滚动到底部并单击“其他类型”。

![获取更多文件类型][14]

这将为你提供更多文件类型。

![列出更多文件类型][15]

### 搜索文件内容，而不是名称

默认情况下，根据文件名执行文件搜索。如果你想知道是否有包含特定单词的文件，Nautilus 也允许你这样做。

首先，单击搜索图标并开始输入。现在，与前面的部分一样，转到下拉菜单。

在下拉菜单中，不要选择“[**文件名**][2]”，而是选择“**全文** ”。

现在，你可以搜索特定字符串并根据特定日期或文件类型进行搜索过滤器。过滤的方法与前面提到的相同。

![选择“全文”选项][16]

在这里，我使用了字符串 “text to be”，你可以看到列出了几个具有该特定字符串的文件。另外，你可以看到，该部分也突出显示。

### 仅搜索文件或仅搜索文件夹

默认情况下，Nautilus 会搜索文件和文件夹。你可以将搜索细化为文件或文件夹。

为此，请在下拉菜单中选择“文件名”，然后从类型列表中选择文件或文件夹，如下所示。

![仅在文件或文件夹中搜索][17]

这将根据你的选择过滤结果。

### 应用多个过滤器

你可以将日期过滤器和类型过滤器组合在一起以获得更精确的搜索。为此，请从各自的下拉列表中选择每个条件。

你可以在下面的截图中看到，我已经搜索了包含字符串 “to be search” 的文件。我应用的标准是 1 天内创建的 PDF 文件。

![应用多个过滤器][18]

### 更多 Nautilus 提示和调整

Nautilus 足以满足大多数搜索场景。如果你需要更多，还有专用的 GUI 工具，可让你执行桌面范围的自定义搜索。

![][19]

想要更多这样的 Nautilus 技巧吗？ [以 root 身份打开文件][20]怎么样？

![][19]

或者将终端的功能与文件管理器结合起来？

![][19]

这里还有更多此类提示。请自行查看。

![][19]

我希望你喜欢这些技巧，它们有助于更好地改善你的桌面 Linux 体验。

你还知道其他这样酷的技巧吗？ 请在评论中分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/nautilus-file-search/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nautilus-tips-tweaks/
[2]: https://linuxhandbook.com/find-command-examples/?ref=itsfoss.com
[3]: https://itsfoss.com/content/images/2023/08/Click-on-the-search-button-and-start-typing.png
[4]: https://itsfoss.com/show-hidden-files-linux/
[5]: https://itsfoss.com/content/images/2023/08/Access-more-search-options.png
[6]: https://itsfoss.com/content/images/2023/08/click-on-time-option-to-get-expanded-list.png
[7]: https://itsfoss.com/content/images/2023/08/Search-according-to-date-and-time.png
[8]: https://itsfoss.com/content/images/2023/08/click-on-calendar-icon.png
[9]: https://itsfoss.com/content/images/2023/08/select-date-from-calendar.png
[10]: https://itsfoss.com/content/images/2023/08/Showing-search-criterea-date-on-search-result.png
[11]: https://itsfoss.com/content/images/2023/08/click-on-type-option-to-get-expanded.png
[12]: https://itsfoss.com/content/images/2023/08/Search-based-on-file-type-like-pdf.png
[13]: https://itsfoss.com/content/images/2023/08/showing-search-criteria-type-on-search-result.png
[14]: https://itsfoss.com/content/images/2023/08/click-on-other-type.png
[15]: https://itsfoss.com/content/images/2023/08/complete-list-of-types.png
[16]: https://itsfoss.com/content/images/2023/08/Search-inside-the-file.png
[17]: https://itsfoss.com/content/images/2023/08/search-for-only-folders-or-only-files.png
[18]: https://itsfoss.com/content/images/2023/08/applied-multiple-criteria.png
[19]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[20]: https://itsfoss.com/open-nautilus-as-administrator/
