[#]: subject: (Apps for daily needs part 2: office suites)
[#]: via: (https://fedoramagazine.org/apps-for-daily-needs-part-2-office-suites/)
[#]: author: (Arman Arisman https://fedoramagazine.org/author/armanwu/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13755-1.html)

满足日常需求的应用（二）：办公套件
======

![][1]

今天，几乎每个家庭都有一台台式电脑或笔记本电脑。这是因为计算机已经成为一个非常重要的要求。此外，不管是为了工作还是学习，许多人需要创建电子版的文档和演示文稿。因此，办公套件是几乎所有计算机上的必备应用程序。本文将介绍一些你可以在 Fedora Linux 上使用的开源办公套件。这些软件你可能需要安装。如果你不熟悉如何在 Fedora Linux 中添加软件包，请参阅我之前的文章 [安装 Fedora 34 工作站后要做的事情][4]。下面是满足日常需求的办公套件类的应用程序列表。

### LibreOffice

LibreOffice 是 GNU/Linux 用户中最流行的办公套件。它的用户界面和用户体验类似于微软 Office。这使得 LibreOffice 对于那些刚刚从微软 Office 迁移过来的人来说很容易学习。LibreOffice 有完整的功能，可以满足你在文档和演示方面的工作需要。它由六个应用程序组成：Writer、Calc、Impress、Draw、Math 和 Base。

第一个应用程序是 Writer，用于创建各种类型的文档，如信件、传真、议程、会议记录等。它是一个全功能的文字处理和桌面出版工具。第二个应用程序是 Calc，它是一个电子表格程序，非常适合以表格形式呈现数据和记录数据。Calc 可以创建简单的表格或进行专业的数据分析。第三个应用程序是 Impress，它是一个易于使用的演示应用程序。你可以很容易地选择你在演示幻灯片中想要的功能，如文本、图像、表格、图表等。

![LibreOffice Writer][5]

![LibreOffice Calc][6]

![LibreOffice Impress][7]

前面提到的三个 LibreOffice 应用程序是创建文档和演示文稿中最常用的应用程序。然而，LibreOffice 提供的其他三个应用程序也非常有用。第一个是 Draw，它可以用来创建从简单到复杂的图纸和图表。下一个应用程序是 Math，它可以帮助我们做出完美格式的数学和科学公式。最后一个是 Base，这是一个用于处理数据库的应用程序。

![LibreOffice Draw][8]

![LibreOffice Math][9]

![LibreOffice Base][10]

更多信息请见此链接：<https://www.libreoffice.org/>

### ONLYOFFICE

ONLYOFFICE 是一款与微软 Office 高度兼容的办公套件应用程序。因此，我们与使用微软 Office 的同事协作时就不必担心了，因为它可以读取各种文件格式，如 docx、xlsx 和 pptx。

ONLYOFFICE 提供了三种具有简洁和现代外观的应用程序。我们可以很容易地找到我们需要的功能和工具。虽然功能没有 LibreOffice 那么齐全，但也足以帮助我们创建良好的文档和演示文稿。

第一个应用程序是文档编辑器，它的功能与 LibreOffice 的 Writer 相同。它具有文字处理器所需的所有基本功能，如管理字体和样式、格式化文本、调整行距和段距、插入页眉和页脚、自定义页面布局和设置页边距。第二个应用程序是电子表格编辑器，它是一个用于处理数据并将其创建为表格格式的文件的应用程序。它是一个具有与 Calc 相同功能的应用程序。最后一个是演示文稿编辑器，它是一个演示文稿应用程序，其功能类似于 Impress。

不幸的是，ONLYOFFICE 在官方的 Fedora Linux 软件库中并没有提供。但是你仍然可以使用 Flatpak 或 Appimages 在 Fedora Linux 上安装它。

![ONLYOFFICE Documents Editor][11]

![ONLYOFFICE Spreadsheets Editor][12]

![ONLYOFFICE Presentations Editor][13]

更多信息请见此链接：<https://www.onlyoffice.com/desktop.aspx>

### Calligra

Calligra 是一个由 KDE 创建的办公套件。因此，这个应用程序实际上更适合于 KDE Plasma 桌面环境的用户。但它仍然可以在其他桌面环境中良好运行，例如使用 GNOME 的 Fedora 工作站。

Calligra 提供的几个应用程序的外观与 LibreOffice 或 ONLYOFFICE 略有不同。对于那些习惯于主流办公套件应用程序的人来说，可能需要一些适应。然而，Calligra 仍然是一个可靠的办公套件，足以支持我们的日常需求。

第一个应用程序是 Words，它是一个具有桌面出版功能的直观的文字处理器。它具有帮助我们进行文档创作的全面功能。第二个应用程序是 Sheets，它具有与 Calc 和电子表格编辑器相同的功能，是一个功能齐全的电子表格应用程序。第三个应用程序是 Stage，它可以帮助我们制作演示幻灯片。

![Calligra Words][14]

![Calligra Sheets][15]

![Calligra Stage][16]

这三个 Calligra 应用程序是创建文档和演示文稿最常用的应用程序。另外还有三个应用程序也非常有用。第一个是 Karbon，它可以用来创建从简单到复杂的图纸和图表。下一个应用程序是 Plan，这是一个项目管理应用程序，可以帮助管理具有多种资源的中等规模的项目。最后一个是 KEXI，它是一个可视化数据库应用程序的创建器。

![Calligra Karbon][17]

![Calligra Plan][18]

![Calligra Kexi][19]

更多信息请见此链接：<https://calligra.org/>

### 总结

这篇文章介绍了 3 个可以在 Fedora Linux 上使用的办公套件，以满足你的日常需要。如果你想拥有具有一套完整功能的办公套件，那么 LibreOffice 可能是正确的选择。如果想与微软 Office 有良好的兼容性，那么你可以选择 ONLYOFFICE。然而，如果你想要一个不同的用户界面和创建文档和演示文稿的体验，你可以试试 Calligra。希望这篇文章能帮助你选择合适的办公套件。如果你有使用这些应用程序的经验，请在评论中分享你的经验。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/apps-for-daily-needs-part-2-office-suites/

作者：[Arman Arisman][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/armanwu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/FedoraMagz-Apps-2-Office-816x345.jpg
[2]: https://unsplash.com/@brookecagle?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/meeting-on-cafe-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/things-to-do-after-installing-fedora-34-workstation/
[5]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-writer-1-1024x575.png
[6]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-calc-1-1024x575.png
[7]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-impress-1-1024x575.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-draw-1-1024x575.png
[9]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-math-1-1024x575.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-libre-base-1-1024x575.png
[11]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-only-doc-1024x575.png
[12]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-only-sheet-1024x575.png
[13]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-only-presentation-1024x575.png
[14]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-words-1024x575.png
[15]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-sheets-1024x575.png
[16]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-stage-1024x575.png
[17]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-karbon-1-1024x575.png
[18]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-plan-1024x575.png
[19]: https://fedoramagazine.org/wp-content/uploads/2021/07/office-calligra-kexi-1024x575.png
