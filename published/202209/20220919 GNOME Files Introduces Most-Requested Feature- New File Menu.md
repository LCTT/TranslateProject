[#]: subject: "GNOME Files Introduces Most-Requested Feature: New File Menu"
[#]: via: "https://www.debugpoint.com/gnome-files-new-file-document/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15057-1.html"

GNOME “文件”引入最受欢迎的功能：“新建文件”菜单
======

> 这是 GNOME “文件”中的“新建文件”功能，它为你提供了一种创建文档和文件的新方法。让我们看一看。

无需在后端进行更多调整。通过“<ruby>文件<rt>Files</rt></ruby>”（又名 Nautilus）中的上下文菜单创建新文档/新文件的最令人期待的功能终于到来了。

作为 [谷歌编程之夏 2022](https://debugpointnews.com/gsoc-2022/) 的一部分，（由 Ignacy Kuchciński 开发的）这个新功能最近经过审查并合并到 “文件” 的主分支中。

### 它看起来如何

当你右键单击文件时，上下文菜单有一个新选项“<ruby>新建文件<rt>New File</rt></ruby>”。

![New File Option in Files Context Menu][2]

GNOME “文件”中的“<ruby>新建文件<rt>New File</rt></ruby>”选项启动一个操作窗口，如下图所示。

![GNOME Files New File Action Dialog][3]

当它启动上述对话框时，会在后台发生一些事情。

你可能知道你可以在主目录中创建一个带有模板的 `Template` 文件夹，以便轻松访问常用的文档类型。因此，GNOME “文件” 会检查你是否有该目录。

如果当前存在一个带有模板的 `Template` 目录，你能通过那些文档类型的列表以创建新文档。

![GNOME Files New File Template Dialog (when some templates present)][4]

如果你没有任何模板（很可能），GNOME “文件”会扫描你的系统并根据系统中已安装的应用程序显示常见文件类型的列表。

例如，文本编辑器、LibreOffice 文档类型（电子表格、演示文稿）等。

这里还发生了一些其他事情。当你为新文档选择文件类型时，系统会选择默认的文件扩展名。这是文件名文本框中的受保护标签。

此外，如果你没有安装任何模板或任何应用程序，则根本不会显示“新建文件”菜单选项。

### 未来路线图

开发人员还提出了未来对该功能的增强，更大程度地扩展其功能。

当没有可用的模板时，对话框将如下所示。它将允许你通过选择应用程序来创建文件，包括空白文件。

此外，你可以直接启动软件来安装一些可以帮助你创建相应文件类型的应用程序。

由于这个功能比较复杂，可能会在以后开发。目前还没有时间表。

### 这在“文件” v43 中可用（通过 GNOME 43）吗？

但是，在我看来，这种变化需要一些额外的设计审查。我觉得它不完整。例如，当你有模板时，你无法创建标准文档类型（文本、LibreOffice 文档）—— 这两个对话框是互斥的。另外，我发现了一些小 BUG。

尽管该功能目前 [已获得批准和合并](https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/914)，但由于日程冲突，它无法进入 [GNOME 43候选版本](https://www.debugpoint.com/gnome-43/)。

希望在经过一轮良好的审查和测试后，你可以在明年的 GNOME 44 版本中获得此功能。

### 总结

总的来说，这是一个优雅的功能，我认为如今没有任何其他文件管理器具有这种先进的设计。一旦这个“文件”的“新建文件”功能被完全实现，它将会是其出色功能集的一个很好的补充。

那么，你喜欢这个新设计吗？请在评论框中告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-files-new-file-document/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/littlebirdnest)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://debugpointnews.com/gsoc-2022/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-File-Option-in-Files-Context-Menu.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-Files-New-Document-Action-Dialog.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-Files-New-Document-Template-Dialog.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Long-term-vision-with-additional-features.jpg
[6]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/914
[7]: https://www.debugpoint.com/gnome-43/
